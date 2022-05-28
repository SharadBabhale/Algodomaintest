package com.algodomain.dto;

import java.util.Map;

import com.algodomain.entity.Product;

import lombok.Data;

@Data
public class ProductResponse {
	
	
	
	private Product product;
	
	private Map<String, Object> specification;
	
}
