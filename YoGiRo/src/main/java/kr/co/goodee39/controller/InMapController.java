package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodee39.service.CourseService;
import kr.co.goodee39.service.FoodService;
import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.FoodVO;
import kr.co.goodee39.vo.MyCourseCommonVO;

@Controller
@RequestMapping("/inmap")
public class InMapController {
	
	@Autowired
	CourseService ts;
	
	@Autowired
	FoodService fs;
	
	@GetMapping("/inmap/{lat}/{latDecimal}/{lng}/{lngDecimal}/{zoom}/{city1}")
	public String inMap(Model model,
						@PathVariable String lat,
						@PathVariable String latDecimal,
						@PathVariable String lng,
						@PathVariable String lngDecimal,
						@PathVariable String zoom,
						@PathVariable String city1) {
		CourseCommonVO cvo = new CourseCommonVO();
		FoodVO fvo = new FoodVO();
		
		String test1 = lat+latDecimal;
		if (test1.equals("3517766797")) {
			cvo.setRegion("전라"); // 광주
			fvo.setRegion("전라"); // 광주
		}else if (test1.equals("351863422") || test1.equals("358123428") || test1.equals("355620296")) {
			cvo.setRegion("경상"); // 부산 대구 울산
			fvo.setRegion("경상"); // 부산 대구 울산
		}else if (test1.equals("375637733") || test1.equals("375145292")) {
			cvo.setRegion("서울"); // 서울 인천
			fvo.setRegion("서울"); // 서울 인천
		}else if (test1.equals("363430795")) {
			cvo.setRegion("충청"); // 대전
			fvo.setRegion("충청"); // 대전
		}else if (test1.equals("333779071")) {
			cvo.setRegion("전라"); // 제주
			fvo.setRegion("전라"); // 제주
		}
		// System.out.println(cvo.getRegion()+" : cvo");
		// System.out.println(fvo.getRegion()+" : fvo");
		
		ts.getCourseCommonToJSP(model, cvo);
		fs.getFoodToJSP(model, fvo);
		
		return "/inmap/inmap";
	}	
	@GetMapping("/inmap/{lat}/{latDecimal}/{lng}/{lngDecimal}/{zoom}/{city1}/{city2}/{city3}/{city4}")
	public String inMap(Model model,
						@PathVariable String lat,
						@PathVariable String latDecimal,
						@PathVariable String lng,
						@PathVariable String lngDecimal,
						@PathVariable String zoom,
						@PathVariable String city1,
						@PathVariable String city2,
						@PathVariable String city3,
						@PathVariable String city4) {
		CourseCommonVO cvo = new CourseCommonVO();
		FoodVO fvo = new FoodVO();
		
		String test1 = lat+latDecimal;
		if (test1.equals("365360355") || test1.equals("357262779") || test1.equals("346909732") || test1.equals("333779071")) {
			cvo.setRegion("전라"); // 공주 무주 순천목포
			fvo.setRegion("전라"); //
		}else if (test1.equals("378651842")) {
			cvo.setRegion("강원"); // 강릉
			fvo.setRegion("강원"); // 
		}else if (test1.equals("365543823") || test1.equals("3530802626")) {
			cvo.setRegion("경상"); // 포항 창원
			fvo.setRegion("경상"); //
		}else if (test1.equals("375969884") || test1.equals("375145292")) {
			cvo.setRegion("서울"); // 남양주
			fvo.setRegion("서울"); //
		}else if (test1.equals("366360848")) {
			cvo.setRegion("충청"); // 충주
			fvo.setRegion("충청"); // 
		}
		System.out.println(cvo.getRegion()+" : cvo");
		System.out.println(fvo.getRegion()+" : fvo");
		
		ts.getCourseCommonToJSP(model, cvo);
		fs.getFoodToJSP(model, fvo);
		
		return "/inmap/inmap";
	}
}
