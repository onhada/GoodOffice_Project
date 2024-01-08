/** 
* @FileName  : PositionVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.common.domain;

/** 
* @FileName  : PositionVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class PositionVO {
	
	/**
	 * 직위id
	 */
	private Long positionId;
	
	/**
	 * 직위명
	 */
	private String positionName;

	/**
	 * @return the positionId
	 */
	public Long getPositionId() {
		return positionId;
	}

	/**
	 * @param positionId the positionId to set
	 */
	public void setPositionId(Long positionId) {
		this.positionId = positionId;
	}

	/**
	 * @return the positionName
	 */
	public String getPositionName() {
		return positionName;
	}

	/**
	 * @param positionName the positionName to set
	 */
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
}
