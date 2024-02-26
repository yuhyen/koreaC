package com.korea.mall.service;

import org.springframework.stereotype.Service;

import com.korea.mall.dao.LoginDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
 private final LoginDAO loginDAO;
 
 //마이페이지 로그인
 public UserDTO selectOne(String id) {
	 return loginDAO.selectOne(id);
 }
	
 	
 
}
