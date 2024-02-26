package com.korea.mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.mall.dao.LoginDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.UserDTO;
import com.korea.mall.service.OrderService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {
	
	private final  OrderService orderService;
	
	private final UserDAO user_dao;
	
	@Autowired
	HttpSession session;
	
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

	@RequestMapping("user_update_login")
	public String mypage_login() {
		
	return "user_update_login";
	}
	
	@RequestMapping("user_mypage_login")
	@ResponseBody
	public String user_mypage_login(String id, String pwd) {
		UserDTO dto = user_dao.selectOne(id);
		
		if(dto == null) {
			return "[{'param' : 'noid'}]";
		}
		if(dto.getU_pwd().equals(pwd)) {
			return "[{'param' : 'nopwd'}]";
		}
		
		session.setAttribute("id", dto);
		
		return"[{'param' : 'clear'}]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
