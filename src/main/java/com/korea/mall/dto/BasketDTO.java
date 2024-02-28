package com.korea.mall.dto;

import lombok.Data;

@Data
public class BasketDTO {
	private int b_idx;
	private String b_id;
	private int b_num;
	private int b_quantity;

	//Pruduct
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
	
	
}
