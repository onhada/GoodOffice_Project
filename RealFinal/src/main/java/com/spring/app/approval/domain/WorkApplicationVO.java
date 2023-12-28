/** 
* @FileName  : WorkApplicationVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 27 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : WorkApplicationVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 27 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class WorkApplicationVO {
	
	/**
	 * 근무신청id
	 */
	private Long workAppId;
	
	/**
	 * 근무 종류 (1: 휴무일, 2: 연장)
	 */
	private String workType;
	
	/**
	 * 근무일자
	 */
	private String workDay;
	
	/**
	 * 연장근무 시작시간
	 */
	private String overTimeStart;
	
	/**
	 * 연장근무 종료시간
	 */
	private String overTimeEnd;

	/**
	 * @return the workAppId
	 */
	public Long getWorkAppId() {
		return workAppId;
	}

	/**
	 * @param workAppId the workAppId to set
	 */
	public void setWorkAppId(Long workAppId) {
		this.workAppId = workAppId;
	}

	/**
	 * @return the workType
	 */
	public String getWorkType() {
		return workType;
	}

	/**
	 * @param workType the workType to set
	 */
	public void setWorkType(String workType) {
		this.workType = workType;
	}

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
	 * @return the overTimeStart
	 */
	public String getOverTimeStart() {
		return overTimeStart;
	}

	/**
	 * @param overTimeStart the overTimeStart to set
	 */
	public void setOverTimeStart(String overTimeStart) {
		this.overTimeStart = overTimeStart;
	}

	/**
	 * @return the overTimeEnd
	 */
	public String getOverTimeEnd() {
		return overTimeEnd;
	}

	/**
	 * @param overTimeEnd the overTimeEnd to set
	 */
	public void setOverTimeEnd(String overTimeEnd) {
		this.overTimeEnd = overTimeEnd;
	}
	
	

}
