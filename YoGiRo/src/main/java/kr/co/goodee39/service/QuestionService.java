package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.QuestionVO;

@Service
public class QuestionService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void getQUEList(Model model, int num, String title, String content) {
		QuestionVO vo = new QuestionVO();
		vo.setStart((num-1)*vo.getCount());
		if(!title.equals("")) {
			model.addAttribute("title", title);
			// %를 넣음으로써 title에 해당하는 글만 가져오는 역할
			vo.setQtitle("%"+title+"%");
		}
		if(!content.equals("")) {
			model.addAttribute("content", content);
			vo.setQcontent("%"+content+"%");
		}
		
		model.addAttribute("list", sqlSessionTemplate.selectList("questions.selectQuestionsList",vo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("questions.selectQuestionsCount", vo));
		model.addAttribute("num", num);
	}
}
