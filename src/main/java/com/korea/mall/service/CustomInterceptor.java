package com.korea.mall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.korea.mall.controller.LoginController;
import com.korea.mall.dto.UserDTO;

@Component
public class CustomInterceptor implements HandlerInterceptor{
	
	LoginController loginController;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		

		HttpSession session = request.getSession();
		UserDTO u_id = (UserDTO)session.getAttribute("u_id");
		System.out.println(u_id);
		
		
		System.out.println(request.getRequestURL());
		if(request.getRequestURI().equals("http://localhost:9090/mall/mypage")) {
			response.sendRedirect("login/login_form");
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	
	
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
