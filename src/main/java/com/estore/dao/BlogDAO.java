package com.estore.dao;

import java.util.List;

import com.estore.entity.Blog;

public interface BlogDAO {
	Blog findById(Integer Id);
	List<Blog> findAll();
	Blog Create(Blog entity);
	void Update(Blog entity);
	Blog Delete(Integer Id);
}
