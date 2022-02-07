package kr.co.goodee39.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodee39.service.CourseService;
import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.CourseIntroVO;
import kr.co.goodee39.vo.AttachImageVO;
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
		System.out.println("롸"+vo.getMycoursemainimage());
		return "incategories/course/mycourse-detail";
	}
	
	@GetMapping("/add_my_course")
	public String getAddMyCoursePage(Model model) {
		MyCourseCommonVO vo = new MyCourseCommonVO();
		model.addAttribute("MyCourseCommonVO",vo);
		return "incategories/course/add_my_course";
	}
	
	
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}
		
		
		String uploadFolder = "E:\\upload";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();			
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			vo.setUuid(uuid);
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		System.out.println("들어오냐");
		return result;
	}
	/*
	 * @PostMapping("/uploadfile") public @ResponseBody ResponseEntity<List<FileVO>>
	 * uploadFile(MultipartFile[] uploadFile) throws Exception{ ArrayList<FileVO>
	 * list = new ArrayList<FileVO>();
	 * 
	 * for (MultipartFile file : uploadFile) {
	 * if(!file.getOriginalFilename().isEmpty()) { String name =
	 * UUID.randomUUID().toString(); file.transferTo(new File("E:/temp", name));
	 * System.out.println(file.getOriginalFilename()+"저장 완료."); list.add(new
	 * FileVO(name, file.getOriginalFilename())); }else {
	 * System.out.println("데이터가 존재하지 않습니다."); } }
	 * System.out.println("모든 데이터가 저장되었습니다.");
	 * 
	 * ResponseEntity<List<FileVO>> response = new
	 * ResponseEntity<List<FileVO>>(list,HttpStatus.OK);
	 * 
	 * return response; }
	 */
	
	@PostMapping("/create_my_course")
	public String getCreateMyCoursePage(Model model,HttpServletRequest request) {
		System.out.println("들어왔는지");
		System.out.println(request.getParameter("mycoursedetailname"));
		System.out.println(request.getParameter("mycoursedetailname1"));
		System.out.println(request.getParameter("mycoursedetailname2"));
		
		//
		ts.insertMyCourseCommon(request);// 이 함수 안에 detail도 넣음 
		return "redirect:/move-to-course-main";
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		File file = new File("E:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
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
	
	
	
	 //----------------- 더보기
	
	
	@GetMapping("/course_more")
	public String moveToCourseMorePage(Model model, @RequestParam(defaultValue = "1") int num,
													@RequestParam(defaultValue="") String title,
													@RequestParam(defaultValue="") String overview,
													@RequestParam(defaultValue="서울") String region) {
		
	 	ts.selectCourseList(model, num, title, overview,region);
	 	
		return "incategories/course/course_more";
	}
 
	@GetMapping("/mycourse_more")
	public String moveToMyCourseMorePage(Model model, @RequestParam(defaultValue = "1") int num,
													@RequestParam(defaultValue="") String mycoursecommontitle,
													@RequestParam(defaultValue="") String mycourseinfo,
													@RequestParam(defaultValue="서울") String region) {
		
	 	ts.selectMyCourseList(model, num, mycoursecommontitle, mycourseinfo, region);
		return "incategories/course/mycourse_more";
	}
}

















