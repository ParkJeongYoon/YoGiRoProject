package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.FestaService;
import kr.co.goodee39.vo.FestaVO;
import kr.co.goodee39.vo.FoodImageVO;
import kr.co.goodee39.vo.FoodVO;
import kr.co.goodee39.vo.MyFoodVO;

@Controller
public class FestaController {
	
	@Autowired
	FestaService fs; 
	@GetMapping("/move-to-festa-main")
	public String getFesta(Model model, @RequestParam(defaultValue = "1") int num,
										@RequestParam(defaultValue="") String title,
										@RequestParam(defaultValue="") String overview,
										@RequestParam(defaultValue="서울") String region) {
		fs.selectFestaList(model, num, title, overview,region);
		System.out.println("여기는메인컨트롤러");
		return "incategories/festa/festa-main";
	}
	
	@GetMapping("/move-to-festa-main-ajax")
	public String getFestaAjax(Model model, @RequestParam(defaultValue = "1") int num,
										@RequestParam(defaultValue="") String title,
										@RequestParam(defaultValue="") String overview,
										String region) {
		fs.selectFestaList(model, num, title, overview,region);
		System.out.println("여기는ajax컨트롤러");
		return "incategories/festa/festa-main-ajax";
	}
	
	@GetMapping("/festa_detail")
	public String getFestaDetailPage(@ModelAttribute("FestaVO") FestaVO vo ,Model model) {
		/*CourseDetailVO dv = new CourseDetailVO();
		dv.setContentid(vo.getContentid());
		
		ts.selectCourseCommonToDetailPage(model, vo);
		ts.selectCourseDetailToDetailPage(model, dv);
		*/
	 	
	 	fs.selectFestaToDetailPage(model, vo);
	 	
	 	
		return "incategories/festa/festa-detail";
	}
}
