package kr.co.goodee39.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.CommunityService;
import kr.co.goodee39.vo.CommunityVO;

@Controller
@RequestMapping("/incategories/community")
public class CommunityController {

	@Autowired
	private CommunityService comService;
	
	@GetMapping("/community-main")
	public String getComList(@ModelAttribute("ComVO") CommunityVO vo, Model model, @RequestParam(defaultValue = "1") int num,
			 		@RequestParam(defaultValue = "") String title,
			 		@RequestParam(defaultValue = "") String content) {
		
		if(vo.getComcategorynum()==0) { 
			vo.setComcategorynum(1); 
		}
		
		comService.selectComList(vo, model, num, title, content);
		return "/incategories/community/community-main";
	}
	
	@GetMapping("/main-ajax")
	public String getComAjaxList(@ModelAttribute("ComVO") CommunityVO vo, Model model, 
					@RequestParam(defaultValue = "1") int num,
			 		@RequestParam(defaultValue = "") String title,
			 		@RequestParam(defaultValue = "") String content) {
		if(vo.getComcategorynum()==0) { 
			vo.setComcategorynum(1); 
		}
		vo.setComcategorynum(vo.getComcategorynum());

		comService.selectComList(vo, model, num, title, content);
		return "/incategories/community/community-ajax"; // com_ajax
	}

	@GetMapping("/create")
	public String getComCreate(@ModelAttribute("ComVO") CommunityVO vo) {
		return "/incategories/community/community-create";
	}
	
	@GetMapping("/detail")
	public String getComDetail(@ModelAttribute("ComVO") CommunityVO vo, Model model) {
		comService.updateViewCount(model, vo);
		comService.selectCom(model, vo);
		return "/incategories/community/community-detail";
	}
	
	@PostMapping("/create_result")
	public String setComCreate(@ModelAttribute("ComVO") CommunityVO vo, Model model) {
		// ComVO com = new ComVO();
		vo.setComcreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		comService.insertCom(model, vo);
		return "redirect:/incategories/community/community-main";
	}
	
	@GetMapping("/modify")
	public String modifyBBS(@ModelAttribute CommunityVO vo, Model model) {
		comService.selectCom(model, vo);
		return "com_modify";
	}
	
	@PostMapping("/modify_result")
	public String modifyBBSResult(CommunityVO vo) {
		comService.updateCom(vo);
		return "redirect:/incategories/community/community-main";
	}
	
	@GetMapping("/delete")
	public String delBBS(CommunityVO vo) {
		comService.deleteCom(vo);
		return "redirect:/incategories/community/community-main";
	}
}
