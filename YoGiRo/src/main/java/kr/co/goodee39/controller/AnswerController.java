package kr.co.goodee39.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.goodee39.service.AnswerService;
import kr.co.goodee39.vo.AnswerVO;

@Controller
public class AnswerController {

	@Autowired
	private AnswerService service;
	
	@GetMapping("/manager/manager2/move_answer")
	public String getAnswer(Model model) {
		System.out.println("확인");
		model.addAttribute("AnswerVO", new AnswerVO()); // answerVO를 담는 그릇
		return "/manager/manager2/manager-answer";
	}
	
	@PostMapping("/manager/manager2/answer_result")
	public String answer(@ModelAttribute("AnswerVO") AnswerVO vo) {
		System.out.println(vo.getAtitle());
		System.out.println(vo.getAcontent());
		
		
		vo.setAcreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		service.insertAnswer(vo);
		
		return "redirect:/manager/manager2/manager-que"; // manager-que 컨트롤러로 리턴
	}
}
