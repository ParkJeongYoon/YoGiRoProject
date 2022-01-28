package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodee39.service.LoginService;
import kr.co.goodee39.vo.UserVO;

@Controller
@RequestMapping("/user")
public class FormController {
	
	@Autowired
	LoginService memberService;
	
	@PostMapping("/login/login-main")
	public String isLogin(UserVO vo, HttpSession session) {
		return memberService.getuser(vo, session);
	}
	
	@GetMapping("/signUp/signup-main")
	public String signUp(UserVO vo) {
		return "signup/signup-main";
	}
	
	@PostMapping("/signupResult")
	public String signupResult(UserVO vo) {
		memberService.setuser(vo);
		return "/login/login";
	}
	
}


