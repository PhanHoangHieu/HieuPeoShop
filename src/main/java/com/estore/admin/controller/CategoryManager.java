package com.estore.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.CategoryDAO;
import com.estore.entity.Category;

@Controller
public class CategoryManager {
	
	@Autowired
	CategoryDAO dao;
	@RequestMapping("/admin/category/index")
	public String index(Model model){
		Category entity = new Category();
		
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id){
		Category entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/create")
	public String create(RedirectAttributes model,
			@Validated @ModelAttribute("entity") Category entity,BindingResult errors){
		//can validate truoc khi insert
		if(errors.hasErrors()) {
			model.addAttribute("message","Please fix some following errors!");
			return "admin/category/index";
		}
		dao.Create(entity);
		model.addAttribute("message","Them moi thanh cong!");
		return "redirect:/admin/category/index";
	}
	
	@RequestMapping("/admin/category/update")
	public String update(RedirectAttributes model,@ModelAttribute("entity") Category entity){
		dao.Update(entity);
		model.addAttribute("message","Cap nhat thanh cong!");
		return "redirect:/admin/category/edit/" +entity.getId();
	}
	
	@RequestMapping(value = {"/admin/category/delete","/admin/category/delete/{id}"})
	public String delete(RedirectAttributes model,@RequestParam(value ="id", required = false) Integer id1,@PathVariable(value ="id", required = false) Integer id2){
		if(id1!=null) {
			dao.Delete(id1);
		}
		else {
			dao.Delete(id2);
		}
		
		model.addAttribute("message","Xoa thanh cong!");
		return "redirect:/admin/category/index";
	}
}
