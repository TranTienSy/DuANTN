package com.poly.rest;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.AddressDAO;
import com.poly.entity.Address;

@RestController
@RequestMapping("/rest/user")
public class UserRescontroller {
	@Autowired
	AddressDAO addressDAO;

	@GetMapping("/address")
	public ResponseEntity<?> getProfile(
			@RequestParam("id") Optional<Long> id) {
		System.out.println("okok");
		if(id.orElse(null)==0) {
			return ResponseEntity.ok(new Address());
		}
		return ResponseEntity.ok(addressDAO.findById(id.orElse(null)));

	}
}
