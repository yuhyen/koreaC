package com.korea.mall.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.mall.common.Common;
import com.korea.mall.dao.ProductDAO;
import com.korea.mall.dao.UserDAO;
import com.korea.mall.dto.ProductDTO;
import com.korea.mall.dto.UserDTO;
import com.korea.mall.service.ProductService;
import com.korea.mall.util.Paging;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	
	private final ProductDAO product_dao;
	private final ProductService productService;
	private final UserDAO user_dao;
	
	@Autowired
	HttpServletRequest request;
	
	// 상품 등록 이동
	@RequestMapping("p_add_form")
	public String p_add_form() {
		return "product/product_insert";
	}
	
	// 상품 등록
	@RequestMapping("p_add")
	public String p_add(ProductDTO dto) {
		productService.photo_upload(dto);
		int res = product_dao.p_add(dto);
		
		if(res > 0) {
			return "redirect:pList_form";
		}
		return null;
	}
	
	// 상품 리스트 페이지
	@RequestMapping("pList_form")
	public String pList_form(Model model, @RequestParam(required = false, defaultValue = "1") int page) {
		int start = (page - 1) * Common.pList.BLOCKLIST + 1;
		int end = start + Common.pList.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<ProductDTO> list = product_dao.selectList(map);
		
		// 전체 상품 수 조회
		int rowTotal = product_dao.getRowTotal();
		
		// 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("pList_form",
											page,
											rowTotal, 
											Common.Main.BLOCKLIST, 
											Common.Main.BLOCKPAGE);
		
		request.getSession().removeAttribute("show");
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "admin/product_list.jsp?page="+page;
	}
	
	// 상품 카테고리별
	@RequestMapping("product_category")
	public String view_list(Model model,@RequestParam(value = "p_id", required = true) int p_id) {
		List<ProductDTO> list = product_dao.category(p_id);
		model.addAttribute("list", list);
		
		return "admin/product_category_list";
	}
	
	// 상품 삭제
	@RequestMapping("delete")
	@ResponseBody
	public String delete(int p_num) {
		
		int res = product_dao.delete(p_num);
		
		String result = "no";
		
		if(res == 1) {
			result = "yes";
		}
		
		String finRes = String.format("[{'del':'%s'}]", result);
		
		return finRes;
		
	}
	
	// 상품 수정 페이지로 이동
	@RequestMapping("modify")
	public String modify(Model model, int p_num) {
		ProductDTO dto = product_dao.selectOne(p_num);
		model.addAttribute("dto", dto);
		return "product/product_modify";
	}
	
	// 상품 수정
	@RequestMapping("product_modify")
	public String product_modify(ProductDTO dto) {
		productService.photo_upload(dto);
		int res = product_dao.update(dto);
		
		if(res > 0) {
			return "redirect:pList_form";
		}
		return null;
	}
	
	// 회원 관리
	@RequestMapping("user")
	public String list(Model model, @RequestParam(value = "u_username", required = false) String u_username, @RequestParam(required = false, defaultValue = "1") int page) {
		int start = (page - 1) * Common.uList.BLOCKLIST + 1;
		int end = start + Common.uList.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		// 전체 회원 수 조회
		int rowTotal = product_dao.getRowTotal();
		
		// 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("user",
											page,
											rowTotal, 
											Common.Main.BLOCKLIST, 
											Common.Main.BLOCKPAGE);
		
		request.getSession().removeAttribute("show");
		
		u_username = "all";
		String name = request.getParameter("u_username");
		
		if(name != null && !name.isEmpty()) {
			u_username = name;
		}
		
		List<UserDTO> list = null;
		
		if(u_username.equalsIgnoreCase("all")) {
			list = user_dao.selectList(map);
		} else {
			list = user_dao.search(name);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu", pageMenu);
		
		return "admin/user_list.jsp?page="+page;
	}
	
	// 회원삭제
	@RequestMapping("user_delete")
	@ResponseBody
	public String user_delete(int u_idx) {
		
		int res = user_dao.user_delete(u_idx);
		
		String result = "no";
		
		if(res == 1) {
			result = "yes";
		}
		
		String finRes = String.format("[{'del':'%s'}]", result);
		
		return finRes;
	}
}
