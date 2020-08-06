package com.estore.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.estore.bean.MailInfo;
import com.estore.dao.ProductDAO;

import com.estore.entity.Product;
import com.estore.service.CookieService;
import com.estore.service.MailService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	@Autowired
	CookieService cookie;
	
	@Autowired 
	MailService mail;

	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {

		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("list", list);
		return "product/productlist";
	}
	
	@RequestMapping("/product/productlist")
	public String listProduct(Model model) {
		return "product/productlist";
	}

	@RequestMapping("/product/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {

		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list", list);
		return "product/list";
	}

	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		// tim kiem theo id
		Product prod = pdao.findById(id);
		model.addAttribute("prod", prod);
		
		// tang luot xem
		prod.setViewCount(prod.getViewCount()+1);
		pdao.Update(prod);
		
		//hang cung loai
		List<Product> list = pdao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list", list);
		
		// lay ra ds sp yeu thich
		Cookie favo = cookie.Read("favo");
		if (favo != null) {
			String ids = favo.getValue();
			List<Product> favo_list = pdao.findByIds(ids);
			model.addAttribute("favo", favo_list);
		}

		//ds sp da xem
		Cookie viewed = cookie.Read("viewed");
		String value = id.toString();
		if (viewed != null) {
			value = viewed.getValue();
			value += "," + id.toString();
		}
		cookie.Create("viewed", value, 10);
		List<Product> view_list = pdao.findByIds(value);
		model.addAttribute("viewed", view_list);
		
		return "product/detail";
	}

	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public boolean addToFavo(Model model, @PathVariable("id") Integer id) {

		Cookie favo = cookie.Read("favo");
		String value = id.toString();
		if (favo != null) {
			value = favo.getValue();
			if (!value.contains(id.toString())) {
				value += "," + id.toString();
			} else {
				return false;
			}
		}
		favo = cookie.Create("favo", value, 30);
		return true;
	}
	
	
	@RequestMapping("/product/list-by-special/{id}")
	public String listBySpecial(Model model, @PathVariable("id") Integer id) {

		List<Product> list = pdao.findBySpecial(id);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-new")
	public String listByNew(Model model) {

		List<Product> list = pdao.findByNew();
		model.addAttribute("list",list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-discount")
	public String listByDiscount(Model model) {

		List<Product> list = pdao.findByDiscount();
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-care")
	public String listByCare(Model model) {

		List<Product> list = pdao.findByCare();
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-sell")
	public String listBySell(Model model) {

		List<Product> list = pdao.findBySell();
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@ResponseBody
	@RequestMapping("/product/send-to-friend")
	public boolean sendToFriend(Model model,MailInfo info,HttpServletRequest req){
		
		//send mail
		info.setSubject("Thông tin hàng hóa");
		try {
			String id = req.getParameter("id");
			String link =req.getRequestURL().toString().replace("send-to-friend", "detail/"+id);
			info.setBody(info.getBody()+"<hr><a href='"+link+"'>Xem chi tiet</a>");
			mail.send(info);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
}
