package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Customer;
import com.estore.entity.Order;
import com.estore.entity.OrderDetail;
import com.estore.entity.Product;

@Transactional
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	SessionFactory factory;

	public Order findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Order entity = session.find(Order.class,Id);
		return entity;
	}

	public List<Order> findAll() {
		String hql ="FROM Order";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql,Order.class);
		List<Order> list = query.getResultList();
		return list;
	}

	public Order Create(Order entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Order entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	public Order Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		Order entity = session.find(Order.class,Id);
		session.delete(entity);
		return entity;
	}

	public void create(Order order, List<OrderDetail> details) {
		Session session = factory.getCurrentSession();
		session.save(order);
		
		for(OrderDetail detail:details) {
			session.save(detail);
		}
	}

	public List<Order> findByUser(Customer user) {
		String hql ="FROM Order o WHERE o.customer.id = :uid ORDER BY o.orderDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql,Order.class);
		query.setParameter("uid",user.getId());
		List<Order> list = query.getResultList();
		return list;
	}

	public List<Product> findItemsByUser(Customer user) {
		String hql ="SELECT DISTINCT d.product FROM OrderDetail d WHERE d.order.customer.id = :uid";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setParameter("uid",user.getId());
		List<Product> list = query.getResultList();
		return list;
	}

	public long getPageCount(int pageSize) {
		String hql ="SELECT count(c) FROM Order c" ;
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql,Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount =(long)Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	public List<Order> getPage(Integer pageNo, int pageSize) {
		String hql ="FROM Order";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql,Order.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		List<Order> list = query.getResultList();
		return list;
	}

	
}
