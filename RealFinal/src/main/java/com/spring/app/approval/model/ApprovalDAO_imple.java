/** 
* @FileName  : ApprovalDAO_imple.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
 *   @FileName  : ApprovalDAO_imple.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 5 
 * @작성자      : 신예진 
 * @변경이력 : 
 * @프로그램설명 : 
 */

@Repository
public class ApprovalDAO_imple implements ApprovalDAO {

	@Resource
	private SqlSessionTemplate sqlSession;

	@Override
	public int hasReturn(Long fk_approvalId) {
		// 전자결재절차 테이블에서 해당 전자결재id 반려 존재여부
		return sqlSession.selectOne("approval.hasReturn", fk_approvalId);
	}

	@Override
	public int hasApplicantAndApproverAllAccept(Map<String, Long> paramMap) {
		// 결재자와 신청자가 모두 승인했는지 확인한다 (0: 전원 승인, 그 외의 경우 모두 승인하기 전)
		return sqlSession.selectOne("approval.hasApplicantAndApproverAllAccept", paramMap);
	}

	@Override
	public int hasAllAccept(Map<String, Long> paramMap) {
		// 전원 승인했는지 확인
		return sqlSession.selectOne("approval.hasAllAccept", paramMap);
	}

	@Override
	public List<ApprovalVO> getApprovalTempBox_withSearchAndPaging(Map<String, String> paraMap) {
		// 임시저장함
		return sqlSession.selectList("approval.getApprovalTempBox_withSearchAndPaging", paraMap);
	}

	@Override
	public List<SecurityVO> getSecurityLevelDetailList() {
		// 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 기존 보안 등급별 열람 정보를 가져온다
		return sqlSession.selectList("approval.getSecurityLevelDetailList");
	}

	@Override
	public List<SecurityVO> getSecurityLevelList() {
		// 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 보안등급 정보를 가져온다
		return sqlSession.selectList("approval.getSecurityLevelList");
	}

	@Override
	public int setSecurityLevelA(String level) {
		// 전자결재_관리자 설정_기본 설정_보안 등급 설정 A등급
		return sqlSession.insert("approval.setSecurityLevelA", level);
	}

	@Override
	public int setSecurityLevelB(String level) {
		// 전자결재_관리자 설정_기본 설정_보안 등급 B등급
		return sqlSession.insert("approval.setSecurityLevelB", level);
	}

	@Override
	public List<FormVO> getFormList(Map<String, String> paraMap) {
		// 전자결재_관리자 설정_양식함 관리_메인화면
		return sqlSession.selectList("approval.getFormList", paraMap);
	}

	@Override
	public int getTotalCountApprovalFormList(String searchWord) {
		// 전자결재_관리자 설정_양식함 관리_메인화면
		return sqlSession.selectOne("approval.getTotalCountApprovalFormList", searchWord);
	}

