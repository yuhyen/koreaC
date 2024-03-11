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
public class CustomInterceptor implements HandlerInterceptor {

	LoginController loginController;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		

			HttpSession session = request.getSession();
			UserDTO u_id = (UserDTO)session.getAttribute("u_id");
			System.out.println(u_id);
		
		  
	       
	        String mypage_url = "http://localhost:9090/mall/mypage";
	        String order_url = "http://localhost:9090/mall/orderhistory_page";
	        
	        
	        
	        //마이페이지인데 세션값이 없으면 로그인페이지로 이동
	        if (request.getRequestURL().toString().equals(mypage_url) && u_id==null){
	        	System.out.println("if문 작동");
	            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
	            response.sendRedirect(request.getContextPath() + "/login_form");
	            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
	        }
	        
	        //오더페이지인데 세션값이 없으면 로그인페이지로 이동
	        if (request.getRequestURL().toString().equals(order_url) && u_id==null){
	        	System.out.println("if문 작동");
	            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
	            response.sendRedirect(request.getContextPath() + "/login_form");
	            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
	        }
	      

		
		/*
		 * if(request.getRequestURL().equals(urlPrior)) {
		 * 
		 * System.out.println("if문 가동"); response.sendRedirect(request.getContextPath()
		 * + "/login_form"); }
		 */
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
