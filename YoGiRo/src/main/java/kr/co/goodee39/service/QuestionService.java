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
	
	public void getQUEList(Model model) {
		QuestionVO vo = new QuestionVO();
		vo.setStart(0);
		vo.setCount(10);
		
		
		model.addAttribute("list", sqlSessionTemplate.selectList("questions.selectQuestionsList",vo));
	}
}
