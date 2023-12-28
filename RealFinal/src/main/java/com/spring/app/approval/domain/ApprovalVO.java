/** 
* @FileName  : ApprovalVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/**
 *   @FileName  : ApprovalVO.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 5 
 * @작성자      : 신예진
 * @변경이력 : 
 * @프로그램설명 : 
 */
/** 
* @FileName  : ApprovalVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 10 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ApprovalVO {
	
	/**
	 * 전자결재 절차id
	 */
	private Long procedureId;
	
	/**
	 * 전자결재id
	 */
	private Long fk_approvalId;

	/**
	 * 양식id
	 */
	private Long fk_formId;

	/**
	 * 적용사원id
	 */
	private Long fk_empId;
	
	/**
	 * 작성사원 이름
	 */
	private String empName;

	/**
	 * 제목
	 */
	private String title;

	/**
	 * 기안일
	 */
	private String draftDay;

	/**
	 * 완료일
	 */
	private String completeDay;

	/**
	 * 임시저장여부
	 */
	private int isTemporary;

	/**
	 * 절차종류 (=구분)
	 */
	private String procedureType;

	/**
	 * 현황 (=상태)
	 */
	private String status;
	
	/**
	 * 순서
	 */
	private int sequence;
	
	/**
	 * 반려열람여부
	 */
	private String isReadReturn; 
	
	/**
	 * 양식 이름
	 */
	private String formName;
	
	/**
	 * 중요 여부
	 */
	private int isImportant;
	
	/**
	 * 파일 존재 여부
	 */
	private int isFile;
	
	/**
	 * 세큐리티 등급
	 */
	private int fk_positionId;
	
	/**
	 * 사원id
	 */
	private Long empId;
	
	/**
	 * 삭제 여부 (0: 미삭제, 1: 관리자에 의한 삭제, 2: 보존 연한 경과로 삭제, 3: 완전 삭제)
	 */
	private String isDelete;
	
	/**
	 * @return the sequence
	 */
	public int getSequence() {
		return sequence;
	}

	/**
	 * @param sequence the sequence to set
	 */
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public ApprovalVO() {
		
	}

