package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.goodee39.service.FoodService;
import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.FoodImageVO;
import kr.co.goodee39.vo.FoodVO;
import kr.co.goodee39.vo.MyCourseCommonVO;

@Controller
public class FoodController {

	 @Autowired
	 FoodService fs;
	 
	 @GetMapping("/move-to-food-main")
		public String getFood(@ModelAttribute("FoodVO") FoodVO vo, Model model) {
			//MyCourseCommonVO mvo = new MyCourseCommonVO();
			System.out.println(vo.getRegion());
			fs.getFoodToJSP(model, vo);
			//fs.getCourseCommonToJSP(model,vo);
			//fs.getCourseDetailToJSP(model,vo);
			//mvo.setMycourseregion(vo.getRegion());
			//ts.getMyCourseCommonToJSP(model,mvo);
			//ts.getMyCourseDetailToJSP(model,mvo);
			return "incategories/food/food-main";
		}
	 
	 @GetMapping("/move-to-food-main-ajax")
		public String getFoodAjax(@ModelAttribute("FoodVO") FoodVO vo, Model model) {
			System.out.println("새로추가한곳"+vo.getRegion());
			fs.getFoodToJSP(model, vo);
			/*MyCourseCommonVO mvo = new MyCourseCommonVO();
			ts.getCourseCommonToJSP(model,vo);
			ts.getCourseDetailToJSP(model,vo);
			mvo.setMycourseregion(vo.getRegion());
			ts.getMyCourseCommonToJSP(model,mvo);
			ts.getMyCourseDetailToJSP(model,mvo);*/
			return "incategories/food/food-main-ajax";
		}
	 
	 @GetMapping("/food_detail")
		public String getFoodDetailPage(@ModelAttribute("FoodVO") FoodVO vo ,Model model) {
			/*CourseDetailVO dv = new CourseDetailVO();
			dv.setContentid(vo.getContentid());
			
			ts.selectCourseCommonToDetailPage(model, vo);
			ts.selectCourseDetailToDetailPage(model, dv);
			*/
		 	FoodImageVO fiv = new FoodImageVO();
		 	fiv.setContentid(vo.getContentid());
		 	
		 	fs.selectFoodToDetailPage(model, vo);
		 	fs.selectFoodImgToDetailPage(model, fiv);
		 	
		 	
			return "incategories/food/food-detail";
		}
	 
	 @GetMapping("/add_my_food")
		public String getAddMyCoursePage(Model model) {
			//MyCourseCommonVO vo = new MyCourseCommonVO();
			//model.addAttribute("MyCourseCommonVO",vo);
			return "incategories/food/add_my_food";
		}
	 
	 
	 
	 
	 //------------- comment
	 
	 
}