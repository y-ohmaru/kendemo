package com.example.demo.model;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

public class UserModel implements Serializable {

    private Integer userId;

    @NotEmpty
    private String username;

    @NotEmpty
    private String password;


    private String email;

    // 都道府県
    private String address_line1;

    // 市区
    private String address_line2;

    // 町村
    private String city;

    // 番地
    private String state;

    // 郵便番号
    private String postal_code;

    // ユーザーの状態
    private Status status;

    // ユーザーの状態を表すEnum
    public enum Status {
        ACTIVE,
        DEACTIVATED
    }

    // ゲッターとセッター
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress_line1() {
        return address_line1;
    }

    public void setAddress_line1(String address_line1) {
        this.address_line1 = address_line1;
    }

    public String getAddress_line2() {
        return address_line2;
    }

    public void setAddress_line2(String address_line2) {
        this.address_line2 = address_line2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

}
