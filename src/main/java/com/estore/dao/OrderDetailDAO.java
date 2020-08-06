package com.estore.dao;

import java.util.List;

import com.estore.entity.Order;
import com.estore.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(Integer Id);
	List<OrderDetail> findAll();
	OrderDetail Create(OrderDetail entity);
	void Update(OrderDetail entity);
	OrderDetail Delete(Integer Id);
	List<OrderDetail> findByOrder(Order order);
}
