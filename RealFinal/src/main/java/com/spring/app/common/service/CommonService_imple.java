package com.spring.app.common.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.common.model.CommonDAO;


/** 
* @FileName  : CommonService_imple.java 
* @Project   : TempFinal 
* @Date      : Jan 7, 2024 
* @작성자      : 김민경  
* @변경이력    : 
* @프로그램설명    : 트랜잭션 처리를 담당하는 곳, 업무를 처리하는 곳, 비지니스(Business)단
*/
@Service
public class CommonService_imple implements CommonService {

	@Autowired
	private CommonDAO dao;

	
	// === 로그인 처리하기 === //
	@Override
	public EmployeeVO getLoginMember(Map<String, Object> paraMap) {
		EmployeeVO loginuser = dao.getLoginMember(paraMap);
		return loginuser;
	}

	

	
}
