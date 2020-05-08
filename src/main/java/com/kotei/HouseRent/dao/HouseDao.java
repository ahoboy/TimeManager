package com.kotei.HouseRent.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.kotei.HouseRent.Entity.HouseEntity;

public interface HouseDao extends JpaRepository<HouseEntity, Integer> {
	@Query(value = "select * from house where hname=?1", nativeQuery = true)
	HouseEntity findByName(String name);
	
	@Query(value = "select * from house where hid=?1", nativeQuery = true)
	HouseEntity findHById(int id);
	
}
