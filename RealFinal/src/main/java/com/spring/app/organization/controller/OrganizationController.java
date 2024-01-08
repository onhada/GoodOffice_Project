package com.spring.app.organization.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.organization.service.OrganizationService;

/** 
* @FileName  : OrganizationController.java 
* @Project   : TempFinal 
* @Date      : Jan 8, 2024 
* @작성자      : hada 
* @변경이력    : 
* @프로그램설명    : 조직 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/organization/*")
public class OrganizationController {
	
	@Autowired
	private OrganizationService service;

		
	
	@GetMapping("organizationManage.gw")
	public ModelAndView organizationManage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
//
///* 로그인 확인을 위한 테스트코드 시작 */
//HttpSession session = request.getSession();
//EmployeeVO loginUser = new EmployeeVO();
//loginUser.setEmpId((long) 9999); 
//session.setAttribute("loginUser", loginUser);
///* 로그인 확인을 위한 테스트코드 끝 */		
//		
//
//		long loginEmpId = loginUser.getEmpId();
//		
//		Map<String, Object> paraMap = new HashMap<>();
//		paraMap.put("loginEmpId", loginEmpId);

		
		
		mav.setViewName("organizationManage.organization");
		
		return mav;
		
	}	
	
	
	
}
