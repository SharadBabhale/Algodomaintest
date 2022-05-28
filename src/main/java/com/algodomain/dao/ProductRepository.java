package com.algodomain.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.algodomain.dto.ProductResponse;
import com.algodomain.dto.SearchProductDTO;
import com.algodomain.entity.Product;
import com.algodomain.utils.ServerResponse;

public interface ProductRepository {
	
	public ServerResponse<List<ProductResponse>> searchProduct(SearchProductDTO searchProductDTO);
	
	public ServerResponse<String> addProduct(ProductResponse productResponse);

}
