package context;


import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.UserDAO;



//스프링에게 설정파일임을 알려주는 어노테이션
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
