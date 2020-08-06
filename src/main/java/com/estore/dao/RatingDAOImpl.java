package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.estore.entity.Rating;

public class RatingDAOImpl implements RatingDAO{
	@Autowired
	SessionFactory factory;
	public Rating findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Rating entity = session.find(Rating.class,Id);
		return entity;
	}

	public List<Rating> findAll() {
		String hql ="FROM Rating";
		Session session = factory.getCurrentSession();
		TypedQuery<Rating> query = session.createQuery(hql,Rating.class);
		List<Rating> list = query.getResultList();
		return list; 
	}

	public Rating Create(Rating entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Rating entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	public Rating Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		Rating entity = session.find(Rating.class,Id);
		session.delete(entity);
		return entity;
	}
	
}
