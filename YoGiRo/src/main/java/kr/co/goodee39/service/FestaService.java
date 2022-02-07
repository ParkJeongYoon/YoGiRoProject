package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.FestaVO;
import kr.co.goodee39.vo.FoodVO;

@Service
public class FestaService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void selectFestaList(Model model, int num, String title, String overview,String region) {
		FestaVO vo = new FestaVO();
		vo.setStart((num-1)*vo.getCount());
		if(!title.equals("")) {
			model.addAttribute("title", title);
			vo.setTitle("%"+title+"%");
		}
		if(!overview.equals("")) {
			model.addAttribute("overview", overview);
			vo.setOverview("%"+overview+"%");
		}
		System.out.println(region);
		vo.setRegion(region);
		model.addAttribute("list", sqlSessionTemplate.selectList("festa.selectFestaList", vo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("festa.selectFestaCount", vo));
		model.addAttribute("num", num);
		model.addAttribute("region",region);
	}
	
	public void selectFestaToDetailPage(Model model, FestaVO vo) {
		
		model.addAttribute("festatodetailpage",sqlSessionTemplate.selectOne("festa.getfestawithid",vo));
	}
}
