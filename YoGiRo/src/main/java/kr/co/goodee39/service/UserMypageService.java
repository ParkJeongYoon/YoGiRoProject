package kr.co.goodee39.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/*
	 * public String getUser(UserVO vo, HttpSession session) { UserVO vo1 =
	 * ss.selectOne("user.selectuser" , vo); String Path = ""; if(vo1 != null) {
	 * session.setAttribute("account", vo1); Path = "after-login_main"; }else { Path
	 * = "/login/login-main"; } return Path; }
	 */
	// 회원정보 리스트 불러와서 마이페이지에 출력
	public List<UserVO> userList(){
		return ss.selectList("user.selectUser_info");
	}

	/*
	 * public UserVO viewuser(String userid) { return ss.selectOne("user.viewUser",
	 * userid); }
	 */
	public void insertUser(UserVO vo) {
		ss.insert("user.insertUser", vo);
	}
	
	public void updateUser(UserVO vo) {
		ss.update("user.updateUser", vo);
	}
	
	public void deleteUSer(String userid) {
		ss.delete("user.deleteUser", userid);
	}
	
	//회원정보 수정 삭제에 필요한 비밀번호 확인
	public boolean CheckPw(String userid, String userpassword) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid",userid);
		map.put("userpassword",userpassword);
		int count =ss.selectOne("user.CheckPw",map);
		if(count ==1) result=true;
		return result;
		
	}

}
