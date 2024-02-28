package com.korea.mall.service;

import org.springframework.stereotype.Service;

import com.korea.mall.dao.LoginDAO;
import com.korea.mall.dao.OrderDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
 private final OrderDAO orderDAO;
 
 //회원정보 수정
 public int update(UserDTO dto) {
	 return orderDAO.update(dto); 
 }
	
 	
 
}
