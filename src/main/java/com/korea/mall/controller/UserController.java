package com.korea.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.mall.dao.UserDAO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	
//public static final String VIEW_PATH = "/WEB-INF/views/";

	private final UserDAO user_dao;
	
	@RequestMapping(value = {"user_list"})
	public String list(Model model) {
		
		
		model.addAttribute("list",user_dao.selectList());
		
//		return VIEW_PATH+"user_list.jsp";
		return "login/user_list";
	}
	
	
	
	
}
