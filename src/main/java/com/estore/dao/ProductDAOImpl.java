package com.estore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.estore.entity.Product;

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SessionFactory factory;

	public Product findById(Integer Id) {
		Session session = factory.getCurrentSession();
		Product entity = session.find(Product.class,Id);
		return entity;
	}

	public List<Product> findAll() {
		String hql ="FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		List<Product> list = query.getResultList();
		return list; 
	}

	public Product Create(Product entity) {		
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	public void Update(Product entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	public Product Delete(Integer Id) {
		Session session = factory.getCurrentSession();
		Product entity = session.find(Product.class,Id);
		session.delete(entity);
		return entity;
	}

	public List<Product> findByCategoryId(Integer categoryId) {
		String hql ="FROM Product p WHERE p.category.id = :cid";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setParameter("cid",categoryId);
		query.setMaxResults(8);
		List<Product> list = query.getResultList();
		return list; 
	}

	public List<Product> findByKeywords(String keywords) {
		String hql ="FROM Product p WHERE p.name LIKE :kw OR p.category.name LIKE :kw OR p.category.nameVN LIKE :kw";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setParameter("kw","%"+keywords+"%");
		List<Product> list = query.getResultList();
		return list; 
		
	}

	public List<Product> findByIds(String ids) {
		String hql ="FROM Product p WHERE p.id IN ("+ids+")";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		List<Product> list = query.getResultList();
		return list; 
	}

	public List<Product> findBySpecial(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p";
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		switch(id) {
		case 0://moi
			hql ="FROM Product p ORDER BY p.productDate DESC";
			
			break;
		case 1://ban chay
			hql ="FROM Product p ORDER BY size(p.orderDetails) DESC";
			break;
		case 2://quan tam
			hql ="FROM Product p ORDER BY p.viewCount DESC";
			break;
			
		case 3://giam gia
			hql ="FROM Product p ORDER BY p.discount DESC";
			break;
		case 4  ://dac biet
			hql ="FROM Product p where p.special = true";
			break;
		}
		
		query =  session.createQuery(hql,Product.class);
		query.setMaxResults(8);
		List<Product> list = query.getResultList();
		return list; 
	}
	
	public List<Product> findBySell() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY size(p.orderDetails) DESC";
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setMaxResults(8);
		List<Product> list = query.getResultList();
		return list; 
	}
	
	public List<Product> findByNew() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY p.productDate DESC";
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setMaxResults(8);
		List<Product> list = query.getResultList();
		return list; 
	}
	
	public List<Product> findByCare() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY p.viewCount DESC";
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setMaxResults(8);
		List<Product> list = query.getResultList();
		return list; 
	}
	
	public List<Product> findByDiscount() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p ORDER BY p.discount DESC";
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setMaxResults(8);
		List<Product> list = query.getResultList();
		return list; 
	}

	@Override
	public long getPageCount(int pageSize) {
		String hql ="SELECT count(p) FROM Product p" ;
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql,Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount =(long)Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	@Override
	public List<Product> getPage(Integer pageNo, int pageSize) {
		String hql ="FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql,Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		List<Product> list = query.getResultList();
		return list;
	}
	
}
