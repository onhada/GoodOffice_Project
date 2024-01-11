package com.spring.app.index.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.approval.service.ApprovalService;
import com.spring.app.common.domain.EmployeeVO;


/** 
* @FileName  : IndexController.java 
* @Project   : TempFinal 
* @Date      : Jan 8, 2024 
* @작성자      : 김민경 
* @변경이력    : 
* @프로그램설명    : 인덱스 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/index/*")
public class IndexController {

//	@Autowired
//	private IndexService service;
	
	@Autowired
	ApprovalService service;
	
	/** 
	* @Method Name  : myReservationList 
	* @작성일   : Jan 8, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 인덱스창을 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("index.gw")
	public ModelAndView myReservationList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		// 예진 코드 시작 -----------------------------------------------------------
		
		HttpSession session = request.getSession();
		
		
		Map<String, String> sizeMap = new HashMap<>();
		sizeMap.put("searchType", "");
		sizeMap.put("searchWord", "");
		sizeMap.put("orderType", "desc");
		sizeMap.put("empId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId()));

		mav.addObject("wSize", service.getApprovalWaitingList_withSearchAndPaging(sizeMap).size());
		mav.addObject("vSize", service.getApprovalCheckList_withSearchAndPaging(sizeMap).size());
		mav.addObject("eSize", service.getApprovalScheduleList_withSearchAndPaging(sizeMap).size());
		mav.addObject("pSize", service.getApprovalProgressList_withSearchAndPaging(sizeMap).size());
		
		// 예진 코드 끝    -----------------------------------------------------------
		
		mav.setViewName("index.index");
		
		return mav;
		
	}	

	
}
