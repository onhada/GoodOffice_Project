package com.spring.app.approval.domain;

/** 
* @FileName  : EmpProofDetailVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 24 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class EmpProofDetailVO {
	
	/**
	 * 사원명
	 */
	private String empName;
	
	/**
	 * 생년월일
	 */
	private String birth;
	
	/**
	 * 발행일자
	 */
	private String issueDay;
	
	/**
	 * 제출처
	 */
	private String submit;
	
	/**
	 * 소속
	 */
	private String team;
	
	/**
	 * 입사일자
	 */
	private String startWorkDay;
	
	/**
	 * 용도
	 */
	private String reason;

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
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}

	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}

	/**
	 * @return the issueDay
	 */
	public String getIssueDay() {
		return issueDay;
	}

	/**
	 * @param issueDay the issueDay to set
	 */
	public void setIssueDay(String issueDay) {
		this.issueDay = issueDay;
	}

	/**
	 * @return the submit
	 */
	public String getSubmit() {
		return submit;
	}

	/**
	 * @param submit the submit to set
	 */
	public void setSubmit(String submit) {
		this.submit = submit;
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
	 * @return the startWorkDay
	 */
	public String getStartWorkDay() {
		return startWorkDay;
	}

	/**
	 * @param startWorkDay the startWorkDay to set
	 */
	public void setStartWorkDay(String startWorkDay) {
		this.startWorkDay = startWorkDay;
	}

	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	

}
