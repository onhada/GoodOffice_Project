package com.spring.app.personnel.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.personnel.domain.WorkhistoryVO;
import com.spring.app.personnel.model.PersonnelDAO;

 
@Service
public class PersonnelService_imple implements PersonnelService {

	
	@Autowired  //Type에 따라 알아서 Bean 을 주입해준다.
	private PersonnelDAO dao;
	
	
	@Override
	public String test_hour(String id) {
		 String id_test= dao.test_hour(id);
		return id_test;
	}


	/**
	 * 현재날짜 가져오기
	 */
	@Override
	public String sysdate_get() {

		//현재 날짜 가져오기
		String sysdate_get=dao.sysdate_get();
		return sysdate_get;
	}


	@Override
	public String day_hour(Map<String, String> paraMap) {
		String day_hour= dao.day_hour(paraMap);
		return day_hour;
	}


	@Override
	public String year_hour(Map<String, String> paraMapYear) {

		String year_hour= dao.year_hour( paraMapYear);
		
		return year_hour;
	}


	/**
	 *현재 근무현황 출력
	 */
	@Override
	public List<WorkhistoryVO> workhistory_print(Map<String, String> paraMap) {
		
		
		List<WorkhistoryVO> workhistoryList= dao.workhistory_print( paraMap );
		return workhistoryList;
	}

 
	 

}
