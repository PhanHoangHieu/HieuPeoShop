package com.estore.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.estore.bean.MailInfo;
import com.estore.dao.CustomerDAO;
import com.estore.entity.Customer;
import com.estore.service.CookieService;
import com.estore.service.MailService;

@Controller
public class AccountController {
	@Autowired
	CustomerDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookie;
	@Autowired
	ServletContext app;
	@Autowired
	MailService mailer;
	
	@Autowired
	HttpServletRequest request;
	
	
	@GetMapping("/account/login")
	public String login(Model model){
		Cookie ckid =  cookie.Read("userid");
		Cookie ckpw = cookie.Read("pass");
		if(ckid!=null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();
			
			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		
		return "account/login";
	}
	
	@PostMapping("/account/login")
	public String login(Model model,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam(value="rm",defaultValue = "false") Boolean rm){
		
		Customer user = dao.findById(id);
		if(user == null) {
			model.addAttribute("message","Username invalid!");
		}else if(!pw.equals(user.getPassword())) {
			model.addAttribute("message","Password invalid!");
		}else if(!user.getActivated()) {
			model.addAttribute("message","Your account inactivated");
		}else {
			model.addAttribute("message","Login successfull!");
			session.setAttribute("user",user);
			if(user.getAdmin()==true) {
				if(rm==true) {
					cookie.Create("userid", user.getId(), 30);
					cookie.Create("pass", user.getPassword(), 30);
				}else {
					cookie.Delete("userid");
					cookie.Delete("pass");
				}
				return "redirect:/admin/home/index";
			}else {
				if(rm==true) {
					cookie.Create("userid", user.getId(), 30);
					cookie.Create("pass", user.getPassword(), 30);
				}else {
					cookie.Delete("userid");
					cookie.Delete("pass");
				}
				
			}
			
			//ghi nho tai khoan = cookie
			
			// quay lai trang duoc bao ve neu co
			
			String backUrl = (String) session.getAttribute("back-url");
			if(backUrl!=null) {
				return "redirect:" + backUrl;
			}
			
		}
		return "account/login";
	}
	
	@RequestMapping("/account/logoff")
	public String logoff(Model model){
		
		session.removeAttribute("user");
		return "redirect:/home/index";
	}
	
	@GetMapping("/account/register")
	public String register(Model model){
		Customer user = new Customer();
		model.addAttribute("form",user);
		return "account/register";
	}
	
	@PostMapping("/account/register")
	public String register(Model model,
			@Validated @ModelAttribute("form") Customer user,BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException{
		
		if(errors.hasErrors()) {
			model.addAttribute("message","Please fix some following errors!");
			return "account/register";
		}
		else{
			Customer user2 =dao.findById(user.getId());
			if(user2!=null) {
				model.addAttribute("message","Username is in used!");
				return "account/register";
			}
		}
		if(file.isEmpty()) {
			user.setPhoto("user.png");
		}
		else {
			String dir = app.getRealPath("/static/images/customer");
			File f = new File(dir,file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		
		user.setActivated(false);
		user.setAdmin(false);
		dao.Create(user);
		model.addAttribute("message","Register successfull!");
		
		String from ="phoanghieu98gmail.com";
		String to = user.getEmail();
		String subject = "Welcome mail";
		String url =request.getRequestURL().toString().replace("register", "activate/"+user.getId());
		String body ="Click<a href='"+url+"'>Activited</a>";
		MailInfo mail = new  MailInfo(from,to,subject,body);
		mailer.send(mail);
		
		return "redirect:/account/login";
	}
	
	
	
	@GetMapping("/account/activate/{id}")
	public String activate(Model model ,@PathVariable("id") String id){
		Customer user = dao.findById(id);
		user.setActivated(true);
		dao.Update(user);
		return "redirect:/account/login";
	}
	

	@GetMapping("/account/forgot")
	public String forgot(Model model){
		return "account/forgot";
	}
	
	@PostMapping("/account/forgot")
	public String forgot(Model model,
			@RequestParam("id") String id,
			@RequestParam("email") String email) throws MessagingException{
		Customer user = dao.findById(id);
		if(user == null) {
			model.addAttribute("message","Invalid UserName!");
		}else if(!email.equals(user.getEmail())){
			model.addAttribute("message","Invalid Email!");
		}else {
			String from ="phoanghieu98gmail.com";
			String to = user.getEmail();
			String subject = "forgot Password";
			String body ="Your password is: " +  user.getPassword();
			MailInfo mail = new  MailInfo(from,to,subject,body);
			mailer.send(mail);
			model.addAttribute("message","Your password was send");
		}
		user.setActivated(true);
		dao.Update(user);
		return "redirect:/account/login";
	}
	
	
	@GetMapping("/account/change")
	public String change(Model model){
		return "account/change";
	}
	

	
	@PostMapping("/account/change")
	public String change(Model model,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1,
			@RequestParam("pw2") String pw2){
		
		if(!pw1.equals(pw2)) {
			model.addAttribute("message","Password is not match!");
		}
		else if(pw1.length() < 6  || pw2.length() < 6 ) {
			model.addAttribute("message","password >= 6 charater");
		}
		else {
			Customer user = dao.findById(id);
			if(user == null) {
				model.addAttribute("message","Invalid UserName!");
			}else if(!pw.equals(user.getPassword())){
				model.addAttribute("message","Invalid Password!");
			}else {
				user.setPassword(pw1);
				dao.Update(user);
				model.addAttribute("message","Change password successfully!");
			}
			return "redirect:/account/login";
		}
		return "account/change";
		
	}

	
	@GetMapping("/account/edit")
	public String edit(Model model){
		Customer user = (Customer)session.getAttribute("user");
		model.addAttribute("form",user);
		return "account/edit";
	}
	
	@PostMapping("/account/edit")
	public String edit(Model model,
			@Validated @ModelAttribute("form") Customer user,BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException{
		if(errors.hasErrors()) {
			model.addAttribute("message","Please fix some following errors!");
			return "account/edit";
		}
		else{
			Customer user2 =dao.findById(user.getId());
			if(user2!=null) {
				model.addAttribute("message","Username is in used!");
				return "account/edit";
			}
		}
		if(!file.isEmpty()){
			String dir = app.getRealPath("/static/images/customer");
			File f = new File(dir,file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		
		dao.Update(user);
		session.setAttribute("user",user);
		model.addAttribute("message","Update account successfull!");
		
		return "account/edit";
	}
	
}
