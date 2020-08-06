package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Customer;

@Transactional
@Repository
public class CustomerDAOImpl implements CustomerDAO {
	@Autowired
	SessionFactory factory;

	public Customer findById(String Id) {
		Session session = factory.getCurrentSession();
		Customer entity = session.find(Customer.class,Id);
		return entity;
	}

	public List<Customer> findAll() {
		String hql ="FROM Customer";
		Session session = factory.getCurrentSession();
		TypedQuery<Customer> query = session.createQuery(hql,Customer.class);
		List<Customer> list = query.getResultList();
		return list;
	}

	public Customer Create(Customer entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Customer entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	public Customer Delete(String Id) {
		Session session = factory.getCurrentSession();
		Customer entity = session.find(Customer.class,Id);
		session.delete(entity);
		return entity;
	}

	public long getPageCount(int pageSize) {
		String hql ="SELECT count(c) FROM Customer c" ;
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql,Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount =(long)Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	public List<Customer> getPage(int pageNo, int pageSize) {
		String hql ="FROM Customer";
		Session session = factory.getCurrentSession();
		TypedQuery<Customer> query = session.createQuery(hql,Customer.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		List<Customer> list = query.getResultList();
		return list;
	}
	
	
}

