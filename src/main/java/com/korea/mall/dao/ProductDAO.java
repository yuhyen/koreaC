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
	
	// ��ǰ �߰�
	public int p_add(ProductDTO dto) {
		return sqlSession.insert("product.p_insert",dto);
	}
	
	// ��ǰ ��ü ��ȸ
	public List<ProductDTO> selectList(HashMap<String, Integer> map) {
		return sqlSession.selectList("product.product_list", map);
	}
	
	// ��ü �Խù� �� ��ȸ
	public int getRowTotal() {
		return sqlSession.selectOne("product.product_count");
	}
	
	// ��ǰ �ϳ� ��ȸ
	public ProductDTO selectOne(int p_num) {
		return sqlSession.selectOne("product.p_selectOne", p_num);
	}
	
	// ��ǰ ī�װ��� ��ȸ
	public List<ProductDTO> category(int p_id){
		return sqlSession.selectList("product.category", p_id);
	}
	
	// ��ǰ �˻�
	public List<ProductDTO> search(String p_name) {
		return sqlSession.selectList("product.p_search", p_name);
	}
	
	// ��ǰ ����
	public int update(ProductDTO dto) {
		return sqlSession.update("product.p_update", dto);
	}
	
	// ��ǰ ����
	public int delete(int p_num) {
		return sqlSession.delete("product.p_delete", p_num);
	}
	
}
