package com.korea.mall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.korea.mall.common.Const;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.BoardDTO;
import com.korea.mall.dto.UserDTO;
import com.korea.mall.service.BoardService;
import com.korea.mall.service.CommonService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;
	private final CommonService commonService;
	private final HttpSession session;
	
	@RequestMapping(value = {"/board_list"})
	public ModelAndView list() {
 		ModelAndView mv = new ModelAndView("/board/board_list");
		return mv;
	}
	
	@RequestMapping(value = {"/board_page.json"})
	public ModelAndView listAjaxPage(@RequestBody HashMap<String, Object> param) {
		ModelAndView mv = new ModelAndView("jsonView");
		Object output = service.selectPage(param);
		mv.addObject("u_id", session.getAttribute(Const.U_SESSION_KEY));
		mv.addObject("data", output);
		return mv;
	} 
	@RequestMapping(value = {"/board_list.json"})
	public ModelAndView listAjax(@RequestBody HashMap<String, Object> param) {
		ModelAndView mv = new ModelAndView("jsonView");
		Object output = service.selectList(param);
		mv.addObject("u_id", session.getAttribute(Const.U_SESSION_KEY));
		mv.addObject("data", output);
		return mv;
	} 
	
	@RequestMapping(value = {"/board_reg"})
	public ModelAndView reg() {
 		ModelAndView mv = new ModelAndView("/board/board_reg");
		return mv;
	}
	
	
	@RequestMapping(value = {"/board_view"})
	public ModelAndView view() {
 		ModelAndView mv = new ModelAndView("/board/board_view");
		return mv;
	}
	
	@RequestMapping(value = {"/board_detail"})
	public ModelAndView detail(@RequestBody HashMap<String, Object> param) {
		ModelAndView mv = new ModelAndView("jsonView");
		UserDTO user = (UserDTO) session.getAttribute(Const.U_SESSION_KEY);
		BoardDTO dto = new BoardDTO();
		dto.setSeq((String) param.get("seq"));
		
		dto = service.selectOne(dto);
		mv.addObject(dto);
		if(dto.getRegUser() ==  user.getU_idx()) {
			mv.addObject("update", "Y");
		}else {
			mv.addObject("update", "N");
		}
		
		return mv;
	}
	
	
	@RequestMapping(value = {"/board_insert"})
	public ModelAndView insert(@RequestBody HashMap<String, Object> param) {
		ModelAndView mv = new ModelAndView("jsonView");
		UserDTO user = (UserDTO) session.getAttribute(Const.U_SESSION_KEY);
		if(user == null) {
			user = new UserDTO();
		  	user.setU_idx(9999);
		}
		BoardDTO dto = new BoardDTO();
		
		dto.setCategory((String) param.get("category"));
		dto.setNoticeYn((String) param.get("noticeYn"));
		dto.setTitle((String) param.get("title"));
		dto.setContents((String) param.get("contents"));
		dto.setUser(user.getU_idx());
		dto.setRegUser(user.getU_idx());
		dto.setModUser(user.getU_idx());
		
		dto = service.insert(dto);
		mv.addObject(dto);
		return mv;
	}
	
	@RequestMapping(value = {"/board_update"})
	public ModelAndView update(@RequestBody HashMap<String, Object> param) {
		ModelAndView mv = new ModelAndView("jsonView");
		//세션체크 필요함.
		UserDTO user = (UserDTO) session.getAttribute(Const.U_SESSION_KEY); 
		if(user == null) {
			user = new UserDTO();
			user.setU_idx(9999);
		}
		BoardDTO dto = new BoardDTO();
		
		dto.setTitle((String) param.get("title"));
		dto.setContents((String) param.get("contents"));
		dto.setUser(user.getU_idx());
		dto.setRegUser(user.getU_idx());
		dto.setModUser(user.getU_idx());
		
		dto = service.insert(dto);
		mv.addObject(dto);
		return mv;
	}
	
	
	
	@RequestMapping(value = {"/board_fileUpload.ajax"})
	public ModelAndView fileUpload(MultipartHttpServletRequest file) {
		List<MultipartFile> list = file.getFiles("files");
		System.out.println(list);
		commonService.uploadFile(list);
 		ModelAndView mv = new ModelAndView("jsonView");
		return mv;
		
	}
	
	
}
