package com.poly.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.service.ThongKeService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/thongke")
public class ThongKeRestController {
	@Autowired
	ThongKeService thongKeService;
	
	
	@GetMapping()
	public ResponseEntity<?> getThongKe(
			@RequestParam("DieuKien") String dieuKien) {
		try {
			System.out.println("ok");
			return ResponseEntity.ok(thongKeService.ThongKe(dieuKien));
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{\"errorCode\":Co loi xay ra\"\"}");
		}

	}
}
