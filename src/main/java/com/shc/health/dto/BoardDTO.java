package com.shc.health.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	
	private long b_number;
	private String b_writer;
	private String b_password;
	private String b_title;
	private String b_contents;
	private long cate_number;
	private int b_hits;
	private Timestamp b_date;
	private MultipartFile b_file; 
	private String b_filename;

}
