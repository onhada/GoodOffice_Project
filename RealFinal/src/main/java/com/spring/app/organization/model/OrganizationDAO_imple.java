package com.spring.app.organization.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.app.common.domain.EmployeeVO;

/** 
* @FileName  : OrganizationDAO_imple.java 
* @Project   : TempFinal 
* @Date      : Jan 8, 2024 
* @작성자      : 김민경 
* @변경이력    : 
* @프로그램설명    : Repository(DAO) 선언
*/
@Repository
public class OrganizationDAO_imple implements OrganizationDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;

	
	///////////////////////////////////////////////////////
	
	
	// === 부서 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getDepList() {
		List<Map<String, String>> depList = sqlsession.selectList("organization.getDepList");
		return depList;
	}


	// === 팀 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getTeamList() {
		List<Map<String, String>> teamList = sqlsession.selectList("organization.getTeamList");
		return teamList;
	}


	// === 임직원 정보 목록 가져오기 === //
	@Override
	public List<EmployeeVO> getEmpInfoList() {
		List<EmployeeVO> empInfoList = sqlsession.selectList("organization.getEmpInfoList");
		return empInfoList;
	}


	// === 특정 부서 or 팀에 소속된 임직원 정보 목록 가져오기 === //
	@Override
	public List<EmployeeVO> getSpecificEmpInfoList(Map<String, Object> paraMap) {
		List<EmployeeVO> empInfoList = sqlsession.selectList("organization.getSpecificEmpInfoList");
		return empInfoList;
	}


	// === 총/부서별/팀별 사원 수 가져오기 === //
	@Override
	public List<Map<String, String>> getEmpCount(Map<String, Object> paraMap) {
		List<Map<String, String>> empCount = sqlsession.selectList("organization.getEmpCount", paraMap);
		return empCount;
	}


	// === 직위 조회하기 === //
	@Override
	public List<EmployeeVO> getPositionList() {
		List<EmployeeVO> positionList = sqlsession.selectList("organization.getPositionList"); 
		return positionList;
	}


	// === 직무 조회하기 === //
	@Override
	public List<EmployeeVO> getJobList() {
		List<EmployeeVO> jobList = sqlsession.selectList("organization.getJobList"); 
		return jobList;
	}


	// === 기존직무 중 같은 이름의 직무가 있는지 조회하기 === //
	@Override
	public String selectExistJob(Map<String, Object> paraMap) {
		String jobName = sqlsession.selectOne("organization.selectExistJob", paraMap); 
		return jobName;
	}


	// === 새 직무 추가하기 === //
	@Override
	public int insertNewJob(Map<String, Object> paraMap) {
		int result = sqlsession.insert("organization.insertNewJob", paraMap); 
		return result;
	}


	// === 삭제하려는 직무의 사원이 있는지 조회한다 === //
	@Override
	public List<Map<String, String>> selectJobIdFromEmp(Map<String, Object> paraMap) {
		List<Map<String, String>> existJobId = sqlsession.selectList("organization.selectJobIdFromEmp", paraMap); 
		return existJobId;
	}


	// === 직무 삭제하기 === //
	@Override
	public int delJob(Map<String, Object> paraMap) {
		int result = sqlsession.delete("organization.delJob", paraMap); 
		return result;
	}


	// === 기존직위 중 같은 등급의 직위가 있는지 조회하기 === //
	@Override
	public String selectExistPositionId(Map<String, Object> paraMap) {
		String positionId = sqlsession.selectOne("organization.selectExistPositionId", paraMap); 
		return positionId;
	}


	// === 기존직위 중 같은 이름의 직위가 있는지 조회하기 === //
	@Override
	public String selectExistPosition(Map<String, Object> paraMap) {
		String positionName = sqlsession.selectOne("organization.selectExistPosition", paraMap); 
		return positionName;
	}


	// === 새 직위 추가하기 === //
	@Override
	public int insertNewPosition(Map<String, Object> paraMap) {
		int result = sqlsession.insert("organization.insertNewPosition", paraMap); 
		return result;
	}


	// === 삭제하려는 직위의 사원이 있는지 조회한다 === //
	@Override
	public List<Map<String, String>> selectPositionIdFromEmp(Map<String, Object> paraMap) {
		List<Map<String, String>> existPositionId = sqlsession.selectList("organization.selectPositionIdFromEmp", paraMap); 
		return existPositionId;
	}


	// === 직위 삭제하기 === //
	@Override
	public int delPosition(Map<String, Object> paraMap) {
		int result = sqlsession.delete("organization.delPosition", paraMap); 
		return result;
	}


	// === 삭제하려는 직위보다 낮은 직위의 사원 가져오기 === //
	@Override
	public List<Map<String, String>> getLowPositionEmp(Map<String, Object> paraMap) {
		List<Map<String, String>> lowPositionEmpList = sqlsession.selectList("organization.getLowPositionEmp", paraMap); 
		return lowPositionEmpList;
	}


	// === 전자결재 보안등급 설정된 직위 조회하기 === //
	@Override
	public List<Map<String, String>> selectSecurityPositionId(Map<String, Object> paraMap) {
		List<Map<String, String>> securityPositionIdList = sqlsession.selectList("organization.selectSecurityPositionId", paraMap); 
		return securityPositionIdList;
	}


	// === 기존부서 중 동일한 부서명이 있는지 조회하기 === //
	@Override
	public String selectExistDep(Map<String, Object> paraMap) {
		String existDepName = sqlsession.selectOne("organization.selectExistDep", paraMap); 
		return existDepName;
	}


	// === 부서 추가하기 === //
	@Override
	public int insertNewDep(Map<String, Object> paraMap) {
		int n = sqlsession.insert("organization.insertNewDep", paraMap); 
		return n;
	}


	// === 부서 내 팀이 존재하는지 조회하기 === //
	@Override
	public List<Map<String, String>> selectExistTeamOfDep(Map<String, Object> paraMap) {
		List<Map<String, String>> existTeamList = sqlsession.selectList("organization.selectExistTeamOfDep", paraMap); 
		return existTeamList;
	}


	// === 부서 삭제하기 === //
	@Override
	public int deleteDep(Map<String, Object> paraMap) {
		int n = sqlsession.delete("organization.deleteDep", paraMap); 
		return n;
	}


	// === 기존팀 중 동일한 팀명이 있는지 조회하기 === //
	@Override
	public String selectExistTeam(Map<String, Object> paraMap) {
		String existTeamName = sqlsession.selectOne("organization.selectExistTeam", paraMap); 
		return existTeamName;
	}


	// === 팀 추가하기 === //
	@Override
	public int insertNewTeam(Map<String, Object> paraMap) {
		int n = sqlsession.insert("organization.insertNewTeam", paraMap); 
		return n;
	}


	// === 팀내 사원이 존재하는지 조회하기 === //
	@Override
	public List<Map<String, String>> selectExistEmpOfTeam(Map<String, Object> paraMap) {
		List<Map<String, String>> existEmpOfTeamList = sqlsession.selectList("organization.selectExistEmpOfTeam", paraMap); 
		return existEmpOfTeamList;
	}


	// === 팀 삭제하기 === //
	@Override
	public int deleteTeam(Map<String, Object> paraMap) {
		int n = sqlsession.delete("organization.deleteTeam", paraMap); 
		return n;
	}


	// === 로그인한 사원 정보 가져오기 === //
	@Override
	public EmployeeVO getLoginEmpInfo(Map<String, Object> paraMap) {
		EmployeeVO loginEmp = sqlsession.selectOne("organization.getLoginEmpInfo", paraMap); 
		return loginEmp;
	}


	// === 내 정보 수정하기 === //
	@Override
	public int editMyinfo(Map<String, Object> paraMap) {
		int n = sqlsession.update("organization.editMyinfo", paraMap);
		return n;
	}

	
	
}
