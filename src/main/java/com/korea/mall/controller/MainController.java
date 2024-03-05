package com.korea.mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.mall.dao.ProductDAO;
import com.korea.mall.dto.ProductDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	final ProductDAO product_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = {"/", "main"})
	public String main(Model model) {
		List<ProductDTO> list = product_dao.selectList();

		model.addAttribute("list",list);
		
		return "main/main";
	}
	
	// 배송지연 안내 페이지
	@RequestMapping("delay")
	public String delay() {
		return "main/delay";
	}
	
	// 검색 페이지
	@RequestMapping("search")
	public String search() {
		return "main/search";
	}
	
	// 상품 검색
	@RequestMapping("p_search")
	@ResponseBody
	public String p_search(Model model, String p_name) {
		List<ProductDTO> list = product_dao.search(p_name);
		
		model.addAttribute("list",list);
		
		if(list == null) {
			return "[{'search':'no_product'}]";
		}
		return "[{'search':'yes_product'}]";
	}
	
//	// 카테고리별로 보기
//	@RequestMapping("category")
//	public String view_list(Model model, int p_id) {
//		List<ProductDTO> list = product_dao.selectList(p_id);
//		
//		model.addAttribute("list", list);
//		
//		return "main/main";
//	}
	
	
}
