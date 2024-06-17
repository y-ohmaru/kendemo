package com.example.demo.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Dao.OrdersDao;
import com.example.demo.Dao.ProductsDao;
import com.example.demo.Dao.UsersDao;
import com.example.demo.model.CartModel;
import com.example.demo.model.OrderDetailModel;
import com.example.demo.model.OrderModel;
import com.example.demo.model.ProductModel;
import com.example.demo.model.UserModel;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private ProductsDao productsDao;

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private UsersDao usersDao;


	 // ModelAttributeを使ってorderModelを追加
    @ModelAttribute("orderModel")
    public OrderModel orderModel() {
        return new OrderModel();
    }


	//カートに追加
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addToCart(@RequestParam("productId") int productId, @RequestParam("quantity") int quantity,HttpSession session) {
		try {
			ProductModel product = productsDao.getById(productId);
			if (product != null) {
				List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cart");
				if (cartItems == null) {
					cartItems = new ArrayList<>();
				}
				//カート内に既にある同じ商品を管理するフラグ。
				boolean itemExists = false;
				for(CartModel item: cartItems) {
					if(item.getProduct().getProductId() == productId) {
						item.setQuantity(item.getQuantity()+quantity);
						//商品がすでにあるのでフラグ更新
						itemExists = true;
						break;
					}
				}
				if(!itemExists) {
					//商品がないので新規追加
					cartItems.add(new CartModel(product,quantity));
				}
				session.setAttribute("cart", cartItems);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// エラーページへの遷移させる
		}
		return "redirect:/cart"; // カートページへリダイレクト
	}

	//カート内商品確認
	@RequestMapping(method = RequestMethod.GET)
	public String showCart(HttpSession session, Model model) {
		List<ProductModel> cartItems = (List<ProductModel>) session.getAttribute("cart");
		if (cartItems == null) {
			cartItems = new ArrayList<>();
			session.setAttribute("cart", cartItems);
		}
		model.addAttribute("cartItems", cartItems);
		return "cart";
	}


	// カート内特定の商品削除
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeFromCart(@RequestParam("productId") int productId, HttpSession session) {
        List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cart");
        if (cartItems != null) {
            Iterator<CartModel> iterator = cartItems.iterator();
            while (iterator.hasNext()) {
                CartModel item = iterator.next();
                if (item.getProduct().getProductId() == productId) {
                    iterator.remove();
                    break;
                }
            }
            session.setAttribute("cart", cartItems);
        }
        return "redirect:/cart"; // カートページへリダイレクト
    }

	//カートのセッションの破棄　全削除に見える。
	@RequestMapping(value = "/clear", method = RequestMethod.GET)
	public String clearCart(HttpSession session) {
		session.removeAttribute("cart");
		return "redirect:/cart"; // カートページへリダイレクト
	}

	// 購入確認画面表示
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String showCheckout(HttpSession session, Model model) {
        List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cart");
        if (cartItems == null || cartItems.isEmpty()) {
            return "redirect:/cart"; // カートが空の場合、カートページへリダイレクト
        }
         model.addAttribute("cartItems", cartItems);

        double total = 0;
        for (CartModel item : cartItems) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        double tax = total * 0.1;
        double totalWithTax = total + tax;
        model.addAttribute("total", total);
        model.addAttribute("tax", tax);
        model.addAttribute("totalWithTax", totalWithTax);
        model.addAttribute("orderModel", new OrderModel());
        return "item_confirm";
    }

 // 購入確定処理
    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String completeCheckout(HttpSession session, @ModelAttribute("orderModel") OrderModel order, Model model) {

        List<CartModel> cartItems = (List<CartModel>) session.getAttribute("cart");
        if (cartItems == null || cartItems.isEmpty()) {
            return "redirect:/cart"; // カートが空の場合、カートページへリダイレクト
        }

        UserModel user = (UserModel) session.getAttribute("userModel");
        if (user == null) {
            return "redirect:/user/login"; // ユーザーがログインしていない場合、ログインページへリダイレクト
        }
        String username = user.getUsername();
        String password = user.getPassword();
        int userId = usersDao.getlogin_id(username, password);

        // 注文情報を保存
        double total = 0;
        for (CartModel item : cartItems) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        double tax = total * 0.1;
        double totalWithTax = total + tax;

        order.setUserId(userId);
        order.setTotalAmount(Math.round(totalWithTax));
        order.setStatus("Pending");
        ordersDao.saveOrder(order);

        int orderId = ordersDao.getLastInsertedId();

        // 注文詳細を保存
        for (CartModel item : cartItems) {
            OrderDetailModel orderDetail = new OrderDetailModel();
            orderDetail.setOrderId(orderId);
            orderDetail.setProductId(item.getProduct().getProductId());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setPrice(item.getProduct().getPrice());
            ordersDao.saveOrderDetail(orderDetail);
        }

        // カートをクリア
        session.removeAttribute("cart");
        return "orderConfirmation"; // 購入完了ページへリダイレクト
    }
}
