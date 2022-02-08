package kr.co.goodee39.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import kr.co.goodee39.service.AnswerService;
import kr.co.goodee39.vo.AnswerVO;
import kr.co.goodee39.vo.QuestionVO;
import kr.co.goodee39.vo.UserVO;

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
	
	
	
	
	
	
	
	
	
	@PostMapping("/answer/set")
	public ResponseEntity<AnswerVO> setAnswer(@RequestBody AnswerVO vo , HttpSession session) {
		
		UserVO uvo = (UserVO)session.getAttribute("account");
		vo.setUserid(uvo.getUserid());
		vo.setIsmanager(uvo.getIsmanager());
		
		// 서비스 작성 후 쿼리 적용위해 ㄱ2 후 실행
		vo.setAcreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		service.insertAnswer(vo);
		
		// 밑으로가 제일 처음 생성한 기본 컨트롤러 로직
		ResponseEntity<AnswerVO> entity = new ResponseEntity<AnswerVO>(vo , HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/answer/get/{anum}")//패스베리어블
	public ResponseEntity<List<AnswerVO>> getAnswerList(@PathVariable int anum) {
		AnswerVO vo = new AnswerVO();
		vo.setQnum(anum);
		
		List<AnswerVO> list = service.selectAnswerList(vo);
		
		ResponseEntity<List<AnswerVO>> entity = new ResponseEntity<List<AnswerVO>>(list , HttpStatus.OK);
		
		return entity;
	}
	
	@DeleteMapping("/answer/delete")
	public ResponseEntity<AnswerVO> deleteAnswer(@RequestBody AnswerVO vo , HttpSession session) {
		UserVO mvo = (UserVO)session.getAttribute("account");
		vo.setUserid(mvo.getUserid());
		System.out.println(vo.getAnum());
		service.deleteAnswer(vo);

		// String str = "삭제되었습니다";

		ResponseEntity<AnswerVO> entity = new ResponseEntity<AnswerVO>(vo , HttpStatus.OK);
		
		return entity;
	}
		
		
}
