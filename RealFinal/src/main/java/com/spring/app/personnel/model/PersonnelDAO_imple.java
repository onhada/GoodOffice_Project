package com.spring.app.personnel.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.app.approval.domain.AdminHistoryVO;
import com.spring.app.approval.domain.FormVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.personnel.domain.SalaryDetailVO;
import com.spring.app.personnel.domain.SalaryVO;
import com.spring.app.personnel.domain.WorkhistoryVO;

 
@Repository
public class PersonnelDAO_imple implements PersonnelDAO {

	@Resource //bean 이 여러개 일때... bean 이 하나일때는 @Autowired를 사용한다
	private SqlSessionTemplate sqlsession; //현재 'mymvc' 디비

	 

	@Override
	public String sysdate_get() {
		
		 String sysdate_get=sqlsession.selectOne("personnel.sysdate_get");
		return sysdate_get;
	}

	 
	@Override
	public String year_hour(Map<String, String> paraMapYear) {

		//외출 한번도 안했나 체크하기
		List<String> outingCheck= sqlsession.selectList("personnel.outingCheck",paraMapYear);
		
		//연장근무 한적 있나 체크하기
		int overtimeCheck= sqlsession.selectOne("personnel.overtimeCheck",paraMapYear);		
		 
		int overtimeSum=0; //연장근무만 총시간
		
		if(overtimeCheck > 0) { //연장근무 내역이 있다면
			
			overtimeSum= sqlsession.selectOne("personnel.overtimeSum",paraMapYear);
			 
		}
		
		String year_hour_str="";
		int a=0,b=0;
		
		if( outingCheck.size()==0  ) { //사원이 외출을 한날이 없는 경우
			
			//외출 안한날
			int year_hour=sqlsession.selectOne("personnel.year_hour",paraMapYear);
			
			  a=  year_hour   /60;
			  a=a+overtimeSum;
			  b=  year_hour  %60;
			
			year_hour_str= a+"시간 "+ b +"분";
			
		}
		else {//사원이 외출을 한날이 있는 경우
			
			//외출 안한날
			int year_hour=sqlsession.selectOne("personnel.year_hour",paraMapYear);
			
			 
			
			//외출 한날
			int year_hour_outing =sqlsession.selectOne("personnel.year_hour_out",paraMapYear);
			 
			
			  a= (year_hour+year_hour_outing) /60;
			  a=a+overtimeSum;
			  b= (year_hour+year_hour_outing) %60;
			
			  year_hour_str= a+"시간 "+ b +"분";
		}
		 
		
		return year_hour_str;
	}

	@Override
	public List<WorkhistoryVO> workhistory_print(Map<String, String> paraMap) {
		
		List<WorkhistoryVO> workhistoryList= sqlsession.selectList("personnel.workhistory_print",paraMap );
		return workhistoryList;
	}

	@Override
	public int workhistory_insert(Map<String, String> paraMap) {

		int n = sqlsession.insert("personnel.workhistory_insert",paraMap);
		return n;
	}

	@Override
	public List<EmployeeVO> personnel_search_name(String empName) {
		List<EmployeeVO> evo=sqlsession.selectList("personnel.personnel_search_name",empName );
		return evo;
	}

	@Override
	public String personnel_selct_empid(String empid) {
		String name =sqlsession.selectOne("personnel.personnel_selct_empid",empid);
		return name;
	}

	@Override
	public String vaction_cnt(String empid) {
		
		String cnt =sqlsession.selectOne("personnel.vaction_cnt",empid);
		return cnt;
	}

	@Override
	public int va_approval_insert(String empid) {
		int va_approval_insert=sqlsession.insert("personnel.va_approval_insert",empid);
		return  va_approval_insert;
	}

	@Override
	public int va_dayoff_insert(Map<String, String> paraMap) {
		int va_dayoff_insert=sqlsession.insert("personnel.va_dayoff_insert",paraMap);
		return  va_dayoff_insert;
	}

	@Override
	public int procedure_insert(Map<String, String> paraMaps) {
		int procedure_insert=sqlsession.insert("personnel.procedure_insert",paraMaps);
		return procedure_insert;
	}

	@Override
	public String tardy_cnt(String empid) {
		String tardy_cnt=sqlsession.selectOne("personnel.tardy_cnt",empid);
		return tardy_cnt;
	}

	@Override
	public String early_work_cnt(String empid) {
		String early_work_cnt=sqlsession.selectOne("personnel.early_work_cnt",empid);
		return early_work_cnt;
	}

	@Override
	public String not_leave_work(String empid) {
		 String not_leave_work=sqlsession.selectOne("personnel.not_leave_work",empid);
		return not_leave_work;
	}

	@Override
	public String workday_cnt(String empid) {
		String workday_cnt=sqlsession.selectOne("personnel.workday_cnt",empid);
		return workday_cnt;
	}

	@Override
	public String absenteeism(String empid) {
		String absenteeism=sqlsession.selectOne("personnel.absenteeism",empid);
		return absenteeism;
	}

