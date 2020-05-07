package com.kotei.HouseRent.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.kotei.HouseRent.Entity.OwnerEntity;

public interface OwnerDao extends JpaRepository<OwnerEntity, Integer> {
	
	@Query(value = "select * from owner where oname=?1", nativeQuery = true)
	OwnerEntity findByName(String name);
}
