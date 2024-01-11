/** 
* @FileName  : ApprovalDAO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
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
* @작성자      : 신예진 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public interface AdminDAO {

	/** 
	* @Method Name  : getTeamList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<DepartmentVO> getDepList();

	/** 
	* @Method Name  : getPositionList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<PositionVO> getPositionList();

	/** 
	* @Method Name  : isExistId 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param id
	* @return 
	*/
	int isExistId(String id);

	/** 
	* @Method Name  : insertUser 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param evo
	* @return 
	*/
	int insertUser(EmployeeVO evo);

	/** 
	* @Method Name  : getEmployeeList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<EmployeeVO> getEmployeeList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getTotalCountEmployeeList 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int getTotalCountEmployeeList(Map<String, String> paraMap);

	/** 
	* @Method Name  : batchWorkType 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchWorkType(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : batchPosition 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchPosition(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : batchStatus 
	* @작성일   : 2024. 1. 7 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchStatus(BatchModifyUserVO bvo);

	/** 
	* @Method Name  : getFullAdminList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<AdminVO> getFullAdminList();

	/** 
	 * @param searchWord 
	* @Method Name  : getNoneFullAdminEmployeeList 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<EmployeeVO> getNoneFullAdminEmployeeList(String searchWord);


	/** 
	* @Method Name  : isAlreadyAdmin 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empMap
	* @return 
	*/
	int isAlreadyAdmin(Map<String, Long> empMap);

	/** 
	* @Method Name  : deleteAdminByEmpId 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empMap
	* @return 
	*/
	int deleteAdminByEmpId(Map<String, Long> empMap);

	/** 
	* @Method Name  : updateAdminHistoryByEmpId 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empMap
	* @return 
	*/
	int updateAdminHistoryByEmpId(Map<String, Long> empMap);

	/** 
	* @Method Name  : addFullAdminManager 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empMap
	* @return 
	*/
	int addFullAdminManager(Map<String, Long> empMap);













	
}
