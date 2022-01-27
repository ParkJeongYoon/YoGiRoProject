package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainContoller {
	@GetMapping("/member/mypage")
	public String mypage() {
		return "/member/mypage";
	}

	@GetMapping("/qna/qna-main")
	public String qnA() {
		return "/qna/qna-main";
	}
	
	@GetMapping("/login/login-main")
	public String login() {
		return "/login/login-main";
	}
	
	@GetMapping("/signup/signup-main")
	public String signup() {
		return "/signup/signup-main";
	}
	
	  
	
	@GetMapping("/incategories/food/food-main")
	public String food() { 
		return "/incategories/food/food-main";
	}
	
	@GetMapping("/incategories/festa/festa-main")
	public String festa() {
		return "/incategories/festa/festa-main";
	}
	
	@GetMapping("/incategories/course/course-main")
	public String course() {
		return "/incategories/course/course-main";
	}
	
//	@GetMapping("/incategories/community/community-main")
//	public String community() {
//		return "/incategories/community/community-main";
//	}
	
	
	
	
	@GetMapping("/inmap/inmap/{lat}/{latDecimal}/{lng}/{lngDecimal}/{zoom}/{city1}")
	public String inMap(@PathVariable String lat,
						@PathVariable String latDecimal,
						@PathVariable String lng,
						@PathVariable String lngDecimal,
						@PathVariable String zoom,
						@PathVariable String city1) {
		return "/inmap/inmap";
	}	
	@GetMapping("/inmap/inmap/{lat}/{latDecimal}/{lng}/{lngDecimal}/{zoom}/{city1}/{city2}/{city3}/{city4}/{city5}")
	public String inMap(@PathVariable String lat,
						@PathVariable String latDecimal,
						@PathVariable String lng,
						@PathVariable String lngDecimal,
						@PathVariable String zoom,
						@PathVariable String city1,
						@PathVariable String city2,
						@PathVariable String city3,
						@PathVariable String city4,
						@PathVariable String city5) {
		return "/inmap/inmap";
	}

}
