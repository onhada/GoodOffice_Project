package com.spring.app.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/** 
* @FileName  : CommonController.java 
* @Project   : TempFinal 
* @Date      : Dec 5, 2023 
* @작성자      : hada 
* @변경이력    : 
* @프로그램설명    : 
*/
@Controller
public class CommonController {
	
	/** 
	* @Method Name  : test_insert 
	* @작성일   : Dec 5, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	@GetMapping("/hi.gw")
	public String test_insert() {

		
		
		
//		return "trashContents.addressBook";
//		return "admin_managerSet.admin";
//		return "settings_write_form_number.approval";
// 		return "writingContents.board";
//		return "groupMain.groupMain";	
//		return "group_members.group";
//		return "index.index";		
		return "mail_mailWrite.mail";	
//		return "work_holiday_next_MyVacationAndWork.personnel";
//		return "reservation_manage_admin.reservation";	
//		return "schedule_monthly.schedule";	
//		return "login";
		
		
		
	}

}
