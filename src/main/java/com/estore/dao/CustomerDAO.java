package com.estore.dao;

import java.util.List;

import com.estore.entity.Customer;

public interface CustomerDAO {
	Customer findById(String Id);
	List<Customer> findAll();
	Customer Create(Customer entity);
	void Update(Customer entity);
	Customer Delete(String Id);
	long getPageCount(int pageSize);
	List<Customer> getPage(int pageNo, int pageSize);
}
