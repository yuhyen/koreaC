package com.korea.mall.controller;

import java.math.BigDecimal;
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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ErrorController {

	private final CommonService commonService;
	private final HttpSession session;
	
	@RequestMapping(value = {"/error404"})
	public ModelAndView err4() {
 		ModelAndView mv = new ModelAndView("/error/404");
		return mv;
	}
	
	@RequestMapping(value = {"/error500"})
	public ModelAndView err5() {
		ModelAndView mv = new ModelAndView("/error/500");
		return mv;
	}
	
	
}
