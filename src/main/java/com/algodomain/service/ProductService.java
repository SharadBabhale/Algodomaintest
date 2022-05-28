package com.algodomain.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.algodomain.dto.ProductResponse;
import com.algodomain.dto.SearchProductDTO;
import com.algodomain.entity.Product;
import com.algodomain.utils.ServerResponse;

@Service
public interface ProductService {
	
	public ServerResponse<List<ProductResponse>> searchProducts(SearchProductDTO searchProductDTO);
	
	public ServerResponse<String> addProduct(ProductResponse productResponse);
}
