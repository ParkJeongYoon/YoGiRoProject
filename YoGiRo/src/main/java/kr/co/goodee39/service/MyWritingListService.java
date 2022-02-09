package kr.co.goodee39.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.ComCommentVO;
import kr.co.goodee39.vo.CommunityVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyFoodVO;
import kr.co.goodee39.vo.QuestionVO;

@Service
public class MyWritingListService {
	
	@Autowired
	SqlSessionTemplate ss;
	
	//내가 쓴 글 내역
	public void selectComList(CommunityVO vo, Model model, int num, String title, String content, String userid) {
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
		vo1.setComuserid(userid);
		model.addAttribute("count", ss.selectOne("mylist.selectMyComCount", vo1));
		model.addAttribute("list", ss.selectList("mylist.selectComListWithID", vo1));
		model.addAttribute("num", num);
	}
	
	public void selectCom(Model model, CommunityVO vo) {
		CommunityVO vo2 = ss.selectOne("community.selectMyCom", vo);

		// comid, comcategorynum, comtitle, comcontent, comuserid, comcreatedate, comisdelete
		vo.setComid(vo2.getComid());
		vo.setComcategorynum(vo2.getComcategorynum());
		vo.setComtitle(vo2.getComtitle());
		vo.setComcontent(vo2.getComcontent());
		vo.setComuserid(vo2.getComuserid());
		vo.setComcreatedate(vo2.getComcreatedate());
		
		model.addAttribute("comVO", ss.selectOne("community.selectMyCom", vo));
	}
	
	public void updateViewCount(Model model, CommunityVO vo) {

		model.addAttribute("comVO", ss.selectOne("community.viewCount", vo));
		
	}
	
	// 나의 문의내역
	public void selectQnaList(QuestionVO vo,Model model, int qnum, String qtitle, String qcontent, String userid) {
		vo.setStart((qnum - 1) * vo.getCount());
		if (!qtitle.equals("")) {
			model.addAttribute("qtitle", qtitle);
			vo.setQtitle("%" + qtitle + "%");
		}
		if (!qcontent.equals("")) {
			model.addAttribute("qcontent", qcontent);
			vo.setQcontent("%" + qcontent + "%");
		}
		vo.setUserid(userid);
		model.addAttribute("qlist", ss.selectList("mylist.selectQuestionsListwithID", vo));
		model.addAttribute("count", ss.selectOne("mylist.selectMyQuestionsCount", vo));
		model.addAttribute("qnum", qnum);
	}
	// 나의 코스
	public void selectMyCourseList(MyCourseCommonVO vo, Model model, int num, String mycoursecommontitle, String mycourseinfo,String region,String userid) {
		MyCourseCommonVO vo1 = new MyCourseCommonVO();
		vo1.setStart((num-1)*vo1.getCount());
		if(!mycoursecommontitle.equals("")) {
			model.addAttribute("mycoursecommontitle", mycoursecommontitle);
			vo1.setMycoursecommontitle("%"+mycoursecommontitle+"%");
		}
		if(!mycourseinfo.equals("")) {
			model.addAttribute("mycourseinfo", mycourseinfo);
			vo1.setMycourseinfo("%"+mycourseinfo+"%");
		}
		vo1.setMycourseregion(region);
		vo1.setUserid(userid);
	
		model.addAttribute("list", ss.selectList("mylist.selectMyCourseList", vo1));
		model.addAttribute("count", ss.selectOne("mylist.selectMyCourseCount", vo1));
		model.addAttribute("num", num);
		model.addAttribute("region",region);
	}
	
	//나의 음식점
	public void selectMyFoodList(MyFoodVO vo, Model model, int num, String myfoodname, String myfooddetail,String region,String userid) {
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
		vo.setUserid(userid);
		model.addAttribute("list", ss.selectList("mylist.selectMyFoodList", vo));
		model.addAttribute("count", ss.selectOne("mylist.selectMyFoodCount", vo));
		model.addAttribute("num", num);
		model.addAttribute("region",region);
	}
}
		
