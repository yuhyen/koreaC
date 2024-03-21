package context;


import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;



//���������� ������������ �˷��ִ� ������̼�
@Configuration
public class Context_1_mybatis {
	
	@Bean
	public DataSource ds() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@35.216.7.121:1521:xe");
		ds.setUsername("admin");
		ds.setPassword("123400");
		return ds;
	}
	
	//sqlSessionFactoryBean �������� FactoryBean �������̽� ������.
	//�� ������ �������� SqlSessionFactory��ü�� �����ϴ� ���� �ƴ϶�.
	//Factory���� getObejct()�޼��带 ȣ���� ����� �����Ѵ�.
	//�� ��� �������� ���ø����̼� ���� ������ SqlSessionFactory�� �����ϰ�
	//sqlSessionFactory��� �̸����� �����Ѵ�.
	
	
	@Bean
	public SqlSessionFactory factoryBean(DataSource ds) throws Exception{
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(ds);
		
		//�߰����� Mybatis����
		factoryBean.setConfigLocation(new ClassPathResource("config/mybatis/mybatis-config.xml"));
		return factoryBean.getObject();
	}
	
	//mybatis������ SqlSession�� �����ϱ� ���� SqlSessionFactory�� ����Ѵ�.
	//Session�� �ѹ� �� �����ϸ� ���α����� �����ϰų� commit �Ǵ� rollback�� ����ϱ� ����
	//Session�� ����Ѵ�.
	//���������� �� �̻� �ʿ����� ���� ���°� �Ǹ� Session�� �ݴ´�.
	//mybatis Spring ������带 ����ϸ� SqlSessionFactory�� ���� ����� �ʿ䰡 ����.
	//�ֳ��ϸ� , ������ Ʈ����� ������ ���� �ڵ����� Ŀ�� �Ǵ� �ѹ��� �����ϱ� �����̴�.
	
	//SqlSessionTemplateŬ������ SqlSession�� implements�ϰ� �ڵ忡�� SqlSession�� ��ü�ϴ� ������ �Ѵ�.
	//Sql�� ó���ϴ� Mybatis�޼��带 ȣ���� �� SqlSessionTemplate�� SQlsEssion�� ������ Spring transaction����
	//���� �� �ֵ��� �������ش�.
	
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory factoryBean) {
		return new SqlSessionTemplate(factoryBean);
	}
	
}
