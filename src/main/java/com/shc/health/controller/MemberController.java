package com.shc.health.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shc.health.dto.MemberDTO;
import com.shc.health.service.MemberService;


@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	
		@Autowired
		private MemberService ms;

		@RequestMapping(value = "insert" , method = RequestMethod.GET)
		public String insertForm() {
			return "member/insert";		
}
		
		@RequestMapping(value = "insert", method = RequestMethod.POST)
		public String insert(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
			System.out.println(member);
			int save = ms.insert(member);
			
			if(save >0) {
				return "index";
			}else {
				
				return "member/insert";
			}
		}
		@RequestMapping(value = "about", method = RequestMethod.GET)
		public String about() {
			return "member/about";
		}
		
		@RequestMapping(value ="login", method = RequestMethod.GET)
		public String loginForm() {
			return "member/login";
		}
		
		@RequestMapping(value ="login", method = RequestMethod.POST)
		public String login(@ModelAttribute MemberDTO member) {
			String resultPage = ms.login(member);
			return resultPage;
		} 
		
		@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
		public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
			String result = ms.idDuplicate(m_id);
			return result;
		}
		
		@RequestMapping(value="logout", method= RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			return"index";
			
		}
		
		@RequestMapping(value="mypage", method= RequestMethod.GET)
		public String mypage(@RequestParam("m_number") long m_number, Model model ) {
			System.out.println(m_number);
			MemberDTO member = ms.mypage(m_number);
			model.addAttribute("m",member);
			return "member/mypage";
		}
		
		@RequestMapping(value="findAll", method= RequestMethod.GET)
		public String findAll(Model model) {
		List<MemberDTO> mList = ms.findAll();
		model.addAttribute("mList",mList);
		return"member/findAll";
		}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		ms.delete(m_number);
		return "redirect:/member/findAll";
	}
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member",member);
		return "member/update";
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO members,Model model) throws IllegalStateException, IOException {
		ms.update(members);
		String result ="redirect:/member/mypage?m_number=" + members.getM_number();
		model.addAttribute("members", members);
		return result;
	}
	
	
	
}
