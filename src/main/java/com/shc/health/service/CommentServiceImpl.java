package com.shc.health.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shc.health.dto.CommentDTO;
import com.shc.health.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentRepository cr;

	@Override
	public void save(CommentDTO comment) {
		cr.save(comment);
		
	}

	@Override
	public List<CommentDTO> findAll(long b_number) {
		return cr.findAll(b_number);
	}

	@Override
	public String delete(long c_number, long b_number, int page) {
		int result = cr.delete(c_number);
		if(result>0) {
			return "redirect:/board/detail?b_number="+b_number+"&page="+page;
		} else {
			return "/board/paging";
		}
	}

	@Override
	public String update(CommentDTO comment, Model model, long c_number,long b_number, int page) {
		int result = cr.update(comment);
		if(result>0) {
			model.addAttribute("comment", comment);
			return "redirect:/board/detail?b_number="+b_number+"&page="+page+comment.getC_number();
		}else {
			return "comment/update";
		}
	}

	@Override
	public CommentDTO findById(long c_number) {
		CommentDTO comment = cr.findById(c_number);
		return comment;
	}

	}

