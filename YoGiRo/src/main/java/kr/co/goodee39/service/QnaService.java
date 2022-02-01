package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.QuestionVO;

@Service
public class QnaService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	
	public void selectQnaList(Model model,
								int qnum,
								String qtitle , String qcontent) {
		QuestionVO vo = new QuestionVO();
		vo.setStart((qnum-1)*vo.getCount());
		if (!qtitle.equals("")) {
			model.addAttribute("qtitle" , qtitle);
			vo.setQtitle("%" + qtitle + "%");
		}
		if (!qcontent.equals("")) {
			model.addAttribute("qcontent" , qcontent);
			vo.setQcontent("%" + qcontent + "%");
		}
		model.addAttribute("list" , sqlSessionTemplate.selectList("questions.selectQuestionsList" , vo));
		model.addAttribute("count" , sqlSessionTemplate.selectOne("questions.selectQuestionsCount" , vo));
		model.addAttribute("qnum" , qnum);
	}
}
