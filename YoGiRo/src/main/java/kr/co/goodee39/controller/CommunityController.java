package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.CommunityService;
import kr.co.goodee39.vo.CommunityVO;

@Controller
@RequestMapping("/incategories/community")
public class CommunityController {

	@Autowired
	CommunityService communityService;
	
	@GetMapping("/community-main")
	public String community(Model model, @RequestParam(defaultValue = "1") int num,
	 		@RequestParam(defaultValue = "") String title,
	 		@RequestParam(defaultValue = "") String content) {
		communityService.selectComList(model, num, title, content);
		return "/incategories/community/community-main";
	}
	
	@GetMapping("/community-create")
	public String getComCreate(CommunityVO vo) {
		return "/incategories/community/community-create";
	}
	
	@GetMapping("/community-detail")
	public String getBBSDetail(@ModelAttribute("ComVO") CommunityVO vo, Model model) {
		// System.out.println("vo"+vo.toString());
		communityService.updateViewCount(model, vo);
		communityService.selectCom(model, vo);
		return "/incategories/community/community-detail";
	}
}
