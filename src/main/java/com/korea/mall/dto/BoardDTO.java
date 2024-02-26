package com.korea.mall.dto;

import lombok.Data;

@Data
public class BoardDTO {
	
//	base
	private String seq;
	private String category;
	private long user;
	private String notice_yn;
	private String img_path;
	private String title;
	private String crtr;
	private String reply;
	private String deep;
	
//	dtls
//	private String seq;
//	private String crtr;
//	private String reply;
//	private String deep;
	private String contents;
	
	private String reg_date;
	private long reg_user;
	private String mod_date;
	private long mod_user;
	
}
