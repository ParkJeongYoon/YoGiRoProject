package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.ManagerComService;

@Controller
public class ManagerComController {
	
	@Autowired
	private ManagerComService comService;
	
	@GetMapping("/manager/manager5/manager-community")
	public String getCommList(Model model, @RequestParam(defaultValue = "1") int comid,
			 		@RequestParam(defaultValue = "") String comtitle,
			 		@RequestParam(defaultValue = "") String comcontent) {
		comService.selectComList(model, comid, comtitle, comcontent);
		return "/manager/manager5//manager-community";
	}
}
