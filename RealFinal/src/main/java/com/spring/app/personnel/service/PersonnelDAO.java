package com.spring.app.personnel.service;

import java.util.List;
import java.util.Map;

import com.spring.app.personnel.domain.WorkhistoryVO;

public interface PersonnelDAO {

	String test_hour(String id);

	/** 
	* @Method Name  : sysdate_get 
	* @작성일   : 2023. 12. 25 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 현재 날짜 가져오기
	* @return 
	*/
	String sysdate_get();

	String day_hour(Map<String, String> paraMap);

	/** 
	* @Method Name  : year_hour 
	* @작성일   : 2023. 12. 25 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 올해 총 근무 시간
	* @param paraMapYear
	* @return 
	*/
	String year_hour(Map<String, String> paraMapYear);

	/** 
	* @Method Name  : workhistory_print 
	* @작성일   : 2023. 12. 28 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 현재 근무현황 출력
	* @param paraMap
	* @return 
	*/
	List<WorkhistoryVO> workhistory_print(Map<String, String> paraMap);

	 

}
