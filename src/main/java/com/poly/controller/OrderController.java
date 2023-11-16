package com.poly.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.AddressDAO;
import com.poly.dao.OrderDAO;
import com.poly.entity.Address;
import com.poly.entity.Order;
import com.poly.service.OrderService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDAO orderDAO;

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AddressDAO addressDAO;

	@RequestMapping("/cart/view")
	public String cart() {
		return "cart/view";
	}

	@RequestMapping("/cart/checkout")
	public String checkout(Model model) {
//		if (!(request.isUserInRole("DIRE") || request.isUserInRole("STAF") || request.isUserInRole("CUST"))) {
//			return "redirect:/auth/login/form";
//		}
			
		//Lấy danh sách địa chỉ user đang đăng nhập
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
        // Kiểm tra xem người dùng có được xác thực không
        if (authentication != null && authentication.isAuthenticated()) {
            // Lấy tên người dùng từ thông tin xác thực
            String username = authentication.getName();
            //Lấy ra danh sách địa chỉ
            model.addAttribute("listAddress", addressDAO.getByIdaccounts(username));
          }
		return "cart/checkout";
	}

	@RequestMapping("/order/list")
	public String list(Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		model.addAttribute("orders", orderService.findByUsername(username));
		return "order/list";
	}

	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("order", orderService.findById(id));
		return "order/detail";
	}
	// Tiến Sỹ
	@GetMapping("/order/cancel/{id}")
	public String cancel(@PathVariable("id") Long id) {
		Order order = orderService.findById(id);
		if(!order.getStatus().equals("CHOXYLY")) {
			return "order/list";
		}
		orderDAO.delete(order);
		return "order/list";
	}
}
