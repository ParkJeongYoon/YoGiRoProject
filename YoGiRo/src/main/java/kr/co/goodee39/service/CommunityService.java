package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.CommunityVO;

@Service
public class CommunityService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public void selectComList(Model model, int num, String title, String content) {
		CommunityVO vo = new CommunityVO();
		vo.setStart((num-1)*vo.getCount());
		if(!title.equals("")) {
			model.addAttribute("title", title);
			vo.setComtitle("%"+title+"%");
		}
		if(!content.equals("")) {
			model.addAttribute("content", content);
			vo.setComcontent("%"+content+"%");
		}
		
		model.addAttribute("count", sqlSessionTemplate.selectOne("community.selectComCount"));
		model.addAttribute("list", sqlSessionTemplate.selectList("community.selectComList", vo));
		model.addAttribute("num", num);
	}
	
	public void selectCom(Model model, CommunityVO vo) {
		CommunityVO vo2 = sqlSessionTemplate.selectOne("community.selectCom", vo);

		// comid, comcategorynum, comtitle, comcontent, comuserid, comcreatedate, comisdelete
		vo.setComid(vo2.getComid());
		vo.setComcategorynum(vo2.getComcategorynum());
		vo.setComtitle(vo2.getComtitle());
		vo.setComcontent(vo2.getComcontent());
		vo.setComuserid(vo2.getComuserid());
		vo.setComcreatedate(vo2.getComcreatedate());

	}
	
	public void updateViewCount(Model model, CommunityVO vo) {

		model.addAttribute("communityVO", sqlSessionTemplate.selectOne("community.viewCount", vo));
		
	}

}
