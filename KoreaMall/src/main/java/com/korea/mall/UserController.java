package com.korea.mall;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDAO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor // 积己磊 积己秦淋
public class UserController {
	
public static final String VIEW_PATH = "/WEB-INF/views/";
	
	final UserDAO user_dao;
	

	@RequestMapping(value = {"/","list"})
	public String list(Model model) {
		
		
		model.addAttribute("list",user_dao.selectList());
		
		return VIEW_PATH+"user_list.jsp";
	}
}
