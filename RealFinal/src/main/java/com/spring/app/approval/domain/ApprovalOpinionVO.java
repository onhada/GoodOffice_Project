package com.spring.app.approval.domain;

/** 
* @FileName  : ApprovalOpinionVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 18 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ApprovalOpinionVO {
	
	/**
	 * 의견id
	 */
	private Long opinionId;
	
	/**
	 * 사원id
	 */
	private Long empId;
	
	/**
	 * 사원명
	 */
	private String empName;
	
	/**
	 * 의견 내용
	 */
	private String content;
	
	
	/**
	 * 등록일시
	 */
	private String registerDay;

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
	 * @return the opinionId
	 */
	public Long getOpinionId() {
		return opinionId;
	}

	/**
	 * @param opinionId the opinionId to set
	 */
	public void setOpinionId(Long opinionId) {
		this.opinionId = opinionId;
	}
	
	
}
