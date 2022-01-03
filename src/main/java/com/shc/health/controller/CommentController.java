package com.shc.health.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shc.health.dto.BoardDTO;
import com.shc.health.dto.CommentDTO;
import com.shc.health.service.BoardService;
import com.shc.health.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Autowired
	private CommentService cs;
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment){
		cs.save(comment);
		List<CommentDTO>commentList = cs.findAll(comment.getB_number());
		return commentList;
	}
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("c_number") long c_number,
						@RequestParam("b_number") long b_number,
						@RequestParam(value="page",required=false,defaultValue="1")int page) {
		String result = cs.delete(c_number,b_number,page);
		return result;
	}
	@RequestMapping(value="update",method=RequestMethod.GET)
	public String updateForm(@RequestParam("c_number") long c_number, Model model,
			@RequestParam("b_number") long b_number,
			@RequestParam(value="page",required=false,defaultValue="1")int page) {
		CommentDTO comment = cs.findById(c_number);
		BoardDTO board = bs.findById(b_number);
		model.addAttribute("comment", comment);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		System.out.println(comment);
		System.out.println(board);
		System.out.println("널??");
		return "comment/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(@ModelAttribute CommentDTO comment, Model model,
			@RequestParam("c_number") long c_number,
			@RequestParam("b_number") long b_number,
			@RequestParam(value="page",required=false,defaultValue="1")int page) {
		String result = cs.update(comment,model,c_number,b_number,page);
		System.out.println(comment);
		return result;
	}
	
}
