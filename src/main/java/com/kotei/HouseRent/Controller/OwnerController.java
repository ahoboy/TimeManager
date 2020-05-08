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

import com.kotei.HouseRent.Entity.HouseEntity;
import com.kotei.HouseRent.Entity.OwnerEntity;
import com.kotei.HouseRent.Service.HouseService;
import com.kotei.HouseRent.Service.OwnerService;
import com.kotei.HouseRent.dao.OwnerDao;

@Controller
public class OwnerController {

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
		System.out.println("登录成功");
		return "index";
	}
	
	@RequestMapping(value="/userRegister", method=RequestMethod.POST)
	public String userRegister(HttpServletRequest request, HttpServletResponse response){
		
		String userName=request.getParameter("username");
		String userPass=request.getParameter("password");
		String telephone = request.getParameter("telephone");
		String sex = request.getParameter("sex");
		
		OwnerEntity owner = new OwnerEntity();
		owner.setOname(userName);
		owner.setPassword(userPass);
		owner.setTelephone(telephone);
		owner.setOsex(sex);
		
		if(service.ownerAdd(owner)) {
		System.out.println("注册成功：");
		System.out.println("用户名：" + request.getParameter("username"));
		System.out.println("密码：" + request.getParameter("password"));
		System.out.println("邮箱：" + request.getParameter("email"));
		System.out.println("联系电话：" + request.getParameter("telephone"));
		System.out.println("性别：" + request.getParameter("sex"));
		System.out.println("出生日期：" + request.getParameter("birthday"));
//		Cookie cookie_username = new Cookie("cookie_username",request.getParameter("username"));
//		Cookie cookie_password = new Cookie("cookie_password",request.getParameter("password"));
//		response.addCookie(cookie_username);
//		response.addCookie(cookie_password);
		return "registerSuccess";
		}
		
		System.out.println("注册失败");
		return "registerFail";
	}
	
	
}
