package kr.co.goodee39.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.UserVO;


@Service
public class UserMypageService {
	
	@Autowired
	SqlSessionTemplate ss;
	   
	// 회원정보 리스트 불러와서 마이페이지에 출력
	public List<UserVO> userList(){
		return ss.selectList("user.selectUser_info");
	}

	public void insertUser(UserVO vo) {
		ss.insert("user.insertUser", vo);
	}
	
	
	 public void updateUser(UserVO vo) { 
		 ss.update("user.updateUser", vo);
	 }
	
	public void deleteUser(UserVO vo) {
		ss.delete("user.deleteUser", vo);
	}
	
	public Object passChk(UserVO vo){
		return ss.selectOne("user.PassChk",vo); 
	}
	
	public UserVO selectUser(Model model, UserVO vo) {
		model.addAttribute("UserVO",ss.selectOne("user.selectUser", vo));
		return ss.selectOne("user.selectUser", vo);
	}

}
