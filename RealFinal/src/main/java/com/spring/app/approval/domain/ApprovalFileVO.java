package com.spring.app.approval.domain;

/** 
* @FileName  : ApprovalFileVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 16 
* @작성자      : 신예진 (yejjinny)
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class ApprovalFileVO {
	
	/**
	 * 전자결재 파일 id
	 */
	private Long approvalFileId;
	
	/**
	 * 파일경로명 
	 */
	private String fileName;
	
	/**
	 * 파일명
	 */
	private String fileRName;
	
	/**
	 * 파일사이즈
	 */
	private Double fileSize;

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
	 * @return the fileRName
	 */
	public String getFileRName() {
		return fileName.substring(fileName.lastIndexOf("\\") +1, fileName.length());
	}

	/**
	 * @param fileRName the fileRName to set
	 */
	public void setFileRName(String fileRName) {
		this.fileRName = fileRName;
	}

	/**
	 * @return the fileSize
	 */
	public Double getFileSize() {
		//return Math.round(fileSize * 1000) / 1000.0;
		return fileSize;
	}

	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(Double fileSize) {
		this.fileSize = fileSize;
	}

	/**
	 * @return the approvalFileId
	 */
	public Long getApprovalFileId() {
		return approvalFileId;
	}

	/**
	 * @param approvalFileId the approvalFileId to set
	 */
	public void setApprovalFileId(Long approvalFileId) {
		this.approvalFileId = approvalFileId;
	}
	
	

}
