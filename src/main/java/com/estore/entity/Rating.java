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
@Entity  @Table(name="Ratings")
public class Rating {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	//ProductId
	//CustomerId
	String rating;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/DD/YYYY")
	Date ratingDate;
	
	@ManyToOne
	@JoinColumn(name="customerId")
	Customer customerRating;
	
	@ManyToOne
	@JoinColumn(name="productId")
	Product productRating;

}
