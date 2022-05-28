package com.algodomain.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

import com.algodomain.utils.Constants;

/*
 * @author Sharad
 * 
 * */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	/**
	 * It will configure HttpSecurity
	 * @param HttpSecurity
	 */
	// 

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.NEVER);
		http.cors().and().csrf().disable().authorizeRequests()
		.antMatchers("/login").permitAll()
		.antMatchers("/addProduct").hasRole(Constants.seller)
		.antMatchers("/searchProduct").hasAnyRole(Constants.customer,Constants.seller);
		
		http.headers().frameOptions().disable();
	}
	

}