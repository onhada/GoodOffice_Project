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
	* @Method Name  : hasReturn 
	* @작성일   : 2023. 12. 8 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재절차 테이블에서 해당 전자결재id 반려 존재여부
	* @param fk_approvalId
	* @return 
	*/
	int hasReturn(Long fk_approvalId);

	/** 
	* @Method Name  : hasApplicantAndApproverAllAccept 
	* @작성일   : 2023. 12. 9 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 결재자와 신청자가 모두 승인했는지 확인한다 (0일 경우 모두 승인, 그 외의 경우 모두 승인하기 전)
	* @param paramMap
	* @return 
	*/
	int hasApplicantAndApproverAllAccept(Map<String, Long> paramMap);

	/** 
	* @Method Name  : hasAllAccept 
	* @작성일   : 2023. 12. 10 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전원 승인했는지 확인 (0: 전원 승인)
	* @param paramMap
	* @return 
	*/
	int hasAllAccept(Map<String, Long> paramMap);




	/** 
	* @Method Name  : getApprovalTempBox_withPaging 
	* @작성일   : 2023. 12. 11 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 임시저장 문서 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalTempBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getSecurityLevelList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 기존 보안 등급별 열람 정보를 가져온다
	* @return 
	*/
	List<SecurityVO> getSecurityLevelDetailList();



	/** 
	* @Method Name  : getSecurityLevelList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 보안등급 정보를 가져온다
	* @return 
	*/
	List<SecurityVO> getSecurityLevelList();




	/** 
	* @Method Name  : setSecurityLevelA 
	* @작성일   : 2023. 12. 12 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 보안등급 A의 값 수정
	* @param level
	* @return 
	*/
	int setSecurityLevelA(String level);




	/** 
	* @Method Name  : setSecurityLevelB 
	* @작성일   : 2023. 12. 12 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 보안등급 B의 값 수정
	* @param string 
	*/
	int setSecurityLevelB(String level);


	/** 
	* @Method Name  : getFormList 
	* @작성일   : 2023. 12. 12 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_양식함 관리 메인 화면
	* @return 
	*/
	List<FormVO> getFormList(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalFormList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_양식함 관리_양식 갯수 취득
	* @param searchWord
	* @return 
	*/
	int getTotalCountApprovalFormList(String searchWord);

	/** 
	* @Method Name  : getApprovalDocumentAllList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_전체 문서 목록
	* @return 
	*/
	List<ApprovalVO> getDocumentAllList_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountDocumentAllList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_전체 문서 목록 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountDocumentAllList(Map<String, String> paraMap);



	/** 
	* @Method Name  : getTotalCountDocumentDeleteList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_삭제 문서 목록 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountDocumentDeleteList(Map<String, String> paraMap);



	/** 
	* @Method Name  : getDocumentDeleteList_withSearchAndPaging 
	* @작성일   : 2023. 12. 13 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_삭제 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getDocumentDeleteList_withSearchAndPaging(Map<String, String> paraMap);



	/** 
	* @Method Name  : getAdminList 
	* @작성일   : 2023. 12. 13 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_전자결재 관리자 목록 취득
	* @return 
	*/
	List<AdminVO> getAdminList();

	/** 
	* @Method Name  : getApprovalDocumentView 
	* @작성일   : 2023. 12. 16 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기
	* @param paraMap
	* @return 
	*/
	ApprovalDetailVO getApprovalDocumentView(Map<String, Long> paraMap);


	/** 
	* @Method Name  : getApprovalDocumentView_Procedure 
	* @작성일   : 2023. 12. 16 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_절차 취득
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getApprovalDocumentView_Procedure(Long approvalId);


	/** 
	* @Method Name  : getApprovalDocumentView_File 
	* @작성일   : 2023. 12. 16 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_파일 목록 취득
	* @param approvalId
	* @return 
	*/
	List<ApprovalFileVO> getApprovalDocumentView_File(Long approvalId);



	/** 
	* @Method Name  : getApprovalOpinion 
	* @작성일   : 2023. 12. 18 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_의견 목록 취득
	* @param approvalId
	* @return 
	*/
	List<ApprovalOpinionVO> getApprovalOpinionList(Long approvalId);



	/** 
	* @Method Name  : isDraftEmp 
	* @작성일   : 2023. 12. 18 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_기안한 사원인지 여부 취득
	* @param approvalId
	* @param empId
	* @return 
	*/
	int isDraftEmp(Map<String, Long> paraMap);

	/** 
	* @Method Name  : updateApprovalSecurity 
	* @작성일   : 2023. 12. 18 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_보안 등급 수정
	* @param paraMap
	* @return 
	*/
	int updateApprovalSecurity(Map<String, Long> paraMap);



	/** 
	* @Method Name  : searchEmpName 
	* @작성일   : 2023. 12. 19 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_사원명 검색
	* @param empName
	* @return 
	*/
	List<EmployeeVO> searchEmpName(String empName);



	/** 
	* @Method Name  : updateApprovalLineSetting 
	* @작성일   : 2023. 12. 19 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_결재선 수정
	* @param updateList
	* @return 
	*/
	int updateApprovalLineSetting(Map<String, String> paraMap);


	/** 
	* @Method Name  : getProcedureTypeApproval 
	* @작성일   : 2023. 12. 19 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_절차 취득
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeApproval(Long approvalId);



	/** 
	* @Method Name  : insertApprovalLineSetting 
	* @작성일   : 2023. 12. 20 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_결재선 추가
	* @param paraMap 
	*/
	int insertApprovalLineSetting(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalProcedureLastSeq 
	* @작성일   : 2023. 12. 20 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_가장 마지막 절차 순서 취득
	* @param approvalId
	* @return 
	*/
	int getApprovalProcedureLastSeq(Long approvalId);


	/** 
	* @Method Name  : deleteApprovalLineSetting 
	* @작성일   : 2023. 12. 20 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_결재선 삭제
	* @param paraMap 
	*/
	int deleteApprovalLineSetting(Map<String, String> paraMap);



	/** 
	* @Method Name  : addRef 
	* @작성일   : 2023. 12. 20 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_참조, 수신참조, 수신 추가
	* @param paraMap
	* @return 
	*/
	int addRef(Map<String, String> paraMap);


	/** 
	* @Method Name  : getUserProcedureType 
	* @작성일   : 2023. 12. 20 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_유저의 절차 타입 취득
	* @param paraMap
	* @return 
	*/
	Integer getUserProcedureType(Map<String, Long> paraMap);



	/** 
	* @Method Name  : delRef 
	* @작성일   : 2023. 12. 20 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_참조, 수신참조, 수신 삭제
	* @param paraMap
	* @return 
	*/
	int delRef(Map<String, String> paraMap);


	/** 
	* @Method Name  : updateApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_파일 수정
	* @param paraMap
	* @return 
	*/
	int updateApprovalFile(Map<String, String> paraMap);

	/** 
	* @Method Name  : deleteApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_파일 삭제
	* @param paraMap
	* @return 
	*/
	int deleteApprovalFile(Map<String, String> paraMap);

	/** 
	* @Method Name  : insertApprovalFile 
	* @작성일   : 2023. 12. 21 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_파일 추가
	* @param paraMap
	* @return 
	*/
	int insertApprovalFile(Map<String, String> paraMap);



	/** 
	* @Method Name  : getApprovalDocumentFile 
	* @작성일   : 2023. 12. 22 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_파일 상세
	* @param fileId
	* @return 
	*/
	ApprovalFileVO getApprovalDocumentFile(Long fileId);


	/** 
	* @Method Name  : insertOpinion 
	* @작성일   : 2023. 12. 22 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_의견 등록
	* @param paraMap
	* @return 
	*/
	int insertOpinion(Map<String, String> paraMap);



	/** 
	* @Method Name  : deleteOpinion 
	* @작성일   : 2023. 12. 22 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_의견 삭제
	* @param opinionId
	* @return 
	*/
	int deleteOpinion(Long opinionId);



	/** 
	* @Method Name  : deleteImportant 
	* @작성일   : 2023. 12. 23 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_중요 삭제
	* @param paraMap
	* @return 
	*/
	int deleteImportant(Map<String, Long> paraMap);



	/** 
	* @Method Name  : insertImportant 
	* @작성일   : 2023. 12. 23 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_중요 등록
	* @param paraMap
	* @return 
	*/
	int insertImportant(Map<String, Long> paraMap);











	/** 
	* @Method Name  : insertActionOfApproval 
	* @작성일   : 2023. 12. 23 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_결재하기
	* @param paraMap
	* @return 
	*/
	int updateActionOfApproval(Map<String, String> paraMap);

	/** 
	* @Method Name  : updateRefRead 
	* @작성일   : 2023. 12. 23 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_읽음처리하기
	* @param paraMap
	* @return 
	*/
	int updateRefRead(Map<String, Long> paraMap);


	/** 
	* @Method Name  : updateApprovalComplete 
	* @작성일   : 2023. 12. 24 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_결재 완료 처리하기
	* @param paraMap
	* @return 
	*/
	int updateApprovalComplete(Map<String, String> paraMap);



	/** 
	* @Method Name  : getEmpProofDetail 
	* @작성일   : 2023. 12. 24 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서_상세보기_재직증명서 취득
	* @param paraMap
	* @return 
	*/
	EmpProofDetailVO getEmpProofDetail(Map<String, Long> paraMap);


	/** 
	* @Method Name  : getProcedureTypeApplication 
	* @작성일   : 2023. 12. 24 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_신청 +버튼_확인 눌렀을 경우_기존에 있던 거인지, 추가한거인지 확인하기 위한 기존 값 리스트
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeApplication(Long approvalId);



	/** 
	* @Method Name  : getProcedureTypeAgree 
	* @작성일   : 2023. 12. 26 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_합의 +버튼_확인 눌렀을 경우_기존에 있던 거인지, 추가한거인지 확인하기 위한 기존 값 리스트
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeAgree(Long approvalId);

	/** 
	* @Method Name  : getProcedureTypeFiAgree 
	* @작성일   : 2023. 12. 26 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_재무 합의 +버튼_확인 눌렀을 경우_기존에 있던 거인지, 추가한거인지 확인하기 위한 기존 값 리스트
	* @param approvalId
	* @return 
	*/
	List<ApprovalProcedureVO> getProcedureTypeFiAgree(Long approvalId);


	/** 
	* @Method Name  : getWorkApplicationDetail 
	* @작성일   : 2023. 12. 27 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_연장근무 혹은 휴일근무 신청
	* @param approvalId
	* @return 
	*/
	WorkApplicationVO getWorkApplicationDetail(Long approvalId);

	/** 
	* @Method Name  : getFormNameList 
	* @작성일   : 2023. 12. 27 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_목록화면에서 문서 드롭다운 리스트에 보여줄 문서 종류 리스트
	* @return 
	*/
	List<FormVO> getFormNameList();


	/** 
	* @Method Name  : getDayOffDetail 
	* @작성일   : 2023. 12. 27 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_휴가 신청
	* @param approvalId
	* @return 
	*/
	DayOffVO getDayOffDetail(Long approvalId);

	/** 
	* @Method Name  : getDayOffSimple 
	* @작성일   : 2023. 12. 29 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_휴가 신청 _ sql문에 사용하기 위해 간단한 정보 취득
	* @param approvalId
	* @return 
	*/
	DayOffVO getDayOffSimple(Long approvalId);

	/** 
	* @Method Name  : getModifyWorkRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_근무체크 수정 정보
	* @param approvalId
	* @return 
	*/
	ModifyWorkRequestVO getModifyWorkRequest(Long approvalId);



	/** 
	* @Method Name  : updateWorkHistoryByRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_근무체크 수정
	* @param mdvo
	* @return 
	*/
	int updateWorkHistoryByRequest(ModifyDetailVO mdvo);


	/** 
	* @Method Name  : insertWorkHistoryByRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_근무체크 추가
	* @param mdvo
	* @return 
	*/
	int insertWorkHistoryByRequest(ModifyDetailVO mdvo);


	/** 
	* @Method Name  : deleteWorkHistoryByRequest 
	* @작성일   : 2023. 12. 28 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_근무체크 삭제
	* @param mdvo
	* @return 
	*/
	int deleteWorkHistoryByRequest(ModifyDetailVO mdvo);


	/** 
	* @Method Name  : updateReadReturn 
	* @작성일   : 2023. 12. 29 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_반려 읽었을 경우 읽음처리
	* @param paraMap
	* @return 
	*/
	int updateReadReturn(Map<String, Long> paraMap);


	/** 
	* @Method Name  : cancleApproval 
	* @작성일   : 2023. 12. 29 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_기안 취소
	* @param paraMap
	* @return 
	*/
	int cancleApproval(Map<String, Long> paraMap);


	/** 
	* @Method Name  : getPreservationYear 
	* @작성일   : 2023. 12. 29 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_작성하기 _문서종류에 따른 보존연한 취득
	* @param formId
	* @return 
	*/
	int getPreservationYear(Long formId);

	/** 
	* @Method Name  : insertApprovalDocument 
	* @작성일   : 2023. 12. 30 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_기안하기
	* @param paraMap
	* @return 
	*/
	int insertApprovalDocument(Map<String, String> paraMap);

	/** 
	* @Method Name  : getApprovalSequence 
	* @작성일   : 2023. 12. 30 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_작성하기 _시퀀스값 취득
	* @return 
	*/
	String getApprovalSequence();


	/** 
	* @Method Name  : insertApplicant 
	* @작성일   : 2023. 12. 30 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_기안자 넣기
	* @param paraMap
	* @return 
	*/
	int insertApplicant(Map<String, String> paraMap);


	/** 
	* @Method Name  : insertBusinessContact 
	* @작성일   : 2023. 12. 30 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_본문 정보_업무연락 
	* @param paraMap
	* @return 
	*/
	int insertBusinessContact(Map<String, String> paraMap);


	/** 
	* @Method Name  : insertTempApprovalDocument 
	* @작성일   : 2023. 12. 30 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_임시저장
	* @param paraMap
	* @return 
	*/
	int insertTempApprovalDocument(Map<String, String> paraMap);


	/** 
	* @Method Name  : insertCircular 
	* @작성일   : 2024. 1. 3 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_본문 정보_업무연락 
	* @param paraMap
	* @return 
	*/
	int insertCircular(Map<String, String> paraMap);


	/** 
	* @Method Name  : insertApprovalDocument_circular 
	* @작성일   : 2024. 1. 3 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_기안하기 (회람)
	* @param paraMap
	* @return 
	*/
	int insertApprovalDocument_circular(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertEmpProof 
	* @작성일   : 2024. 1. 3 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_본문 정보_재직증명서
	* @param paraMap
	* @return 
	*/
	int insertEmpProof(Map<String, String> paraMap);











	/** 
	* @Method Name  : insertRoundRobin 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기_본문 정보_품의서
	* @param paraMap
	* @return 
	*/
	int insertRoundRobin(Map<String, String> paraMap);



	/** 
	* @Method Name  : getFormId 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_작성하기 _formId 취득
	* @param approvalId
	* @return 
	*/
	Long getFormId(Long approvalId);



	/** 
	* @Method Name  : deleteApprovalProcedure 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장 되어있던 절차 내용_삭제
	* @param approvalId
	* @return 
	*/
	int deleteApprovalProcedure(String approvalId);


	/** 
	* @Method Name  : updateApprovalDocument 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장 되어있던 내용_수정
	* @param paraMap
	* @return 
	*/
	int updateApprovalDocument(Map<String, String> paraMap);



	/** 
	* @Method Name  : updateApprovalDocument_circular 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장 되어있던 내용(회람)_수정
	* @param paraMap
	* @return 
	*/
	int updateApprovalDocument_circular(Map<String, String> paraMap);



	/** 
	* @Method Name  : updateBusinessContact 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장_임시저장_본문 정보_업무연락
	* @param paraMap
	* @return 
	*/
	int updateBusinessContact(Map<String, String> paraMap);


	/** 
	* @Method Name  : updateEmpProof 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장_임시저장_본문 정보_재직증명서
	* @param paraMap
	* @return 
	*/
	int updateEmpProof(Map<String, String> paraMap);




	/** 
	* @Method Name  : updateRoundRobin 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장_임시저장_본문 정보_품의서
	* @param paraMap
	* @return 
	*/
	int updateRoundRobin(Map<String, String> paraMap);




	/** 
	* @Method Name  : updateCircular 
	* @작성일   : 2024. 1. 4 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_임시저장_임시저장_본문 정보_회람
	* @param paraMap
	* @return 
	*/
	int updateCircular(Map<String, String> paraMap);



	/** 
	* @Method Name  : batchApproval 
	* @작성일   : 2024. 1. 5 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_일괄 결재
	* @param bvo
	* @return 
	*/
	int batchApproval(BatchVO bvo);



	/** 
	* @Method Name  : batchCheck 
	* @작성일   : 2024. 1. 5 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_일괄 확인
	* @param bvo
	* @return 
	*/
	int batchCheck(BatchVO bvo);



	/** 
	* @Method Name  : batchDelete 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_일괄 삭제
	* @param bvo
	* @return 
	*/
	int batchDelete(BatchVO bvo);



	/** 
	* @Method Name  : batchRestore 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_일괄 복원
	* @param bvo
	* @return 
	*/
	int batchRestore(BatchVO bvo);



	/** 
	* @Method Name  : addAppovalAdminManager 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 추가
	* @param paraMap
	* @return 
	*/
	int addAppovalAdminManager(Map<String, Long> paraMap);


	/** 
	* @Method Name  : getAdminSequence 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 추가_시퀀스값 취득
	* @return 
	*/
	Long getAdminSequence();


	/** 
	* @Method Name  : addAdminHistory 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 추가 이력 넣기
	* @param paraMap
	* @return 
	*/
	int addAdminHistory(Map<String, Long> paraMap);



	/** 
	* @Method Name  : deleteAppovalAdminManager 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 삭제
	* @param paraMap
	* @return 
	*/
	int deleteAppovalAdminManager(Map<String, Long> paraMap);


	/** 
	* @Method Name  : updateAdminHistory 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 삭제 이력 넣기
	* @param paraMap
	* @return 
	*/
	int updateAdminHistory(Map<String, Long> paraMap);



	/** 
	* @Method Name  : grantAdminRead 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 전체문서 열람 허용 비허용 설정 
	* @param paraMap
	* @return 
	*/
	int grantAdminRead(Map<String, Long> paraMap);



	/** 
	* @Method Name  : getAdminHistoryList 
	* @작성일   : 2024. 1. 6 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자설정 _관리자 설정 이력
	* @return 
	*/
	List<AdminHistoryVO> getAdminHistoryList();


	/** 
	* @Method Name  : getFormDetail 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_양식함 관리_양식 상세
	* @param formId
	* @return 
	*/
	FormVO getFormDetail(Long formId);



	/** 
	* @Method Name  : getFormNameListByWrite 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 작성시 드롭다운 리스트에 보여줄 문서 종류 리스트
	* @return 
	*/
	List<FormVO> getFormNameListByWrite();



	/** 
	* @Method Name  : updateForm 
	* @작성일   : 2024. 1. 8 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_양식함 관리_양식 상세_수정
	* @param paraMap
	* @return 
	*/
	int updateForm(Map<String, String> paraMap);

	
	/** 
	* @Method Name  : isReadAble 
	* @작성일   : 2024. 1. 11 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_열람 허용 여부
	* @param paraMap
	* @return 
	*/
	int isReadAble(Map<String, Long> paraMap);



	/** 
	* @Method Name  : isAlreadyAdmin 
	* @작성일   : 2024. 1. 11 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_관리자 설정_관리자 추가 전 다른 기능 관리자인지 체크
	* @param empId
	* @return 
	*/
	int isAlreadyAdmin(Long empId);


	/** 
	* @Method Name  : isExistApproval 
	* @작성일   : 2024. 1. 11 
	* @작성자   : 신예진 (yejjinny)
	* @변경이력  : 
	* @Method 설명 : 전자결재_상세보기_존재하는 전자결재 문서인지 확인
	* @param paraMap
	* @return 
	*/
	int isExistApproval(Map<String, Long> paraMap);


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 
	* @Method Name  : getApprovalProgressList_withSearchAndPaging 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_진행 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalProgressList_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalScheduleList_withSearchAndPaging 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_예정 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalScheduleList_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalCheckList_withSearchAndPaging 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_확인 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalCheckList_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalWaitingList_withSearchAndPaging 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_대기 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalWaitingList_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalAllIngList_withSearchAndPaging 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_전체 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalAllIngList_withSearchAndPaging(Map<String, String> paraMap);

	
	
	
	
	
	
	
	
	
	
	

	/** 
	* @Method Name  : getTotalCountApprovalAllIngList 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_전체 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalAllIngList(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalWaitingList 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_대기 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalWaitingList(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalCheckList 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_확인 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalCheckList(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalScheduleList 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_예정 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalScheduleList(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalProgressList 
	* @작성일   : 2024. 1. 19 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_진행 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalProgressList(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalAllBox_withViewAllAndSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_전체 문서 + 열람문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalAllBox_withViewAllAndSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalAllBox_withSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_전체 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalAllBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalWriterBox_withSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_기안/신청 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalWriterBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalApprovalBox_withSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_결재/처리/합의/재무합의 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalApprovalBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalReferBox_withSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_참조 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalReferBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalReadBox_withSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_수신/수신참조 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalReadBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getApprovalReturnBox_withSearchAndPaging 
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_반려 문서 목록 취득
	* @param paraMap
	* @return 
	*/
	List<ApprovalVO> getApprovalReturnBox_withSearchAndPaging(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalAllBox_withViewAll
	* @작성일   : 2024. 1. 20 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_전체 문서 + 열람 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalAllBox_withViewAll(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalAllBox
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_전체 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalAllBox(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalWriterBox 
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_기안/신청 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalWriterBox(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalApprovalBox 
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_결재/처리/합의/재무합의 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalApprovalBox(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalReferBox 
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_참조 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalReferBox(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalReadBox 
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_수신/수신참조 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalReadBox(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalReturnBox 
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_반려 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalReturnBox(Map<String, String> paraMap);


	/** 
	* @Method Name  : getTotalCountApprovalTempBox 
	* @작성일   : 2024. 1. 21 
	* @작성자   : 신예진 (yejjinny)   
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_임시문서 문서 총 갯수 취득
	* @param paraMap
	* @return 
	*/
	int getTotalCountApprovalTempBox(Map<String, String> paraMap);


}
