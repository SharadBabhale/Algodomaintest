package com.algodomain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algodomain.dao.ProductRepository;
import com.algodomain.dto.ProductResponse;
import com.algodomain.dto.SearchProductDTO;
import com.algodomain.entity.Product;
import com.algodomain.utils.ServerResponse;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public ServerResponse<List<ProductResponse>> searchProducts(SearchProductDTO searchProductDTO) {
		
		return productRepository.searchProduct(searchProductDTO);
	}

	@Override
	public ServerResponse<String> addProduct(ProductResponse productResponse) {
		// TODO Auto-generated method stub
		return productRepository.addProduct(productResponse);
	}
	
	
	
}
