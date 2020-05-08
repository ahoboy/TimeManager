package com.kotei.HouseRent.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kotei.HouseRent.Entity.HouseEntity;
import com.kotei.HouseRent.Entity.OwnerEntity;
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
	
	public HouseEntity getHouseById(int id) {
		HouseEntity house = null;
		house = dao.findHById(id);
		if(!(house==null)) {
			System.out.println("这是从数据库中取出的数据：" + house.getHname());
			return house;
		}
		return null;
	}
	
	public List<HouseEntity> getAllHouse() {
		List<HouseEntity> houseList = new ArrayList<HouseEntity>();
		houseList = dao.findAll();
		if(!(houseList.isEmpty()))
		{
		System.out.println("成功读取所有房源");
		return houseList;
		}
		return houseList;
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
