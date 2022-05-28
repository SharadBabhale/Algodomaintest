package com.algodomain.entity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.algodomain.utils.JsonToMapConverter;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "product")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_id")
	private int productId;
	
	@JsonIgnore
	@Column(name="specification")
	@Convert(attributeName = "specification", converter = JsonToMapConverter.class)
	private String specification ;
	
	@Column(name="name")
	private String name;

	@Column(name="type")
	private String type;
	
	@Column(name="category")
	private String category;
	
	@Column(name="brand")
	private String brand;
	
	@Column(name="price")
	private double price;
	
	private int seller_id;
	/*
	 * @ManyToOne
	 * 
	 * @JoinColumn(name = "seller_id") private User seller;
	 */
	
}
