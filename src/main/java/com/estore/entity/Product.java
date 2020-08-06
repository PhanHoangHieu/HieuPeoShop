package com.estore.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="Products")
public class Product {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@NotEmpty(message="name is not empty")
	String name;
	@Range(min = (long) 0.0,message="unitPrice >= 0")
	Double unitPrice;
	
	String image;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/DD/YYYY")
	Date productDate;
	
	Boolean available;
	//Integer categoryId;
	@Range(min = (int) 1,message="quantity >= 1")
	Integer quantity;
	@NotEmpty(message="description is not empty")
	String description;
	@Range(min = (long) 0.0,message="discount >= 0")
	Double discount;
	
	@Range(min = (long) 0,message="discount >= 0")
	Integer viewCount;
	
	Boolean special;

	@ManyToOne
	@JoinColumn(name="categoryId")
	Category category;
	
	@JsonIgnore
	@OneToMany(mappedBy ="order", fetch = FetchType.EAGER)
	List<OrderDetail> orderDetails;
	
	@JsonIgnore
	@OneToMany(mappedBy ="productRating") @Fetch(value = FetchMode.SUBSELECT)
	List<Rating> ratings;
	
	@JsonIgnore
	@OneToMany(mappedBy ="productComment") @Fetch(value = FetchMode.SUBSELECT)
	List<Comment> comments;
	
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

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Boolean getSpecial() {
		return special;
	}

	public void setSpecial(Boolean special) {
		this.special = special;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	
}
