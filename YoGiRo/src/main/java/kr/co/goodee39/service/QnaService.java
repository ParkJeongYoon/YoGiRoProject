package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.QnaVO;

@Service
public class QnaService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 전체 글갯수 및 페이징
	public void selectQnaCount(Model model,
								int qnum,
								String qtitle,
								String qcontent) {
		QnaVO vo = new QnaVO();
		vo.setStart((qnum-1) * vo.getCount());
		if(!qtitle.equals("")) {
			model.addAttribute("qtitle" , qtitle);
			vo.setQtitle("%" + qtitle + "%");
		}
		if(!qcontent.equals("")) {
			model.addAttribute("qcontent" , qcontent);
			vo.setQcontent("%" + qcontent + "%");
		}
		
		model.addAttribute("qlist" , sqlSessionTemplate.selectList("qna.selectQuestionsList" , vo));
		model.addAttribute("count" , sqlSessionTemplate.selectOne("qna.selectQnaCount" , vo));
		model.addAttribute("qnum" , qnum);
	}
	
	// 글 작성
	public void selectQnaData(Model model , int qnum) {
		model.addAttribute("qdata" , sqlSessionTemplate.selectOne("qna.selectQnaByNum" , qnum));
	}
	public void insertQna(QnaVO vo) {
		sqlSessionTemplate.insert("qna.insertBBS" , vo);
	}

}
