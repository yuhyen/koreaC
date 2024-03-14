package com.korea.mall.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.mall.common.Common;
import com.korea.mall.dto.ProductDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

	final private CommonService commonService;
	
	@Autowired
	HttpServletRequest request;
	
	// 상품 수정 및 등록시 사진 업로드 
	public ProductDTO photo_upload(ProductDTO dto) {
		String fileName = "no_file";

		fileName = commonService.uploadFile(dto.getPicture()).getStriostoredFileName();
		
//		String webPath = "/resources/product_img/";
//		webPath = String.format("%s_%s", webPath, dto.getP_name());
//		String savePath = request.getServletContext().getRealPath(webPath);
//		System.out.println(savePath);
//		
//		MultipartFile photo = dto.getPicture();
//		
//		
//		if(!photo.isEmpty()) {
//			fileName = dto.getP_name();
//			
//			File saveFile = new File(savePath, fileName);
//			
//			if(!saveFile.exists()) {
//				saveFile.mkdirs();
//			} else {
//				saveFile = new File(savePath, fileName);
//			}
//			
//			try {
//				photo.transferTo(saveFile);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
		dto.setP_picture(fileName);
		return dto;
	}
}
