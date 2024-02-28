package com.korea.mall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.BoardDTO;
import com.korea.mall.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;
	
	@RequestMapping(value = {"/boardList"})
	public ModelAndView list() {
 		ModelAndView mv = new ModelAndView("/board/boardList");
		return mv;
		
	}
	@RequestMapping(value = {"/boardList.json"})
	public ModelAndView listAjax(BoardDTO dto , Model model) {
		ModelAndView mv = new ModelAndView("jsonView");
		Object output = service.selectList(dto);
		mv.addObject(output);
		return mv;
	} 
	
	@RequestMapping(value = {"/board_reg"})
	public ModelAndView reg() {
 		ModelAndView mv = new ModelAndView("/board/board_reg");
		return mv;
		
	}
	
}
