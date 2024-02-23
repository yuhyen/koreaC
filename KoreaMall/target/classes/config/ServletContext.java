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
//Enable로 시작하는 어노테이션을 @Configuration이 붙은 설정 클래스에 붙임으로써 이와 관련된 기능들을 편리하게 제공
//어노테이션 기반의 SpringMVC를 구성할 때 필요한 Bean설정을 자동으로 해주는 어노테이션
//@ComponentScan("com.korea.di")
//@Component, stereotype(@Service, @Repository, @Controller)어노테이션이 부여된 Class들을
//자동으로 Scan하여 Bean으로 등록해주는 역할을 하는 어노테이션
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
