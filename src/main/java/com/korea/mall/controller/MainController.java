package com.korea.mall.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.korea.mall.common.Common;
import com.korea.mall.dao.ProductDAO;
import com.korea.mall.dto.ProductDTO;
import com.korea.mall.util.Paging;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	final ProductDAO product_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = {"/", "main"})
	public String main(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		
		int start = (page - 1) * Common.Main.BLOCKLIST + 1;
		int end = start + Common.Main.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<ProductDTO> list = product_dao.selectList(map);
		
		// 전체 상품 수 조회
		int rowTotal = product_dao.getRowTotal();
		
		// 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("main",
											page,
											rowTotal, 
											Common.Main.BLOCKLIST, 
											Common.Main.BLOCKPAGE);
		
		request.getSession().removeAttribute("show");
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		return "main/main.jsp?page="+page;
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
	public String search(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		int start = (page - 1) * Common.Main.BLOCKLIST + 1;
		int end = start + Common.Main.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		// 전체 상품 수 조회
		int rowTotal = product_dao.getRowTotal();
		
		// 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("search",
											page,
											rowTotal, 
											Common.Main.BLOCKLIST, 
											Common.Main.BLOCKPAGE);
		
		request.getSession().removeAttribute("show");

		List<ProductDTO> list = product_dao.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "main/search.jsp?page="+page;
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
	public String p_search(Model model,@RequestParam(value = "p_name", required = true) String p_name, @RequestParam(required = false, defaultValue = "1") int page) {
		int start = (page - 1) * Common.Main.BLOCKLIST + 1;
		int end = start + Common.Main.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		// 전체 상품 수 조회
		int rowTotal = product_dao.getRowTotal();
		
		// 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("main",
											page,
											rowTotal, 
											Common.Main.BLOCKLIST, 
											Common.Main.BLOCKPAGE);
		
		request.getSession().removeAttribute("show");
		
		p_name = "all";
		String name = request.getParameter("p_name");
		
		if(name != null && !name.isEmpty()) {
			p_name = name;
		}
		
		List<ProductDTO> list = null;
		
		if(p_name.equalsIgnoreCase("all")) {
			list = product_dao.selectList(map);
		} else {
			list = product_dao.search(name);
		}
		
		model.addAttribute("pageMenu", pageMenu);
		model.addAttribute("list", list);
		
		return "main/search.jsp?page="+page;
	}
}
