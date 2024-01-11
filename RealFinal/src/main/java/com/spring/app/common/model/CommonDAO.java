package com.spring.app.common.model;

import java.util.Map;

import com.spring.app.common.domain.EmployeeVO;

public interface CommonDAO {

	/** 
	* @Method Name  : getLoginMember 
	* @작성일   : Jan 7, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 로그인 처리하기
	* @param paraMap
	* @return 
	*/
	EmployeeVO getLoginMember(Map<String, Object> paraMap);

	

}
