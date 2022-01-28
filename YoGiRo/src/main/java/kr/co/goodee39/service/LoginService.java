package kr.co.goodee39.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.UserVO;

@Service
public class LoginService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;      
	
	public String getuser(UserVO vo, HttpSession session) {
		UserVO vo1 = sqlSessionTemplate.selectOne("user.selectuser",vo);
		String path = "";
		if(vo1 != null) {
			session.setAttribute("account", vo1);
			path = "redirect:/bbs/main";
		}else {
			path = "/login/login-main";
		}
		
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now(); //1156511615699486512
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		// 포맷 적용
		String formatedNow = now.format(formatter);
		System.out.println(formatedNow);
		// 찾기
//		int num = sqlSessionTemplate.selectOne("count.isCount",formatedNow);
//		if( num > 0) {
//			// 있으면 업데이트
//			sqlSessionTemplate.update("count.updateCount",formatedNow);
//		}else {
//			// 없으면 인서트
//			sqlSessionTemplate.insert("count.insertCount", formatedNow);
//		}
		
		return path;
	}
	
	public void setuser(UserVO vo) {
		sqlSessionTemplate.insert("user.insertuser", vo);
	}
}
