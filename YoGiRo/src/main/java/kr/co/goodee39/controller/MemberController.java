package kr.co.goodee39.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.MemberService;
import kr.co.goodee39.vo.UserVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService userService;
	
	@GetMapping("/manager/manager3/manager-member")
	public String getUserList(Model model, @RequestParam(defaultValue = "1") int usernum,
										   @RequestParam(defaultValue="") String userid,
										   @RequestParam(defaultValue="") String useremail) {
		userService.getUserList(model, usernum, userid, useremail);
		return "/manager/manager3/manager-member";
	}
	
	@GetMapping("/manager/manager4/manager-block-member")
	public String getBlockUserList(Model model, @RequestParam(defaultValue = "1") int usernum,
										   @RequestParam(defaultValue="") String userid,
										   @RequestParam(defaultValue="") String useremail) {
		userService.getUserBlock(model, usernum, userid, useremail);
		return "/manager/manager4/manager-block-member";
	}
	
	
}