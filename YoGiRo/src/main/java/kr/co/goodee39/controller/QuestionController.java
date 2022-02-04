package kr.co.goodee39.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.QuestionService;
import kr.co.goodee39.vo.AnswerVO;
import kr.co.goodee39.vo.QuestionVO;



@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	
	
	@GetMapping("/manager/manager2/manager-que")
	public String getQUEList(Model model, @RequestParam(defaultValue = "1") int qnum,
										@RequestParam(defaultValue="") String qtitle,
										@RequestParam(defaultValue="") String qcontent) {
		service.getQUEList(model, qnum, qtitle, qcontent);
		return "/manager/manager2/manager-que";
	}
	
	@GetMapping("/manager/manager2/manager-qued")
	public String getQUEDetail(@ModelAttribute("questionVO") QuestionVO vo, Model model) {
//		System.out.println(vo.getQnum());
		service.getQUE(model, vo);
		
		return "/manager/manager2/manager-qued";
	}
	
	
}
