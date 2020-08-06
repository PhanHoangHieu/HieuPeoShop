package com.estore.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.validation.constraints.NotEmpty;


@Entity @Table(name="Customers")
public class Customer {
	
	@Id
	@NotEmpty(message="Username is not empty")
	String id;
	@Length(min=6,message="password >= 6 charater")
	String password;
	@NotEmpty
	String fullName;
	@NotEmpty
	@Email
	String email;
	String photo;
	Boolean activated;
	Boolean admin;
	
	@JsonIgnore
	@OneToMany(mappedBy ="customer", fetch = FetchType.EAGER)
	List<Order> orders;
	
	@JsonIgnore
	@OneToMany(mappedBy ="BlogCustomer") @Fetch(value = FetchMode.SUBSELECT)
	List<Blog> blogs;
	
	@JsonIgnore
	@OneToMany(mappedBy ="customerComment") @Fetch(value = FetchMode.SUBSELECT)
	List<Comment> Cuscomments;
	
	@JsonIgnore
	@OneToMany(mappedBy ="customerRating") @Fetch(value = FetchMode.SUBSELECT)
	List<Rating> Proratings;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

}
