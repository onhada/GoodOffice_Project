package com.spring.app.personnel.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.common.domain.EmployeeVO;
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


	/**
	 *현재 근무현황 추가
	 */
	@Override
	public int workhistory_insert(Map<String, String> paraMap) {
		int n= dao.workhistory_insert( paraMap);
		return n;
	}


	@Override
	public List<EmployeeVO> personnel_search_name(String empName) {
		 List<EmployeeVO> evo =dao.personnel_search_name( empName);
		return evo;
	}


	@Override
	public String personnel_selct_empid(String empid) {
		String name=dao.personnel_selct_empid(empid);
		return name;
	}


	@Override
	public String vaction_cnt(String empid) {
		
		String cnt=dao.vaction_cnt(empid);
		
		return cnt;
	}


	@Override
	public int va_approval_insert(String empid) {
		int va_approval_insert=dao.va_approval_insert(empid);
		return va_approval_insert;
	}


	@Override
	public int va_dayoff_insert(Map<String, String> paraMap) {
		int va_dayoff_insert=dao.va_dayoff_insert(paraMap);
		return va_dayoff_insert;
	}


	@Override
	public int procedure_insert(Map<String, String> paraMaps) {
		int procedure_insert=dao.procedure_insert(paraMaps);
		return procedure_insert;
	}


	@Override
	public String tardy_cnt(String empid) {
		String tardy_cnt=dao.tardy_cnt(empid);
		return tardy_cnt;
	}


	@Override
	public String early_work_cnt(String empid) {
		String early_work_cnt=dao.early_work_cnt(empid);
		return early_work_cnt;
	}


	@Override
	public String not_leave_work(String empid) {
		String not_leave_work=dao.not_leave_work(empid);
		return not_leave_work;
	}


	@Override
	public String workday_cnt(String empid) {
		String workday_cnt=dao.workday_cnt(empid);
		return workday_cnt;
	}


	@Override
	public String absenteeism(String empid) {
		String absenteeism=dao.absenteeism(empid);
		return absenteeism;
	}


	@Override
	public int mowork_approval_insert(String empid) {
		int mowork_approval_insert=dao.mowork_approval_insert(empid);
		return mowork_approval_insert;
	}


	@Override
	public int work_modify_add_insert(Map<String, String> paraMaps) {
		int work_modify_add_insert=dao.work_modify_add_insert(paraMaps);
		return work_modify_add_insert;
	}


	@Override
	public int work_modify_del_insert(Map<String, String> paraMaps) {
		int work_modify_del_insert=dao.work_modify_del_insert(paraMaps);
		return work_modify_del_insert;
	}


	@Override
	public int work_modify_edit_insert(Map<String, String> paraMaps) {
		int work_modify_edit_insert=dao.work_modify_edit_insert(paraMaps);
		return work_modify_edit_insert;
	}


	@Override
	public String avg_hour(Map<String, String> paraMapYear) {
		String avg_hour=dao.avg_hour(paraMapYear);
		return avg_hour;
	}

 
	 

}
