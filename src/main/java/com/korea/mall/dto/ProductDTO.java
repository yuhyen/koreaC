package com.korea.mall.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
	
	private String p_name;
	private String p_explain;
	private String p_size;
	private String p_color;
	private String p_pabric;
	private String p_picture;
	
	private int p_num;
	private int p_price;
	private int p_id;
	private int picture_count;
	
	private MultipartFile picture[];
}
