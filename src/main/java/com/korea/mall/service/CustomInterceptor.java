package com.korea.mall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class CustomInterceptor implements HandlerInterceptor{


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("##################");
		System.out.println("##################");
		System.out.println("preHandle");
		System.out.println("##################");
		System.out.println("##################");
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("##################");
		System.out.println("##################");
		System.out.println("postHandle");
		System.out.println("##################");
		System.out.println("##################");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("##################");
		System.out.println("##################");
		System.out.println("afterCompletion");
		System.out.println("##################");
		System.out.println("##################");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
