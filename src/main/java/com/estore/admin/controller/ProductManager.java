package com.estore.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.estore.dao.ProductDAO;
import com.estore.entity.Product;

@Controller
public class ProductManager {
	
	@Autowired
	ProductDAO dao;
	@Autowired
	ServletContext app;
	@RequestMapping("/admin/product/index")
	public String index(Model model){
		Product entity = new Product();
		
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id){
		Product entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/create")
	public String create(RedirectAttributes model,
			@Validated @ModelAttribute("entity") Product entity,BindingResult errors,
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException{
		//can validate truoc khi insert
		if(errors.hasErrors()) {
			model.addAttribute("message","Please fix some following errors!");
			return "admin/product/index";
		}
		if(file.isEmpty()) {
			entity.setImage("admin-1.png");
		}else {
			entity.setImage(file.getOriginalFilename());
			String path=app.getRealPath("/static/images/product/" + entity.getImage());
			file.transferTo(new File(path));
		}
		dao.Create(entity);
		model.addAttribute("message","Them moi thanh cong!");
		return "redirect:/admin/product/index";
	}
	
	@RequestMapping("/admin/product/update")
	public String update(RedirectAttributes model,
			@ModelAttribute("entity") Product entity,
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException{
		if(!file.isEmpty()) {
			entity.setImage(file.getOriginalFilename());
			String path=app.getRealPath("/static/images/product/" + entity.getImage());
			file.transferTo(new File(path));
		}
		dao.Update(entity);
		model.addAttribute("message","Cap nhat thanh cong!");
		return "redirect:/admin/product/edit/" +entity.getId();
	}
	
	@RequestMapping(value = {"/admin/product/delete","/admin/product/delete/{id}"})
	public String delete(RedirectAttributes model,@RequestParam(value ="id", required = false) Integer id1,@PathVariable(value ="id", required = false) Integer id2){
		if(id1!=null) {
			dao.Delete(id1);
		}
		else {
			dao.Delete(id2);
		}
		
		model.addAttribute("message","Xoa thanh cong!");
		return "redirect:/admin/product/index";
	}
	
	int pageSize =8;
	@ResponseBody
	@RequestMapping("/pager/product/page-count")
	public long pageCount() {
		return dao.getPageCount(pageSize);
	}
	
	@ResponseBody
	@RequestMapping("/pager/product/page/{pageNo}")
	public List<Product> getPage(@PathVariable("pageNo") Integer pageNo) {
		
		List<Product> list = dao.getPage(pageNo,pageSize);
		return list;
	}
}
