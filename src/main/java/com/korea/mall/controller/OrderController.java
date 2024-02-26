package com.korea.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.mall.dao.UserDAO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {
	
	private final UserDAO userdao;
	
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "mypage";
	}
	
	@RequestMapping("/user_update")
	public String user_update() {
		
		
		return "user_update";
	}
	
	@RequestMapping("basket_page")
	public String basket_page() {
		
		return "order/basket_page";
	}
	
	@RequestMapping("orderhistory_page")
	public String orderhistory_page() {
		
		return "order/orderhistory_page";
	}
	
	
	}
