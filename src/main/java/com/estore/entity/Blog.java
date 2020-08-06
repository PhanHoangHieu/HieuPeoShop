package com.estore.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity @Table(name="Blogs")
public class Blog {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	
	//String customerId;
	String title;
	String description;
	String descriptionlong;
	String image;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	Date blogDate;
	
	@ManyToOne
	@JoinColumn(name = "customerId")
	Customer BlogCustomer;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getBlogDate() {
		return blogDate;
	}

	public void setBlogDate(Date blogDate) {
		this.blogDate = blogDate;
	}

	public Customer getBlogCustomer() {
		return BlogCustomer;
	}

	public void setBlogCustomer(Customer blogCustomer) {
		BlogCustomer = blogCustomer;
	}
	

}
