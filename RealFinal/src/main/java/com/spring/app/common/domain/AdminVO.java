/** 
* @FileName  : AdminVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 13 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.common.domain;

/** 
* @FileName  : AdminVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 13 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class AdminVO {
	/**
	 * 관리자id
	 */
	private Long adminId;
	
	/**
	 * 사원id
	 */
	private Long empId;
	
	/**
	 * 관리자 사원명
	 */
	private String empName;
	
	/**
	 * 관리자 아이디 (이메일에서 사용되는 아이디)
	 */
	private String id;
	
	/**
	 * [부서명] 팀명
	 */
	private String team;
	
	/**
	 * 관리자 등록일시
	 */
	private String registerDay;
	
	/**
	 * 전체 문서 열람 허용 여부 (0: 미허용, 1: 허용)
	 */
	private String isReadAllDocument;
	
	/**
	 * 전체 관리자 여부(0: 아님, 1: 전체 관리자)
	 */
	private String isFullAdmin;

	/**
	 * @return the adminId
	 */
	public Long getAdminId() {
		return adminId;
	}

	/**
	 * @param adminId the adminId to set
	 */
	public void setAdminId(Long adminId) {
		this.adminId = adminId;
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
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
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
	 * @return the isReadAllDocument
	 */
	public String getIsReadAllDocument() {
		return isReadAllDocument;
	}

	/**
	 * @param isReadAllDocument the isReadAllDocument to set
	 */
	public void setIsReadAllDocument(String isReadAllDocument) {
		this.isReadAllDocument = isReadAllDocument;
	}

	/**
	 * @return the isFullAdmin
	 */
	public String getIsFullAdmin() {
		return isFullAdmin;
	}

	/**
	 * @param isFullAdmin the isFullAdmin to set
	 */
	public void setIsFullAdmin(String isFullAdmin) {
		this.isFullAdmin = isFullAdmin;
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
	

}
