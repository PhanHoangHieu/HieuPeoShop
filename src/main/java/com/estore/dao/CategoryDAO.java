package com.estore.dao;

import java.util.List;

import com.estore.entity.Category;

public interface CategoryDAO {
	Category findById(Integer Id);
	List<Category> findAll();
	Category Create(Category entity);
	void Update(Category entity);
	Category Delete(Integer Id);
}