//	/**
//	 * @param procedureId
//	 * @param fk_approvalId
//	 * @param fk_formId
//	 * @param fk_empId
//	 * @param title
//	 * @param draftDay
//	 * @param completeDay
//	 * @param isTemporary
//	 * @param procedureType
//	 * @param status
//	 */
//	public ApprovalVO(Long procedureId, Long fk_approvalId, Long fk_formId, Long fk_empId, String title,
//			String draftDay, String completeDay, int isTemporary, String procedureType, String status) {
//		super();
//		this.procedureId = procedureId;
//		this.fk_approvalId = fk_approvalId;
//		this.fk_formId = fk_formId;
//		this.fk_empId = fk_empId;
//		this.title = title;
//		this.draftDay = draftDay;
//		this.completeDay = completeDay;
//		this.isTemporary = isTemporary;
//		this.procedureType = procedureType;
//		this.status = status;
//	}

	/**
	 * @return the procedureId
	 */
	public Long getProcedureId() {
		return procedureId;
	}

	/**
	 * @param procedureId the procedureId to set
	 */
	public void setProcedureId(Long procedureId) {
		this.procedureId = procedureId;
	}

	/**
	 * @return the fk_approvalId
	 */
	public Long getFk_approvalId() {
		return fk_approvalId;
	}

	/**
	 * @param fk_approvalId the fk_approvalId to set
	 */
	public void setFk_approvalId(Long fk_approvalId) {
		this.fk_approvalId = fk_approvalId;
	}

	/**
	 * @return the fk_formId
	 */
	public Long getFk_formId() {
		return fk_formId;
	}

	/**
	 * @param fk_formId the fk_formId to set
	 */
	public void setFk_formId(Long fk_formId) {
		this.fk_formId = fk_formId;
	}

	/**
	 * @return the fk_empId
	 */
	public Long getFk_empId() {
		return fk_empId;
	}

	/**
	 * @param fk_empId the fk_empId to set
	 */
	public void setFk_empId(Long fk_empId) {
		this.fk_empId = fk_empId;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the draftDay
	 */
	public String getDraftDay() {
		return draftDay;
	}

	/**
	 * @param draftDay the draftDay to set
	 */
	public void setDraftDay(String draftDay) {
		this.draftDay = draftDay;
	}

	/**
	 * @return the completeDay
	 */
	public String getCompleteDay() {
		return completeDay;
	}

	/**
	 * @param completeDay the completeDay to set
	 */
	public void setCompleteDay(String completeDay) {
		this.completeDay = completeDay;
	}

	/**
	 * @return the isTemporary
	 */
	public int getIsTemporary() {
		return isTemporary;
	}

	/**
	 * @param isTemporary the isTemporary to set
	 */
	public void setIsTemporary(int isTemporary) {
		this.isTemporary = isTemporary;
	}

	/**
	 * @return the procedureType
	 */
	public String getProcedureType() {

		switch (procedureType) {
		case "1":
			return "기안";
		case "2":
			return "신청";
		case "3":
			return "결재";
		case "4":
			return "처리";
		case "5":
			return "참조";
		case "6":
			return "수신";
		case "7":
			return "수신참조";
		case "8":
			return "합의";
		case "9":
			return "재무합의";
		default:
			return procedureType;
		}
		
//		return procedureType;

	}

	/**
	 * @param procedureType the procedureType to set
	 */
	public void setProcedureType(String procedureType) {
//		switch (procedureType) {
//		case "1":
//			this.procedureType = "기안";
//			break;
//		case "2":
//			this.procedureType = "신청";
//			break;
//		case "3":
//			this.procedureType = "결재";
//			break;
//		case "4":
//			this.procedureType = "처리";
//			break;
//		case "5":
//			this.procedureType = "참조";
//			break;
//		case "6":
//			this.procedureType = "수신";
//			break;
//		case "7":
//			this.procedureType = "수신참조";
//			break;
//		default:
//			this.procedureType = procedureType;
//		}
		
		this.procedureType = procedureType;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		switch (status) {
		case "1":
			// 아직 결재 승인 전 단계
			return "대기";
		case "2":
			return "승인";
		case "3":
			return "반려";
		case "4":
			return "확인";
		case "5":
			return "미확인";
		default:
			return status;
		}
		
//		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
//		switch (status) {
//		case "1":
//			// 아직 결재 승인 전 단계
//			this.status = "대기";
//			break;
//		case "2":
//			this.status = "승인";
//			break;
//		case "3":
//			this.status = "반려";
//			break;
//		case "4":
//			this.status = "협의";
//			break;
//		case "5":
//			this.status = "합의";
//			break;
//		case "6":
//			this.status = "재무합의";
//			break;
//		case "7":
//			this.status = "확인";
//			break;
//		case "8":
//			this.status = "미확인";
//			break;
//		default:
//			this.status = status;
//		}
		
		this.status = status;
	}

	/**
	 * @return the empName
	 */
	public String getEmpName() {
		return empName;
	}

	/**
	 * @param empName the empName to set
	 */
	public void setEmpName(String empName) {
		this.empName = empName;
	}

	/**
	 * @return the isReadReturn
	 */
	public String getIsReadReturn() {
		switch (isReadReturn) {
		case "0":
			return "미읽음";
		case "1":
			return "읽음";
		default:
			return isReadReturn;
		}
	}

	/**
	 * @param isReadReturn the isReadReturn to set
	 */
	public void setIsReadReturn(String isReadReturn) {
		this.isReadReturn = isReadReturn;
	}

	/**
	 * @return the formName
	 */
	public String getFormName() {
		return formName;
	}

	/**
	 * @param formName the formName to set
	 */
	public void setFormName(String formName) {
		this.formName = formName;
	}

	/**
	 * @return the isImportant
	 */
	public int getIsImportant() {
		return isImportant;
	}

	/**
	 * @param isImportant the isImportant to set
	 */
	public void setIsImportant(int isImportant) {
		this.isImportant = isImportant;
	}

	/**
	 * @return the isFile
	 */
	public int getIsFile() {
		return isFile;
	}

	/**
	 * @param isFile the isFile to set
	 */
	public void setIsFile(int isFile) {
		this.isFile = isFile;
	}

	/**
	 * @return the fk_positionId
	 */
	public int getFk_positionId() {
		return fk_positionId;
	}

	/**
	 * @param fk_positionId the fk_positionId to set
	 */
	public void setFk_positionId(int fk_positionId) {
		this.fk_positionId = fk_positionId;
	}

	/**
	 * @return the empId
	 */
	public Long getEmpId() {
		return empId;
	}

	/**
	 * @param empId the empId to set
	 */
	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	/**
	 * @return the isDelete
	 */
	public String getIsDelete() {
		switch (isDelete) {
		case "0":
			return "미삭제";
		case "1":
			return "관리자에 의한 삭제";
		case "2":
			return "보존 연한 경과";
		case "3":
			return "완전 삭제";
		default:
			return isDelete;
		}
	}

	/**
	 * @param isDelete the isDelete to set
	 */
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
}