	@Override
	public int mowork_approval_insert(String empid) {
		int mowork_approval_insert=sqlsession.insert("personnel.mowork_approval_insert",empid);
		return mowork_approval_insert;
	}

	@Override
	public int work_modify_add_insert(Map<String, String> paraMaps) {
		int work_modify_add_insert=sqlsession.insert("personnel.work_modify_add_insert",paraMaps);
		return work_modify_add_insert;
	}

	@Override
	public int work_modify_del_insert(Map<String, String> paraMaps) {
		int work_modify_del_insert=sqlsession.insert("personnel.work_modify_del_insert",paraMaps);
		return work_modify_del_insert;
	}

	@Override
	public int work_modify_edit_insert(Map<String, String> paraMaps) {
		int work_modify_edit_insert=sqlsession.insert("personnel.work_modify_edit_insert",paraMaps);
		return work_modify_edit_insert;
	}

	@Override
	public String avg_hour(Map<String, String> paraMapYear) {

		//외출 한번도 안했나 체크하기
		List<String> outingCheck= sqlsession.selectList("personnel.outingCheck",paraMapYear);
		
		//연장근무 한적 있나 체크하기
		int overtimeCheck= sqlsession.selectOne("personnel.overtimeCheck",paraMapYear);		
		 
		int overtimeSum=0; //연장근무만 총시간
		
		if(overtimeCheck > 0) { //연장근무 내역이 있다면
			
			overtimeSum= sqlsession.selectOne("personnel.overtimeSum",paraMapYear);
			 
		}
		
		String year_hour_str="";
		int a=0,b=0;
		
		if( outingCheck.size()==0  ) { //사원이 외출을 한날이 없는 경우
			
			//외출 안한날
			int year_hour=sqlsession.selectOne("personnel.year_hour",paraMapYear);
			
			  a=  year_hour   /60;
			  a=a+overtimeSum;
			  b=  year_hour  %60;
			
			year_hour_str= Integer.toString(year_hour)  ;
			
		}
		else {//사원이 외출을 한날이 있는 경우
			
			//외출 안한날
			int year_hour=sqlsession.selectOne("personnel.year_hour",paraMapYear);
			
			 
			
			//외출 한날
			int year_hour_outing =sqlsession.selectOne("personnel.year_hour_out",paraMapYear);
			 
			
			  a= (year_hour+year_hour_outing) /60;
			  a=a+overtimeSum;
			  b= (year_hour+year_hour_outing) %60;
			
			  year_hour_str= Integer.toString(year_hour+year_hour_outing);
		}
		 
		
		return year_hour_str;
	 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 예진 코드 추가 ----------------------------------------------------------------------------------------
	@Override
	public List<FormVO> getFormList() {
		return sqlsession.selectList("personnel.getFormList");
	}

	@Override
	public List<AdminVO> getAdminList() {
		return sqlsession.selectList("personnel.getAdminList");
	}

	@Override
	public List<AdminHistoryVO> getAdminHistoryList() {
		return sqlsession.selectList("personnel.getAdminHistoryList");
	}

	@Override
	public SalaryVO isExistPayrollThisMonth(String month) {
		return sqlsession.selectOne("personnel.isExistPayrollThisMonth", month);
	}

	@Override
	public List<SalaryDetailVO> getSalaryDetail_withSearch(Map<String, String> paraMap) {
		return sqlsession.selectList("personnel.getSalaryDetail_withSearch", paraMap);
	}

	@Override
	public int fixPayroll(Map<String, String> paraMap) {
		return sqlsession.update("personnel.fixPayroll", paraMap);
	}

	@Override
	public int deleteSalaryDetail(Long salaryId) {
		return sqlsession.delete("personnel.deleteSalaryDetail", salaryId);
	}

	@Override
	public int deleteSalary(Long salaryId) {
		return sqlsession.delete("personnel.deleteSalary", salaryId);
	}

	@Override
	public Long getSalarySequence() {
		return sqlsession.selectOne("personnel.getSalarySequence");
	}

	@Override
	public int insertSalary(SalaryVO svo) {
		return sqlsession.insert("personnel.insertSalary", svo);
	}

	@Override
	public int insertSalaryDetail(SalaryDetailVO sdvo) {
		return sqlsession.insert("personnel.insertSalaryDetail", sdvo);
	}

	@Override
	public Long getEmpId(Map<String, String> paraMap) {
		return sqlsession.selectOne("personnel.getEmpId", paraMap);
	}

	@Override
	public SalaryVO getSalary(String salaryId) {
		return sqlsession.selectOne("personnel.getSalary", salaryId);
	}

	@Override
	public List<SalaryVO> getSalaryByYear(Map<String, String> paraMap) {
		return sqlsession.selectList("personnel.getSalaryByYear", paraMap);
	}

	@Override
	public SalaryDetailVO getSalaryDetailBySalaryIdAndEmpId(Map<String, String> paraMap) {
		return sqlsession.selectOne("personnel.getSalaryDetailBySalaryIdAndEmpId", paraMap);
	}
	
	
	// 예진 코드 끝 -----------------------------------------------------------------------------------------

	 
	
}
