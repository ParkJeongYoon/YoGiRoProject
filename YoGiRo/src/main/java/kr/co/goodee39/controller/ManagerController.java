package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerController {
	
	@GetMapping("/manager/manager1/manager-chart")
	public String chart() {
		return "/manager/manager1/manager-chart";
	}
	
//	@GetMapping("/manager/manager2/manager-que")
//	public String question() {
//		return "/manager/manager2/manager-que";
//	}
	
	@GetMapping("/manager/manager3/manager-member")
	public String member() {
		return "/manager/manager3/manager-member";
	}
	
	@GetMapping("/manager/manager4/manager-block-member")
	public String block() {
		return "/manager/manager4/manager-block-member";
	}
	
	@GetMapping("/manager/manager5/manager-community")
	public String community() {
		return "/manager/manager5/manager-community";
	}
	
	@GetMapping("/manager/manager6/manager-delete-community")
	public String delete() {
		return "/manager/manager6/manager-delete-community";
	}
}
