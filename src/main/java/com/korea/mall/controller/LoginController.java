	package com.korea.mall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class LoginController {

	
	final UserDAO user_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("login")
	@ResponseBody
	public String login(String u_id, String u_pwd) {
		//id에 해당하는 데이터 1건 조회
		UserDTO dto = user_dao.selectOne(u_id);
		
		//dto가 null일 경우 id가 DB에 존재하지 않음
		if(dto ==null) {
			return "[{'param':'no_u_id'}]";
		}
		
		//우리가 입력받은 pwd와 DB에 저장된 비밀번호를 비교하기
		if(u_pwd.equals(dto.getU_pwd())){
			return "[{'param':'no_u_pwd'}]";
		}
		
		//여기까지 내려오면 아이디와 비밀번호에 문제가 없다는 뜻
		//세션에 바인딩을 한다.
		//세션은 서버의 메모리를 사용하기 때문에 세션을 많이 사용할수록
		//브라우저가 느려지기 때문에 꼭 필요한 곳에서만 쓰도록 하자
		
		session.setAttribute("u_id",dto);
		
		//로그인에 성공한 경우
		return "[{'param':'clear'}]";
		
		
	}
	
	@RequestMapping(value={"","login_form"})
	public String login_form() {
		return "login/login_form";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("u_id");
		return "redirect:user_list";
	}
	
	@RequestMapping("user_insert_form")
	public String user_insert_form() {
		return "/login/user_insert_form";
	}
	
	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(String u_id) {
		UserDTO dto = user_dao.selectOne(u_id);
		
		//null이면 중복이 없으니깐 가입 가능.
		if(dto ==null) {
			return "[{'res':'yes'}]";
		}
		return "[{'res':'no'}]";
	}
	
	@RequestMapping("user_insert")
	public String user_insert(UserDTO dto) {
		int res = user_dao.insert(dto);
		
		if(res>0) {
			return "redirect:user_list";
		}
		return null;
	}
	
	
	
	
}








