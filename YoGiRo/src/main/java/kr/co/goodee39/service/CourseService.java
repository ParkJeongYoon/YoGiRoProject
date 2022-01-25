package kr.co.goodee39.service;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.goodee39.vo.CourseCommonVO;
import kr.co.goodee39.vo.CourseDetailVO;
import kr.co.goodee39.vo.CourseIntroVO;
import kr.co.goodee39.vo.MyCourseCommonVO;
import kr.co.goodee39.vo.MyCourseDetailVO;

@Service
public class CourseService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	static ArrayList<String> contentID = new ArrayList<String>();
	static int count = 0;
	static int total = 0;

	private static String getTagValue(String tag, Element eElement) {
		// TODO Auto-generated method stub

		// NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		NodeList nlList = eElement.getElementsByTagName(tag);
		if (nlList.getLength() == 0) {
			System.out.println("들어옴");
			return null;
		} else {
			nlList = nlList.item(0).getChildNodes();
		}
		Node nValue = (Node) nlList.item(0);

		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	private static String getContentID(String region) {

		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /* URL */
			// urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
			// +
			// "=whSKqyHH%2BFU9%2BtzWaXnQKTYDUAXt6uBd6uH62NGmjzqe5TE%2FeAgHi5e2gndupTupZqEFTcIQgYE719GAAtG%2FtQ%3D%3D");
			// /*
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=ewO71PYzRas%2FQAzqCTyOcN8ixCHyI0coTie0WecjMb90zExos496ICxA8%2BJ478TiXcf%2BsQDuNF9OQiTKVEhQwg%3D%3D"); /*
																															 * Service
																															 * Key
																															 */
			urlBuilder.append(
					"&" + URLEncoder.encode("keyword", "UTF-8") + "=" + URLEncoder.encode(region, "UTF-8")); /* 콘텐츠id */
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
					+ URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
					+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* 서비스명=어플명 */
			urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "="
					+ URLEncoder.encode("1", "UTF-8")); /* 서비스명=어플명 */
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "="
					+ URLEncoder.encode("25", "UTF-8")); /* 서비스명=어플명 */

			String str = " http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=whSKqyHH%2BFU9%2BtzWaXnQKTYDUAXt6uBd6uH62NGmjzqe5TE%2FeAgHi5e2gndupTupZqEFTcIQgYE719GAAtG%2FtQ%3D%3D&areaCode=35&MobileOS=ETC&MobileApp=AppTesting&numOfRows=50";
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			System.out.println("요청 url : " + urlBuilder.toString());
			Document doc = dBuilder.parse(urlBuilder.toString());

			doc.getDocumentElement().normalize();
			System.out.println("Root element : " + doc.getDocumentElement().getNodeName());

			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱 할 리스트 수 :" + nList.getLength());

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					// System.out.println("######################");
					// System.out.println(eElement.getTextContent());
					// System.out.println("contentid : " + getTagValue("contentid", eElement));
					// 가져온 contentID를 arraylist에 담음
					contentID.add(getTagValue("contentid", eElement));

					// contentID[temp] = Integer.parseInt(getTagValue("contentid", eElement)) ;
					// System.out.println("상품 코드 : " + getTagValue("fin_prdt_cd", eElement));
					// System.out.println("상품명 : " + getTagValue("fin_prdt_nm", eElement));
					// System.out.println("연평균 수익률 : " + getTagValue("avg_prft_rate", eElement));
					// System.out.println("공시 이율 : " + getTagValue("dcls_rate", eElement));
				} // for end
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;

	}

	private static CourseCommonVO getCourseCommon(String contentID, CourseCommonVO vo) {
		try {
			CourseService ts = new CourseService(); // 서비스 객체

			String str = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=ewO71PYzRas%2FQAzqCTyOcN8ixCHyI0coTie0WecjMb90zExos496ICxA8%2BJ478TiXcf%2BsQDuNF9OQiTKVEhQwg%3D%3D&contentTypeId=25&contentId="
					+ contentID
					+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";
			// String str =
			// "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=whSKqyHH%2BFU9%2BtzWaXnQKTYDUAXt6uBd6uH62NGmjzqe5TE%2FeAgHi5e2gndupTupZqEFTcIQgYE719GAAtG%2FtQ%3D%3D&contentTypeId=25&contentId=2044565&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			// System.out.println("요청 url 코스: " +urlBuilder.toString());
			Document doc = dBuilder.parse(str);

			doc.getDocumentElement().normalize();
			// System.out.println("Root element : "+doc.getDocumentElement().getNodeName());

			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱 할 리스트 수 코스 공통:" + nList.getLength());

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					System.out.println("$$$$$$$$$$$$$$$$$$$$$");
					System.out.println(eElement.getTextContent());
					System.out.println("contentid  : " + getTagValue("contentid", eElement));
					System.out.println("firstimage  : " + getTagValue("firstimage", eElement));
					System.out.println("firstimage2  : " + getTagValue("firstimage2", eElement));
					System.out.println("areacode  : " + getTagValue("areacode", eElement));
					System.out.println("addr1  : " + getTagValue("addr1", eElement));
					System.out.println("addr2  : " + getTagValue("addr2", eElement));
					System.out.println("mapx  : " + getTagValue("mapx", eElement));
					System.out.println("mapy  : " + getTagValue("mapy", eElement));
					System.out.println("mlevel  : " + getTagValue("mlevel", eElement));
					System.out.println("overview  : " + getTagValue("overview", eElement));
					System.out.println("title  : " + getTagValue("title", eElement));
					System.out.println("zipcode  : " + getTagValue("zipcode", eElement));

					System.out.println("db 확인전");
					vo.setContentid(getTagValue("contentid", eElement));
					vo.setRegion("서울");
					vo.setFirstimage(getTagValue("firstimage", eElement));
					vo.setFirstimage2(getTagValue("firstimage2", eElement));
					vo.setOverview(getTagValue("overview", eElement));
					vo.setTitle(getTagValue("title", eElement));
					vo.setMapx(getTagValue("mapx", eElement));
					vo.setMapy(getTagValue("mapy", eElement));
					vo.setMlevel(getTagValue("mlevel", eElement));
					// vo.setDistance("1234");
					// vo.setTaketime("1234");
					System.out.println(vo.getContentid());
				} // for end

			}

			// }
			// }

		} catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	}

	private static CourseIntroVO getCourseDetailIntro(String contentID, CourseIntroVO vo) {
		try {
			// for(int i = 0 ; i<contentID.size(); i++) {

			// 공통정보
//				StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"); /*URL*/
//				urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=whSKqyHH%2BFU9%2BtzWaXnQKTYDUAXt6uBd6uH62NGmjzqe5TE%2FeAgHi5e2gndupTupZqEFTcIQgYE719GAAtG%2FtQ%3D%3D"); /*Service Key*/
//				urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("25", "UTF-8")); /*콘텐츠타입id*/
//				urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode("2381406", "UTF-8")); /*콘텐츠id*/
//		        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
//		        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
//		        
			// for (int i = 0; i < contentID.size(); i++) {
			String str = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=ewO71PYzRas%2FQAzqCTyOcN8ixCHyI0coTie0WecjMb90zExos496ICxA8%2BJ478TiXcf%2BsQDuNF9OQiTKVEhQwg%3D%3D&contentTypeId=25&contentId="
					+ contentID
					+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			// System.out.println("요청 url 코스: " +urlBuilder.toString());
			Document doc = dBuilder.parse(str);

			doc.getDocumentElement().normalize();
			// System.out.println("Root element : "+doc.getDocumentElement().getNodeName());

			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱 할 리스트 수 코스 공통:" + nList.getLength());

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					System.out.println("$$$$$$$$$$$$$$$$$$$$$");
					System.out.println(eElement.getTextContent());
					System.out.println("contentid  : " + getTagValue("contentid", eElement));
//
//						System.out.println("subdetailalt  : " + getTagValue("subdetailalt", eElement));
//						System.out.println("subdetailimg : " + getTagValue("subdetailimg", eElement));
//						System.out.println("subdetailoverview : " + getTagValue("subdetailoverview", eElement));
//						System.out.println("subname  : " + getTagValue("subname", eElement));\
					System.out.println("distance  : " + getTagValue("distance", eElement));
					System.out.println("taketime  : " + getTagValue("taketime", eElement));
					System.out.println("infocentertourcourse  : " + getTagValue("infocentertourcourse", eElement));
					System.out.println("schedule  : " + getTagValue("schedule", eElement));
					System.out.println("theme  : " + getTagValue("theme", eElement));

					vo.setDistance(getTagValue("distance", eElement));
					vo.setTaketime(getTagValue("taketime", eElement));
					vo.setContentid(getTagValue("contentid", eElement));
				} // for end
			}

			// }
			// }

		} catch (Exception e) {
			// TODO: handle exception
		}

		return vo;
	}

	private static CourseDetailVO getCourseDetail(String contentID, CourseDetailVO vo) {
		try {
			// for(int i = 0 ; i<contentID.size(); i++) {

			// 공통정보
			StringBuilder urlBuilder = new StringBuilder(
					"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=ewO71PYzRas%2FQAzqCTyOcN8ixCHyI0coTie0WecjMb90zExos496ICxA8%2BJ478TiXcf%2BsQDuNF9OQiTKVEhQwg%3D%3D"); /*
																															 * Service
																															 * Key
																															 */
			urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "="
					+ URLEncoder.encode("25", "UTF-8")); /* 콘텐츠타입id */
			urlBuilder.append("&" + URLEncoder.encode("contentId", "UTF-8") + "="
					+ URLEncoder.encode(contentID, "UTF-8")); /* 콘텐츠id */
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
					+ URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
					+ URLEncoder.encode("TourAPI3.0_Guide", "UTF-8")); /* 서비스명=어플명 */
			urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));

			// String str =
			// "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=whSKqyHH%2BFU9%2BtzWaXnQKTYDUAXt6uBd6uH62NGmjzqe5TE%2FeAgHi5e2gndupTupZqEFTcIQgYE719GAAtG%2FtQ%3D%3D&contentTypeId=25&contentId=2381406&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			// System.out.println("요청 url 코스: " +urlBuilder.toString());
			Document doc = dBuilder.parse(urlBuilder.toString());

			doc.getDocumentElement().normalize();
			// System.out.println("Root element : "+doc.getDocumentElement().getNodeName());

			NodeList nList = doc.getElementsByTagName("item");
			System.out.println("파싱 할 리스트 수 코스 세부 :" + nList.getLength());
			total = nList.getLength();

			// for (int temp = count; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(count);
			System.out.println("count = : " + count);
			if (nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;
				System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~");
				System.out.println(eElement.getTextContent());
				System.out.println("contentid  : " + getTagValue("contentid", eElement));
				vo.setContentid(getTagValue("contentid", eElement));
				vo.setRegion("서울");
				if (getTagValue("subdetailalt", eElement) == null || getTagValue("subdetailimg", eElement) == null) {
					System.out.println("hello");
				} else {
					System.out.println("subdetailalt  : " + getTagValue("subdetailalt", eElement));
					System.out.println("subdetailimg : " + getTagValue("subdetailimg", eElement));
					vo.setSubdetailalt(getTagValue("subdetailalt", eElement));
					vo.setSubdetailimg(getTagValue("subdetailimg", eElement));
				}
				System.out.println("subdetailoverview : " + getTagValue("subdetailoverview", eElement));
				System.out.println("subname  : " + getTagValue("subname", eElement));
				vo.setSubdetailoverview(getTagValue("subdetailoverview", eElement));
				vo.setSubname(getTagValue("subname", eElement));
				count++;
			} // for end
			// }
			// }

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return vo;
	}

	public void setDeatilData(CourseDetailVO vo) {
		CourseDetailVO vo1 = vo;

		// getContentID("서울");
		String conID = null;
		for (int i = 0; i < contentID.size(); i++) {
			// vo1 = getCourseCommon(contentID.get(i),vo1);
			// getCourseDetail(contentID.get(i));
			vo1 = getCourseDetail(contentID.get(i), vo1);
			if (vo1.getContentid() == null) {
				continue;
			}

			if (conID != vo1.getContentid()) {

				sqlSessionTemplate.insert("course.insertcoursedetail", vo1);
				System.out.println("db확인하세요~detail" + count);

				
			}
			for (int j = 1; j < total; j++) {
				vo1 = getCourseDetail(contentID.get(i), vo1);
				// System.out.println("서비스에서 나온 결과 : "+ vo1.getContentid());
				if (vo1.getContentid() == null) {
					continue;
				}

				if (conID != vo1.getContentid()) {

					sqlSessionTemplate.insert("course.insertcoursedetail", vo1);
					System.out.println("db확인하세요~detail" + count);

					
				}
			}
			total = 0;
			count = 0;
			conID = vo1.getContentid();

		}
	}

	public void setCommonIntroData(CourseIntroVO vo) {
		CourseIntroVO vo1 = vo;
		// getContentID("서울");
		String conID = null;
		for (int i = 0; i < contentID.size(); i++) {
			// vo1 = getCourseCommon(contentID.get(i),vo1);
			// getCourseDetail(contentID.get(i));
			vo1 = getCourseDetailIntro(contentID.get(i), vo1);
			// System.out.println("서비스에서 나온 결과 : "+ vo1.getContentid());
			if (vo1.getContentid() == null) {
				continue;
			}

			if (conID != vo1.getContentid()) {
				sqlSessionTemplate.insert("course.insertcourseintro", vo1);
				System.out.println("db확인하세요~intro");
			}

			conID = vo1.getContentid();

		}

	}

	public void setCommonData(CourseCommonVO vo) {

		CourseCommonVO vo1 = vo;
		getContentID("서울");
		String conID = null;
		// contentID.add("2044565");
		System.out.println(contentID.size());
		for (int i = 0; i < contentID.size(); i++) {
			System.out.println("common contentid: " + contentID.get(i));
			vo1 = getCourseCommon(contentID.get(i), vo1);
			System.out.println("서비스에서 나온 결과 : " + vo1.getContentid());
			if (vo1.getContentid() == null) {
				continue;
			}

			if (conID != vo1.getContentid()) {
				sqlSessionTemplate.insert("course.insertcoursecommon", vo1);
				System.out.println("db확인하세요~common");
			}

			conID = vo1.getContentid();

		}

		// vo1.setOwner("박정윤");
		// String date = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new
		// Date());

		// vo1.setCreatedate(date);
		// sqlSessionTemplate.insert("bbs.insertSample", vo1);
	}

