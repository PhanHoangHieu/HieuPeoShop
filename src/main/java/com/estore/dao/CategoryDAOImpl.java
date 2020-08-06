package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Category;

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	SessionFactory factory;
	public Category findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Category entity = session.find(Category.class,Id);
		return entity;
	}

	public List<Category> findAll() {
		String hql ="FROM Category";
		Session session = factory.getCurrentSession();
		TypedQuery<Category> query = session.createQuery(hql,Category.class);
		List<Category> list = query.getResultList();
		return list; 
	}

	public Category Create(Category entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Category entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	public Category Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		Category entity = session.find(Category.class,Id);
		session.delete(entity);
		return entity;
	}
	
}
