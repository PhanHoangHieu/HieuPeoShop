package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Comment;

@Transactional
@Repository
public class CommentDAOImpl implements CommentDAO{
	@Autowired
	SessionFactory factory;
	public Comment findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Comment entity = session.find(Comment.class,Id);
		return entity;
	}

	public List<Comment> findAll() {
		String hql ="FROM Comment";
		Session session = factory.getCurrentSession();
		TypedQuery<Comment> query = session.createQuery(hql,Comment.class);
		List<Comment> list = query.getResultList();
		return list; 
	}

	public Comment Create(Comment entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Comment entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		
	}

	public Comment Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		Comment entity = session.find(Comment.class,Id);
		session.delete(entity);
		return entity;
	}
	
}
