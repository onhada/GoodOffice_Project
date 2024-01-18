package com.spring.app.admin.model;

import java.util.List;
import java.util.Map;

import com.spring.app.admin.domain.BatchModifyUserVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.DepartmentVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.common.domain.PositionVO;

/** 
* @FileName  : AdminDAO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : 신예진 (yejjinny) 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public interface AdminDAO {

	/** 
	* @Method Name  : getTeamList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 부서 목록을 가져온다
	* @return 
	*/
	List<DepartmentVO> getDepList();

	/** 
	* @Method Name  : getPositionList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 직위 목록을 가져온다
	* @return 
	*/
	List<PositionVO> getPositionList();

	/** 
	* @Method Name  : isExistId 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : id가 존재하는지 확인한다
	* @param id
	* @return 
	*/
	int isExistId(String id);

	/** 
	* @Method Name  : insertUser 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 새로운 사용자(사원)을 등록한다
	* @param evo
	* @return 
	*/
	int insertUser(EmployeeVO evo);

	/** 
	* @Method Name  : getEmployeeList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 사원 목록을 가져온다
	* @return 
	*/
	List<EmployeeVO> getEmployeeList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getTotalCountEmployeeList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 사원수를 가져온다
	* @param paraMap
	* @return 
	*/
	int getTotalCountEmployeeList(Map<String, String> paraMap);

	/** 
	* @Method Name  : batchWorkType 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 선택한 회원의 근무형태를 일괄 변경한다
	* @param bvo
	* @return 
	*/
	int batchWorkType(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : batchPosition 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 선택한 회원의 직위를 일괄 변경한다
	* @param bvo
	* @return 
	*/
	int batchPosition(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : batchStatus 
	* @작성일   : 2024. 1. 7 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 선택한 회원의 상태를 일괄 변경한다
	* @param bvo
	* @return 
	*/
	int batchStatus(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : getFullAdminList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 전체 관리자 목록을 가져온다
	* @return 
	*/
	List<AdminVO> getFullAdminList();

	/** 
	 * @param searchWord 
	* @Method Name  : getNoneFullAdminEmployeeList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 전체 관리자가 아닌 회원 목록을 가져온다
	* @return 
	*/
	List<EmployeeVO> getNoneFullAdminEmployeeList(String searchWord);


	/** 
	* @Method Name  : isAlreadyAdmin 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 이미 관리자로 등록되어있는지 확인한다
	* @param empMap
	* @return 
	*/
	int isAlreadyAdmin(Map<String, Long> empMap);

	/** 
	* @Method Name  : deleteAdminByEmpId 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 관리자를 사원id로 지운다
	* @param empMap
	* @return 
	*/
	int deleteAdminByEmpId(Map<String, Long> empMap);

	/** 
	* @Method Name  : updateAdminHistoryByEmpId 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 관리자 이력을 사원id를 통해 검색해 수정한다
	* @param empMap
	* @return 
	*/
	int updateAdminHistoryByEmpId(Map<String, Long> empMap);

	/** 
	* @Method Name  : addFullAdminManager 
	* @작성일   : 2024. 1. 10 
	* @작성자   : 신예진 (yejjinny) 
	* @변경이력  : 
	* @Method 설명 : 전체 관리자를 추가한다
	* @param empMap
	* @return 
	*/
	int addFullAdminManager(Map<String, Long> empMap);

}
