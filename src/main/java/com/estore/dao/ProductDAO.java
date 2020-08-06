package com.estore.dao;

import java.util.List;
import com.estore.entity.Product;

public interface ProductDAO {
	Product findById(Integer Id);
	List<Product> findAll();
	Product Create(Product entity);
	void Update(Product entity);
	Product Delete(Integer Id);
	List<Product> findByCategoryId(Integer categoryId);
	List<Product> findByKeywords(String keywords);
	List<Product> findByIds(String ids);
	List<Product> findBySpecial(Integer id);
	List<Product> findByNew();
	List<Product> findByDiscount();
	List<Product> findByCare();
	List<Product> findBySell();
	long getPageCount(int pageSize);
	List<Product> getPage(Integer pageNo, int pageSize);

}