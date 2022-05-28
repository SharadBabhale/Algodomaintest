package com.algodomain.dto;

import com.algodomain.entity.User;

import lombok.Data;

@Data
public class LoginResponse {

	private int statusCode;

	private String statusMessage;
	
	private User user;
	
	private String token;
}
