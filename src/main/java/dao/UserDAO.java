package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.UserDTO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class UserDAO {
	final SqlSession sqlSession;
	
	public List<UserDTO> selectList(){
		return sqlSession.selectList("user.user_list");
	}
	
	
}
