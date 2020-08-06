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

@Entity  @Table(name="Comments")
public class Comment {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	//ProductId
	//CustomerId
	String comment;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/DD/YYYY")
	Date commentDate;
	String image;
	
	@ManyToOne
	@JoinColumn(name="customerId")
	Customer customerComment;
	
	@ManyToOne
	@JoinColumn(name="productId")
	Product productComment;
}
