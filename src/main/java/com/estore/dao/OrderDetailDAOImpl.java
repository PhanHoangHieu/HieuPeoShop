package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Order;
import com.estore.entity.OrderDetail;

@Transactional
@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
	@Autowired
	SessionFactory factory;

	public OrderDetail findById(Integer Id) {
		Session session = factory.getCurrentSession();
		OrderDetail entity = session.find(OrderDetail.class,Id);
		return entity;
	}

	public List<OrderDetail> findAll() {
		String hql ="FROM OrderDetail";
		Session session = factory.getCurrentSession();
		TypedQuery<OrderDetail> query = session.createQuery(hql,OrderDetail.class);
		List<OrderDetail> list = query.getResultList();
		return list;
	}

	public OrderDetail Create(OrderDetail entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(OrderDetail entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	public OrderDetail Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		OrderDetail entity = session.find(OrderDetail.class,Id);
		session.delete(entity);
		return entity;
	}

	public List<OrderDetail> findByOrder(Order order) {
		String hql ="FROM OrderDetail d WHERE d.order.id=:oid";
		Session session = factory.getCurrentSession();
		TypedQuery<OrderDetail> query = session.createQuery(hql,OrderDetail.class);
		query.setParameter("oid",order.getId());
		List<OrderDetail> list = query.getResultList();
		return list;
	}
	
	
}
