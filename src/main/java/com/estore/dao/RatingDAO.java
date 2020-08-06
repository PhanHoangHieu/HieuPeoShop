package com.estore.dao;

import java.util.List;

import com.estore.entity.Rating;

public interface RatingDAO {
	Rating findById(Integer Id);
	List<Rating> findAll();
	Rating Create(Rating entity);
	void Update(Rating entity);
	Rating Delete(Integer Id);
}
