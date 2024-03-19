package com.korea.mall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.BasketDTO;
import com.korea.mall.dto.MoreDTO;
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
	 public List<OrderDTO> selectOrderList(MoreDTO dto){
		 return sqlSession.selectList("order.orderList", dto);
	 }
	 
	 public List<OrderDTO> selectSearch(SearchDTO dto){
		 return sqlSession.selectList("order.orderSearch", dto);
	 }
	 public int updateTotal(UserDTO dto) {
		 return sqlSession.update("order.updateTotal", dto);
	 }
	 public int selectCount(String u_id) {
		 return sqlSession.selectOne("order.moreCount", u_id);
	 }
	 public int selectSearchCount(SearchDTO dto) {
		 return sqlSession.selectOne("order.moreSearchcount", dto);
	 }
	 
	 
}
