package com.example.demo.model;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;



public class LoginModel implements Serializable {
	@NotEmpty
	private String loginId;

	@NotEmpty
	private String password;


	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}