package com.kotei.HouseRent.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kotei.HouseRent.Entity.HouseEntity;
import com.kotei.HouseRent.Entity.PageBean;
import com.kotei.HouseRent.Service.HouseService;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;

@Controller
public class HouseController {
	@Autowired
	HouseService hservice;
	
	@RequestMapping(value="/addHouse", method=RequestMethod.POST)
	public String addHouse(HttpServletRequest request, HttpServletResponse response){
		
		String hname = request.getParameter("hname");
		String hprice = request.getParameter("hprice");
		String haddress = request.getParameter("address");
		String hsize = request.getParameter("hsize");
		String hdesc = request.getParameter("hdesc");
		
		HouseEntity house = new HouseEntity();
		house.setHname(hname);
		house.setHprice(hprice);
		house.setHaddress(haddress);
		house.setHsize(hsize);
		house.setHflag(0);
		house.setHdesc(hdesc);
		
		if(hservice.houseAdd(house)) {
			System.out.println("发布房屋成功：");
			System.out.println("房屋名字：" + request.getParameter("hname"));
			System.out.println("价格：" + request.getParameter("hprice"));
			System.out.println("邮箱：" + request.getParameter("address"));
			System.out.println("户型：" + request.getParameter("hsize"));
			System.out.println("描述：" + request.getParameter("hdesc"));
			return "index";
		}
		return "publishHouse";
	}
	
	@RequestMapping(value="/rentHouse", method=RequestMethod.GET)
	public String rentHouse(HttpServletRequest request, HttpServletResponse response){
		System.out.println("进入租房页面");
		PageBean<HouseEntity> pageBean = new PageBean<HouseEntity>();
		List<HouseEntity> list = new ArrayList<HouseEntity>();
		pageBean.setCurrentCount(1);
		pageBean.setCurrentPage(1);
		pageBean.setTotalCount(20);
		pageBean.setTotalPage(2);
		list = hservice.getAllHouse();
		pageBean.setList(list);
		request.setAttribute("pageBean", pageBean);
		return "product_list";
	}
	
	
}
