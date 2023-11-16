package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.SecurityConfig;
import com.poly.dao.AddressDAO;
import com.poly.entity.Address;

@Controller
public class UserController {
	@Autowired
	private SecurityConfig securityConfig;
	
	@Autowired
	AddressDAO addressDAO;

	@GetMapping("/user/profile")
	public String getProfile(Model model) {
		  // Lấy thông tin người dùng đã xác thực từ SecurityContextHolder
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Kiểm tra xem người dùng có được xác thực không
        if (authentication != null && authentication.isAuthenticated()) {
            // Lấy tên người dùng từ thông tin xác thực
            String username = authentication.getName();
            model.addAttribute("address", new Address());
            //Lấy ra danh sách địa chỉ
            model.addAttribute("listAddress", addressDAO.getByIdaccounts(username));
          }
		return "user/diachi";

	}
	@ResponseBody
	@PostMapping("/user/profile/add-address/{id}")
	public boolean updateAddress(@RequestBody Address address , @PathVariable("id") Optional<Long> id) {
		Address addressOld = addressDAO.findById(id.orElse(null)).get();
		addressOld.setHuyen(address.getHuyen());
		addressOld.setTinh(address.getTinh());
		addressOld.setXa(address.getXa());
		addressOld.setChitiet(address.getChitiet());
		
		addressDAO.saveAndFlush(addressOld);
		return true;

	}
	
	@ResponseBody
	@PostMapping("/user/profile/add-address")
	public boolean addAddress(@RequestBody Address address) {
		  // Lấy thông tin người dùng đã xác thực từ SecurityContextHolder
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Kiểm tra xem người dùng có được xác thực không
        if (authentication != null && authentication.isAuthenticated()) {
            // Lấy tên người dùng từ thông tin xác thực
            String username = authentication.getName();
            address.setIdaccounts(username);
          }
		addressDAO.saveAndFlush(address);
		return true;

	}
	
	
	
	@GetMapping("/user/profile/address/delete/{id}")
	public String addAddress(@PathVariable("id") Optional<Long> id) {
		addressDAO.deleteById(id.orElse(null));
		return "redirect:/user/profile";
	}
	
}
