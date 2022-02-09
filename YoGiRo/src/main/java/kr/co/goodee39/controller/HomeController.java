package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String main(HttpSession session) {
//		int failCnt = -1;
//		session.setAttribute("fail-cnt" , failCnt);
		return "main";
	}

}
