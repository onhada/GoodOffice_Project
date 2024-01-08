/** 
* @FileName  : BatchVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : BatchVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class BatchVO {
	
	private String empId;
	
	private String procedureType;
	
	private String[] approvalIdList;

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
	 * @return the procedureType
	 */
	public String getProcedureType() {
		return procedureType;
	}

	/**
	 * @param procedureType the procedureType to set
	 */
	public void setProcedureType(String procedureType) {
		this.procedureType = procedureType;
	}

	/**
	 * @return the approvalIdList
	 */
	public String[] getApprovalIdList() {
		return approvalIdList;
	}

	/**
	 * @param approvalIdList the approvalIdList to set
	 */
	public void setApprovalIdList(String[] approvalIdList) {
		this.approvalIdList = approvalIdList;
	}
	
	

}
