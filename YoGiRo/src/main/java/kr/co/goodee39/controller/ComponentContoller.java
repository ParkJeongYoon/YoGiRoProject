package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ComponentContoller {

	@GetMapping("/header")
	public String header() {
		return "/header";
	}

	@GetMapping("/footer")
	public String footer() {
		return "/footer";
	}

}
