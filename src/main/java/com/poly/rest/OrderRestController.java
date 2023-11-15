package com.poly.rest;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.dao.OrderDAO;
import com.poly.entity.Order;
import com.poly.service.OrderService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class OrderRestController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	HttpSession session;

	@PostMapping
	public Order create(@RequestBody JsonNode orderData) {
		System.out.println(orderData);
		return orderService.create(orderData);
	}

	@PostMapping("/cancel")
	public ResponseEntity<?> cancel(
			@RequestParam("idOrder") Optional<String> idOrder,
			@RequestParam("user") Optional<String> username) {
		Order order = orderService.findById(Long.parseLong(idOrder.orElse(null)));
		if(!order.getAccount().getUsername().equals(username.orElse(null))) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("{\"errorCode\": \"Bạn không có quyền hủy đơn hàng\"}");
		}
		if(!order.getStatus().equals("CHOXULY")) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("{\"errorCode\":Đơn hàng chờ xử lý mới được hủy\"\"}");
		}
		orderDAO.delete(order);
		return  ResponseEntity.ok(true);
	}
}
