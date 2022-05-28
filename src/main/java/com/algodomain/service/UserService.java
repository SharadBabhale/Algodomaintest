package com.algodomain.service;

import org.springframework.stereotype.Service;

import com.algodomain.dto.LoginRequest;
import com.algodomain.dto.LoginResponse;
import com.algodomain.entity.User;
import com.algodomain.utils.ServerResponse;

@Service
public interface UserService {
	public LoginResponse login(LoginRequest loginRequest);
	
	
}
