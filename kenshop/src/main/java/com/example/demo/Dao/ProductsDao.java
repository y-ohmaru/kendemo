package com.example.demo.Dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.ProductModel;

@Repository
public class ProductsDao implements BaseDao<ProductModel> {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<ProductModel> rowMapper = new BeanPropertyRowMapper<>(ProductModel.class);

    @Override
    public int add(ProductModel product) {
        String sql = "INSERT INTO Products (name, description, price, stock_quantity, image_url) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, product.getName(), product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getImageUrl());
    }

    @Override
    public int update(ProductModel product) {
        String sql = "UPDATE Products SET name = ?, description = ?, price = ?, stock_quantity = ?, image_url = ? WHERE product_id = ?";
        return jdbcTemplate.update(sql, product.getName(), product.getDescription(), product.getPrice(), product.getStockQuantity(), product.getImageUrl(), product.getProductId());
    }

    @Override
    public List<ProductModel> getAll() {
        String sql = "SELECT * FROM Products";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public ProductModel getById(Integer id) throws SQLException {
        String sql = "SELECT * FROM Products WHERE product_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, rowMapper);
    }

    @Override
    public int delete(Integer id) {
        String sql = "DELETE FROM Products WHERE product_id = ?";
        return jdbcTemplate.update(sql, id);
    }

    // 商品名で検索
    public List<ProductModel> getProductsByName(String name) {
        String sql = "SELECT * FROM Products WHERE name LIKE ?";
        name = name.replace("%", "\\%").replace("_", "\\_");
        name = "%" + name + "%";
        return jdbcTemplate.query(sql, new Object[]{name}, rowMapper);
    }
}
