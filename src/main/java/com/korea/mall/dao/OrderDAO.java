package com.korea.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDAO {
	private final SqlSession sqlSession;
	
	public UserDTO selectOne(String id) {
		return sqlSession.selectOne("order.mypage_login", id);
	}

}
