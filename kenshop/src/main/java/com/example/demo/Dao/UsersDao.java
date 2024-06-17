package com.example.demo.Dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.demo.model.UserModel;

@Repository
public class UsersDao implements BaseDao<UserModel> {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<UserModel> rowMapper = new BeanPropertyRowMapper<>(UserModel.class);


    //新規登録
    @Override
    public int add(UserModel user) {
        String sql = "INSERT INTO Users (username, password) VALUES (?, ?)";
        return jdbcTemplate.update(sql, user.getUsername(), user.getPassword());
    }

    //更新
    @Override
    public int update(UserModel user) {
        String sql = "UPDATE Users SET username = ?, password = ? WHERE id = ?";
        return jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getUserId());
    }

    //取得
    @Override
    public List<UserModel> getAll() {
        String sql = "SELECT * FROM Users";
        return jdbcTemplate.query(sql, rowMapper);
    }

    @Override
    public UserModel getById(Integer id) throws SQLException {
        String sql = "SELECT * FROM Users WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, rowMapper);
    }

    @Override
    public int delete(Integer id) {
        String sql = "DELETE FROM Users WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    // ユーザー名で検索
    public List<UserModel> getUsersByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE username LIKE ?";
        username = username.replace("%", "\\%").replace("_", "\\_");
        username = "%" + username + "%";
        return jdbcTemplate.query(sql, new Object[]{username}, rowMapper);
    }

    // ユーザー名とパスワードでユーザー取得
    public UserModel login_check(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{username, password}, rowMapper);
    }

    //同じユーザー名とパスワードがいた時にエラー出る。
    public Integer getlogin_id(String username, String password) {
        String sql = "SELECT id FROM Users WHERE username = ? AND password = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{username, password}, Integer.class);
    }
}
