package com.estore.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.estore.dao.ProductDAO;
import com.estore.entity.Product;

@SessionScope //scopedTarget.cartService
@Service
public class CartService {
	
	@Autowired
	ProductDAO dao;
	Map<Integer, Product> map = new HashMap<Integer, Product>();

	// them sp
	public void add(Integer id) {
		Product p = map.get(id);
		if(p==null) {
			p=dao.findById(id);
			p.setQuantity(1);
			map.put(id,p);
		}else{
			p.setQuantity(p.getQuantity()+1);
		}
	}

	// xoa sp
	public void remove(Integer id) {
		map.remove(id);
	}

	// cap nhap sl cua sp
	public void update(Integer id, int qty) {
		Product p = map.get(id);
		p.setQuantity(qty);
	}

	// xoa sach cac sp trong gio
	public void clear() {
		map.clear();
	}

	// tong sl sp
	public int getCount() {
		Collection<Product> ps = this.getItems();
		int count = 0;
		
		for(Product p:ps){
			count += p.getQuantity();
		}
		return count;
	}

	// tong sl tien
	public double getAmount() {
		Collection<Product> ps = this.getItems();
		double amount = 0;
		
		for(Product p:ps){
			amount += p.getQuantity()*p.getUnitPrice()*(1-p.getDiscount()/100);
		}
		return amount;
	}

	public Collection<Product> getItems() {
		return map.values();
	}
}
