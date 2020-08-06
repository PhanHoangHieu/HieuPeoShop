package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Transactional
@Repository
public class ReportDAOImpl implements ReportDAO{
	
	@Autowired
	SessionFactory factory;

	public List<Object[]> inventory() {
		String hql ="SELECT p.category.name,"
					+ " SUM(p.quantity),"
					+ " SUM(p.unitPrice*p.quantity),"
					+ " MIN(p.unitPrice),"
					+ " MAX(p.unitPrice),"
					+ " AVG(p.unitPrice)"
					+ " FROM Product p "
					+ " GROUP BY p.category.name"; 
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	public List<Object[]> revenueByCategory() {
		String hql ="SELECT d.product.category.name,"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice*d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d "
				+ " GROUP BY d.product.category.name"; 
		
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	public List<Object[]> revenueByCustomer() {
		String hql ="SELECT d.order.customer.id,"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice*d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d "
				+ " GROUP BY d.order.customer.id";
				//+ " ORDER BY SUM(d.unitPrice*d.quantity) DESC"; 
		
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	public List<Object[]> revenueByYear() {
		String hql ="SELECT YEAR(d.order.orderDate),"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice*d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d "
				+ " GROUP BY YEAR(d.order.orderDate)"
				+ " ORDER BY YEAR(d.order.orderDate) DESC"; 
		
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	public List<Object[]> revenueByQuater() {
		String hql ="SELECT CEILING((MONTH(d.order.orderDate)+1) / 3.0),"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice*d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d "
				+ " GROUP BY CEILING((MONTH(d.order.orderDate)+1) / 3.0)"
				+ " ORDER BY CEILING((MONTH(d.order.orderDate)+1) / 3.0) DESC"; 
		
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	public List<Object[]> revenueByMonth() {
		String hql ="SELECT MONTH(d.order.orderDate),"
				+ " SUM(d.quantity),"
				+ " SUM(d.unitPrice*d.quantity),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d "
				+ " GROUP BY MONTH(d.order.orderDate)"
				+ " ORDER BY MONTH(d.order.orderDate) DESC"; 
		
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql,Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

}
