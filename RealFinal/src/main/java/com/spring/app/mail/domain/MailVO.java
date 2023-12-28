package com.spring.app.mail.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 *   @FileName  : MailVO.java 
 * 
 * @Project   : TempFinal 
 * @Date      : Dec 6, 2023 
 * @작성자      : 김민경
 * @변경이력 : 
 * @프로그램설명 : 
 */
public class MailVO {

	/**
	 * 메일id
	 */
	private String mailId;

	/**
	 * 사원id
	 */
	private String empId;
	
	/**
	 * 사원email
	 */
	private String email;
	
	/**
	 * 사원이름
	 */
	private String empName;

	/**
	 * 제목
	 */
	private String subject;

	/**
	 * 내용
	 */
	private String mailContent;

	/**
	 * 발신일시
	 */
	private String sendDay;

	/**
	 * 원메일id 0:해당메일이 원메일인 경우
	 */
	private String orgMailId;

	/**
	 * 메모내용
	 */
	private String memoContent;
	
	/**
	 * 중요여부 0:중요하지않음, 1:중요함
	 */
	private String isImportant;
	
	/**
	 * 첨부파일 존재 유무 확인
	 */
	private String hasFile;
	
	// ----- 파일 첨부를 위한 필드 시작 ----- //
	/**
	 * form 태그에서 type="file" 인 파일을 받아서 저장되는 필드이다. 진짜파일 ==> WAS(톰캣) 디스크에 저장됨. 
	 * 조심할것은 MultipartFile attach 는 오라클 데이터베이스 tbl_mail 테이블의 컬럼이 아니다.
	 * /TempFinal/src/main/webapp/WEB-INF/views/mail/mailWrite.jsp 파일에서 input type="file" 인 name 의 이름(attach)과 동일해야만 파일첨부가 가능해진다.!!!!
	 */
	private List<MultipartFile> attachList; 
	/**
	 * WAS(톰캣)에 저장될 파일명(2023112409291535243254235235234.png) 
	 */
	private String fileName; 
	/**
	 * 진짜 파일명(강아지.png). 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명.  
	 */
	private String orgFileName; 
	/**
	 * 파일크기 
	 */
	private String fileSize; 
	// ----- 파일 첨부를 위한 필드 끝 ----- //
	
	
	/**
	 * 휴지통에서 메일리스트를 볼 때 어떤 메일함에서 버렸는지 확인하기 위함
	 */
	private String fromMailbox;
	
	///////////////////////////////////////////////////////////////////////////////////

	/**
	 * @return the mailId
	 */
	public String getMailId() {
		return mailId;
	}

	/**
	 * @param mailId the mailId to set
	 */
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * @return the title
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param title the title to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the mailContent
	 */
	public String getMailContent() {
		return mailContent;
	}

	/**
	 * @param mailContent the mailContent to set
	 */
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	/**
	 * @return the sendDay
	 */
	public String getSendDay() {
		return sendDay;
	}

	/**
	 * @param sendDay the sendDay to set
	 */
	public void setSendDay(String sendDay) {
		this.sendDay = sendDay;
	}

	/**
	 * @return the orgMailId
	 */
	public String getOrgMailId() {
		return orgMailId;
	}

	/**
	 * @param orgMailId the orgMailId to set
	 */
	public void setOrgMailId(String orgMailId) {
		this.orgMailId = orgMailId;
	}
	
	/**
	 * @return the memoContent
	 */
	public String getMemoContent() {
		return memoContent;
	}

	/**
	 * @param memoContent the memoContent to set
	 */
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}

	/**
	 * @return the isImportant
	 */
	public String getIsImportant() {
		return isImportant;
	}

	/**
	 * @param isImportant the isImportant to set
	 */
	public void setIsImportant(String isImportant) {
		this.isImportant = isImportant;
	}
	
	/**
	 * @return the hasFile
	 */
	public String getHasFile() {
		return hasFile;
	}

	/**
	 * @param hasFile the hasFile to set
	 */
	public void setHasFile(String hasFile) {
		this.hasFile = hasFile;
	}

	/**
	 * @return the attachList
	 */
	public List<MultipartFile> getAttachList() {
		return attachList;
	}

	/**
	 * @param attachList the attachList to set
	 */
	public void setAttachList(List<MultipartFile> attachList) {
		this.attachList = attachList;
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
	public String getFileSize() {
		return fileSize;
	}

	/**
	 * @param fileSize the fileSize to set
	 */
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	/**
	 * @return the fromMailbox
	 */
	public String getFromMailbox() {
		return fromMailbox;
	}

	/**
	 * @param fromMailbox the fromMailbox to set
	 */
	public void setFromMailbox(String fromMailbox) {
		this.fromMailbox = fromMailbox;
	}

	
	
	//////////////////////////////////////////////////

}
