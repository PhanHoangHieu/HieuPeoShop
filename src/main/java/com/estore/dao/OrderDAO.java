package com.estore.dao;

import java.util.List;

import com.estore.entity.Customer;
import com.estore.entity.Order;
import com.estore.entity.OrderDetail;
import com.estore.entity.Product;

public interface OrderDAO {
	Order findById(Integer Id);
	List<Order> findAll();
	Order Create(Order entity);
	void Update(Order entity);
	Order Delete(Integer Id);
	void create(Order order, List<OrderDetail> details);
	List<Order> findByUser(Customer user);
	List<Product> findItemsByUser(Customer user);
	long getPageCount(int pageSize);
	List<Order> getPage(Integer pageNo, int pageSize);
}
