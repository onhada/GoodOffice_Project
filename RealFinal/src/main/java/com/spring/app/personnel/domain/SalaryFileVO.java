package com.spring.app.personnel.domain;

/** 
* @FileName  : SalaryFileVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 9 
* @작성자      : 신예진 (yejjinny) 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class SalaryFileVO {
	/**
	 * 급여파일id
	 */
	private Long fileId;
	
	/**
	 * 급여id
	 */
	private Long salaryId;
	
	/**
	 * 파일 저장경로명
	 */
	private String fileName;
	
	/**
	 * 진짜 파일명
	 */
	private String orgFileName;
	
	/**
	 * 파일사이즈
	 */
	private Double fileSize;

	/**
	 * @return the fileId
	 */
	public Long getFileId() {
		return fileId;
	}

	/**
	 * @param fileId the fileId to set
	 */
	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}

	/**
	 * @return the salaryId
	 */
	public Long getSalaryId() {
		return salaryId;
	}

	/**
	 * @param salaryId the salaryId to set
	 */
	public void setSalaryId(Long salaryId) {
		this.salaryId = salaryId;
	}

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the orgFileName
	 */
	public String getOrgFileName() {
		return orgFileName;
	}

	/**
	 * @param orgFileName the orgFileName to set
	 */
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	/**
	 * @return the fileSize
	 */
	public Double getFileSize() {
		return fileSize;
	}

	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(Double fileSize) {
		this.fileSize = fileSize;
	}
	
	
}
