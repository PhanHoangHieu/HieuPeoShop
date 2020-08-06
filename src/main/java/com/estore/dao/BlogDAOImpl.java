package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Blog;

@Transactional
@Repository
public class BlogDAOImpl implements BlogDAO {
	@Autowired
	SessionFactory factory;
	public Blog findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Blog entity = session.find(Blog.class,Id);
		return entity;
	}

	public List<Blog> findAll() {
		String hql ="FROM Blog";
		Session session = factory.getCurrentSession();
		TypedQuery<Blog> query = session.createQuery(hql,Blog.class);
		List<Blog> list = query.getResultList();
		return list; 
	}

	public Blog Create(Blog entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Blog entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	public Blog Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		Blog entity = session.find(Blog.class,Id);
		session.delete(entity);
		return entity;
	}
	
}
