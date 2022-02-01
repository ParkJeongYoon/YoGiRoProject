package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private QnaService service;
	
	@GetMapping("/qna-main")
	public String getQnaList(Model model,
							@RequestParam(defaultValue = "1") int qnum,
							@RequestParam(defaultValue = "") String qtitle,
							@RequestParam(defaultValue = "") String qcontent) {
		service.selectQnaList(model , qnum , qtitle , qcontent);
		System.out.println("controller.list.model : " + model);
		System.out.println("controller.list.num : " + qnum);
		System.out.println("controller.list.title : " + qtitle);
		System.out.println("controller.list.content : " + qcontent);
		
		return "qna/qna-main";
	}

}
