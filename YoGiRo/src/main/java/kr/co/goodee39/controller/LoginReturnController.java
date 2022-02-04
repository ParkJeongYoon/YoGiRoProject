package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class LoginReturnController {

	@GetMapping("/maib")
	public String getLoginList() {
		return "main";
	}
}
