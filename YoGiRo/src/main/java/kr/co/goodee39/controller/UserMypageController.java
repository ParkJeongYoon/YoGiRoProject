package kr.co.goodee39.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.goodee39.service.UserMypageService;
import kr.co.goodee39.vo.UserVO;


@Controller
public class UserMypageController {
	
	@Autowired UserMypageService usermypageservice;
	
	
	/*
	 * @PostMapping("/login") public String isLogin(UserVO vo, HttpSession session)
	 * { return userservice.insertUser(vo, session); }
	 * 
	 * @PostMapping("/signup/signup-main") public String Signup(UserVO vo) { return
	 * "/signup/signup-main"; }
	 * 
	 * @PostMapping("/signupResult") public String SignupResult(UserVO vo) {
	 * userservice.insertUser(vo); return "/login/login-main"; }
	 */
	 
	
	//회원정보 리스트 띄우기
	@GetMapping("/mypage")
	public String MemberList(Model model) {
		List<UserVO> list = usermypageservice.userList();
		model.addAttribute("list", list);
		return "/member/mypage";
	}
	
	
	/*
	 * @PostMapping("/update_do") public String UserUpdate(@ModelAttribute UserVO
	 * vo, Model model) { //비밀번호체크 boolean result
	 * =usermypageservice.CheckPw(vo.getUserid(), vo.getUserpassword()); if (result)
	 * { usermypageservice.updateUser(vo); return "redirect:/member/mypage"; }else
	 * model.addAttribute(UserVO, vo); model.addAttribute("message" "비밀번호불일치");
	 * return "redirect:/member/mypage"; }
	 */

}
