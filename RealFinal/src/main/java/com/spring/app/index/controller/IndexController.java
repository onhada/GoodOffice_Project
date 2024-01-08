package com.spring.app.index.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/** 
* @FileName  : IndexController.java 
* @Project   : TempFinal 
* @Date      : Jan 8, 2024 
* @작성자      : hada 
* @변경이력    : 
* @프로그램설명    : 인덱스 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/index/*")
public class IndexController {

//	@Autowired
//	private IndexService service;
	
	
	/** 
	* @Method Name  : myReservationList 
	* @작성일   : Jan 8, 2024 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 인덱스창을 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("index.gw")
	public ModelAndView myReservationList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		mav.setViewName("index.index");
		
		return mav;
		
	}	

	
}
