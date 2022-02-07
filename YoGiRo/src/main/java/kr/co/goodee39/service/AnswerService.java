package kr.co.goodee39.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.AnswerVO;

@Service
public class AnswerService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
//	public void insertAnswer(AnswerVO vo) {
//		vo.setQnum(99);
////		vo.setAnum(4);
//		sqlSessionTemplate.insert("answer.insertAnswer", vo);
		
//	}
	public void getAnswerList(Model model,
								int anum,
								int qnum,
								String atitle,
								String acontent) {
		AnswerVO vo = new AnswerVO();
		if(!atitle.equals("")) {
			model.addAttribute("atitle", atitle);
			vo.setAtitle("%"+atitle+"%");
		}
		if(!acontent.equals("")) {
			model.addAttribute("acontent", acontent);
			vo.setAcontent("%"+acontent+"%");
		}
		
		model.addAttribute("list", sqlSessionTemplate.selectList("answer.selectAnswerList",vo));
		model.addAttribute("qnum", qnum);
	}
	
	
	
	
	
	
	public void insertAnswer(AnswerVO vo) {
		sqlSessionTemplate.insert("answer.insertAnswer" , vo);
		sqlSessionTemplate.insert("answer.insertIsans" , vo);
	}
	
	public List<AnswerVO> selectAnswerList(AnswerVO vo) {
		return sqlSessionTemplate.selectList("answer.selectAnswerList" , vo);
	}
	
	public void deleteAnswer(AnswerVO vo) {
		sqlSessionTemplate.update("answer.deleteAnswer" , vo);
	}
	
	
}
