/** 
* @FileName  : TeamVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.common.domain;

/** 
* @FileName  : TeamVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class TeamVO {
	
	/**
	 * 팀id
	 */
	private Long teamId;
	
	/**
	 * 팀명
	 */
	private String teamName;

	/**
	 * @return the teamId
	 */
	public Long getTeamId() {
		return teamId;
	}

	/**
	 * @param teamId the teamId to set
	 */
	public void setTeamId(Long teamId) {
		this.teamId = teamId;
	}

	/**
	 * @return the teamName
	 */
	public String getTeamName() {
		return teamName;
	}

	/**
	 * @param teamName the teamName to set
	 */
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	
}
