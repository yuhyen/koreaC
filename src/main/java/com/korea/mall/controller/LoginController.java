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
	
	//로그인
	@RequestMapping("login")
	@ResponseBody
	public String login(String u_id, String u_pwd) {
		//id에 해당하는 데이터 1건 조회
		UserDTO dto = user_dao.selectOne(u_id);
		
		//dto가 null일 경우 id가 DB에 존재하지 않음
		if(dto ==null) {
			return "[{'param':'no_u_id'}]";
		}
		
		//우리가 입력받은 pwd와 DB에 저장된 비밀번호를 비교하기
		if(!u_pwd.equals(dto.getU_pwd())){
			return "[{'param':'no_u_pwd'}]";
		}
		
		//여기까지 내려오면 아이디와 비밀번호에 문제가 없다는 뜻
		//세션에 바인딩을 한다.
		//세션은 서버의 메모리를 사용하기 때문에 세션을 많이 사용할수록
		//브라우저가 느려지기 때문에 꼭 필요한 곳에서만 쓰도록 하자
		
		session.setAttribute("u_id",dto);
		
	
		//로그인에 성공한 경우
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
	
	//아이디찾기
	@RequestMapping("find_id")
	@ResponseBody
	public String find_id(String u_username,String u_email) {
		System.out.println(u_username+","+u_email);
		
		UserDTO dto = user_dao.selectUserName(u_username);
		
		if(dto ==null) {
			return "[{'param':'no_u_username'}]";
		}
		
		//우리가 입력받은 email와 DB에 저장된 이메일를 비교하기
		if(!u_email.equals(dto.getU_email())){
			return "[{'param':'no_u_email'}]";
		}
		
		String u_id = String.format("%s", dto.getU_id());
		System.out.println(u_id);
	
		//로그인에 성공한 경우
		return "[{'u_id':'"+u_id+"'}]";
	}
	
	
	//비밀번호 찾기
	@RequestMapping("find_pwd")
	@ResponseBody
	public String find_pwd(String u_id,String u_email) {
		System.out.println(u_id+","+u_email);
		
		UserDTO dto = user_dao.selectUserId(u_id);
		
		if(dto ==null) {
			return "[{'param':'no_u_id'}]";
		}
		
		//우리가 입력받은 email와 DB에 저장된 이메일를 비교하기
		if(!u_email.equals(dto.getU_email())){
			return "[{'param':'no_u_email'}]";
		}
		
		//로그인에 성공한 경우
		return "[{'param':'clear'},{'u_id':'"+u_id+"'}]";
	}
	
	
	@RequestMapping("find_pwd_form")
	public String find_pwd_form() {
		return "/login/find_pwd_form";
	}
	
	
	//아이디중복검사
	@RequestMapping("check_id")
	@ResponseBody
	public String check_id(String u_id) {
		UserDTO dto = user_dao.selectOne(u_id);
		
		//null이면 중복이 없으니깐 가입 가능.
		if(dto ==null) {
			return "[{'res':'yes'}]";
		}
		return "[{'res':'no'}]";
	}
	
	//이메일 중복검사
	@RequestMapping("check_email")
	@ResponseBody
	public String check_email(String u_email) {
		System.out.println("jsp에서 입력해서 넘어온 이메일 : "+ u_email);//jsp에서 넘어온 이메일
		
		
		UserDTO dto = user_dao.selectUserEmail(u_email);
		//System.out.println("DB에서 넘어온 이메일 : " + dto.getU_email()); //DB에서 넘어온 이메일
		
		if(dto ==null) {
			return "[{'res':'yes'}]";
		}
		return "[{'res':'no'}]";
	}
	
	
	
	//회원가입
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
	
	
	//비밀번호찾기 이메일 인증번호 전송
	 @RequestMapping("/find")
	   @ResponseBody
	   public String find_post(@RequestParam Map<String, Object> map,
	      HttpServletRequest req,String u_email) throws Exception {
	      // 랜덤한 숫자문자를 합친 문자열을 전달받은 map의 email로 보낸다.
		 
		 System.out.println(u_email);
		 
		  Random rand = new Random();
		  strRand = "";
		  for (int i = 0; i < 4; i++) {
			  strRand +=  rand.nextInt(10);
		}
		 
	      MailUtils sendMail = new MailUtils(mailSender);
	      sendMail.setSubject("비밀번호찾기 이메일 인증");
	      String message = new StringBuffer()
	    		  .append("<h1>[이메일 인증]발신전용이므로 회신 불가</h1>")
	    		  .append("<p>인증번호: ")
	    		  .append(strRand)
	    		  .append("</p>")
	    		  .toString() ;
	    		  
	      sendMail.setText(message);
	      sendMail.setFrom("noreply@noreply.com", "관리자");
	      sendMail.setTo(u_email);
	      sendMail.send();
	        
	      return null;   
	   }
	 
	 
	//이메일 인증번호 비교
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
			
			
			//인증번호 비교
			if(!u_check.equals(strRand)){
				return "[{'param':'no_equal'}]";
			}	

			//인증번호가 맞을 경우
			return "[{'u_pwd':'"+u_pwd+"'}]";
		}
}








