package com.poly.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.OrderDAO;

@Service
public class ThongKeService {

	@Autowired
	OrderDAO orderDAO;

	public List<Map<String, Object>>ThongKe(String DieuKien) {
		return orderDAO.ThongKe(DieuKien);
	}
}
