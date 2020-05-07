package com.kotei.HouseRent.Controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kotei.HouseRent.Entity.OwnerEntity;
import com.kotei.HouseRent.Service.OwnerService;
import com.kotei.HouseRent.dao.OwnerDao;

@Controller
public class JSPController {

	@Autowired
	OwnerService service;
	
	@RequestMapping("/index")
	public String index(Model model){
		return "index";
	}
	
	@RequestMapping("/default")
	public String deafult(Model model){
		return "default";
	}
	
	@RequestMapping("/login")
	public String login(){
		System.out.println("进入登录页面");
		return "login";
	}
	
	@RequestMapping("/register")
	public String register(){
		System.out.println("进入注册页面");
		return "register";
	}

	@RequestMapping("/publishHouse")
	public String publishHouse(Model model){
		System.out.println("发布房源页面");
		return "publish";
	}
	
	@RequestMapping(value="/userLogin", method=RequestMethod.POST)
	public String userLogin(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("登录成功：" + request.getParameter("username") + request.getParameter("password"));
		
		//获取用户名和密码
		String userName=request.getParameter("username");
		String userPass=request.getParameter("password");
		
		response.setContentType("text/html;charset=UTF-8");
		
		OwnerEntity owner=service.getOwnerByName(userName);
		
		if(owner==null){
			System.out.println("用户不存在：" + request.getParameter("username") + request.getParameter("password"));
			return "login";
		}
		
		if(!owner.getPassword().equals(userPass)) {
			System.out.println("密码错误：" + request.getParameter("username") + request.getParameter("password"));
			return "login";
		}	
		
		Cookie cookie_username = new Cookie("cookie_username",request.getParameter("username"));
		Cookie cookie_password = new Cookie("cookie_password",request.getParameter("password"));
		response.addCookie(cookie_username);
		response.addCookie(cookie_password);
		return "index";
	}
}
