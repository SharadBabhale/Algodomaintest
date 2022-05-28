package com.algodomain.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.algodomain.dto.ProductResponse;
import com.algodomain.dto.SearchProductDTO;
import com.algodomain.entity.Product;
import com.algodomain.entity.User;
import com.algodomain.service.ProductService;
import com.algodomain.utils.ServerResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ProductController {

	@Autowired
	private ProductService productService;
	@PostMapping("/searchProduct")
	public ResponseEntity<ServerResponse<List<ProductResponse>>> searchProducts(@RequestBody SearchProductDTO searchProductDTO, HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		User user = (User) session.getAttribute("SESSION_USER") ;
		searchProductDTO.setSellerId(user.getUserId());
		ServerResponse<List<ProductResponse>> response = productService.searchProducts(searchProductDTO);
		return ResponseEntity.status(response.getStatusCode()).body(response);
	}
	
	@PostMapping("/addProduct")
	public ResponseEntity<ServerResponse<String>> addProduct(@RequestBody ProductResponse productResponse, HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		User user = (User) session.getAttribute("SESSION_USER") ;
		productResponse.getProduct().setSeller_id(user.getUserId());
		
		ServerResponse<String> response = productService.addProduct(productResponse);
		return ResponseEntity.status(response.getStatusCode()).body(response);
	}
	
}
