package com.korea.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class LoginDAO {
	
	private final SqlSession sqlSession;
	
	//로그인 체크
		public UserDTO selectOne(String id) {
			return sqlSession.selectOne("user.loginCheck",id);
		}
		
		public int insert(UserDTO dto) {
			return sqlSession.insert("user.insert",dto);
		}

}
