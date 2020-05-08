package com.kotei.HouseRent.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kotei.HouseRent.Entity.HouseEntity;
import com.kotei.HouseRent.dao.HouseDao;

@Service
public class HouseService {
	
	@Autowired
	HouseDao dao;
	
	public HouseEntity getHouseByName(String name) {
		HouseEntity house = null;
		house = dao.findByName(name);
		if(!(house==null)) {
			System.out.println("这是从数据库中取出的数据：" + house.getHname());
			return house;
		}
		return null;
	}
	
	public Boolean houseAdd(HouseEntity house) {
		if(house==null) {
			return false;
		}
		dao.save(house);
		System.out.println("添加房屋成功, 房主名：" + house.getHname());
		return true;
	}
	
}
