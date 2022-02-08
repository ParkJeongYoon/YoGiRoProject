 package kr.co.goodee39.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.ComCommentVO;
import kr.co.goodee39.vo.CommunityVO;

@Service
public class CommunityService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public void selectComList(CommunityVO vo, Model model, int num, String title, String content) {
		CommunityVO vo1 = new CommunityVO();
		
		if(vo.getComcategorynum()==0) { 
			 vo1.setComcategorynum(1); 
		 }else {
			 vo1.setComcategorynum(vo.getComcategorynum());
		 }
		
		vo1.setStart((num-1)*vo1.getCount()); // (page - 1) *10
		if(!title.equals("")) {
			model.addAttribute("title", title);
			vo1.setComtitle("%"+title+"%");
		}
		if(!content.equals("")) {
			model.addAttribute("content", content);
			vo1.setComcontent("%"+content+"%");
		}
		
		model.addAttribute("count", sqlSessionTemplate.selectOne("community.selectComCount", vo1));
		model.addAttribute("list", sqlSessionTemplate.selectList("community.selectComList", vo1));
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
		
		model.addAttribute("comVO", sqlSessionTemplate.selectOne("community.selectCom", vo));
	}
	
	public void updateViewCount(Model model, CommunityVO vo) {

		model.addAttribute("comVO", sqlSessionTemplate.selectOne("community.viewCount", vo));
		
	}
	
	@Transactional
	public void insertCom(Model model,CommunityVO vo) {
		sqlSessionTemplate.insert("community.insertCom", vo);
		// model.addAttribute("comVO", )
		System.out.println(vo.getComid());

	}
	
	public void updateCom(CommunityVO vo) {
		sqlSessionTemplate.update("community.updateCom", vo);
	}
	
	public void deleteCom(CommunityVO vo) {
		sqlSessionTemplate.delete("community.deleteCom", vo);
	}

	

}
