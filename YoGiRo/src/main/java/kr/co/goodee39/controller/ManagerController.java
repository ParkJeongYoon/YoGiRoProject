package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerController {
	
	
	
	
	

	
	
	
	@GetMapping("/manager/manager6/manager-delete-community")
	public String delete() {
		return "/manager/manager6/manager-delete-community";
	}
}
