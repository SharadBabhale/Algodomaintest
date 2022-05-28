package com.algodomain.dto;

import lombok.Data;

@Data
public class SearchProductDTO {
	
	private String name;
	
	private String type;
	
	private String category;
	
	private String sortOrder;
	
	private int sellerId;
	
}
