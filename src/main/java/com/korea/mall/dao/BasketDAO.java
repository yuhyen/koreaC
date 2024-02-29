package com.korea.mall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BasketDAO {
 private final SqlSession sqlSession;
	
 public List<BasketDTO> selectList(BasketDTO dto) {
	 return sqlSession.selectList("order.basket_list", dto);
 }

 public int delete(int idx) {
	 return sqlSession.delete("order.basket_del", idx);
 }
 
	
}