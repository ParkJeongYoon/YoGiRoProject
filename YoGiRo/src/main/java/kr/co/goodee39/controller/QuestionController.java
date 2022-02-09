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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.QuestionService;

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
	
	@GetMapping("/manager/manager2/manager-qns")
	public String getQnaDetail1(Model model , QuestionVO vo) {
		service.selectQnaDetail(model , vo);
		return "/manager/manager2/manager-qns";
	}
	
	@GetMapping("/manager/manager2/manager-que-delete")
	public String deleteQna1(QuestionVO vo) {
		service.deleteQna(vo);
		
		return "redirect:/manager/manager2/manager-que";
	}
	
	
	
	
	
	
	
	
	@GetMapping("/qna/qna-main")
	public String getQnaList(Model model,
								@RequestParam(defaultValue = "1") int qnum,
								@RequestParam(defaultValue="") String qtitle,
								@RequestParam(defaultValue="") String qcontent) {
		service.selectQnaList(model, qnum, qtitle, qcontent);
		return "/qna/qna-main";
	}
	
	@GetMapping("/qna/qna-detail")
	public String getQnaDetail(Model model , QuestionVO vo) {
		service.selectQnaDetail(model , vo);
		return "/qna/qna-detail";
	}
	
	
	@GetMapping("/qna/qna-create")
	public String getQnaCreate(QuestionVO vo) {
		return "/qna/qna-create";
	}
	
	@PostMapping("/qna/qna-create-result")
	public String setQnaCreate(QuestionVO vo) {
		
		vo.setQcreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		service.insertQna(vo);

		return "redirect:/qna/qna-main";
	}
	
	
	@GetMapping("/qna/qna-delete")
	public String deleteQna(QuestionVO vo) {
		service.deleteQna(vo);
		
		return "redirect:/qna/qna-main";
	}
	
}
