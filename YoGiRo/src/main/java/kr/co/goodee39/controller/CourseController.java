package kr.co.goodee39.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import kr.co.goodee39.service.CourseService;
import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.CourseIntroVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyCourseDetailVO;

@Controller
public class CourseController {
	@Autowired
	CourseService ts;
	
	

	
	@GetMapping("/move-to-course-main")
	public String getCourseCommon(@ModelAttribute("CourseCommonVO") CourseCommonVO vo, Model model) {
		System.out.println(vo.getRegion());
		ts.getCourseCommonToJSP(model,vo);
		ts.getCourseDetailToJSP(model,vo);
		ts.getMyCourseCommonToJSP(model);
		ts.getMyCourseDetailToJSP(model);
		return "incategories/course/course-main";
	}
	@GetMapping("/move-to-course-main-ajax")
	public String getCourseCommonAjax(@ModelAttribute("CourseCommonVO") CourseCommonVO vo, Model model) {
		System.out.println("새로추가한곳"+vo.getRegion());
		ts.getCourseCommonToJSP(model,vo);
		ts.getCourseDetailToJSP(model,vo);
		ts.getMyCourseCommonToJSP(model);
		ts.getMyCourseDetailToJSP(model);
		return "incategories/course/course-main-ajax";
	}
	
	@GetMapping("/course_detail")
	public String getCourseDetailPage(@ModelAttribute("CourseCommonVO") CourseCommonVO vo ,Model model) {
		CourseDetailVO dv = new CourseDetailVO();
		dv.setContentid(vo.getContentid());
		
		ts.selectCourseCommonToDetailPage(model, vo);
		ts.selectCourseDetailToDetailPage(model, dv);
		
		return "incategories/course/course-detail";
	}
	
	@GetMapping("/mycourse_detail")
	public String getMyCourseDetailPage(@ModelAttribute("MyCourseCommonVO") MyCourseCommonVO vo ,Model model) {
		MyCourseDetailVO mdv = new MyCourseDetailVO();
		mdv.setMycoursecommonid(vo.getMycoursecommonid());
		
		ts.selectMyCourseCommonToDetailPage(model, vo);
		ts.selectMyCourseDetailToDetailPage(model, mdv);
		
		return "incategories/course/mycourse-detail";
	}
}

















