package com.korea.mall.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.UserDTO;
import com.korea.mall.mail.MailUtils;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class LoginController {

	final UserDAO user_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	JavaMailSender mailSender;
	
	private String strRand;
	
	//�α���
	@RequestMapping("login")
	@ResponseBody
	public String login(String u_id, String u_pwd) {
		//id�� �ش��ϴ� ������ 1�� ��ȸ
		UserDTO dto = user_dao.selectOne(u_id);
		
		//dto�� null�� ��� id�� DB�� �������� ����
		if(dto ==null) {
			return "[{'param':'no_u_id'}]";
		}
		
		//�츮�� �Է¹��� pwd�� DB�� ����� ��й�ȣ�� ���ϱ�
		if(!u_pwd.equals(dto.getU_pwd())){
			return "[{'param':'no_u_pwd'}]";
		}
		
		//������� �������� ���̵�� ��й�ȣ�� ������ ���ٴ� ��
		//���ǿ� ���ε��� �Ѵ�.
		//������ ������ �޸𸮸� ����ϱ� ������ ������ ���� ����Ҽ���
		//�������� �������� ������ �� �ʿ��� �������� ������ ����
		
		session.setAttribute("u_id",dto);
		
		
		//�α��ο� ������ ���
		return "[{'param':'clear'}]";
		
		
	}
	
	@RequestMapping(value={"","login_form"})
	public String login_form() {
		return "login/login_form";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("u_id");
		return "redirect:main";
	}
	
	@RequestMapping("user_insert_form")
	public String user_insert_form() {
		return "/login/user_insert_form";
	}
	
	@RequestMapping("find_id_form")
	public String find_id_form() {
		return "/login/find_id_form";
	}
	
	//���̵�ã��
	@RequestMapping("find_id")
	@ResponseBody
	public String find_id(String u_username,String u_email) {
		System.out.println(u_username+","+u_email);
		
		UserDTO dto = user_dao.selectUserName(u_username);
		
		if(dto ==null) {
			return "[{'param':'no_u_username'}]";
		}
		
		//�츮�� �Է¹��� email�� DB�� ����� �̸��ϸ� ���ϱ�
		if(!u_email.equals(dto.getU_email())){
			return "[{'param':'no_u_email'}]";
		}
		
		String u_id = String.format("%s", dto.getU_id());
		System.out.println(u_id);
	
		//�α��ο� ������ ���
		return "[{'u_id':'"+u_id+"'}]";
	}
	
	
	//��й�ȣ ã��
	@RequestMapping("find_pwd")
	@ResponseBody
	public String find_pwd(String u_id,String u_email) {
		System.out.println(u_id+","+u_email);
		
		UserDTO dto = user_dao.selectUserId(u_id);
		
		if(dto ==null) {
			return "[{'param':'no_u_id'}]";
		}
		
		//�츮�� �Է¹��� email�� DB�� ����� �̸��ϸ� ���ϱ�
		if(!u_email.equals(dto.getU_email())){
			return "[{'param':'no_u_email'}]";
		}
		
		//�α��ο� ������ ���
		return "[{'param':'clear'},{'u_id':'"+u_id+"'}]";
	}
	
	
	@RequestMapping("find_pwd_form")
	public String find_pwd_form() {
		return "/login/find_pwd_form";
	}
	
	
	//���̵��ߺ��˻�
	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(String u_id) {
		UserDTO dto = user_dao.selectOne(u_id);
		
		//null�̸� �ߺ��� �����ϱ� ���� ����.
		if(dto ==null) {
			return "[{'res':'yes'}]";
		}
		return "[{'res':'no'}]";
	}
	
	//�̸��� �ߺ��˻�
	@RequestMapping("check_email")
	@ResponseBody
	public String check_email(String u_email) {
		System.out.println("jsp���� �Է��ؼ� �Ѿ�� �̸��� : "+ u_email);//jsp���� �Ѿ�� �̸���
		
		
		UserDTO dto = user_dao.selectUserEmail(u_email);
		//System.out.println("DB���� �Ѿ�� �̸��� : " + dto.getU_email()); //DB���� �Ѿ�� �̸���
		
		if(dto ==null) {
			return "[{'res':'yes'}]";
		}
		return "[{'res':'no'}]";
	}
	
	
	
	//ȸ������
	@RequestMapping("user_insert")
	public String user_insert(UserDTO dto,String u_ipExtraAddr) {
		
		System.out.println(u_ipExtraAddr);
		
		String ip = dto.getU_ip() + u_ipExtraAddr;
		dto.setU_ip(ip);
		int res = user_dao.insert(dto);
		
		if(res>0) {
			return "redirect:login_form";
		}
		return null;
	}
	
	
	//��й�ȣã�� �̸��� ������ȣ ����
	 @RequestMapping("/find")
	   @ResponseBody
	   public String find_post(@RequestParam Map<String, Object> map,
	      HttpServletRequest req,String u_email) throws Exception {
	      // ������ ���ڹ��ڸ� ��ģ ���ڿ��� ���޹��� map�� email�� ������.
		 
		 System.out.println(u_email);
		 
		  Random rand = new Random();
		  strRand = "";
		  for (int i = 0; i < 4; i++) {
			  strRand +=  rand.nextInt(10);
		}
		 
	      MailUtils sendMail = new MailUtils(mailSender);
	      sendMail.setSubject("��й�ȣã�� �̸��� ����");
	      String message = new StringBuffer()
	    		  .append("<h1>[�̸��� ����]�߽������̹Ƿ� ȸ�� �Ұ�</h1>")
	    		  .append("<p>������ȣ: ")
	    		  .append(strRand)
	    		  .append("</p>")
	    		  .toString() ;
	    		  
	      sendMail.setText(message);
	      sendMail.setFrom("noreply@noreply.com", "������");
	      sendMail.setTo(u_email);
	      sendMail.send();
	        
	      return null;   
	   }
	 
	 
	//�̸��� ������ȣ ��
	 @RequestMapping("/checknum")
		@ResponseBody
		public String checknum(String u_check, String u_id) {
			u_check = u_check.replace("=", "");
			System.out.println("#####strRand:"+strRand);
			System.out.println("######str:"+u_check);
			System.out.println(u_id);
			String u_pwd="";
			
			u_pwd = user_dao.selectUserPwd(u_id);
			System.out.println(u_pwd);
			
			
			//������ȣ ��
			if(!u_check.equals(strRand)){
				return "[{'param':'no_equal'}]";
			}	

			//������ȣ�� ���� ���
			return "[{'u_pwd':'"+u_pwd+"'}]";
		}
	 
		/*
		 * @RequestMapping("/kakaologin") public String kakaoLogin(@RequestParam String
		 * code) { String accessToken = kakaoApi.getAccessToker(code);
		 * 
		 * Map<String,Object> userInfo = kakaoApi.getUserInfo(accessToken);
		 * 
		 * String email = (String)userInfo.get("email"); String nickname =
		 * (String)userInfo.get("nickname");
		 * 
		 * System.out.println("email = " + email); System.out.println("nickname = " +
		 * nickname); System.out.println("accessToken = " + accessToken);
		 * 
		 * return "redirect:/login";
		 * 
		 * }
		 */
	 
}








