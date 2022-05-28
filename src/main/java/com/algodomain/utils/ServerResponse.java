package com.algodomain.utils;
import lombok.Data;

@Data
public class ServerResponse<T> {
	
	
	private int statusCode;
	
	private String statusMessage;
	
	private T response;
}
