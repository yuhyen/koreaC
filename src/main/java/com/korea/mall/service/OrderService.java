package com.korea.mall.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.mall.dao.BasketDAO;
import com.korea.mall.dao.UserupdateDAO;
import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
 private final UserupdateDAO userupdateDAO;
 private final BasketDAO basketDAO;
 @Autowired
	HttpSession session;
 //회원정보 수정
 public int update(UserDTO dto) {
	 return userupdateDAO.update(dto); 
 }
	
 public List<BasketDTO> selectList() {
	 BasketDTO dto =new BasketDTO();
	 UserDTO user = (UserDTO) session.getAttribute("u_id");
	 dto.setB_id(user.getU_id());
	 return basketDAO.selectList(dto);
 }

 public int delete(int idx) {
	 return basketDAO.delete(idx);
	 
 }
 
 public List<BasketDTO> selectList(String type) {
	 String[] types = type.split(",");
	int[] inttypes = Arrays.stream(types).mapToInt(Integer::parseInt).toArray();
	 
	ArrayList<Integer> typelist = new ArrayList<>(inttypes.length);
	for(int num : inttypes) {
		typelist.add(num);
	}
	
	
	 return  basketDAO.selectList(typelist);
			
 }
 	
 
}
