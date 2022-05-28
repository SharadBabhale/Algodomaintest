package com.algodomain.constrants;

public class SQLConstants {
	
	public static String SEARCH_PRODUCT_QUERY = "Select * from product where seller_id = :sellerId ";
		
	public static String BY_NAME = "AND name = :name ";
	
	public static String BY_TYPE = "AND type = :type ";

	public static String BY_CATEGORY = "AND category = :category ";

	public static String BY_PRICE_ASC = "order by price ";
	
	public static String BY_PRICE_DESC = "order by price DESC";
	
	public static String INSERT_PRODUCT_QUERY = "INSERT INTO `product` ( `name`, `type`, `category`, `brand`, `price`, `seller_id`) VALUES ( :name, :type, :category, :brand, :price, :sellerId)" ;
	
}
