package com.algodomain.utils;

public class StringUtils {
	
	public static boolean isNullOrEmpty(String param) {
		return param==null || param.trim().equals("");
	}

}