	@Override
	public List<ApprovalVO> getDocumentAllList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getDocumentAllList_withSearchAndPaging", paraMap);
	}

	@Override
	public int getTotalCountDocumentAllList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountDocumentAllList", paraMap);
	}

	@Override
	public int getTotalCountDocumentDeleteList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountDocumentDeleteList", paraMap);
	}

	@Override
	public List<ApprovalVO> getDocumentDeleteList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getDocumentDeleteList_withSearchAndPaging", paraMap);
	}

	@Override
	public List<AdminVO> getAdminList() {
		return sqlSession.selectList("approval.getAdminList");
	}

	@Override
	public ApprovalDetailVO getApprovalDocumentView(Map<String, Long> paraMap) {
		return sqlSession.selectOne("approval.getApprovalDocumentView", paraMap);
	}

	@Override
	public List<ApprovalProcedureVO> getApprovalDocumentView_Procedure(Long approvalId) {
		return sqlSession.selectList("approval.getApprovalDocumentView_Procedure", approvalId);
	}

	@Override
	public List<ApprovalFileVO> getApprovalDocumentView_File(Long approvalId) {
		return sqlSession.selectList("approval.getApprovalDocumentView_File", approvalId);
	}

	@Override
	public List<ApprovalOpinionVO> getApprovalOpinionList(Long approvalId) {
		return sqlSession.selectList("approval.getApprovalOpinionList", approvalId);
	}

	@Override
	public int isDraftEmp(Map<String, Long> paraMap) {
		return sqlSession.selectOne("approval.isDraftEmp", paraMap);
	}

	@Override
	public int updateApprovalSecurity(Map<String, Long> paraMap) {
		return sqlSession.update("approval.updateApprovalSecurity", paraMap);
	}

	@Override
	public List<EmployeeVO> searchEmpName(String empName) {
		return sqlSession.selectList("approval.searchEmpName", empName);
	}

	@Override
	public List<ApprovalProcedureVO> getProcedureTypeApproval(Long approvalId) {
		return sqlSession.selectList("approval.getProcedureTypeApproval", approvalId);
	}

	@Override
	public int updateApprovalLineSetting(Map<String, String> paraMap) {

		return sqlSession.update("approval.updateApprovalLineSetting", paraMap);
	}

	@Override
	public int insertApprovalLineSetting(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertApprovalLineSetting", paraMap);
	}

	@Override
	public int getApprovalProcedureLastSeq(Long approvalId) {
		return sqlSession.selectOne("approval.getApprovalProcedureLastSeq", approvalId);
	}

	@Override
	public int deleteApprovalLineSetting(Map<String, String> paraMap) {
		return sqlSession.delete("approval.deleteApprovalLineSetting", paraMap);
	}

	@Override
	public int addRef(Map<String, String> paraMap) {
		return sqlSession.insert("approval.addRef", paraMap);
	}

	@Override
	public Integer getUserProcedureType(Map<String, Long> paraMap) {
		return sqlSession.selectOne("approval.getUserProcedureType", paraMap);
	}

	@Override
	public int delRef(Map<String, String> paraMap) {
		return sqlSession.delete("approval.delRef", paraMap);
	}

	@Override
	public int updateApprovalFile(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateApprovalFile", paraMap);
	}

	@Override
	public int deleteApprovalFile(Map<String, String> paraMap) {
		return sqlSession.delete("approval.deleteApprovalFile", paraMap);
	}

	@Override
	public int insertApprovalFile(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertApprovalFile", paraMap);
	}

	@Override
	public ApprovalFileVO getApprovalDocumentFile(Long fileId) {
		return sqlSession.selectOne("approval.getApprovalDocumentFile", fileId);
	}

	@Override
	public int insertOpinion(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertOpinion", paraMap);
	}

	@Override
	public int deleteOpinion(Long opinionId) {
		return sqlSession.delete("approval.deleteOpinion", opinionId);
	}

	@Override
	public int deleteImportant(Map<String, Long> paraMap) {
		return sqlSession.delete("approval.deleteImportant", paraMap);
	}

	@Override
	public int insertImportant(Map<String, Long> paraMap) {
		return sqlSession.insert("approval.insertImportant", paraMap);
	}

	@Override
	public int updateActionOfApproval(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateActionOfApproval", paraMap);
	}

	@Override
	public int updateRefRead(Map<String, Long> paraMap) {
		return sqlSession.update("approval.updateRefRead", paraMap);
	}

	@Override
	public int updateApprovalComplete(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateApprovalComplete", paraMap);
	}

	@Override
	public EmpProofDetailVO getEmpProofDetail(Map<String, Long> paraMap) {
		return sqlSession.selectOne("approval.getEmpProofDetail", paraMap);
	}

	@Override
	public List<ApprovalProcedureVO> getProcedureTypeApplication(Long approvalId) {
		return sqlSession.selectList("approval.getProcedureTypeApplication", approvalId);
	}

	@Override
	public List<ApprovalProcedureVO> getProcedureTypeAgree(Long approvalId) {
		return sqlSession.selectList("approval.getProcedureTypeAgree", approvalId);
	}

	@Override
	public List<ApprovalProcedureVO> getProcedureTypeFiAgree(Long approvalId) {
		return sqlSession.selectList("approval.getProcedureTypeFiAgree", approvalId);
	}

	@Override
	public WorkApplicationVO getWorkApplicationDetail(Long approvalId) {
		return sqlSession.selectOne("approval.getWorkApplicationDetail", approvalId);
	}

	@Override
	public List<FormVO> getFormNameList() {
		return sqlSession.selectList("approval.getFormNameList");
	}

	@Override
	public DayOffVO getDayOffDetail(Long approvalId) {
		return sqlSession.selectOne("approval.getDayOffDetail", approvalId);
	}

	@Override
	public DayOffVO getDayOffSimple(Long approvalId) {
		return sqlSession.selectOne("approval.getDayOffSimple", approvalId);
	}

	@Override
	public ModifyWorkRequestVO getModifyWorkRequest(Long approvalId) {
		return sqlSession.selectOne("approval.getModifyWorkRequest", approvalId);
	}

	@Override
	public int updateWorkHistoryByRequest(ModifyDetailVO mdvo) {
		return sqlSession.update("approval.updateWorkHistoryByRequest", mdvo);
	}

	@Override
	public int insertWorkHistoryByRequest(ModifyDetailVO mdvo) {
		return sqlSession.insert("approval.insertWorkHistoryByRequest", mdvo);
	}

	@Override
	public int deleteWorkHistoryByRequest(ModifyDetailVO mdvo) {
		return sqlSession.update("approval.deleteWorkHistoryByRequest", mdvo);
	}

	@Override
	public int updateReadReturn(Map<String, Long> paraMap) {
		return sqlSession.update("approval.updateReadReturn", paraMap);
	}

	@Override
	public int cancleApproval(Map<String, Long> paraMap) {
		return sqlSession.update("approval.cancleApproval", paraMap);
	}

	@Override
	public int getPreservationYear(Long formId) {
		return sqlSession.selectOne("approval.getPreservationYear", formId);
	}

	@Override
	public int insertApprovalDocument(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertApprovalDocument", paraMap);
	}

	@Override
	public int insertApprovalDocument_circular(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertApprovalDocument_circular", paraMap);
	}

	@Override
	public int insertTempApprovalDocument(Map<String, String> paraMap) {
		// 임시저장 등록
		return sqlSession.insert("approval.insertTempApprovalDocument", paraMap);
	}

	@Override
	public String getApprovalSequence() {
		// insert에 사용하기 위해 시퀀스값 얻기
		return sqlSession.selectOne("approval.getApprovalSequence");
	}

	@Override
	public int insertApplicant(Map<String, String> paraMap) {
		// 기안자 insert
		return sqlSession.insert("approval.insertApplicant", paraMap);
	}

	@Override
	public int insertBusinessContact(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertBusinessContact", paraMap);
	}

	@Override
	public int insertCircular(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertCircular", paraMap);
	}

	@Override
	public int insertEmpProof(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertEmpProof", paraMap);
	}

	@Override
	public int insertRoundRobin(Map<String, String> paraMap) {
		return sqlSession.insert("approval.insertRoundRobin", paraMap);
	}

	@Override
	public Long getFormId(Long approvalId) {
		return sqlSession.selectOne("approval.getFormId", approvalId);
	}

	@Override
	public int deleteApprovalProcedure(String approvalId) {
		return sqlSession.delete("approval.deleteApprovalProcedure", approvalId);
	}

	@Override
	public int updateApprovalDocument(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateApprovalDocument", paraMap);
	}

	@Override
	public int updateApprovalDocument_circular(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateApprovalDocument_circular", paraMap);
	}

	@Override
	public int updateBusinessContact(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateBusinessContact", paraMap);
	}

	@Override
	public int updateEmpProof(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateEmpProof", paraMap);
	}

	@Override
	public int updateRoundRobin(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateRoundRobin", paraMap);
	}

	@Override
	public int updateCircular(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateCircular", paraMap);
	}

	@Override
	public int batchApproval(BatchVO bvo) {
		return sqlSession.update("approval.batchApproval", bvo);
	}

	@Override
	public int batchCheck(BatchVO bvo) {
		return sqlSession.update("approval.batchCheck", bvo);
	}

	@Override
	public int batchDelete(BatchVO bvo) {
		return sqlSession.update("approval.batchDelete", bvo);
	}

	@Override
	public int batchRestore(BatchVO bvo) {
		return sqlSession.update("approval.batchRestore", bvo);
	}

	@Override
	public int addAppovalAdminManager(Map<String, Long> paraMap) {
		return sqlSession.insert("approval.addAppovalAdminManager", paraMap);
	}

	@Override
	public Long getAdminSequence() {
		return sqlSession.selectOne("approval.getAdminSequence");
	}

	@Override
	public int addAdminHistory(Map<String, Long> paraMap) {
		return sqlSession.insert("approval.addAdminHistory", paraMap);
	}

	@Override
	public int deleteAppovalAdminManager(Map<String, Long> paraMap) {
		return sqlSession.update("approval.deleteAppovalAdminManager", paraMap);
	}

	@Override
	public int updateAdminHistory(Map<String, Long> paraMap) {
		return sqlSession.update("approval.updateAdminHistory", paraMap);
	}

	@Override
	public int grantAdminRead(Map<String, Long> paraMap) {
		return sqlSession.update("approval.grantAdminRead", paraMap);
	}

	@Override
	public List<AdminHistoryVO> getAdminHistoryList() {
		return sqlSession.selectList("approval.getAdminHistoryList");
	}

	@Override
	public FormVO getFormDetail(Long formId) {
		return sqlSession.selectOne("approval.getFormDetail", formId);
	}

	@Override
	public List<FormVO> getFormNameListByWrite() {
		return sqlSession.selectList("approval.getFormNameListByWrite");
	}

	@Override
	public int updateForm(Map<String, String> paraMap) {
		return sqlSession.update("approval.updateForm", paraMap);
	}

	@Override
	public int isReadAble(Map<String, Long> paraMap) {
		return sqlSession.selectOne("approval.isReadAble", paraMap);
	}

	@Override
	public int isAlreadyAdmin(Long empId) {
		return sqlSession.selectOne("approval.isAlredayAdmin", empId);
	}

	@Override
	public int isExistApproval(Map<String, Long> paraMap) {
		return sqlSession.selectOne("approval.isExistApproval", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalProgressList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalProgressList_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalScheduleList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalScheduleList_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalCheckList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalCheckList_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalWaitingList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalWaitingList_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalAllIngList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalAllIngList_withSearchAndPaging", paraMap);
	}

	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int getTotalCountApprovalAllIngList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalAllIngList", paraMap);
	}

	@Override
	public int getTotalCountApprovalWaitingList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalWaitingList", paraMap);
	}

	@Override
	public int getTotalCountApprovalCheckList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalCheckList", paraMap);
	}

	@Override
	public int getTotalCountApprovalScheduleList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalScheduleList", paraMap);
	}

	@Override
	public int getTotalCountApprovalProgressList(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalProgressList", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalAllBox_withViewAllAndSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalAllBox_withViewAllAndSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalAllBox_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalAllBox_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalWriterBox_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalWriterBox_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalApprovalBox_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalApprovalBox_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalReferBox_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalReferBox_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalReadBox_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalReadBox_withSearchAndPaging", paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalReturnBox_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("approval.getApprovalReturnBox_withSearchAndPaging", paraMap);
	}

	@Override
	public int getTotalCountApprovalAllBox_withViewAll(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalAllBox_withViewAll", paraMap);
	}

	@Override
	public int getTotalCountApprovalAllBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalAllBox", paraMap);
	}

	@Override
	public int getTotalCountApprovalWriterBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalWriterBox", paraMap);
	}

	@Override
	public int getTotalCountApprovalApprovalBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalApprovalBox", paraMap);
	}

	@Override
	public int getTotalCountApprovalReferBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalReferBox", paraMap);
	}

	@Override
	public int getTotalCountApprovalReadBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalReadBox", paraMap);
	}

	@Override
	public int getTotalCountApprovalReturnBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalReturnBox", paraMap);
	}

	@Override
	public int getTotalCountApprovalTempBox(Map<String, String> paraMap) {
		return sqlSession.selectOne("approval.getTotalCountApprovalTempBox", paraMap);
	}

}
