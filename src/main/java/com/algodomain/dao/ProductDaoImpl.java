package com.algodomain.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.algodomain.constrants.SQLConstants;
import com.algodomain.dto.ProductResponse;
import com.algodomain.dto.SearchProductDTO;
import com.algodomain.entity.Product;
import com.algodomain.utils.Constants;
import com.algodomain.utils.ServerResponse;
import com.algodomain.utils.StringUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductDaoImpl implements ProductRepository {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public ServerResponse<List<ProductResponse>> searchProduct(SearchProductDTO searchProductDTO) {
		String query = SQLConstants.SEARCH_PRODUCT_QUERY;
		ServerResponse<List<ProductResponse>> response = new ServerResponse<>();
		List<Product> products = null;
		Map<String, Object> params = new HashMap<>();
		params.put(Constants.sellerId, searchProductDTO.getSellerId());
		if (!StringUtils.isNullOrEmpty(searchProductDTO.getCategory())) {
			query = query.concat(SQLConstants.BY_CATEGORY);
			params.put(Constants.CATEGORY, searchProductDTO.getCategory());
		}
		if (!StringUtils.isNullOrEmpty(searchProductDTO.getName())) {
			query = query.concat(SQLConstants.BY_NAME);
			params.put(Constants.NAME, searchProductDTO.getName());
		}
		if (!StringUtils.isNullOrEmpty(searchProductDTO.getType())) {
			query = query.concat(SQLConstants.BY_TYPE);
			params.put(Constants.TYPE, searchProductDTO.getType());
		}
		if (!StringUtils.isNullOrEmpty(searchProductDTO.getSortOrder())) {
			if (searchProductDTO.getSortOrder().equalsIgnoreCase("ASC"))
				query = query.concat(SQLConstants.BY_PRICE_ASC);
			if (searchProductDTO.getSortOrder().equalsIgnoreCase("DESC"))
				query = query.concat(SQLConstants.BY_PRICE_DESC);

		}
		try {
			log.info("Query : " + query);
			products = jdbcTemplate.query(query, params, BeanPropertyRowMapper.newInstance(Product.class));
			ObjectMapper mapper = new ObjectMapper();

			log.info("Products list retrieved...");
			List<ProductResponse> productResponses = new ArrayList<ProductResponse>();
			for (Product product : products) {
				ProductResponse productResponse = new ProductResponse();
				productResponse.setProduct(product);
				if (!StringUtils.isNullOrEmpty(product.getSpecification()))
					productResponse.setSpecification(mapper.readValue(product.getSpecification(), HashMap.class));
				productResponses.add(productResponse);
			}
			response.setResponse(productResponses);
			response.setStatusCode(200);
			response.setStatusMessage("Products list retrieved.");

		} catch (Exception e) {
			log.error("Error while getting product list" + e.getMessage(), e);
			response.setStatusCode(400);
			response.setStatusMessage("Error while getting product list" + e.getMessage());
		}
		return response;
	}

	@Override
	public ServerResponse<String> addProduct(ProductResponse productResponse) {
		ServerResponse<String> response = new ServerResponse<String>();
		Map<String, Object> params = new HashMap<>();
		String specifications = productResponse.getSpecification().toString();
		params.put(Constants.sellerId, productResponse.getProduct().getSeller_id());
		//params.put(Constants.specification, specifications);
		params.put(Constants.brand, productResponse.getProduct().getBrand());
		params.put(Constants.CATEGORY, productResponse.getProduct().getCategory());
		params.put(Constants.NAME, productResponse.getProduct().getName());
		params.put(Constants.TYPE, productResponse.getProduct().getType());
		params.put(Constants.price, productResponse.getProduct().getPrice());
		String query = SQLConstants.INSERT_PRODUCT_QUERY;
		try {
			int res = jdbcTemplate.update(query, params);
			if(res>0) {
				response.setStatusCode(201);
				log.info("Product created");

				response.setStatusMessage("Product created");
				response.setResponse("Product created");
			}
			else {
				response.setStatusCode(400);
				log.info("Error while creating product");

				response.setStatusMessage("Error while creating product");
				response.setResponse("Error while creating product");
			}
		} catch (Exception e) {
			response.setStatusCode(500);
			log.info("Error while creating product"+e.getMessage());

			response.setStatusMessage("Error while creating product");
			response.setResponse("Error while creating product"+e.getMessage());
		}
		
		return response;
	}
	
	
}
