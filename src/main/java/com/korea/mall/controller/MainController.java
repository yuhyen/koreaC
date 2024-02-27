package com.korea.mall.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.korea.mall.dao.ProductDAO;
import com.korea.mall.dto.ProductDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	ProductDAO product_dao;
	
	HttpServletRequest request;
	
	int p_num;
	
	@RequestMapping(value = {"/","main"})
	public String main(Model model) {
		model.addAttribute(model);
		return "main/main";
	}
	
	// 카테고리별로 보기
	@RequestMapping("category")
	public String view_list(Model model, int p_id) {
		List<ProductDTO> list = product_dao.selectList(p_id);
		
		model.addAttribute("list", list);
		
		return "main/main";
	}
	
	// 상품 수정 및 등록시 사진 업로드 
	public ProductDTO photo_upload(ProductDTO dto) {
		String webPath = "/resources/" + p_num + "/";
		webPath = String.format("%s/%a", webPath, dto.getP_name());
		String savePath = request.getServletContext().getRealPath(webPath);
		
		System.out.println(savePath);
		
		int picCount = dto.getPicture_count();
		
		for(int i = 0; i < dto.getPicture().length; i++) {
			MultipartFile photo = dto.getPicture()[i];
			String fileName = "no_file";
			
			if(!photo.isEmpty()) {
				fileName = dto.getP_name() + '_' + (++picCount) + ".jpeg";
				
				File saveFile = new File(savePath, fileName);
				
				if(!saveFile.exists()) {
					saveFile.mkdirs();
				} else {
					saveFile.delete();
					saveFile = new File(savePath, fileName);
				}
				
				try {
					photo.transferTo(saveFile);
				} catch (Exception e) {
					// TODO: handle exception
				}
				dto.setP_picture(fileName);
				dto.setPicture_count(picCount);
			}
		}
		return dto;
	}
}
