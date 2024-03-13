package com.korea.mall.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.korea.mall.dao.LoginDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.OrderDTO;
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
	public String mypage(Model model) {
		UserDTO dto = (UserDTO) session.getAttribute("u_id");
		model.addAttribute("user", dto);		
		return "mypage";
	}
	
	@RequestMapping("/user_update")
	public String user_update(HttpServletRequest req) {
		
		UserDTO dto = (UserDTO) session.getAttribute("u_id");
		req.setAttribute("dto", dto);
	
		return "user_update";
	}
	
	@RequestMapping("basket_page")
	public String basket_page(Model model) {
		
		List<BasketDTO> list = orderService.selectList();
		UserDTO dto = (UserDTO) session.getAttribute("u_id");
		
		model.addAttribute("basket", list);
		model.addAttribute("user", dto);
		
		
		
		return "order/basket_page";
	}
	
	@RequestMapping("orderhistory_page")
	public String orderhistory_page(Model model) {
			UserDTO uesrdto = (UserDTO)session.getAttribute("u_id");
			List<OrderDTO> order = orderService.selectOrderList();
			
			model.addAttribute("order", order);
			model.addAttribute("user", uesrdto);	
		return "order/orderhistory_page";
	}
	

	
	@RequestMapping("histroy_search")
	@ResponseBody
	public String history_search(@RequestBody HashMap<String, Object> jsonString) {
		System.out.println(jsonString);
		
		return null;
	}

	
	
	@RequestMapping("user_update_login")
	public String mypage_login() {
		
	return "user_update_login";
	}
	
	@RequestMapping("user_db_update")
	@ResponseBody
	public String user_db_update(UserDTO dto) {
		int res = orderService.update(dto);
		if(res >= 1) {
			return "[{'param' : 'in'}]";
		}
			return "[{'param' : 'notin'}]";
	}
	
	@RequestMapping("basket_del")
	@ResponseBody
	public String basket_del(int idx) {
		
		
		int res = orderService.delete(idx);
		if(res >= 1) {
			
			return "[{'param' : 'yes'}]";
		}
		return "[{'param' : 'no'}]";
		
	}
	
	
	@RequestMapping("order_page")
	public String orderpage(String type, Model model, String pronum, Integer num) {
		UserDTO dto = (UserDTO) session.getAttribute("u_id");
		model.addAttribute("user", dto);
		
		if(pronum == null) {
		List<BasketDTO> order = orderService.selectList(type);
		model.addAttribute("order", order);
		}else if(pronum != null){
			List<BasketDTO> order = orderService.selectProduct(pronum, num);
			model.addAttribute("order", order);
			
		}
		
		
		
		return "order/orderpage";
	}
	
	@RequestMapping("order_pay")
	@ResponseBody
	public String order_pay(@RequestBody HashMap<String, Object> jsonString) {
		
		int res = orderService.insertorder(jsonString);
		
		if (res >= 1) {
			return "[{'param' : 'yes'}]";
		}
		return "[{'param' : 'no'}]";



	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
