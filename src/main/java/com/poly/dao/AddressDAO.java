package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Address;


public interface AddressDAO extends JpaRepository<Address, Long>{
	 List<Address> getByIdaccounts(String idaccounts);
	 
}
