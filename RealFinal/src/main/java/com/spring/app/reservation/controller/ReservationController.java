package com.spring.app.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.reservation.service.ReservationService;

/** 
* @FileName  : ReservationController.java 
* @Project   : TempFinal 
* @Date      : Dec 28, 2023 
* @작성자      : hada 
* @변경이력    : 
* @프로그램설명    : 예약 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/reservation/*")
public class ReservationController {
	
	@Autowired
	private ReservationService service;

	
	
	@GetMapping("myReservationList.gw")
	public ModelAndView mailWrite(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */		









	mav.setViewName("myReservationList.reservation");
	
	return mav;
		
	}	
		
}
