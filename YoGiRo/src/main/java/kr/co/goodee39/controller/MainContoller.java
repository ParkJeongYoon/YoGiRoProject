package kr.co.goodee39.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.vo.UserVO;

@Controller
public class MainContoller {
	@GetMapping("/member/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	
	@GetMapping("/login/login-main")
	public String login(HttpServletRequest request,
						HttpSession session,
						@RequestParam(required=false, defaultValue="0") int flag) {
		if(flag==0) {
			String beforePage = request.getHeader("referer");
			session.setAttribute("beforePage" , beforePage);
			System.out.println("con: " + beforePage);
		}
		return "/login/login-main";
	}
	
	/*
	 * @GetMapping("/signup/signup-main") public String signup() { return
	 * "/signup/signup-main"; }
	 */
	  
	
	@GetMapping("/incategories/food/food-main")
	public String food() { 
		return "/incategories/food/food-main";
	}
	
	@GetMapping("/incategories/festa/festa-main")
	public String festa() {
		return "/incategories/festa/festa-main";
	}
	
	@GetMapping("/incategories/course/course-main")
	public String course() {
		return "/incategories/course/course-main";
	}
	
//	@GetMapping("/incategories/community/community-main")
//	public String community() {
//		return "/incategories/community/community-main";
//	}
	

}
