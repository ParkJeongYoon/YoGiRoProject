package kr.co.goodee39.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodee39.service.QuestionService;



@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	
	
	@GetMapping("/manager/manager2/manager-que")
	public String getQUEList(Model model) {
		service.getQUEList(model);
		return "/manager/manager2/manager-que";
	}
		
}
