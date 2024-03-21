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

	//�α��� üũ
	public UserDTO selectOne(String u_id) {
		return sqlSession.selectOne("user.loginCheck",u_id);
	}
	
	public int insert(UserDTO dto) {
		return sqlSession.insert("user.insert",dto);
	}
	//���̵� ã��
	public UserDTO selectUserName(String u_username) {
		return sqlSession.selectOne("user.userNameCheck",u_username);
	}
	
	//��й�ȣ ã��
	public UserDTO selectUserId(String u_id) {
		return sqlSession.selectOne("user.userIdCheck",u_id);
	}
	
	public String selectUserPwd(String u_pwd) {
		return sqlSession.selectOne("user.userPwdCheck",u_pwd);
	}
	
	//�̸����ߺ��˻� 
	public UserDTO selectUserEmail(String u_email) {
		return sqlSession.selectOne("user.EmailCheck",u_email);
	}
			
	// ȸ�� ��ȸ
	public List<UserDTO> search(String u_username){
		return sqlSession.selectList("user.u_search", u_username);
	}
	
	// ȸ�� ����
	public int user_delete(int u_idx) {
		return sqlSession.delete("user.user_delete", u_idx);
	}	
		
}
