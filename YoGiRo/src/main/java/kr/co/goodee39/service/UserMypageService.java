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
	 
	// 회원탈퇴 > vo, session 정보를 받아서 회원정보를 삭제 후 / 세션종료
	public void deleteUser(UserVO vo, HttpSession session) {
		ss.delete("user.deleteUser",vo);
		session.invalidate();
	}
	
	// 패스워드 체크
	public int passChk(UserVO vo){
		int result = ss.selectOne("user.passChk",vo);
		return result;
	}
	
	 

}
