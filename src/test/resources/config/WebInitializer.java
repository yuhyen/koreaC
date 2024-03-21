package config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import context.Context_1_mybatis;
import context.Context_2_dao;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	//AbstractAnnotationConfigDispatcherServletInitializer
	//스프링에서 제공하는 클래스로 웹 어플리케이션의 초기화를 위한 편리한 방법을 제공한다.
	// 이 클래스를 사용하면 자바 기반 설정 클래스를 이용하여 DispatcherServlet 및 ContextLoaderListener를
	//이를 통래 web.xml을 사용하지 않고도 웹 어플리케이션의 초기화를 설정 할 수 있다.
	// 해당 클래스를 상속받아 필요한 설정을 오버라이딩 하여 사용한다.
	
	//프로젝트의 모델 영역 설정을 담당한다.
	//데이터베이스 연결풀(DBCP), Mybatis, Myabits매퍼와 같은 로직 설정파일을 담당하는 메서드
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {Context_1_mybatis.class,
							Context_2_dao.class};
	}
	
	//.class : 클래스 리터럴
	//클래스 그 자체를 참조하는 구문
	//Class clazz = String.class;
	
	//DispatcherSerlvet이 사용할 설정 클래스를 반환한다.
	//SpringMVC 웹 영역 설정을 담당한다.
	//View와 Controller를 담당하는 메서드
	
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class[] {ServletContext.class};
	}
	
	//DispatcherServlet의 URL 패턴을 지정한다.
	//모든 요청을 처리하도록 "/"로 설정되어있다.
	@Override
	protected String[] getServletMappings() {

		return new String[] {"/"};
	}
	
	//filter
	//Client의 요청이 Servlet에 도달하기 전이나 후에 요청 및 응답 데이터를 변형하거나
	//추가 작업을 수행하는데 사용되는 자바 컴포넌트를 의미한다.
	
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		return new Filter[] {characterEncodingFilter};
	}
	
	
	
}
