package com.spring.app.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.common.Sha256;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.common.service.CommonService;

/** 
* @FileName  : CommonController.java 
* @Project   : TempFinal 
* @Date      : Jan 7, 2024 
* @작성자      : hada 
* @변경이력    : 
* @프로그램설명    : 공통 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/common/*")
public class CommonController {
	
	@Autowired
	private CommonService service;

	
	/** 
	* @Method Name  : login 
	* @작성일   : Jan 7, 2024 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 로그인 페이지 요청하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("login.gw")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		mav.setViewName("common/login");
		
		return mav;
	}	
	
	
	/** 
	* @Method Name  : loginEnd 
	* @작성일   : Jan 7, 2024 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 로그인 완료 요청하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@PostMapping("loginEnd.gw")
	public ModelAndView loginEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String loginId = request.getParameter("loginId");
		String loginPasswd = request.getParameter("loginPasswd");
		
		if (!loginId.contains("@")) { // 이메일 도메인 주소 모두 입력하지 않고, @ 앞까지만 입력했을 때
			loginId = loginId + "@project.com";
		}
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginId", loginId);
		paraMap.put("loginPasswd", Sha256.encrypt(loginPasswd));
		
		EmployeeVO loginuser = service.getLoginMember(paraMap); // 로그인 처리하기
	
		if(loginuser == null) { // 로그인 실패시
			String message = "아이디 또는 암호가 틀립니다.";
		 	String loc = request.getHeader("referer");
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			
			mav.setViewName("common/msg");
		}
		else { // 아이디와 암호가 존재하는 경우 
			System.out.println(loginuser.getAdminType());		
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			
		// 수정필 이거 살려야 하나...?고민해보고 		
			// 로그인을 해야만 접근할 수 있는 페이지에 로그인을 하지 않은 상태에서 접근을 시도한 경우 
			// "먼저 로그인을 하세요!!" 라는 메시지를 받고서 사용자가 로그인을 성공했다라면
			// 화면에 보여주는 페이지는 시작페이지로 가는 것이 아니라
			// 조금전 사용자가 시도하였던 로그인을 해야만 접근할 수 있는 페이지로 가기 위한 것이다.
			String goBackURL = (String) session.getAttribute("goBackURL");
			
			if(goBackURL != null) {
				mav.setViewName("redirect:"+goBackURL);
				session.removeAttribute("goBackURL"); // 세션에서 제거 
			}
			else {
				mav.setViewName("redirect:/index/index.gw"); // 인덱스페이지로 이동
			}
		}
		
			
		return mav;
	}
	
	
	
	/** 
	* @Method Name  : logout 
	* @작성일   : Jan 8, 2024 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 로그아웃 처리하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("logout.gw")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String message = "로그아웃 되었습니다.";
		String loc = request.getContextPath()+"/common/login.gw";
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	
	
	
}
