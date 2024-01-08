/** 
* @FileName  : AdminHistoryVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 6 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : AdminHistoryVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 6 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class AdminHistoryVO {
	
	/**
	 * 관리자 사원의 이메일 id
	 */
	private String id;
	
	/**
	 * 관리자 사원명
	 */
	private String empName;
	
	/**
	 * 관리자 등록시킨 사원의 이메일 id
	 */
	private String registerId;
	
	/**
	 * 관리자 등록시킨 사원명
	 */
	private String registerEmpName;
	
	/**
	 * 등록일시
	 */
	private String registerDay;
	
	/**
	 * 등록 타입 (1: 등록, 2: 삭제)
	 */
	private String registerType;

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
	 * @return the registerId
	 */
	public String getRegisterId() {
		return registerId;
	}

	/**
	 * @param registerId the registerId to set
	 */
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	/**
	 * @return the registerEmpName
	 */
	public String getRegisterEmpName() {
		return registerEmpName;
	}

	/**
	 * @param registerEmpName the registerEmpName to set
	 */
	public void setRegisterEmpName(String registerEmpName) {
		this.registerEmpName = registerEmpName;
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
	 * @return the registerType
	 */
	public String getRegisterType() {
		return registerType;
	}

	/**
	 * @param registerType the registerType to set
	 */
	public void setRegisterType(String registerType) {
		this.registerType = registerType;
	}
	
	
	
	
}
