package com.spring.app.approval.domain;

import java.util.List;

/** 
* @FileName  : ModifyWorkRequestVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 28 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ModifyWorkRequestVO {
	
	/**
	 * 근무일자
	 */
	private String workDay;
	
	/**
	 * 적용 사원명
	 */
	private String empName;
	
	/**
	 * 전자결재id
	 */
	private Long approvalId;
	
	/**
	 * 근무체크 수정 요청 정보
	 */
	private List<ModifyDetailVO> modifyDetailList;

	/**
	 * @return the workDay
	 */
	public String getWorkDay() {
		return workDay;
	}

	/**
	 * @param workDay the workDay to set
	 */
	public void setWorkDay(String workDay) {
		this.workDay = workDay;
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
	 * @return the modifyDetailList
	 */
	public List<ModifyDetailVO> getModifyDetailList() {
		return modifyDetailList;
	}

	/**
	 * @param modifyDetailList the modifyDetailList to set
	 */
	public void setModifyDetailList(List<ModifyDetailVO> modifyDetailList) {
		this.modifyDetailList = modifyDetailList;
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

}
