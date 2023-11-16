package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Productvariants;

public interface ProductvariantsDAO extends JpaRepository<Productvariants, Integer>{
	void deleteByProductid(Integer productid);
}
