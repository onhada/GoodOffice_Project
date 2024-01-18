package com.spring.app.admin.service;

import java.util.List;
import java.util.Map;

import com.spring.app.admin.domain.BatchModifyUserVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.DepartmentVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.common.domain.PositionVO;

/** 
* @FileName  : AdminService.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public interface AdminService {


	/** 
	* @Method Name  : getTeamList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 부서 목록을 취득한다
	* @return 
	*/
	public List<DepartmentVO> getDepList();

	/** 
	* @Method Name  : getPositionList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 직위 목록을 취득한다
	* @return 
	*/
	public List<PositionVO> getPositionList();

	/** 
	* @Method Name  : isExistId 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : tbl_employee 테이블에 존재하는 id인지 확인한다
	* @param id
	* @return 
	*/
	public boolean isExistId(String id);

	/** 
	* @Method Name  : insertUser 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 새로운 사용자(사원)을 등록한다
	* @param evo
	* @return 
	*/
	public boolean insertUser(EmployeeVO evo);

	/** 
	* @Method Name  : getEmployeeList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 사원 목록을 취득한다
	* @return 
	*/
	public List<EmployeeVO> getEmployeeList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getTotalCountEmployeeList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 사원수를 취득한다
	* @param paraMap
	* @return 
	*/
	public int getTotalCountEmployeeList(Map<String, String> paraMap);

	/** 
	* @Method Name  : batchWorkType 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 선택한 회원의 근무형태를 일괄 변경한다
	* @param bvo
	* @return 
	*/
	public int batchWorkType(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : batchPosition 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 선택한 회원의 직위를 일괄 변경한다
	* @param bvo
	* @return 
	*/
	public int batchPosition(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : batchStatus 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 선택한 회원의 상태를 일괄 변경한다
	* @param bvo
	* @return 
	*/
	public int batchStatus(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : getFullAdminList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 전체 관리자 목록을 가져온다
	* @return 
	*/
	public List<AdminVO> getFullAdminList();

	/** 
	 * @param searchWord 
	* @Method Name  : getNoneFullAdminEmployeeList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 전체 관리자가 아닌 회원 목록을 가져온다
	* @return 
	*/
	public List<EmployeeVO> getNoneFullAdminEmployeeList(String searchWord);

	/** 
	* @Method Name  : confirmFullAdmin 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 전체 관리자를 등록한다
	* @param paraMap
	* @return 
	*/
	public boolean confirmFullAdmin(Map<String, String[]> paraMap, Long userEmpId);


}
