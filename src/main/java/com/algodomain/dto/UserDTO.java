package com.algodomain.dto;

import java.sql.Date;

import com.algodomain.enums.CustomerStatus;
import com.algodomain.enums.Roles;

import lombok.Data;

@Data

public class UserDTO {
	
	private int userId;
	
	private CustomerStatus customerStatus;
	
	private String firstName;
	
	private String lastName;
	
	private String email;
		
	private Roles roles;
	
	private Date dateOfBirth;
	
	private String token;
	
	private String address;
	
}
