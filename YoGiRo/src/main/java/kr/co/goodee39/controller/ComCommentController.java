package kr.co.goodee39.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.goodee39.service.ComCommentService;
import kr.co.goodee39.vo.ComCommentVO;
import kr.co.goodee39.vo.CommunityVO;
import kr.co.goodee39.vo.UserVO;

@RestController
@RequestMapping("/comcomment")
public class ComCommentController {

	@Autowired
	private ComCommentService commentService;

	@PostMapping("/set")
	public ResponseEntity<ComCommentVO> addComment(@RequestBody ComCommentVO vo, HttpSession session) throws Exception {
		System.out.println(vo.getComcommentcontent());
		System.out.println(vo.getComid());
		
		UserVO userVO = (UserVO) session.getAttribute("account"); // 유저에 대한 넘버, 네임
		vo.setComcreatedate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA).format(new Date()));
		// 불러오기
		vo.setComuserid(userVO.getUserid());
		// vo.setWritername(userVO.getUserid());

		try {
			commentService.addComComment(vo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		ResponseEntity<ComCommentVO> entity = new ResponseEntity<ComCommentVO>(vo, HttpStatus.OK);

		return entity;
	}

	@GetMapping("/get/{comid}")
	public ResponseEntity<List<ComCommentVO>> getCommentList(@PathVariable int comid) {
		ComCommentVO vo = new ComCommentVO();
		vo.setComid(comid);

		List<ComCommentVO> list = commentService.selectComComment(vo);

		ResponseEntity<List<ComCommentVO>> entity = new ResponseEntity<List<ComCommentVO>>(list, HttpStatus.OK);

		return entity;
	}

	@DeleteMapping("/delete")
	public ResponseEntity<String> dropComment(@RequestBody ComCommentVO vo, HttpSession session) {
		// 세션으로 사용자의 계정정보를 받기위해 httpsession 사용. 세션 정보(로그인정보)받아서 그 사람인지 아닌지 식별.

		System.out.println(vo.getComcommentid());

		UserVO uvo = (UserVO) session.getAttribute("account");
		vo.setComuserid(uvo.getUserid()); // 세션정보로 확인

		commentService.deleteComment(vo);

		String str = "삭제되었습니다";

		ResponseEntity<String> entity = new ResponseEntity<String>(str, HttpStatus.OK);
		return entity;
	}

	@PatchMapping("/update")
	public ResponseEntity<ComCommentVO> patchComment(@RequestBody ComCommentVO vo, HttpSession session) {

		System.out.println(vo.getComid());
		System.out.println(vo.getComcommentcontent());

		UserVO uvo = (UserVO) session.getAttribute("account");
		vo.setComuserid(uvo.getUserid());

		commentService.updateComment(vo);

		ResponseEntity<ComCommentVO> entity = new ResponseEntity<ComCommentVO>(vo, HttpStatus.OK);

		return entity;
	}
}
