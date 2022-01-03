package com.shc.health.service;

import java.util.List;

import org.springframework.ui.Model;

import com.shc.health.dto.BoardDTO;
import com.shc.health.dto.CommentDTO;

public interface CommentService {

	void save(CommentDTO comment);

	List<CommentDTO> findAll(long b_number);

	String delete(long c_number, long b_number, int page);

	String update(CommentDTO comment, Model model,long c_number, long b_number, int page);

	CommentDTO findById(long c_number);




}
