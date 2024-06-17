package com.example.demo.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.model.OrderDetailModel;
import com.example.demo.model.OrderModel;

@Repository
public class OrdersDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 注文を保存
    public int saveOrder(OrderModel order) {
        String sql = "INSERT INTO orders (user_id, total_amount, status, shipping_address_line1, shipping_address_line2, " +
                     "shipping_city, shipping_state, shipping_postal_code, shipping_country, created_at, updated_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())";
        return jdbcTemplate.update(sql, order.getUserId(), order.getTotalAmount(), order.getStatus(), order.getShippingAddressLine1(),
                                   order.getShippingAddressLine2(), order.getShippingCity(), order.getShippingState(),
                                   order.getShippingPostalCode(), order.getShippingCountry());
    }

    // 最後に挿入された注文IDを取得
    public int getLastInsertedId() {
        return jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
    }


    // 注文詳細を保存
    public int saveOrderDetail(OrderDetailModel orderDetail) {
        String sql = "INSERT INTO order_details (order_id, product_id, quantity, price, created_at, updated_at) " +
                     "VALUES (?, ?, ?, ?, NOW(), NOW())";
        return jdbcTemplate.update(sql, orderDetail.getOrderId(), orderDetail.getProductId(), orderDetail.getQuantity(), orderDetail.getPrice());
    }


 // 複数の注文詳細を保存
    public void saveOrderDetails(List<OrderDetailModel> orderDetails) {
        for (OrderDetailModel orderDetail : orderDetails) {
            saveOrderDetail(orderDetail);
        }
    }
}

