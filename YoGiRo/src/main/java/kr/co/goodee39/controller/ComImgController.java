package kr.co.goodee39.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/comimg")
public class ComImgController {

	@RequestMapping("/imageUpload")
	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String fileName = upload.getOriginalFilename();
		
		//파일에 날짜 넣어서 확인
		Date date = new Date();
		SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
		fileName = imsi.format(date) + "_" + fileName;
		byte[] bytes = upload.getBytes();
		
		String uploadPath = "C:/temp/";
		// String uploadPath = request.getSession().getServletContext().getRealPath("/") + "/resources/ckeditor/images/";
		OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));

		outStr.write(bytes);

		// String callback=request.getParameter("CKEditorFuncNum");
		PrintWriter out = response.getWriter();
		// String fileUrl = request.getContextPath() + "/resources/ckeditor/images/" + fileName;
		String fileUrl = request.getContextPath()+"/temp/" + fileName;

		out.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

		out.flush();
		outStr.close();
	}

}
