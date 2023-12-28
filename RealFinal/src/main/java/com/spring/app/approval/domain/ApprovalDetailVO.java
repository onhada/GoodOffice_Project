/** 
* @FileName  : ApprovalDetailVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 16 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

import java.util.List;

/** 
* @FileName  : ApprovalDetailVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 16 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
/** 
* @FileName  : ApprovalDetailVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 23 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ApprovalDetailVO {
	
	/**
	 * 양식id
	 */
	private Long formId;
	
	
	/**
	 * 양식명
	 */
	private String formName;
	
	/**
	 * 기안부서 
	 * [부서명] 팀이름
	 */
	private String team;
	
	/**
	 * 기안사원명
	 */
	private String empName;
	
	/**
	 * 전자결재id
	 */
	private Long approvalId;
	
	/**
	 * 보존연한
	 */
	private int preservationYear;
	
	/**
	 * 보안id
	 */
	private Long securityId;
	
	/**
	 * 전자결재절차
	 */
	private List<ApprovalProcedureVO> apvo;
	
	/**
	 * 제목
	 */
	private String title;
	
	/**
	 * 내용
	 */
	private String content;
	
	/**
	 * 전자결재 파일정보
	 */
	private List<ApprovalFileVO> fvo;
	
	/**
	 * 중요 등록 여부
	 */
	private int isImportant;
	
	/**
	 * 기안일시
	 */
	private String draftDay;
	
	/**
	 * 완료일시
	 */
	private String completeDay;
	

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
	 * @return the team
	 */
	public String getTeam() {
		return team;
	}

	/**
	 * @param team the team to set
	 */
	public void setTeam(String team) {
		this.team = team;
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
	 * @return the preservationYear
	 */
	public int getPreservationYear() {
		return preservationYear;
	}

	/**
	 * @param preservationYear the preservationYear to set
	 */
	public void setPreservationYear(int preservationYear) {
		this.preservationYear = preservationYear;
	}


	/**
	 * @return the apvo
	 */
	public List<ApprovalProcedureVO> getApvo() {
		return apvo;
	}

	/**
	 * @param apvo the apvo to set
	 */
	public void setApvo(List<ApprovalProcedureVO> apvo) {
		this.apvo = apvo;
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
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the fvo
	 */
	public List<ApprovalFileVO> getFvo() {
		return fvo;
	}

	/**
	 * @param fvo the fvo to set
	 */
	public void setFvo(List<ApprovalFileVO> fvo) {
		this.fvo = fvo;
	}

	/**
	 * @return the securityId
	 */
	public Long getSecurityId() {
		return securityId;
	}

	/**
	 * @param securityId the securityId to set
	 */
	public void setSecurityId(Long securityId) {
		this.securityId = securityId;
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
