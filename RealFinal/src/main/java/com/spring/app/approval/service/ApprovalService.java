/** 
* @FileName  : ApprovalService.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.service;

import java.util.List;
import java.util.Map;

import com.spring.app.approval.domain.AdminHistoryVO;
import com.spring.app.approval.domain.ApprovalDetailVO;
import com.spring.app.approval.domain.ApprovalFileVO;
import com.spring.app.approval.domain.ApprovalOpinionVO;
import com.spring.app.approval.domain.ApprovalProcedureVO;
import com.spring.app.approval.domain.ApprovalVO;
import com.spring.app.approval.domain.BatchVO;
import com.spring.app.approval.domain.DayOffVO;
import com.spring.app.approval.domain.EmpProofDetailVO;
import com.spring.app.approval.domain.FormVO;
import com.spring.app.approval.domain.ModifyWorkRequestVO;
import com.spring.app.approval.domain.SecurityVO;
import com.spring.app.approval.domain.WorkApplicationVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.EmployeeVO;

/** 
* @FileName  : ApprovalService.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : 신예진
* @변경이력	 : 
* @프로그램설명	 : 
*/
public interface ApprovalService {

	/** 
	* @Method Name  : getApprovalAllIngList_withSearchAndPaging 
	* @작성일   : 2023. 12. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public List<ApprovalVO> getApprovalAllIngList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalWaitingList_withSearchAndPaging 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalWaitingList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalCheckList_withSearchAndPaging 
	* @작성일   : 2023. 12. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalCheckList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalScheduleList_withSearchAndPaging 
	* @작성일   : 2023. 12. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalScheduleList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalProgressList_withSearchAndPaging 
	* @작성일   : 2023. 12. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalProgressList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalAllBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalAllBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalWriterBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalWriterBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalApprovalBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalApprovalBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalReferBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalReferBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalReadBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalReadBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalReturnBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalReturnBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalTempBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getApprovalTempBox_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getSecurityLevelList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 기존 보안 등급별 열람 정보를 가져온다
	* @return 
	*/
	public List<SecurityVO> getSecurityLevelDetailList();

	/** 
	* @Method Name  : getSecurityLevelList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 보안등급 정보를 가져온다
	* @return 
	*/
	public List<SecurityVO> getSecurityLevelList();

	/** 
	* @Method Name  : setSecurityLevel 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급 수정
	* @param paraMap
	* @return 
	*/
	public boolean setSecurityLevel(Map<String, String> paraMap);

	/** 
	 * @param searchWord 
	* @Method Name  : getFormList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public List<FormVO> getFormList(Map<String, String> paraMap);

	/** 
	* @Method Name  : getTotalCountApprovalFormList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public int getTotalCountApprovalFormList(String searchWord);

	/** 
	* @Method Name  : getDocumentAllList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getDocumentAllList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getTotalCountDocumentAllList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public int getTotalCountDocumentAllList(Map<String, String> paraMap);

	/** 
	* @Method Name  : getTotalCountDocumentDeleteList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public int getTotalCountDocumentDeleteList(Map<String, String> paraMap);

	/** 
	* @Method Name  : getDocumentDeleteList_withSearchAndPaging 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalVO> getDocumentDeleteList_withSearchAndPaging(Map<String, String> paraMap);

	/** 
	* @Method Name  : getAdminList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public List<AdminVO> getAdminList();

	/** 
	* @Method Name  : getApprovalDocumentView 
	* @작성일   : 2023. 12. 16 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public ApprovalDetailVO getApprovalDocumentView(Map<String, Long> paraMap);

	/** 
	* @Method Name  : getApprovalOpinion 
	* @작성일   : 2023. 12. 18 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재 상세의 의견
	* @param approvalId
	* @return 
	*/
	public List<ApprovalOpinionVO> getApprovalOpinionList(Long approvalId);

	/** 
	 * @param empId 
	 * @param approvalId 
	* @Method Name  : isDraftEmp 
	* @작성일   : 2023. 12. 18 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 기안 혹은 신청자인지 확인
	* @return 
	*/
	public int isDraftEmp(Map<String, Long> paraMap);

	/** 
	* @Method Name  : updateApprovalSecurity 
	* @작성일   : 2023. 12. 18 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public int updateApprovalSecurity(Map<String, Long> paraMap);

	/** 
	* @Method Name  : searchEmpName 
	* @작성일   : 2023. 12. 19 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empName
	* @return 
	*/
	public List<EmployeeVO> searchEmpName(String empName);

	/** 
	* @Method Name  : updateApprovalLineSetting 
	* @작성일   : 2023. 12. 19 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param updateList
	 * @param approvalId 
	* @return 
	*/
	public boolean updateApprovalLineSetting(List<ApprovalProcedureVO> updateList, Long approvalId, Long procedureType);
	
	public List<ApprovalProcedureVO> getProcedureTypeApproval(Long approvalId);

	/** 
	* @Method Name  : addRef 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param refType
	* @param empId
	 * @param approvalId 
	* @return 
	*/
	public boolean addRef(String refType, Long empId, Long approvalId);

	/** 
	* @Method Name  : userProcedureType 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 유저 결재절차 타입
	* @param paraMap
	* @return 
	*/
	public int getUserProcedureType(Map<String, Long> paraMap);

	/** 
	* @Method Name  : delRef 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param refType
	* @param empId
	* @param approvalId
	* @return 
	*/
	public boolean delRef(Long empId, Long approvalId);

