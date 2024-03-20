package com.korea.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ErrorController {
	
	@RequestMapping(value = {"/error404"})
	public ModelAndView err404() {
 		ModelAndView mv = new ModelAndView("/error/404");
		return mv;
	}
	
	@RequestMapping(value = {"/error500"})
	public ModelAndView err500() {
		ModelAndView mv = new ModelAndView("/error/500");
		return mv;
	}
	
	
}
