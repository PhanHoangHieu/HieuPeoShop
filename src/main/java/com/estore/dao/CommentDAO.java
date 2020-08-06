package com.estore.dao;

import java.util.List;

import com.estore.entity.Comment;

public interface CommentDAO {
	Comment findById(Integer Id);
	List<Comment> findAll();
	Comment Create(Comment entity);
	void Update(Comment entity);
	Comment Delete(Integer Id);
}
