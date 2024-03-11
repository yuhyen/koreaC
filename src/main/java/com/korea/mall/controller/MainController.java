package com.korea.mall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 상품 상세보기
	@RequestMapping("detail")
	public String detail(Model model, int p_num) {
		ProductDTO dto = product_dao.selectOne(p_num);
		model.addAttribute("dto", dto);
		
		return "main/p_detail";
	}
	
	// 배송지연 안내 페이지
	@RequestMapping("delay")
	public String delay() {
		return "main/delay";
	}
	
	// 검색 페이지
	@RequestMapping("search")
	public String search(Model model) {
		List<ProductDTO> list = product_dao.selectList();
		model.addAttribute("list", list);
		return "main/search";
	}
	
	// 카테고리별로 보기
	@RequestMapping("category")
	public String view_list(Model model,@RequestParam(value = "p_id", required = true) int p_id) {
		List<ProductDTO> list = product_dao.category(p_id);
		model.addAttribute("list", list);
		return "main/category";
	}
	
	// 상품 검색
	@RequestMapping("p_search")
	public String p_search(Model model,@RequestParam(value = "p_name", required = true) String p_name) {
		
		p_name = "all";
		String name = request.getParameter("p_name");
		
		if(name != null && !name.isEmpty()) {
			p_name = name;
		}
		
		List<ProductDTO> list = null;
		
		if(p_name.equalsIgnoreCase("all")) {
			list = product_dao.selectList();
		} else {
			list = product_dao.search(name);
		}
		model.addAttribute("list", list);
		
		return "main/search";
	}
}
