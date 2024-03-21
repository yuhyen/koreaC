package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.mall.UserController;

import dao.UserDAO;

@Configuration
@EnableWebMvc
//Enable�� �����ϴ� ������̼��� @Configuration�� ���� ���� Ŭ������ �������ν� �̿� ���õ� ��ɵ��� ���ϰ� ����
//������̼� ����� SpringMVC�� ������ �� �ʿ��� Bean������ �ڵ����� ���ִ� ������̼�
//@ComponentScan("com.korea.di")
//@Component, stereotype(@Service, @Repository, @Controller)������̼��� �ο��� Class����
//�ڵ����� Scan�Ͽ� Bean���� ������ִ� ������ �ϴ� ������̼�
public class ServletContext implements WebMvcConfigurer{


	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
//	@Bean
//	public InternalResourceViewResolver resolver() {
//		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//		resolver.setViewClass(JstlView.class);
//		resolver.setPrefix("/WEB-INF/views/");
//		resolver.setSuffix(".jsp");
//		return resolver;
//	}
	
//	@Bean
//	public DeptController deptController(DeptDAO dao) {
//		return new DeptController(dao);
//	}
	
	@Bean
	public UserController userController(UserDAO dao) {
		return new UserController(dao);
	}
	
	
}
