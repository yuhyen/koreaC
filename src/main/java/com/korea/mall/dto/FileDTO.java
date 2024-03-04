package com.korea.mall.dto;

import lombok.Data;

@Data
public class FileDTO {
	
	long fileNo; //FILE_NO
	String orgFileName;	//ORG_FILE_NAME
	String StriostoredFileName; //STORED_FILE_NAME
	long fileSize; //FILE_SIZE
	String delYn; //DEL_YN
	String regDate;
	long regUser;
	String updDate;
	long updUser;
}
