package com.example.demo.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.Dao.ProductsDao;
import com.example.demo.model.ProductModel;

@Controller
@RequestMapping("/product")
public class ProductsController {

	@Autowired
	private ProductsDao productDao;

	//商品詳細 　URLの/{id}部分を受け取る
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String p_detail(@PathVariable Integer id,Model model) throws SQLException {

		ProductModel product = productDao.getById(id);
		model.addAttribute("product", product);
		return "product_detail";

	}

}
