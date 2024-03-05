package com.korea.mall.dto;

import lombok.Data;

@Data
public class UserDTO {
	private int u_idx,u_total,u_reserve;
	private String u_id,u_pwd,u_username,u_email,u_tel,u_ip;
}
