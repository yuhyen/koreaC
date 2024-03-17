package com.korea.mall.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class UserDAO {
	private final SqlSession sqlSession;
	
	public List<UserDTO> selectList(HashMap<String, Integer> map){
		return sqlSession.selectList("user.user_list", map);
	}
	
	//로그인 체크
		public UserDTO selectOne(String u_id) {
			return sqlSession.selectOne("user.loginCheck",u_id);
		}
		
		public int insert(UserDTO dto) {
			return sqlSession.insert("user.insert",dto);
		}
	//아이디 찾기
		public UserDTO selectUserName(String u_username) {
			return sqlSession.selectOne("user.userNameCheck",u_username);
		}
		
	//비밀번호 찾기
		public UserDTO selectUserId(String u_id) {
			return sqlSession.selectOne("user.userIdCheck",u_id);
		}
		
		public String selectUserPwd(String u_pwd) {
			return sqlSession.selectOne("user.userPwdCheck",u_pwd);
		}
		
		//이메일중복검사 
				public UserDTO selectUserEmail(String u_email) {
					return sqlSession.selectOne("user.EmailCheck",u_email);
				}
				
	// 회원 조회
	public List<UserDTO> search(String u_username){
		return sqlSession.selectList("user.u_search", u_username);
	}
		
	
}
