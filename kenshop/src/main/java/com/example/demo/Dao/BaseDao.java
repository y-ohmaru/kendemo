package com.example.demo.Dao;


import java.sql.SQLException;
import java.util.List;

public interface BaseDao<T> {
	int add(T entity);
	int update(T entity);
	List<T> getAll();
	T getById(Integer id) throws SQLException;
	int delete(Integer id);
}


