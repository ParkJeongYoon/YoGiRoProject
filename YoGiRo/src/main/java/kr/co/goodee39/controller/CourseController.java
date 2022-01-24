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
import org.springframework.web.bind.annotation.PostMapping;


import kr.co.goodee39.service.CourseService;

import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.CourseIntroVO;

@Controller
public class CourseController {
	@Autowired
	CourseService ts;
	
	

	
	@GetMapping("/move-to-course-main")
	public String getCourseCommon(Model model) {
		System.out.println("들어오니");
		ts.getCourseCommonToJSP(model);
		ts.getCourseDetailToJSP(model);
		ts.getMyCourseCommonToJSP(model);
		ts.getMyCourseDetailToJSP(model);
		return "incategories/course/course-main";
	}
	
	
}

















