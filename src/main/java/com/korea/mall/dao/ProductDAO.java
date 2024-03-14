package com.korea.mall.dao;

import java.util.HashMap;
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
		return sqlSession.insert("product.p_insert",dto);
	}
	
	// 상품 전체 조회
	public List<ProductDTO> selectList(HashMap<String, Integer> map) {
		return sqlSession.selectList("product.product_list", map);
	}
	
	// 전체 게시물 수 조회
	public int getRowTotal() {
		return sqlSession.selectOne("product.product_count");
	}
	
	// 상품 하나 조회
	public ProductDTO selectOne(int p_num) {
		return sqlSession.selectOne("product.p_selectOne", p_num);
	}
	
	// 상품 카테고리별 조회
	public List<ProductDTO> category(int p_id){
		return sqlSession.selectList("product.category", p_id);
	}
	
	// 상품 검색
	public List<ProductDTO> search(String p_name) {
		return sqlSession.selectList("product.p_search", p_name);
	}
	
	// 상품 수정
	public int update(ProductDTO dto) {
		return sqlSession.update("product.p_update", dto);
	}
	
	// 상품 삭제
	public int delete(int p_num) {
		return sqlSession.delete("product.p_delete", p_num);
	}
	
}
