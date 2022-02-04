package kr.co.goodee39.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.FoodImageVO;
import kr.co.goodee39.vo.FoodVO;

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
}