//	public void setIntroData(CourseCommonVO vo) {
//		CourseCommonVO vo1 = vo;
//		sqlSessionTemplate.insert("course.insertcourseintro", vo1);
//
//	}
	
	public void getCourseCommonToJSP(Model model) {
		model.addAttribute("commonList",sqlSessionTemplate.selectList("course.getcoursecommon"));
	}
	public void getCourseDetailToJSP(Model model) {
		model.addAttribute("detailList",sqlSessionTemplate.selectList("course.getcoursedetail"));
	}
	public void getMyCourseCommonToJSP(Model model) {
		model.addAttribute("myCommonList",sqlSessionTemplate.selectList("course.getmycoursecommon"));
	}
	public void getMyCourseDetailToJSP(Model model) {
		model.addAttribute("myDetailList",sqlSessionTemplate.selectList("course.getmycoursedetail"));
	}
	
	public void selectCourseCommonToDetailPage(Model model, CourseCommonVO vo) {
		
		model.addAttribute("coursecommontodetailpage",sqlSessionTemplate.selectOne("course.getcoursecommonwithid",vo));
	}
	public void selectCourseDetailToDetailPage(Model model, CourseDetailVO vo) {
		
		model.addAttribute("coursedetailtodetailpage",sqlSessionTemplate.selectList("course.getcoursedetailwithid",vo));
	}
	public void selectMyCourseCommonToDetailPage(Model model, MyCourseCommonVO vo) {
		
		model.addAttribute("mycoursecommontodetailpage",sqlSessionTemplate.selectOne("course.getmycoursecommonwithid",vo));
	}
	public void selectMyCourseDetailToDetailPage(Model model, MyCourseDetailVO vo) {
		
		model.addAttribute("mycoursedetailtodetailpage",sqlSessionTemplate.selectList("course.getmycoursedetailwithid",vo));
	}
}
