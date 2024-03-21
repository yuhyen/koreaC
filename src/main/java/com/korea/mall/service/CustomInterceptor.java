package com.korea.mall.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.korea.mall.common.CommonUrlResource;
import com.korea.mall.dto.UserDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomInterceptor implements HandlerInterceptor {
	
	@Autowired
	CommonUrlResource urlResoucre;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			String mainurl = "";

			HttpSession session = request.getSession();
			UserDTO u_id = (UserDTO)session.getAttribute("u_id");
			//System.out.println(u_id);
		
			//mall���� ���
			String url= "http://localhost:9090/mall/";
			
			//webapp���������� ���
			String resourceSrc = request.getServletContext().getRealPath("");
			
			//pageURL��� �߰�
			resourceSrc += "resources/pageURL/pageURL";
			
			
			//ĳ�ÿ� Ŭ���� ȣ��
			ArrayList<String> urlList = urlResoucre.getUrilList();
			log.debug("ĳ������Ȯ�� ########## urlList");
			log.debug(System.identityHashCode(urlList) + " �ּҰ�");
			
			//������ null�ΰ��
			if(u_id == null) {
				
	        // ���Ͽ��� URL�� �о�� ó��
	        try (BufferedReader br = new BufferedReader(new FileReader(resourceSrc))) {
	        	
	            String line;
	            while ((line = br.readLine()) != null) {
	            	
	                //�⺻ URL���� ���Ͽ� �ִ� �ּҰ� ���ؼ� ���� 
	                if (request.getRequestURL().toString().equals(url+line)) {
	                	
	                	//�Ķ���Ͱ� �̾ƿ���
	                	Map<String, String[]> map = request.getParameterMap();
	        			
	                	StringBuilder urlString = new StringBuilder();
	                    urlString.append("?");
	                    for (String key : map.keySet()) {
	                        for(String value : map.get(key)) {
	                            urlString.append(key).append("=").append(value).append("&");
	                        }
	                    }
	                    // ������ '&' ���� ���Ÿ� ���� ���̰� 0���� ū ��쿡�� ����
	                    if (urlString.length() > 0) {
	                        urlString.setLength(urlString.length() - 1);
	                    }
	                    String param = urlString.toString();
	                    
	                    System.out.println(param);
	        				
	                    //�Ķ���Ͱ��� ������ �ּҿ� �Ķ���� �߰�
	                    	if(param!="") {
	                    		session.setAttribute("line", line+param);
	                			 response.sendRedirect(request.getContextPath() + "/login_form");
	 		                    return false;
	                    	}
	                	
	                		if(request.getParameter("type")!=null) {
	                			session.setAttribute("line", line+"?type="+request.getParameter("type"));
	                			 response.sendRedirect(request.getContextPath() + "/login_form");
	 		                    return false;
	                		}
		                	session.setAttribute("line",line);
		                    response.sendRedirect(request.getContextPath() + "/login_form");
		                    return false;
	                	}
	                }
	            }
	       
			catch (IOException e) {
	            e.printStackTrace();
	        }
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
