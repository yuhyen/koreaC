package com.korea.mall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.OrderDTO;
import com.korea.mall.dto.ProductDTO;
import com.korea.mall.dto.SearchDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDAO {
	 private final SqlSession sqlSession;
	 
	 public List<ProductDTO> selectproList(List<Integer> dto) {
		 return sqlSession.selectList("order.productall", dto);
	 }
	 
	 public int selectSEQ() {
		 return sqlSession.selectOne("order.selectSEQ");
	 }

	 public int insert(OrderDTO dto) {
		 return sqlSession.insert("order.orderhistory_insert", dto);
	 }
	 public List<OrderDTO> selectOrderList(String u_id){
		 return sqlSession.selectList("order.orderList", u_id);
	 }
	 
	 public List<OrderDTO> selectSearch(SearchDTO dto){
		 return sqlSession.selectList("order.orderSearch", dto);
	 }
	 public int updateTotal(UserDTO dto) {
		 return sqlSession.update("order.updateTotal", dto);
	 }
	 
}
