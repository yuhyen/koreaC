package com.korea.mall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.korea.mall.dao.BasketDAO;
import com.korea.mall.dao.LoginDAO;
import com.korea.mall.dao.UserupdateDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
 private final UserupdateDAO userupdateDAO;
 private final BasketDAO basketDAO;
 
 //회원정보 수정
 public int update(UserDTO dto) {
	 return userupdateDAO.update(dto); 
 }
	
 public List<BasketDTO> selectList() {
	 return basketDAO.selectList();
 }

 	
 
}
