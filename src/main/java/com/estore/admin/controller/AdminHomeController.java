package com.estore.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.estore.dao.ReportDAO;

@Controller
public class AdminHomeController {
	
	@Autowired
	ReportDAO dao;
	
	@RequestMapping("/admin/home/index")
	public String index(Model model){
		model.addAttribute("data",dao.inventory());
		model.addAttribute("cus",dao.revenueByCustomer());
		return "admin/home/index";
	}
	
	
}
