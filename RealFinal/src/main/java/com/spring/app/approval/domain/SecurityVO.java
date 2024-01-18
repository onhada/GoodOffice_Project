package com.spring.app.approval.domain;

/** 
* @FileName  : SecurityVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 12 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class SecurityVO {
	
	/**
	 * 보안id
	 */
	private Long securityId;
	
	/**
	 * 직위id
	 */
	private Long positionId;
	
	/**
	 * 직위명
	 */
	private String positionName;
	
	/**
	 * 보안등급
	 */
	private String securityLevel;

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

	/**
	 * @return the securityLevel
	 */
	public String getSecurityLevel() {
		return securityLevel;
	}

	/**
	 * @param securityLevel the securityLevel to set
	 */
	public void setSecurityLevel(String securityLevel) {
		this.securityLevel = securityLevel;
	}

	/**
	 * @return the securityId
	 */
	public Long getSecurityId() {
		return securityId;
	}

	/**
	 * @param securityId the securityId to set
	 */
	public void setSecurityId(Long securityId) {
		this.securityId = securityId;
	}
}
