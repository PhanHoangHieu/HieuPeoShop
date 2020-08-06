package com.estore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.estore.dao.CategoryDAO;
import com.estore.dao.ProductDAO;
import com.estore.entity.Product;


@Controller
public class HomeController {
	@Autowired
	CategoryDAO cdao;
	
	@Autowired
	ProductDAO pdao;
	@RequestMapping("/home/index")
	public String index(Model model){
		
		List<Product>  list = pdao.findBySpecial(4);
		model.addAttribute("list", list);
		return "home/index";
	}
	
	@RequestMapping("/home/about")
	public String about(){
		return "home/about";
	}
	
	@RequestMapping("/home/contact")
	public String contact(){
		return "home/contact";
	}
	@RequestMapping("/home/blog")
	public String blog(){
		return "home/blog";
	}
	@RequestMapping("/home/blogdetail")
	public String blogdetail(){
		return "home/blogdetail";
	}
}
