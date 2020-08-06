package com.estore.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="Categories")
public class Category {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@NotEmpty(message="name is not empty")
	String name;
	@NotEmpty(message="nameVN is not empty")
	String nameVN;
	String image;
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	@JsonIgnore
	@OneToMany(mappedBy ="category",fetch = FetchType.LAZY)
	List<Product> products;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameVN() {
		return nameVN;
	}

	public void setNameVN(String nameVN) {
		this.nameVN = nameVN;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
}
