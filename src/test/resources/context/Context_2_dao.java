package context;


import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.UserDAO;



//���������� ������������ �˷��ִ� ������̼�
@Configuration
public class Context_2_dao {
	
//	@Bean
//	public DeptDAO dept_dao(SqlSession sqlSession) {
//		return new DeptDAO(sqlSession);
//		
//	}
	
	@Bean
	public UserDAO user_dao(SqlSession sqlSession) {
		return new UserDAO(sqlSession);
	}
	
}
