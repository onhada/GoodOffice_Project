package com.spring.app.common.domain;

import java.util.List;

/** 
* @FileName  : DepartmentVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : 신예진 (yejjinny) 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class DepartmentVO {
	
	/**
	 * 부서id
	 */
	private Long depId;
	
	/**
	 * 부서명
	 */
	private String depName;
	
	/**
	 * 부서에 소속된 팀 정보
	 */
	private List<TeamVO> teamList;

	/**
	 * @return the depId
	 */
	public Long getDepId() {
		return depId;
	}

	/**
	 * @param depId the depId to set
	 */
	public void setDepId(Long depId) {
		this.depId = depId;
	}

	/**
	 * @return the depName
	 */
	public String getDepName() {
		return depName;
	}

	/**
	 * @param depName the depName to set
	 */
	public void setDepName(String depName) {
		this.depName = depName;
	}

	/**
	 * @return the teamList
	 */
	public List<TeamVO> getTeamList() {
		return teamList;
	}

	/**
	 * @param teamList the teamList to set
	 */
	public void setTeamList(List<TeamVO> teamList) {
		this.teamList = teamList;
	}
	
	
	
}
