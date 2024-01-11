package com.spring.app.organization.service;

import java.util.List;
import java.util.Map;

import com.spring.app.common.domain.EmployeeVO;

public interface OrganizationService {

	/** 
	* @Method Name  : getDepList 
	* @작성일   : Jan 8, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 부서 목록 가져오기
	* @return 
	*/
	List<Map<String, String>> getDepList();

	/** 
	* @Method Name  : getTeamList 
	* @작성일   : Jan 8, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 팀 목록 가져오기
	* @return 
	*/
	List<Map<String, String>> getTeamList();

	/** 
	* @Method Name  : getEmpCount 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 총/부서별/팀별 사원 수 가져오기
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> getEmpCount(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getempInfoList 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 임직원 정보 목록 가져오기
	* @return 
	*/
	List<EmployeeVO> getEmpInfoList();

	/** 
	* @Method Name  : getSpecificEmpInfoList 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 특정 부서 or 팀에 소속된 임직원 정보 목록 가져오기
	* @param paraMap
	* @return 
	*/
	List<EmployeeVO> getSpecificEmpInfoList(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getPositionList 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직위 조회하기
	* @return 
	*/
	List<EmployeeVO> getPositionList();
	
	/** 
	* @Method Name  : getJobList 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직무 조회하기
	* @return 
	*/
	List<EmployeeVO> getJobList();

	/** 
	* @Method Name  : selectExistJob 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 기존직무 중 같은 이름의 직무가 있는지 조회하기 
	* @param paraMap
	* @return 
	*/
	String selectExistJob(Map<String, Object> paraMap);

	/** 
	* @Method Name  : insertNewJob 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 새 직무 추가하기 
	* @param paraMap
	* @return 
	*/
	int insertNewJob(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectJobIdFromEmp 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 삭제하려는 직무의 사원이 있는지 조회한다
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> selectJobIdFromEmp(Map<String, Object> paraMap);

	/** 
	* @Method Name  : delJob 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int delJob(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectExistPositionId 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 기존직위 중 같은 등급의 직위가 있는지 조회하기 
	* @param paraMap
	* @return 
	*/
	String selectExistPositionId(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : selectExistPosition 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 기존직위 중 같은 이름의 직위가 있는지 조회하기 
	* @param paraMap
	* @return 
	*/
	String selectExistPosition(Map<String, Object> paraMap);

	/** 
	* @Method Name  : insertNewPosition 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 새 직위 추가하기 
	* @param paraMap
	* @return 
	*/
	int insertNewPosition(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectPositionIdFromEmp 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 삭제하려는 직위의 사원이 있는지 조회한다
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> selectPositionIdFromEmp(Map<String, Object> paraMap);

	/** 
	* @Method Name  : delPosition 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직위 삭제하기
	* @param paraMap
	* @return 
	*/
	int delPosition(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getLowPositionEmp 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 삭제하려는 직위보다 낮은 직위의 사원 가져오기
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> getLowPositionEmp(Map<String, Object> paraMap);

	/**
	* @Method Name  : selectSecurityPositionId
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 전자결재 보안등급 설정된 직위 조회하기
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> selectSecurityPositionId(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectExistDep 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 기존부서 중 동일한 부서명이 있는지 조회하기
	* @param paraMap
	* @return 
	*/
	String selectExistDep(Map<String, Object> paraMap);

	/** 
	* @Method Name  : insertNewDep 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 부서 추가하기
	* @param paraMap
	* @return 
	*/
	int insertNewDep(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectExistTeamOfDep 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 부서 내 팀이 존재하는지 조회하기 
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> selectExistTeamOfDep(Map<String, Object> paraMap);

	/** 
	* @Method Name  : deleteDep 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 부서 삭제하기
	* @param paraMap
	* @return 
	*/
	int deleteDep(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectExistTeam 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 기존팀 중 동일한 팀명이 있는지 조회하기 
	* @param paraMap
	* @return 
	*/
	String selectExistTeam(Map<String, Object> paraMap);

	/** 
	* @Method Name  : insertNewTeam 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 팀 추가하기
	* @param paraMap
	* @return 
	*/
	int insertNewTeam(Map<String, Object> paraMap);

	/** 
	* @Method Name  : selectExistEmpOfTeam 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 팀내 사원이 존재하는지 조회하기 
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> selectExistEmpOfTeam(Map<String, Object> paraMap);

	/** 
	* @Method Name  : deleteDep 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 팀 삭제하기
	* @param paraMap
	* @return 
	*/
	int deleteTeam(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getLoginEmpInfo 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 로그인한 사원 정보 가져오기
	* @param paraMap
	* @return 
	*/
	EmployeeVO getLoginEmpInfo(Map<String, Object> paraMap);

	/** 
	* @Method Name  : editMyinfo 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 내 정보 수정하기
	* @param paraMap
	* @return 
	*/
	int editMyinfo(Map<String, Object> paraMap);

	




	

}
