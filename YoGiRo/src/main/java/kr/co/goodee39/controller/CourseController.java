package kr.co.goodee39.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodee39.service.CourseService;
import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.CourseIntroVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyCourseDetailVO;
import kr.co.goodee39.vo.ThemeCommentVO;

@Controller
public class CourseController {
	@Autowired
	CourseService ts;
	
	

	
	@GetMapping("/move-to-course-main")
	public String getCourseCommon(@ModelAttribute("CourseCommonVO") CourseCommonVO vo, Model model) {
		MyCourseCommonVO mvo = new MyCourseCommonVO();
		System.out.println(vo.getRegion());
		ts.getCourseCommonToJSP(model,vo);
		ts.getCourseDetailToJSP(model,vo);
		mvo.setMycourseregion(vo.getRegion());
		ts.getMyCourseCommonToJSP(model,mvo);
		ts.getMyCourseDetailToJSP(model,mvo);
		return "incategories/course/course-main";
	}
	@GetMapping("/move-to-course-main-ajax")
	public String getCourseCommonAjax(@ModelAttribute("CourseCommonVO") CourseCommonVO vo, Model model) {
		System.out.println("새로추가한곳"+vo.getRegion());
		MyCourseCommonVO mvo = new MyCourseCommonVO();
		ts.getCourseCommonToJSP(model,vo);
		ts.getCourseDetailToJSP(model,vo);
		mvo.setMycourseregion(vo.getRegion());
		ts.getMyCourseCommonToJSP(model,mvo);
		ts.getMyCourseDetailToJSP(model,mvo);
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
	
	@GetMapping("/add_my_course")
	public String getAddMyCoursePage(Model model) {
		MyCourseCommonVO vo = new MyCourseCommonVO();
		model.addAttribute("MyCourseCommonVO",vo);
		return "incategories/course/add_my_course";
	}
	
	@PostMapping("/create_my_course")
	public String getCreateMyCoursePage(Model model,HttpServletRequest request) {
		System.out.println("들어왔는지");
		System.out.println(request.getParameter("mycoursedetailname"));
		System.out.println(request.getParameter("mycoursedetailname1"));
		System.out.println(request.getParameter("mycoursedetailname2"));
		
		ts.insertMyCourseCommon(request);// 이 함수 안에 detail도 넣음 
		return "incategories/course/course-main";
	}
	@ResponseBody
	@GetMapping("/addComment")
	public String ajax_addComment(@ModelAttribute("ThemeCommentVO") ThemeCommentVO vo ,HttpServletRequest request) {
		HttpSession session = request.getSession();
		//세션에서 가져온 uservo 넣는 로직 추가 요
		System.out.println("comment 컨트롤러 들어오는지");
		System.out.println("comment 테마코드 테스트"+ vo.getThemecode());
		System.out.println("comment 테마코드 테스트"+ vo.getThemecommentcontent());
		// 현재 날짜/시간
		LocalDateTime now = LocalDateTime.now();
		// 현재 날짜/시간 출력
		System.out.println(now); // 2021-06-17T06:43:21.419878100
		// 포맷팅
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초"));
		// 포맷팅 현재 날짜/시간 출력
		
		
		try {
			//uservo에서 가져온 userid넣는 로직 추가 요
			vo.setUserid("pjy4722");
			vo.setThemecommentdate(formatedNow);
			
			ts.insertThemeComment(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return "success";
	}
	
	@RequestMapping(value="commentList", produces="application/json; charset=utf8")
    @ResponseBody
    public ResponseEntity ajax_commentList(@ModelAttribute("ThemeCommentVO") ThemeCommentVO vo, HttpServletRequest request) throws Exception{
        
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
        List<ThemeCommentVO> themeCommentVO = ts.selectBoardCommentByCode(vo);
        
        if(themeCommentVO.size() > 0){
            for(int i=0; i<themeCommentVO.size(); i++){
                HashMap hm = new HashMap();
                hm.put("c_themecode", themeCommentVO.get(i).getThemecode());
                hm.put("themepostid", themeCommentVO.get(i).getThemepostid());
                hm.put("comment", themeCommentVO.get(i).getThemecommentcontent());
                hm.put("writer", themeCommentVO.get(i).getUserid());
                hmlist.add(hm);
            }
            
        }
        
        JSONArray json = new JSONArray(hmlist);        
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
        
    }
}

















