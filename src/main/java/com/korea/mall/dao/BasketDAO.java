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
 
 public BasketDTO selectByProduct(BasketDTO dto) {
	 return sqlSession.selectOne("order.basket_producnt", dto);
 }

 public int update(BasketDTO dto) {
	 return sqlSession.insert("order.basket_update", dto);
 }
 
 public int insert(BasketDTO dto) {
	 return sqlSession.insert("order.basket_insert", dto);
 }
 
 public int delete(int idx) {
	 return sqlSession.delete("order.basket_del", idx);
 }
 
	public List<BasketDTO> selectList(List<Integer> typelist){
		return sqlSession.selectList("order.order_basket_list", typelist);
	}
	
	public int deleteList(List<Integer> b_idxlist){
		return sqlSession.delete("order.order_basket_deleteList", b_idxlist);
	}
}
