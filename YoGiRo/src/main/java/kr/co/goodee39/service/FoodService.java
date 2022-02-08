package kr.co.goodee39.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.FoodImageVO;
import kr.co.goodee39.vo.FoodVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyCourseDetailVO;
import kr.co.goodee39.vo.MyFoodVO;
import kr.co.goodee39.vo.UserVO;

@Service
public class FoodService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	static ArrayList<String> contentID = new ArrayList<String>();
	
	public void getFoodToJSP(Model model, FoodVO vo) {
		if(vo.getRegion()==null) {
			vo.setRegion("서울");
		}
		System.out.println("서비스 : "+vo.getRegion());
		model.addAttribute("foodList",sqlSessionTemplate.selectList("food.getfood",vo));
	}

	public void selectFoodToDetailPage(Model model, FoodVO vo) {
		
		model.addAttribute("foodtodetailpage",sqlSessionTemplate.selectOne("food.getfoodwithid",vo));
	}
	public void selectFoodImgToDetailPage(Model model, FoodImageVO vo) {
		
		model.addAttribute("foodimgtodetailpage",sqlSessionTemplate.selectList("food.getfoodimgwithid",vo));
	}
	
	public void getMyFoodToJSP(Model model,MyFoodVO vo) {
		if(vo.getRegion()==null) {
			vo.setRegion("서울");
		}
		model.addAttribute("myFoodList",sqlSessionTemplate.selectList("food.getmyfood",vo));
	}
	public void selectMyFoodToDetailPage(Model model, MyFoodVO vo) {
		
		model.addAttribute("myfoodtodetailpage",sqlSessionTemplate.selectOne("food.getmyfoodwithid",vo));
	}
	/*public void getMyCourseDetailToJSP(Model model,MyCourseCommonVO vo) {
		if(vo.getMycourseregion()==null) {
			vo.setMycourseregion("서울");
		}
		MyCourseDetailVO vo1 = new MyCourseDetailVO();
		vo1.setMycourseregion(vo.getMycourseregion());
		model.addAttribute("myDetailList",sqlSessionTemplate.selectList("course.getmycoursedetail",vo1));
	}*/
	public void insertMyFood(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo= (UserVO)session.getAttribute("account");
		MyFoodVO mfvo = new MyFoodVO();
		
		mfvo.setMyfoodname(request.getParameter("myfoodname"));
		mfvo.setMyfoodaddress(request.getParameter("myfoodaddress"));
		mfvo.setMyfoodimg(request.getParameter("myfoodimg"));
		mfvo.setMyfooddetail(request.getParameter("myfooddetail"));
		mfvo.setUserid(vo.getUserid());
		mfvo.setRegion(request.getParameter("region"));
		System.out.println("두번가는거 확인");
		sqlSessionTemplate.insert("food.insertmyfood",mfvo);
	}
	
	//-----------------------------더보기
	
	public void selectFoodList(Model model, int num, String title, String treatmenu,String region) {
		FoodVO vo = new FoodVO();
		vo.setStart((num-1)*vo.getCount());
		if(!title.equals("")) {
			model.addAttribute("title", title);
			vo.setTitle("%"+title+"%");
		}
		if(!treatmenu.equals("")) {
			model.addAttribute("treatmenu", treatmenu);
			vo.setTreatmenu("%"+treatmenu+"%");
		}
		vo.setRegion(region);
		model.addAttribute("list", sqlSessionTemplate.selectList("food.selectFoodList", vo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("food.selectFoodCount", vo));
		model.addAttribute("num", num);
		model.addAttribute("region",region);
	}
	
	public void selectMyFoodList(Model model, int num, String myfoodname, String myfooddetail,String region) {
		MyFoodVO vo = new MyFoodVO();
		vo.setStart((num-1)*vo.getCount());
		if(!myfoodname.equals("")) {
			model.addAttribute("myfoodname", myfoodname);
			vo.setMyfoodname("%"+myfoodname+"%");
		}
		if(!myfooddetail.equals("")) {
			model.addAttribute("myfooddetail", myfooddetail);
			vo.setMyfooddetail("%"+myfooddetail+"%");
		}
		vo.setRegion(region);
		model.addAttribute("list", sqlSessionTemplate.selectList("food.selectMyFoodList", vo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("food.selectMyFoodCount", vo));
		model.addAttribute("num", num);
		model.addAttribute("region",region);
	}
}
