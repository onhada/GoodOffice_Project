/** 
* @FileName  : BatchModifyUserVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.admin.domain;

/** 
* @FileName  : BatchModifyUserVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class BatchModifyUserVO {
	/**
	 * 일괄 업데이트할 사원id
	 */
	private String[] empIdList;
	
	/**
	 * 일괄 업데이트할 근무형태
	 */
	private String empType;
	
	/**
	 * 일괄 업데이트할 상태
	 */
	private String status;
	
	/**
	 * 일괄 업데이트할 직위id
	 */
	private String positionId;


	/**
	 * @return the empIdList
	 */
	public String[] getEmpIdList() {
		return empIdList;
	}

	/**
	 * @param empIdList the empIdList to set
	 */
	public void setEmpIdList(String[] empIdList) {
		this.empIdList = empIdList;
	}

	/**
	 * @return the empType
	 */
	public String getEmpType() {
		return empType;
	}

	/**
	 * @param empType the empType to set
	 */
	public void setEmpType(String empType) {
		this.empType = empType;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the positionId
	 */
	public String getPositionId() {
		return positionId;
	}

	/**
	 * @param positionId the positionId to set
	 */
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	
}
