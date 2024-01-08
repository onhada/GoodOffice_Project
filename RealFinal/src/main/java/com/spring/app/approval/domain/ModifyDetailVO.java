/** 
* @FileName  : ModifyDetailVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 28 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : ModifyDetailVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 28 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ModifyDetailVO {
	
	/**
	 * 사원id
	 */
	private Long empId;
	
	/**
	 * 근무내역id
	 */
	private Long workHistoryId; 
	
	/**
	 * 근무 종류
	 *  업무 1
		외출 2
		회의 3
		외근 4
		퇴근 5
		출근 6
		휴가 7
		연장근무 8
		휴일근무  9
	 */
	private String workType;
	
	/**
	 * 요청 종류
	 * 1: 수정
	   2: 삭제
	   3: 추가
	 */
	private String requestType;
	
	/**
	 * 기존 근무내역 등록 시간
	 */
	private String orgWorkDateTime;
	
	/**
	 * 업데이트할 근무 시간
	 */
	private String modifyRequestDateTime;

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
	 * @return the workType
	 */
	public String getWorkType() {
		return workType;
	}
	
	public String getWorkType_Kor() {
		switch (workType) {
		case "1":
			return "업무";
		case "2":
			return "외출";
		case "3":
			return "회의";
		case "4":
			return "외근";
		case "5":
			return "퇴근";
		case "6":
			return "출근";
		case "7":
			return "휴가";
		case "8":
			return "연장근무";
		case "9":
			return "휴일근무";
		default :
			return workType;
		}
	}


	/**
	 * @param workType the workType to set
	 */
	public void setWorkType(String workType) {
		this.workType = workType;
	}

	/**
	 * @return the requestType
	 */
	public String getRequestType() {
		return requestType;
	}
	
	public String getRequestType_Kor() {
		switch(requestType) {
		case "1" : 
			return "수정";
		case "2":
			return "삭제";
		case "3":
			return "추가";
		default :
			return requestType;
		}
	}

	/**
	 * @param requestType the requestType to set
	 */
	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	/**
	 * @return the orgWorkDateTime
	 */
	public String getOrgWorkDateTime() {
		return orgWorkDateTime;
	}

	/**
	 * @param orgWorkDateTime the orgWorkDateTime to set
	 */
	public void setOrgWorkDateTime(String orgWorkDateTime) {
		this.orgWorkDateTime = orgWorkDateTime;
	}
	
	/**
	 * @return the modifyRequestDateTime
	 */
	public String getModifyRequestDateTime() {
		return modifyRequestDateTime;
	}

	/**
	 * @param modifyRequestDateTime the modifyRequestDateTime to set
	 */
	public void setModifyRequestDateTime(String modifyRequestDateTime) {
		this.modifyRequestDateTime = modifyRequestDateTime;
	}

	/**
	 * @return the workHistoryId
	 */
	public Long getWorkHistoryId() {
		return workHistoryId;
	}

	/**
	 * @param workHistoryId the workHistoryId to set
	 */
	public void setWorkHistoryId(Long workHistoryId) {
		this.workHistoryId = workHistoryId;
	}

}
