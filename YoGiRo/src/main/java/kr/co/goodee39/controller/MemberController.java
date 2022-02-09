package kr.co.goodee39.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ctc.wstx.util.DataUtil;

import kr.co.goodee39.service.MemberService;
import kr.co.goodee39.vo.UserVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService userService;
	
	@GetMapping("/manager/manager3/manager-member")
	public String getUserList(Model model, @RequestParam(defaultValue = "1") int usernumber,
										   @RequestParam(defaultValue="") String userid,
										   @RequestParam(defaultValue="") String useremail) {
		userService.getUserList(model, usernumber, userid, useremail);
		return "/manager/manager3/manager-member";
	}
	
	@PostMapping("/manager/manager3/manager-mem")
	public @ResponseBody ResponseEntity<Map<String,String>> getBlock(@RequestBody Map<String,List<String>> valueArr, UserVO vo) {
		//String [] block = request.getParameterValues("valueArr");
//		int size = block.length;
		
		List<String> list = valueArr.get("valueArr");
		for (String string : list) {
			System.out.println(string);
			vo.setUserid(string);
			userService.getUserManager(vo);
		}
      
		Map<String,String> map = new HashMap<String,String>();
		map.put("str", "okok");
		
		ResponseEntity<Map<String,String>> entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		 
        return entity;
	}
	
	@PostMapping("/manager/manager4/manager-block")
	public @ResponseBody ResponseEntity<Map<String,String>> getBlock1(@RequestBody Map<String,List<String>> valueArr, UserVO vo) {
		//String [] block = request.getParameterValues("valueArr");
//		int size = block.length;
		
		List<String> list = valueArr.get("valueArr");
		for (String string : list) {
			System.out.println(string);
			vo.setUserid(string);
			userService.getUserManager2(vo);
		}
      
		Map<String,String> map = new HashMap<String,String>();
		map.put("str", "okok");
		
		ResponseEntity<Map<String,String>> entity = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
		 
        return entity;
	}
	
//	@RequestMapping(value ="/manager/manager3/delete") //method = RequestMethod.POST
//	public String getBlock(UserVO vo, HttpServletRequest request) {
//		System.out.println(request.getParameterValues("valueArr"));
//		String[] ajaxMsg = request.getParameterValues("valueArr");
//        int size = ajaxMsg.length;
//        for (int i = 0; i < size; i++) {
//			vo.setUserid(ajaxMsg[i]);
//			userService.getUserManager(vo);
//		} 
//        return "redirect:/manager/manager3/manager-member";
//	}
	
	@GetMapping("/manager/manager4/manager-block-member")
	public String getBlockUserList(Model model, @RequestParam(defaultValue = "1") int usernumber,
										   @RequestParam(defaultValue="") String userid,
										   @RequestParam(defaultValue="") String useremail) {
		userService.getUserBlockList(model, usernumber, userid, useremail);
		return "/manager/manager4/manager-block-member";
	}
	
//	@GetMapping("/manager/manager4/manager-block-member")
//	public String getBlockUserList(ModelMap model, @RequestParam(defaultValue = "1") int usernumber,
//										   @RequestParam(defaultValue="") String userid,
//										   @RequestParam(defaultValue="") String useremail, HttpServletRequest request) {
//						
//			String [] block = request.getParameterValues("bloCheck");		
//		           for(int i = 0; i <= block.length ; i++ ){
//					System.out.println(block[i]);
//				}
//		userService.getUserBlockList(model, usernumber, userid, useremail);
//		return "/manager/manager4/manager-block-member";
//	}
	
	
	
}
