/** 
* @FileName  : ApprovalDAO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.model;

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
import com.spring.app.approval.domain.ModifyDetailVO;
import com.spring.app.approval.domain.ModifyWorkRequestVO;
import com.spring.app.approval.domain.SecurityVO;
import com.spring.app.approval.domain.WorkApplicationVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.EmployeeVO;

/** 
* @FileName  : ApprovalDAO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : 신예진 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public interface ApprovalDAO {

	/** 
	* @Method Name  : getApprovalAllIngList_withSearchAndPaging 
	* @작성일   : 2023. 12. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalAllIngList_withSearchAndPaging(Map<String, String> paraMap);


	
	
	
	
	
	
	
	
	
	/** 
	* @Method Name  : hasReturn 
	* @작성일   : 2023. 12. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재절차 테이블에서 해당 전자결재id 반려 존재여부
	* @param fk_approvalId
	* @return 
	*/
	int hasReturn(Long fk_approvalId);

	
	/** 
	* @Method Name  : hasLowerApplicantAllAccept 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 유저보다 하위 신청 or 기안자들이 전원 승인하였는지 확인용 (0 : 전원 승인)
	* @param paramMap
	* @return 
	*/
	int hasLowerApplicantAllAccept(Map<String, Long> paramMap);

	
	/** 
	* @Method Name  : hasLowerApplicantWait 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paramMap
	* @return 
	*/
	int hasLowerApplicantWait(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasUpperApplicantAndApproverWait 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 상위 신청 or 기안자 및 결재자 중에 대기가 있을 경우
	* @param paramMap
	* @return 
	*/
	int hasUpperApplicantAndApproverWait(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasLowerApplicantAndApproverAllAccept 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 유저보다 하위의 신청 or 기안자 및 결재 or 처리자가 다 승인했을 경우 (0: 전원 승인)
	* @param paramMap
	* @return 
	*/
	int hasLowerApplicantAndApproverAllAccept(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasLowerApplicantAndApproverWait 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 유저보다 하위의 신청 or 기안자 및 결재 or 처리자 중에 대기가 있을 경우
	* @param paramMap
	* @return 
	*/
	int hasLowerApplicantAndApproverWait(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasUpperApproverWait 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 유저보다 상위의 신청 or 기안자 및 결재 or 처리자 중에 대기가 있을 경우
	* @param paramMap
	* @return 
	*/
	int hasUpperApproverWait(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasApplicantAndApproverAllAccept 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 결재자와 신청자가 모두 승인했는지 확인한다 (0일 경우 모두 승인, 그 외의 경우 모두 승인하기 전)
	* @param paramMap
	* @return 
	*/
	int hasApplicantAndApproverAllAccept(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasUnderRankerAllAccept 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 하위 순서가 모두 승인하였는지 확인 (0: 전원 승인)
	* @param paramMap
	* @return 
	*/
	int hasUnderRankerAllAccept(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasUnderRankerWait 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 하위 순서 중에 대기가 있을 경우
	* @param paraMap
	* @return 
	*/
	int hasUnderRankerWait(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasUpperRankerWait 
	* @작성일   : 2023. 12. 9 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 상위 순서 중에 대기가 있을 경우
	* @param paramMap
	* @return 
	*/
	int hasUpperRankerWait(Map<String, Long> paramMap);











	/** 
	* @Method Name  : getApprovalAllBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalAllBox_withViewAllAndSearchAndPaging(Map<String, String> paraMap);











	/** 
	* @Method Name  : hasAllAccept 
	* @작성일   : 2023. 12. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전원 승인했는지 확인 (0: 전원 승인)
	* @param paramMap
	* @return 
	*/
	int hasAllAccept(Map<String, Long> paramMap);











	/** 
	* @Method Name  : getApprovalTempBox_withPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalTempBox_withSearchAndPaging(Map<String, String> paraMap);











	/** 
	* @Method Name  : getSecurityLevelList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 기존 보안 등급별 열람 정보를 가져온다
	* @return 
	*/
	List<SecurityVO> getSecurityLevelDetailList();











	/** 
	* @Method Name  : getSecurityLevelList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 보안등급 정보를 가져온다
	* @return 
	*/
	List<SecurityVO> getSecurityLevelList();



















	/** 
	* @Method Name  : setSecurityLevelA 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param string
	* @return 
	*/
	int setSecurityLevelA(String level);











	/** 
	* @Method Name  : setSecurityLevelB 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param string 
	*/
	int setSecurityLevelB(String level);











	/** 
	* @Method Name  : getFormList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_양식함 관리 메인 화면
	* @return 
	*/
	List<FormVO> getFormList(Map<String, String> paraMap);











	/** 
	* @Method Name  : getTotalCountApprovalFormList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param searchWord
	* @return 
	*/
	int getTotalCountApprovalFormList(String searchWord);











/////////////////////////////////////////////////////////////////////////////////////////
	/** 
	* @Method Name  : getApprovalDocumentAllList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_전체 문서 목록
	* @return 
	*/
	List<ApprovalVO> getDocumentAllList_withSearchAndPaging(Map<String, String> paraMap);











	/** 
	* @Method Name  : getTotalCountDocumentAllList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int getTotalCountDocumentAllList(Map<String, String> paraMap);











	/** 
	* @Method Name  : getTotalCountDocumentDeleteList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int getTotalCountDocumentDeleteList(Map<String, String> paraMap);











	/** 
	* @Method Name  : getDocumentDeleteList_withSearchAndPaging 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getDocumentDeleteList_withSearchAndPaging(Map<String, String> paraMap);











	/** 
	* @Method Name  : getAdminList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<AdminVO> getAdminList();











	/** 
	* @Method Name  : getApprovalAllBox_withSearchAndPaging 
	* @작성일   : 2023. 12. 16 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalAllBox_withSearchAndPaging(Map<String, String> paraMap);











	/** 
	* @Method Name  : getApprovalDocumentView 
	* @작성일   : 2023. 12. 16 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	ApprovalDetailVO getApprovalDocumentView(Map<String, Long> paraMap);











	/** 
	* @Method Name  : getApprovalDocumentView_Procedure 
	* @작성일   : 2023. 12. 16 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getApprovalDocumentView_Procedure(Long approvalId);











	/** 
	* @Method Name  : getApprovalDocumentView_File 
	* @작성일   : 2023. 12. 16 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalFileVO> getApprovalDocumentView_File(Long approvalId);





















	/** 
	* @Method Name  : getApprovalOpinion 
	* @작성일   : 2023. 12. 18 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalOpinionVO> getApprovalOpinionList(Long approvalId);











	/** 
	* @Method Name  : isDraftEmp 
	* @작성일   : 2023. 12. 18 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @param empId
	* @return 
	*/
	int isDraftEmp(Map<String, Long> paraMap);











	/** 
	* @Method Name  : updateApprovalSecurity 
	* @작성일   : 2023. 12. 18 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateApprovalSecurity(Map<String, Long> paraMap);











	/** 
	* @Method Name  : searchEmpName 
	* @작성일   : 2023. 12. 19 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param empName
	* @return 
	*/
	List<EmployeeVO> searchEmpName(String empName);











	/** 
	* @Method Name  : updateApprovalLineSetting 
	* @작성일   : 2023. 12. 19 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param updateList
	* @return 
	*/
	int updateApprovalLineSetting(Map<String, String> paraMap);











	/** 
	* @Method Name  : getProcedureTypeApproval 
	* @작성일   : 2023. 12. 19 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeApproval(Long approvalId);











	/** 
	* @Method Name  : insertApprovalLineSetting 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap 
	*/
	int insertApprovalLineSetting(Map<String, String> paraMap);











	/** 
	* @Method Name  : getApprovalProcedureLastSeq 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	int getApprovalProcedureLastSeq(Long approvalId);











	/** 
	* @Method Name  : deleteApprovalLineSetting 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap 
	*/
	int deleteApprovalLineSetting(Map<String, String> paraMap);











	/** 
	* @Method Name  : addRef 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int addRef(Map<String, String> paraMap);











	/** 
	* @Method Name  : getUserProcedureType 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int getUserProcedureType(Map<String, Long> paraMap);











	/** 
	* @Method Name  : delRef 
	* @작성일   : 2023. 12. 20 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int delRef(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateApprovalFile(Map<String, String> paraMap);

	/** 
	* @Method Name  : deleteApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int deleteApprovalFile(Map<String, String> paraMap);

	/** 
	* @Method Name  : insertApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertApprovalFile(Map<String, String> paraMap);











	/** 
	* @Method Name  : getApprovalDocumentFile 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param fileId
	* @return 
	*/
	ApprovalFileVO getApprovalDocumentFile(Long fileId);











	/** 
	* @Method Name  : insertOpinion 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertOpinion(Map<String, String> paraMap);











	/** 
	* @Method Name  : deleteOpinion 
	* @작성일   : 2023. 12. 22 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param opinionId
	* @return 
	*/
	int deleteOpinion(Long opinionId);











	/** 
	* @Method Name  : deleteImportant 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int deleteImportant(Map<String, Long> paraMap);











	/** 
	* @Method Name  : insertImportant 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertImportant(Map<String, Long> paraMap);











	/** 
	* @Method Name  : insertActionOfApproval 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateActionOfApproval(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateRefRead 
	* @작성일   : 2023. 12. 23 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateRefRead(Map<String, Long> paraMap);











	/** 
	* @Method Name  : updateApprovalComplete 
	* @작성일   : 2023. 12. 24 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateApprovalComplete(Map<String, String> paraMap);











	/** 
	* @Method Name  : getEmpProofDetail 
	* @작성일   : 2023. 12. 24 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	EmpProofDetailVO getEmpProofDetail(Map<String, Long> paraMap);











	/** 
	* @Method Name  : insertProcessLineSetting 
	* @작성일   : 2023. 12. 24 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	//int insertProcessLineSetting(Map<String, String> paraMap);











	/** 
	* @Method Name  : getProcedureTypeApplication 
	* @작성일   : 2023. 12. 24 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeApplication(Long approvalId);

	/** 
	* @Method Name  : insertApplicationLineSetting 
	* @작성일   : 2023. 12. 24 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	//int insertApplicationLineSetting(Map<String, String> paraMap);











	/** 
	* @Method Name  : getProcedureTypeAgree 
	* @작성일   : 2023. 12. 26 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeAgree(Long approvalId);

	/** 
	* @Method Name  : getProcedureTypeFiAgree 
	* @작성일   : 2023. 12. 26 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeFiAgree(Long approvalId);











	/** 
	* @Method Name  : getWorkApplicationDetail 
	* @작성일   : 2023. 12. 27 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	WorkApplicationVO getWorkApplicationDetail(Long approvalId);











	/** 
	* @Method Name  : getFormNameList 
	* @작성일   : 2023. 12. 27 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<FormVO> getFormNameList();











	/** 
	* @Method Name  : getDayOffDetail 
	* @작성일   : 2023. 12. 27 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	DayOffVO getDayOffDetail(Long approvalId);

	/** 
	* @Method Name  : getDayOffSimple 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	DayOffVO getDayOffSimple(Long approvalId);









	/** 
	* @Method Name  : getModifyWorkRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	ModifyWorkRequestVO getModifyWorkRequest(Long approvalId);











	/** 
	* @Method Name  : updateWorkHistoryByRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param mdvo
	* @return 
	*/
	int updateWorkHistoryByRequest(ModifyDetailVO mdvo);











	/** 
	* @Method Name  : insertWorkHistoryByRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param mdvo
	* @return 
	*/
	int insertWorkHistoryByRequest(ModifyDetailVO mdvo);











	/** 
	* @Method Name  : deleteWorkHistoryByRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param mdvo
	* @return 
	*/
	int deleteWorkHistoryByRequest(ModifyDetailVO mdvo);











	/** 
	* @Method Name  : updateReadReturn 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateReadReturn(Map<String, Long> paraMap);











	/** 
	* @Method Name  : cancleApproval 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int cancleApproval(Map<String, Long> paraMap);











	/** 
	* @Method Name  : getPreservationYear 
	* @작성일   : 2023. 12. 29 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param formId
	* @return 
	*/
	int getPreservationYear(Long formId);











	/** 
	* @Method Name  : insertApprovalDocument 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertApprovalDocument(Map<String, String> paraMap);











	/** 
	* @Method Name  : getApprovalSequence 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	String getApprovalSequence();











	/** 
	* @Method Name  : insertApplicant 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertApplicant(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertBusinessContact 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertBusinessContact(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertTempApprovalDocument 
	* @작성일   : 2023. 12. 30 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertTempApprovalDocument(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertCircular 
	* @작성일   : 2024. 1. 3 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertCircular(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertApprovalDocument_circular 
	* @작성일   : 2024. 1. 3 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertApprovalDocument_circular(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertEmpProof 
	* @작성일   : 2024. 1. 3 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertEmpProof(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertRoundRobin 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int insertRoundRobin(Map<String, String> paraMap);











	/** 
	* @Method Name  : getFormId 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param approvalId
	* @return 
	*/
	Long getFormId(Long approvalId);











	/** 
	* @Method Name  : deleteApprovalProcedure 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param string
	* @return 
	*/
	int deleteApprovalProcedure(String string);











	/** 
	* @Method Name  : updateApprovalDocument 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateApprovalDocument(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateApprovalDocument_circular 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateApprovalDocument_circular(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateBusinessContact 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateBusinessContact(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateEmpProof 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateEmpProof(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateRoundRobin 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateRoundRobin(Map<String, String> paraMap);











	/** 
	* @Method Name  : updateCircular 
	* @작성일   : 2024. 1. 4 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateCircular(Map<String, String> paraMap);











	/** 
	* @Method Name  : batchApproval 
	* @작성일   : 2024. 1. 5 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchApproval(BatchVO bvo);











	/** 
	* @Method Name  : batchCheck 
	* @작성일   : 2024. 1. 5 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchCheck(BatchVO bvo);











	/** 
	* @Method Name  : batchDelete 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchDelete(BatchVO bvo);











	/** 
	* @Method Name  : batchRestore 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param bvo
	* @return 
	*/
	int batchRestore(BatchVO bvo);











	/** 
	* @Method Name  : addAppovalAdminManager 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int addAppovalAdminManager(Map<String, Long> paraMap);











	/** 
	* @Method Name  : getAdminSequence 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	Long getAdminSequence();











	/** 
	* @Method Name  : addAdminHistory 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int addAdminHistory(Map<String, Long> paraMap);



	/** 
	* @Method Name  : deleteAppovalAdminManager 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int deleteAppovalAdminManager(Map<String, Long> paraMap);


	/** 
	* @Method Name  : updateAdminHistory 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateAdminHistory(Map<String, Long> paraMap);











	/** 
	* @Method Name  : grantAdminRead 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int grantAdminRead(Map<String, Long> paraMap);











	/** 
	* @Method Name  : getAdminHistoryList 
	* @작성일   : 2024. 1. 6 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<AdminHistoryVO> getAdminHistoryList();











	/** 
	* @Method Name  : getFormDetail 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param formId
	* @return 
	*/
	FormVO getFormDetail(Long formId);











	/** 
	* @Method Name  : getFormNameListByWrite 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @return 
	*/
	List<FormVO> getFormNameListByWrite();











	/** 
	* @Method Name  : updateForm 
	* @작성일   : 2024. 1. 8 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 
	* @param paraMap
	* @return 
	*/
	int updateForm(Map<String, String> paraMap);





























	
}
