/** 
* @FileName  : DayOffVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 27 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

import java.util.List;

/**
 *   @FileName  : DayOffVO.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 27 
 * @작성자      : syxzi 
 * @변경이력 : 
 * @프로그램설명 : 
 */
public class DayOffVO {

	/**
	 * 전자결재id
	 */
	private Long approvalId;
	
	/**
	 * 적용사원id
	 */
	private Long empId;

	/**
	 * 사용자명
	 */
	private String empName;

	/**
	 * [부서명] 팀명
	 */
	private String team;

	/**
	 * 종류 (1: 종일, 2: 오전, 3: 오후)
	 */
	private String type;

	/**
	 * 연차 종류명 (1: 연차, 2: 포상, 3: 경조사)
	 */
	private String dayOffTypeName;

	/**
	 * 휴가일자
	 */
	private String dayOffDay;

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
	 * @return the type
	 */
	public String getType() {

		switch (type) {
		case "1":
			return "종일";
		case "2":
			return "오전";
		case "3":
			return "오후";
		default:
			return type;
		}
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the dayOffTypeName
	 */
	public String getDayOffTypeName() {
		return dayOffTypeName;
	}

	/**
	 * @param dayOffTypeName the dayOffTypeName to set
	 */
	public void setDayOffTypeName(String dayOffTypeName) {
		this.dayOffTypeName = dayOffTypeName;
	}

	/**
	 * @return the dayOffDay
	 */
	public String getDayOffDay() {
		return dayOffDay;
	}

	/**
	 * @param dayOffDay the dayOffDay to set
	 */
	public void setDayOffDay(String dayOffDay) {
		this.dayOffDay = dayOffDay;
	}

}
