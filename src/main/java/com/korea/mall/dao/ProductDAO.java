package com.korea.mall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.ProductDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductDAO {
	
	final SqlSession sqlSession;
	
	// 상품 추가
	public int p_add(ProductDTO dto) {
		return sqlSession.insert("p.p_insert",dto);
	}
	
	// 상품 전체 조회
	public List<ProductDTO> selectList(String p_name) {
		return sqlSession.selectList("p.product_list",p_name);
	}
	
//	// 상품 카테고리별 조회
//	public List<ProductDTO> selectList(int p_id){
//		return sqlSession.selectList("p.product_list", p_id);
//	}
}
