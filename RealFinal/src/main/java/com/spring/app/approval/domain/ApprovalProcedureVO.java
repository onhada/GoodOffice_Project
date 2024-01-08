/** 
* @FileName  : ApprovalProcedureVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 16 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : ApprovalProcedureVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 16 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ApprovalProcedureVO {
	
	/**
	 * 전자결재 절차id
	 */
	private Long procedureId;
	
	/**
	 * 전자결재 절차 타입
	 */
	private String procedureType;
	
	/**
	 * 전자결재 절차 상태
	 */
	private String status;
	
	/**
	 * 전자결재 절차 사원id
	 */
	private String empId;
	
	/**
	 * 전자결재 절차 사원명
	 */
	private String empName;
	
	/**
	 * 직위명
	 */
	private String positionName;
	
	/**
	 * 전자결재 절차 등록일시
	 */
	private String registerDay;
	
	
	/**
	 * 순서
	 */
	private int sequence;
	
	/**
	 * 전자결재id
	 */
	private Long approvalId;

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
	}

	/**
	 * @param procedureType the procedureType to set
	 */
	public void setProcedureType(String procedureType) {
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
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
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
	 * @return the registerDay
	 */
	public String getRegisterDay() {
		return registerDay;
	}

	/**
	 * @param registerDay the registerDay to set
	 */
	public void setRegisterDay(String registerDay) {
		this.registerDay = registerDay;
	}

	/**
	 * @return the positionName
	 */
	public String getPositionName() {
		return positionName;
	}

	/**
	 * @param positionName the positionName to set
	 */
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}


	/**
	 * @return the empId
	 */
	public String getEmpId() {
		return empId;
	}

	/**
	 * @param empId the empId to set
	 */
	public void setEmpId(String empId) {
		this.empId = empId;
	}

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

	/**
	 * @return the approvalId
	 */
	public Long getApprovalId() {
		return approvalId;
	}

	/**
	 * @param approvalId the approvalId to set
	 */
	public void setApprovalId(Long approvalId) {
		this.approvalId = approvalId;
	}

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
}
