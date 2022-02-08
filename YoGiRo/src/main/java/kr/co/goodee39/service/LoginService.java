package kr.co.goodee39.service;

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
      UserVO vo1 = sqlSessionTemplate.selectOne("user.selectUser",vo);
      String path = "";
      if(vo1 != null) {
         session.setAttribute("account", vo1);
         path = "redirect:/main/maib";
      }else {
         path = "/login/login-main";
      }      
      return path;
   }
   
   public void insertUser(UserVO vo) {
      sqlSessionTemplate.insert("user.insertUser", vo);
   }
}