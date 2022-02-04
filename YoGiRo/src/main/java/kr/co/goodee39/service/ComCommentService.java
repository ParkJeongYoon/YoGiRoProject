package kr.co.goodee39.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.ComCommentVO;

@Service
public class ComCommentService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void addComComment(ComCommentVO vo) {
		sqlSessionTemplate.insert("comcomment.insertComment", vo); // 코멘트 넣어주기
	}
	
	public List<ComCommentVO> selectComComment(ComCommentVO vo) {
		List<ComCommentVO> comCommentVO = sqlSessionTemplate.selectList("comcomment.selectCommentList",vo);
		return comCommentVO;
		/* return sqlSessionTemplate.selectList("comcomment.selectCommentList", vo); */
	} // db에 저장된 코멘트 불러오기
	
	public void deleteComment(ComCommentVO vo) {
		sqlSessionTemplate.delete("comcomment.deleteComment", vo);
	} // 코멘트 삭제 
	
	public void updateComment(ComCommentVO vo) {
		sqlSessionTemplate.update("comcomment.updateComment", vo);
	}
}
