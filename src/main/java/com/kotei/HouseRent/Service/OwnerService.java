package com.kotei.HouseRent.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kotei.HouseRent.Entity.OwnerEntity;
import com.kotei.HouseRent.dao.OwnerDao;

@Service
public class OwnerService {

	private static final String OwnerEntity = null;
	@Autowired
	OwnerDao dao;
	
	public OwnerEntity getOwnerByName(String name) {
		OwnerEntity owner = null;
		owner = dao.findByName(name);
		if(!(owner==null))
		System.out.println("这是从数据库中取出的数据：" + owner.getOname());
		return owner;
	}
	
	public Boolean ownerAdd(OwnerEntity owner)
	{
		if(owner==null) {
			return false;
		}
		dao.save(owner);
		System.out.println("添加房主成功, 房主名：" + owner.getOname());
		return true;
	}
}
