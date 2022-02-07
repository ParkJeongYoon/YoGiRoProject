package kr.co.goodee39.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.FoodService;
import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.FoodImageVO;
import kr.co.goodee39.vo.FoodVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyCourseDetailVO;
import kr.co.goodee39.vo.MyFoodVO;

@Controller
public class FoodController {

	 @Autowired
	 FoodService fs;
	 
	 @GetMapping("/move-to-food-main")
		public String getFood(@ModelAttribute("FoodVO") FoodVO vo, Model model) {
			MyFoodVO mfv = new MyFoodVO();
			System.out.println(vo.getRegion());
			fs.getFoodToJSP(model, vo);
			mfv.setRegion(vo.getRegion());
			fs.getMyFoodToJSP(model, mfv);
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
			MyFoodVO mfv = new MyFoodVO();
			mfv.setRegion(vo.getRegion());
			fs.getMyFoodToJSP(model, mfv);
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
		 	MyFoodVO mfv = new MyFoodVO();
		 	model.addAttribute("MyFoodVO",mfv);
			return "incategories/food/add_my_food";
		}
	 @PostMapping("/create_my_food")
		public String getCreateMyCoursePage(Model model,HttpServletRequest request) {
			//구현해야함 ------------------------
		 
		 
		 
		 
		 
			//ts.insertMyCourseCommon(request);// 이 함수 안에 detail도 넣음 
			return "redirect:/move-to-course-main";
		}
	 @GetMapping("/myfood_detail")
		public String getMyFoodDetailPage(@ModelAttribute("MyFoodVO") MyFoodVO vo ,Model model) {
			/*MyCourseDetailVO mdv = new MyCourseDetailVO();
			mdv.setMycoursecommonid(vo.getMycoursecommonid());
			
			ts.selectMyCourseCommonToDetailPage(model, vo);
			ts.selectMyCourseDetailToDetailPage(model, mdv);
			*/
		 	
		 	fs.selectMyFoodToDetailPage(model, vo);
			return "incategories/food/myfood-detail";
		}
	 
	 
	 
	 
	 //----------------- 더보기
	 
	 
	 @GetMapping("/food_more")
		public String moveToFoodMorePage(Model model, @RequestParam(defaultValue = "1") int num,
														@RequestParam(defaultValue="") String title,
														@RequestParam(defaultValue="") String treatmenu,
														@RequestParam(defaultValue="서울") String region) {
			
		 	fs.selectFoodList(model, num, title, treatmenu,region);
		 	
			return "incategories/food/food_more";
		}
	 
	 @GetMapping("/myfood_more")
		public String moveToMyFoodMorePage(Model model, @RequestParam(defaultValue = "1") int num,
														@RequestParam(defaultValue="") String myfoodname,
														@RequestParam(defaultValue="") String myfooddetail,
														@RequestParam(defaultValue="서울") String region) {
			
		 	fs.selectMyFoodList(model, num, myfoodname, myfooddetail, region);
			return "incategories/food/myfood_more";
		}
	 
}
