package com.korea.mall.dto;

import lombok.Data;

@Data
public class BoardDTO {
	
//	base
	private String seq;
	private String category;
	private long user;
	private String noticeYn;
	private String imgPath;
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
	
	private String regDate;
	private long regUser;
	private String modDate;
	private long modUser;
	
}
