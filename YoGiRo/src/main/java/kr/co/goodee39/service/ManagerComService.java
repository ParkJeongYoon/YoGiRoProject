package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.CommunityVO;

@Service
public class ManagerComService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public void selectComList(Model model, int comid, String title, String content) {
		CommunityVO vo = new CommunityVO();
		vo.setStart((comid-1)*vo.getCount());
		if(!title.equals("")) {
			model.addAttribute("title", title);
			vo.setComtitle("%"+title+"%");
		}
		if(!content.equals("")) {
			model.addAttribute("content", content);
			vo.setComcontent("%"+content+"%");
		}
		
		model.addAttribute("count", sqlSessionTemplate.selectOne("community.selectComCount", vo));
		model.addAttribute("qlist", sqlSessionTemplate.selectList("community.selectComList", vo));
		model.addAttribute("comid", comid);
	}
}
