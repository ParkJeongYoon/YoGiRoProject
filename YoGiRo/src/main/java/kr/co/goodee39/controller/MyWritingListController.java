package kr.co.goodee39.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.CommunityService;
import kr.co.goodee39.service.MyWritingListService;
import kr.co.goodee39.vo.ComCommentVO;
import kr.co.goodee39.vo.CommunityVO;
import kr.co.goodee39.vo.UserVO;

@Controller
public class MyWritingListController {
	
	@Autowired
	private MyWritingListService mls;
	
	
	@GetMapping("/myfavorite")
	public String myfavorite() {
		return "/member/myfavorite";
	}
	
	@GetMapping("/myqna")
	public String myqna() {
		return "/member/myqna";
	}
	
	@GetMapping("/mycommunity")
	public String mycommunity(@ModelAttribute UserVO uservo, CommunityVO comvo, Model model,
							  @RequestParam(defaultValue = "1") int num,
							  @RequestParam(defaultValue = "") String title,
							  @RequestParam(defaultValue = "") String content,
							  HttpSession session) {
		
		//session에서 UserVO에 있는 Userid를 Comuserid에 sets
		//UserVO vo1 = (UserVO)session.getAttribute("account");
		
		//comvo.setComuserid(vo1.getUserid());
		UserVO vo =(UserVO)session.getAttribute("account");
		String userid = vo.getUserid();
		mls.selectComList(comvo, model, num, title, content,userid);
		
			
		return "/member/mycommunity";
	}	
	/*
	 * @GetMapping("/get/{comid}") public String<List<CommunityVO>>
	 * getCommunityList(CommunityVO vo, Model model,HttpSession session) 
	 * { UserVO userVO = (UserVO) session.getAttribute("account"); // 유저에 대한 넘버, 네임
	 * 
	 * List<CommunityVO> list = mls.mycommunityList(vo); model.addAttribute("list",
	 * list);
	 * 
	 * }
	 */
	
	@GetMapping("/mycourse")
	public String mycourse() {
		return "/member/mycourse";
	}
	
	@GetMapping("/myrestaurant")
	public String myrestaurant() {
		return "/member/myrestaurant";
	}
	
	
}
