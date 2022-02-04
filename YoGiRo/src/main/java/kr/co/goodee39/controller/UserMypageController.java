package kr.co.goodee39.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.LoginService;
import kr.co.goodee39.service.UserMypageService;
import kr.co.goodee39.vo.UserVO;


@Controller
public class UserMypageController {
	
	
	@Autowired UserMypageService us;
	 
	
	//회원정보 리스트 띄우기
	@GetMapping("/mypage")
	public String UserList(Model model) {
		List<UserVO> list = us.userList();
		model.addAttribute("list", list);
		return "/member/mypage";
	}
	
	@PostMapping("/update_do")
	public String updateUserView(){
		return "/member/modify_mypage";
	}
	
	@PostMapping("/update_result") 
	public String updateUserResult(UserVO vo){
	us.updateUser(vo);
	return "redirect:/login/login-main"; 
	}
	
	@GetMapping("/delete_do")
	public String UserDelete() {
	return "/member/delete_mypage";
	
	}
	
	@PostMapping("/passChk")
	public String passChk(UserVO vo){
		us.passChk(vo);
		return "main";
	}
}
