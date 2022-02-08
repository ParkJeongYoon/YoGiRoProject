package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginReturnController {

   @GetMapping("main/maib")
   public String getLoginList(HttpSession session) {
		String backButton = (String)session.getAttribute("backButton");
		System.out.println(backButton);
		backButton.replaceAll("http://localhost:8093/TestSpringMVC/", "");
		System.out.println(backButton);
		String backButtonRe = backButton.substring(35);
		System.out.println(backButtonRe);
      return "redirect:"+backButtonRe;
   }
}