	/** 
	* @Method Name  : insertOrUpdateApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param parameter
	* @param afList
	* @return 
	*/
	public boolean insertOrUpdateApprovalFile(String approvalId, List<ApprovalFileVO> afList);

	/** 
	* @Method Name  : deleteSavedFile 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param fileId
	* @return 
	*/
	public boolean deleteSavedFile(Long fileId);

	/** 
	* @Method Name  : getApprovalDocumentFile 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param parseLong
	* @return 
	*/
	public ApprovalFileVO getApprovalDocumentFile(Long parseLong);

	/** 
	* @Method Name  : insertOpinion 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @param opinion
	* @return 
	*/
	public boolean insertOpinion(Map<String, String> paraMap);

	/** 
	* @Method Name  : deleteOpinion 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param opinionId
	* @return 
	*/
	public boolean deleteOpinion(Long opinionId);

	/** 
	* @Method Name  : isReturn 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean isReturn(Long approvalId);

	/** 
	* @Method Name  : deleteImportant 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean deleteImportant(Map<String, Long> paraMap);

	/** 
	* @Method Name  : insertImportant 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean insertImportant(Map<String, Long> paraMap);

	/** 
	* @Method Name  : updateActionOfApproval 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean updateActionOfApproval(Map<String, String> paraMap);

	/** 
	* @Method Name  : updateRefRead 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean updateRefRead(Map<String, Long> paraMap);

	/** 
	* @Method Name  : getEmpProofDetail 
	* @작성일   : 2023. 12. 24 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public EmpProofDetailVO getEmpProofDetail(Map<String, Long> paraMap);


	/** 
	* @Method Name  : updateRoundRobinApprovalLineSetting 
	* @작성일   : 2023. 12. 26 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param updateList
	 * @param procedureType 
	* @param long1
	* @return 
	*/
	public boolean updateRoundRobinApprovalLineSetting(List<ApprovalProcedureVO> updateList, Long approvalId, Long procedureType);


	/** 
	* @Method Name  : getProcedureTypeAgree 
	* @작성일   : 2023. 12. 26 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public List<ApprovalProcedureVO> getProcedureTypeAgree(Long approvalId);

	/** 
	* @Method Name  : getWorkApplicationDetail 
	* @작성일   : 2023. 12. 27 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	public WorkApplicationVO getWorkApplicationDetail(Long approvalId);

	/** 
	* @Method Name  : getFormNameList 
	* @작성일   : 2023. 12. 27 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public List<FormVO> getFormNameList();

	/** 
	* @Method Name  : getDayOffDetail 
	* @작성일   : 2023. 12. 27 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	public DayOffVO getDayOffDetail(Long approvalId);

	/** 
	* @Method Name  : getModifyWorkRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	public ModifyWorkRequestVO getModifyWorkRequest(Long approvalId);

	/** 
	* @Method Name  : updateReadReturn 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public int updateReadReturn(Map<String, Long> paraMap);

	/** 
	* @Method Name  : cancleApproval 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean cancleApproval(Map<String, Long> paraMap);

	/** 
	* @Method Name  : getPreservationYear 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param formId
	* @return 
	*/
	public int getPreservationYear(Long formId);

	/** 
	* @Method Name  : insertDocumentWrite 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraArrMap
	* @param paraMap
	* @return 
	*/
	public String insertDocumentWrite(Map<String, String[]> paraArrMap, Map<String, String> paraMap);

	/** 
	* @Method Name  : insertTempDocumentWrite 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraArrMap
	* @param paraMap
	* @return 
	*/
	public String insertTempDocumentWrite(Map<String, String[]> paraArrMap, Map<String, String> paraMap);

	/** 
	* @Method Name  : getFormId 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	public Long getFormId(Long approvalId);

	/** 
	* @Method Name  : batchApproval 
	* @작성일   : 2024. 1. 5 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	public int batchApproval(BatchVO bvo);

	/** 
	* @Method Name  : batchCheck 
	* @작성일   : 2024. 1. 5 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	public int batchCheck(BatchVO bvo);

	/** 
	* @Method Name  : batchDelete 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	public int batchDelete(BatchVO bvo);

	/** 
	* @Method Name  : batchRestore 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	public int batchRestore(BatchVO bvo);

	/** 
	* @Method Name  : addAppovalAdminManager 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean addAppovalAdminManager(Map<String, Long> paraMap);

	/** 
	* @Method Name  : deleteAppovalAdminManager 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean deleteAppovalAdminManager(Map<String, Long> paraMap);

	/** 
	* @Method Name  : grantAdminRead 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean grantAdminRead(Map<String, Long> paraMap);

	/** 
	* @Method Name  : getAdminHistoryList 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public List<AdminHistoryVO> getAdminHistoryList();

	/** 
	* @Method Name  : getFormDetail 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param formId
	* @return 
	*/
	public FormVO getFormDetail(Long formId);

	/** 
	* @Method Name  : getFormNameListByWrite 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public List<FormVO> getFormNameListByWrite();

	/** 
	* @Method Name  : updateForm 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	public boolean updateForm(Map<String, String> paraMap);

	/** 
	 * @param paraMap 
	* @Method Name  : isReadAble 
	* @작성일   : 2024. 1. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	public boolean isReadAble(Map<String, Long> paraMap);


}
