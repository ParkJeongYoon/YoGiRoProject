package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.AnswerVO;

@Service
public class AnswerService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public void insertAnswer(AnswerVO vo) {
		vo.setQnum(99);
//		vo.setAnum(4);
		sqlSessionTemplate.insert("answer.insertAnswer", vo);
		
	}
}
