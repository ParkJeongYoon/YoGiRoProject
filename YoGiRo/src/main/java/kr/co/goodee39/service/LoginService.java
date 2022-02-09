package kr.co.goodee39.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.UserVO;

@Service
public class LoginService {
   
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;      
   
   public String getuser(UserVO vo,
						   HttpSession session,
						   HttpServletRequest request) {
		UserVO vo1 = sqlSessionTemplate.selectOne("user.selectUser",vo);
		String path = "";
		if(vo1 != null) {
			session.setAttribute("account", vo1);
			System.out.println("로그인성공 서비스");
			String beforePage = (String)session.getAttribute("beforePage");
			path = "redirect:" + beforePage.substring(35);
		}else {
			String failText = "없는 아이디 이거나 아이디 혹은 비밀번호가 일치하지 않습니다.";
			request.setAttribute("failText" , failText);
			
			System.out.println("로그인실패 서비스");
			path = "redirect:/login/login-main?flag=" + 1;
		}
		return path;
   }
   
   public void insertUser(UserVO vo) {
      sqlSessionTemplate.insert("user.insertUser", vo);
   }
}