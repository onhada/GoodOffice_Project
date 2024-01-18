package com.spring.app.approval.domain;

/** 
* @FileName  : ApprovalActionVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 23 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ApprovalActionVO {
	
	private Long empId;
	
	private Long approvalId;
	
	private int approvalStatus;
	
	private String opinion;
	
	private Long formId;

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
	 * @return the status
	 */
	public int getApprovalStatus() {
		return approvalStatus;
	}

	/**
	 * @param status the status to set
	 */
	public void setApprovalStatus(int approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	/**
	 * @return the opinion
	 */
	public String getOpinion() {
		return opinion;
	}

	/**
	 * @param opinion the opinion to set
	 */
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	/**
	 * @return the formId
	 */
	public Long getFormId() {
		return formId;
	}

	/**
	 * @param formId the formId to set
	 */
	public void setFormId(Long formId) {
		this.formId = formId;
	}
	
}
