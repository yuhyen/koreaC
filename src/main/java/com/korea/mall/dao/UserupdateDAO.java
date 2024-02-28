package com.korea.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserupdateDAO {
	private final SqlSession sqlSession;
	
	
	public int update(UserDTO dto) {
		return sqlSession.update("order.user_update", dto);
	}
}
