package kr.co.goodee39.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.QnaService;
import kr.co.goodee39.vo.QnaVO;

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
		service.selectQnaCount(model , qnum , qtitle , qcontent);

		return "qna/qna-main";
	}
	
	@GetMapping("/qna-create")
	public String getQnaCreate(QnaVO vo) {
		return "qna/qna-create";
	}
//	public String getBBSDetail(Model model , @ModelAttribute("bbsVO") BBSVO vo) {
//		// 파일에서 모델 쓰니 디테일와 모디파이 모델 추가
//		service.selectBBS(model , vo);
//		System.out.println("detail : " + vo.toString());
//		System.out.println("detail : " + vo.getTitle());
//		System.out.println("detail : " + vo.getContent());
//		System.out.println("detail : " + vo.getOwnerid());
//		System.out.println("detail : " + vo.getOwnername());
//		return "bbs_detail";
//	}
	
	@PostMapping("/qna-create-result")
	public String setQnaCreate(QnaVO vo) {
		
		vo.setQcreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		service.insertQna(vo);

		return "redirect:/qna/qna-main";
	}

}
