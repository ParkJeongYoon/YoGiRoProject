package kr.co.goodee39.service;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import kr.co.goodee39.vo.UserVO;

@Service
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void getUserList(Model model, int usernumber, String userid, String useremail) {
		UserVO vo = new UserVO();
		vo.setStart((usernumber-1)*vo.getCount());
		
		if(!userid.equals("")) {
			model.addAttribute("userid", userid);
			vo.setUserid("%"+userid+"%");;
		}
		if(!useremail.equals("")) {
			model.addAttribute("useremail", useremail);
			vo.setUseremail("%"+useremail+"%");;
		}
		
		model.addAttribute("list", sqlSessionTemplate.selectList("member.selectUserList",vo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("member.selectUserCount", vo));
		model.addAttribute("usernumber", usernumber);
		
		
	}
	
	
	public void getUserBlockList(Model model, int usernumber, String userid, String useremail ) {
		UserVO vo = new UserVO();
		vo.setStart((usernumber-1)*vo.getCount());
		
		if(!userid.equals("")) {
			model.addAttribute("userid", userid);
			vo.setUserid("%"+userid+"%");;
		}
		if(!useremail.equals("")) {
			model.addAttribute("useremail", useremail);
			vo.setUseremail("%"+useremail+"%");;
		}
		
		model.addAttribute("list", sqlSessionTemplate.selectList("member.selectUserBlockList",vo));
		model.addAttribute("count", sqlSessionTemplate.selectOne("member.selectUserBlockCount", vo));
		model.addAttribute("usernumber", usernumber);
	}
	
	public void getUserManager(UserVO vo) {
//		System.out.println(vo.getUserid()+"안녕 서비스");
		sqlSessionTemplate.update("member.blockUser", vo);
	}
	
	public void getUserManager2(UserVO vo) {
//		System.out.println(vo.getUserid()+"안녕 서비스");
		sqlSessionTemplate.update("member.blockUser2", vo);
	}
}
