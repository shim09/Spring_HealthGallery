package com.shc.health.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	private long m_number;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phone;	
	private String m_home;
	private String m_home1;
	private String m_home2;
	private MultipartFile m_file;
	private String m_filename;
}
