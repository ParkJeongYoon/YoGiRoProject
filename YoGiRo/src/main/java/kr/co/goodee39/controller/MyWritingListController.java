package kr.co.goodee39.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.CommunityService;
import kr.co.goodee39.service.MyWritingListService;
import kr.co.goodee39.vo.ComCommentVO;
import kr.co.goodee39.vo.CommunityVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyCourseDetailVO;
import kr.co.goodee39.vo.MyFoodVO;
import kr.co.goodee39.vo.QuestionVO;
import kr.co.goodee39.vo.UserVO;

@Controller
public class MyWritingListController {
	
	@Autowired
	private MyWritingListService mls;
	
	
	@GetMapping("/myqna")
	public String myqna(@ModelAttribute UserVO uservo, QuestionVO questionvo, Model model, 
			@RequestParam(defaultValue = "1") int qnum,
			@RequestParam(defaultValue="") String qtitle,
			@RequestParam(defaultValue="") String qcontent,
			HttpSession session) {
			
		UserVO vo =(UserVO)session.getAttribute("account");
		String userid = vo.getUserid();
		mls.getQUEList(questionvo, model, qnum, qtitle, qcontent,userid);
		return "/member/myqna";
	}
	
	@GetMapping("/mycommunity")
	public String mycommunity(@ModelAttribute UserVO uservo, CommunityVO comvo, Model model,
							  @RequestParam(defaultValue = "1") int num,
							  @RequestParam(defaultValue = "") String title,
							  @RequestParam(defaultValue = "") String content,
							  HttpSession session) {
		
		UserVO vo =(UserVO)session.getAttribute("account");
		String userid = vo.getUserid();
		mls.selectComList(comvo, model, num, title, content,userid);
		
			
		return "/member/mycommunity";
	}	

	
	@GetMapping("/mycourse")
	public String mycourse(@ModelAttribute UserVO uservo, MyCourseCommonVO coursevo,Model model,
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue="") String mycoursecommontitle,
			@RequestParam(defaultValue="") String mycourseinfo,
			@RequestParam(defaultValue="서울") String region,
			HttpSession session) {
		
		UserVO vo =(UserVO)session.getAttribute("account");
		String userid = vo.getUserid();
		mls.selectMyCourseList(coursevo,model, num, mycoursecommontitle, mycourseinfo, region,userid);
		return "/member/mycourse";
	}
	
	
	@GetMapping("/myrestaurant")
	public String myrestaurant(@ModelAttribute UserVO uservo, MyFoodVO myfoodvo,Model model,
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue="") String myfoodname,
			@RequestParam(defaultValue="") String myfooddetail,
			@RequestParam(defaultValue="서울") String region,
			HttpSession session) {
		
		UserVO vo =(UserVO)session.getAttribute("account");
		String userid = vo.getUserid();
		mls.selectMyFoodList(myfoodvo,model, num, myfoodname, myfooddetail, region,userid);
		return "/member/myrestaurant";
	}
	
}
