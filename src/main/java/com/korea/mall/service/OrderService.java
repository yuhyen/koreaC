package com.korea.mall.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.mall.dao.BasketDAO;
import com.korea.mall.dao.ProductDAO;
import com.korea.mall.dao.UserupdateDAO;
import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.ProductDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService {
 private final UserupdateDAO userupdateDAO;
 private final BasketDAO basketDAO;
 @Autowired
	HttpSession session;
private final ProductDAO productDAO; 
 
 //�쉶�썝�젙蹂� �닔�젙
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
 
 public List<BasketDTO> selectProduct(String pronum, int num){
	Integer p_num = Integer.parseInt(pronum);
	 ProductDTO p_dto = productDAO.selectOne(p_num);
	 BasketDTO b_dto = new BasketDTO();
	 b_dto.setB_num(p_dto.getP_num());
	 b_dto.setB_quantity(num);
	 b_dto.setB_shipping(3000);
	 b_dto.setP_color(p_dto.getP_color());
	 b_dto.setP_explain(p_dto.getP_explain());
	 b_dto.setP_id(p_dto.getP_id());
	 b_dto.setP_name(p_dto.getP_name());
	 b_dto.setP_num(p_dto.getP_num());
	 b_dto.setP_pabric(p_dto.getP_pabric());
	 b_dto.setP_picture(p_dto.getP_picture());
	 b_dto.setP_price(p_dto.getP_price());
	 b_dto.setP_size(p_dto.getP_size());
//	 b_dto.setPicture_count(p_dto.getPicture_count());
	 List<BasketDTO> list = new ArrayList<BasketDTO>();
	 list.add(b_dto);
	 return list;
 }
 	
 
}
