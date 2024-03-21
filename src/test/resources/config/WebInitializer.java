package config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import context.Context_1_mybatis;
import context.Context_2_dao;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	//AbstractAnnotationConfigDispatcherServletInitializer
	//���������� �����ϴ� Ŭ������ �� ���ø����̼��� �ʱ�ȭ�� ���� ���� ����� �����Ѵ�.
	// �� Ŭ������ ����ϸ� �ڹ� ��� ���� Ŭ������ �̿��Ͽ� DispatcherServlet �� ContextLoaderListener��
	//�̸� �뷡 web.xml�� ������� �ʰ� �� ���ø����̼��� �ʱ�ȭ�� ���� �� �� �ִ�.
	// �ش� Ŭ������ ��ӹ޾� �ʿ��� ������ �������̵� �Ͽ� ����Ѵ�.
	
	//������Ʈ�� �� ���� ������ ����Ѵ�.
	//�����ͺ��̽� ����Ǯ(DBCP), Mybatis, Myabits���ۿ� ���� ���� ���������� ����ϴ� �޼���
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {Context_1_mybatis.class,
							Context_2_dao.class};
	}
	
	//.class : Ŭ���� ���ͷ�
	//Ŭ���� �� ��ü�� �����ϴ� ����
	//Class clazz = String.class;
	
	//DispatcherSerlvet�� ����� ���� Ŭ������ ��ȯ�Ѵ�.
	//SpringMVC �� ���� ������ ����Ѵ�.
	//View�� Controller�� ����ϴ� �޼���
	
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class[] {ServletContext.class};
	}
	
	//DispatcherServlet�� URL ������ �����Ѵ�.
	//��� ��û�� ó���ϵ��� "/"�� �����Ǿ��ִ�.
	@Override
	protected String[] getServletMappings() {

		return new String[] {"/"};
	}
	
	//filter
	//Client�� ��û�� Servlet�� �����ϱ� ���̳� �Ŀ� ��û �� ���� �����͸� �����ϰų�
	//�߰� �۾��� �����ϴµ� ���Ǵ� �ڹ� ������Ʈ�� �ǹ��Ѵ�.
	
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		return new Filter[] {characterEncodingFilter};
	}
	
	
	
}
