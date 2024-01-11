package com.spring.app.personnel.model;

import java.util.List;
import java.util.Map;

import com.spring.app.approval.domain.AdminHistoryVO;
import com.spring.app.approval.domain.FormVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.personnel.domain.SalaryDetailVO;
import com.spring.app.personnel.domain.SalaryVO;
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

	/** 
	* @Method Name  : workhistory_insert 
	* @작성일   : 2023. 12. 29 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 현재 근무현황 추가
	* @param paraMap
	* @return 
	*/
	int workhistory_insert(Map<String, String> paraMap);

	/** 
	* @Method Name  : personnel_search_name 
	* @작성일   : 2024. 1. 1 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empName
	* @return 
	*/
	List<EmployeeVO> personnel_search_name(String empName);

	/** 
	* @Method Name  : personnel_selct_empid 
	* @작성일   : 2024. 1. 2 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String personnel_selct_empid(String empid);

	/** 
	* @Method Name  : vaction_cnt 
	* @작성일   : 2024. 1. 4 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String vaction_cnt(String empid);

	/** 
	* @Method Name  : va_approval_insert 
	* @작성일   : 2024. 1. 5 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	int va_approval_insert(String empid);

	/** 
	* @Method Name  : va_dayoff_insert 
	* @작성일   : 2024. 1. 5 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int va_dayoff_insert(Map<String, String> paraMap);

	/** 
	* @Method Name  : procedure_insert 
	* @작성일   : 2024. 1. 5 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMaps
	* @return 
	*/
	int procedure_insert(Map<String, String> paraMaps);

	/** 
	* @Method Name  : tardy_cnt 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String tardy_cnt(String empid);

	/** 
	* @Method Name  : early_work_cnt 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String early_work_cnt(String empid);

	/** 
	* @Method Name  : not_leave_work 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String not_leave_work(String empid);

	/** 
	* @Method Name  : workday_cnt 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String workday_cnt(String empid);

	/** 
	* @Method Name  : absenteeism 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	String absenteeism(String empid);

	/** 
	* @Method Name  : mowork_approval_insert 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empid
	* @return 
	*/
	int mowork_approval_insert(String empid);

	/** 
	* @Method Name  : work_modify_add_insert 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMaps
	* @return 
	*/
	int work_modify_add_insert(Map<String, String> paraMaps);

	/** 
	* @Method Name  : work_modify_del_insert 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMaps
	* @return 
	*/
	int work_modify_del_insert(Map<String, String> paraMaps);

	/** 
	* @Method Name  : work_modify_edit_insert 
	* @작성일   : 2024. 1. 9 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMaps
	* @return 
	*/
	int work_modify_edit_insert(Map<String, String> paraMaps);

	/** 
	* @Method Name  : avg_hour 
	* @작성일   : 2024. 1. 10 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMapYear
	* @return 
	*/
	String avg_hour(Map<String, String> paraMapYear);

	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 예진 코드 추가 ---------------------------------------------------------------------------------------------
	
	
	/** 
	* @Method Name  : getFormList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<FormVO> getFormList();

	/** 
	* @Method Name  : getAdminList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<AdminVO> getAdminList();

	/** 
	* @Method Name  : getAdminHistory 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<AdminHistoryVO> getAdminHistoryList();

	/** 
	* @Method Name  : isExistPayrollThisMonth 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param month
	* @return 
	*/
	SalaryVO isExistPayrollThisMonth(String month);

	/** 
	* @Method Name  : getSalaryDetail 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param salaryId
	* @return 
	*/
	List<SalaryDetailVO> getSalaryDetail_withSearch(Map<String, String> paraMap);

	/** 
	* @Method Name  : fixPayroll 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int fixPayroll(Map<String, String> paraMap);

	/** 
	* @Method Name  : deleteSalaryDetail 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param salaryId
	* @return 
	*/
	int deleteSalaryDetail(Long salaryId);

	/** 
	* @Method Name  : deleteSalary 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param salaryId
	* @return 
	*/
	int deleteSalary(Long salaryId);


	/** 
	* @Method Name  : getSalarySequence 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	Long getSalarySequence();

	/** 
	* @Method Name  : insertSalary 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param svo
	* @return 
	*/
	int insertSalary(SalaryVO svo);

	/** 
	* @Method Name  : insertSalaryDetail 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param sdvo
	* @return 
	*/
	int insertSalaryDetail(SalaryDetailVO sdvo);

	/** 
	* @Method Name  : getEmpId 
	* @작성일   : 2024. 1. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param S
	* @return 
	*/
	Long getEmpId(Map<String, String> paraMap);

	/** 
	* @Method Name  : getSalary 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param salaryId
	* @return 
	*/
	SalaryVO getSalary(String salaryId);

	/** 
	* @Method Name  : getSalaryByYear 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	List<SalaryVO> getSalaryByYear(Map<String, String> paraMap);

	/** 
	* @Method Name  : getSalaryDetailBySalaryIdAndEmpId 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	SalaryDetailVO getSalaryDetailBySalaryIdAndEmpId(Map<String, String> paraMap);
	
	
	// 예진 코드 끝 ----------------------------------------------------------------------------------------------

}
