package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainContoller {

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
	
	@GetMapping("/incategories/community/community-main")
	public String community() {
		return "/incategories/community/community-main";
	}
	
	
	
	
	
	@GetMapping("/inmap/Seoul-si")
	public String seoulSi() {
		return "/inmap/Seoul-si";
	}
	
	@GetMapping("/inmap/Busan-si")
	public String busanSi() {
		return "/inmap/Busan-si";
	}
	
	@GetMapping("/inmap/Daegu-si")
	public String daeguSi() {
		return "/inmap/Daegu-si";
	}
	
	@GetMapping("/inmap/Incheon-si")
	public String incheonSi() {
		return "/inmap/Incheon-si";
	}
	
	@GetMapping("/inmap/Gwangju-si")
	public String gwangjuSi() {
		return "/inmap/Gwangju-si";
	}
	
	@GetMapping("/inmap/Daejeon-si")
	public String daejeonSi() {
		return "/inmap/Daejeon-si";
	}
	
	@GetMapping("/inmap/Ulsan-si")
	public String ulsanSi() {
		return "/inmap/Ulsan-si";
	}
	
	@GetMapping("/inmap/Sejong-si")
	public String sejongSi() {
		return "/inmap/Sejong-si";
	}
	
	@GetMapping("/inmap/Gyeonggi-do")
	public String gyeonggiDo() {
		return "/inmap/Gyeonggi-do";
	}
	
	@GetMapping("/inmap/Gangwon-do")
	public String gangwonDo() {
		return "/inmap/Gangwon-do";
	}
	
	@GetMapping("/inmap/Chungcheongbuk-do")
	public String chungcheongbukDo() {
		return "/inmap/Chungcheongbuk-do";
	}
	
	@GetMapping("/inmap/Chungcheongnam-do")
	public String chungcheongnamDo() {
		return "/inmap/Chungcheongnam-do";
	}
	
	@GetMapping("/inmap/Jeollabuk-do")
	public String jeollabukDo() {
		return "/inmap/Jeollabuk-do";
	}
	
	@GetMapping("/inmap/Jeollanam-do")
	public String jeollanamDo() {
		return "/inmap/Jeollanam-do";
	}
	
	@GetMapping("/inmap/Gyeongsangbuk-do")
	public String gyeongsangbukDo() {
		return "/inmap/Gyeongsangbuk-do";
	}
	
	@GetMapping("/inmap/Gyeongsangnam-do")
	public String gyeongsangnamDo() {
		return "/inmap/Gyeongsangnam-do";
	}
	
	@GetMapping("/inmap/Jeju-do")
	public String gejuDo() {
		return "/inmap/Jeju-do";
	}

}
