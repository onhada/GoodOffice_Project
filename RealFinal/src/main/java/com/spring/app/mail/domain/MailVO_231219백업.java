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
public class MailVO_231219백업 {

	/**
	 * 메일id
	 */
	private String mailId;

	/**
	 * 사원id
	 */
	private String fk_empId;
	
	/**
	 * 사원email
	 */
	private String email;
	
	/**
	 * 발신사원 이름
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
	 * 임시저장여부 0:임시저장없음, 1:임시저장있음
	 */
//	private String isTemporary;

	/**
	 * 전송취소여부 0:중요하지않음, 1:중요함
	 */
	private String isCancel;

	/**
	 * 중요여부 0:전송취소아님, 1:전송취소
	 */
	private String isImportant;
	
	/**
	 * 삭제여부 0:삭제하지않음, 1:삭제함
	 */
	private String isDelete;

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
	 * 수신사원id
	 */
	private String incomeEmpId;
	
	/**
	 * 참조email
	 */
	private String reference; 
	
	/**
	 * 참조사원id 
	 */
	private String referenceEmpId; 
	
	/**
	 * 숨은참조
	 */
	private String hiddenReference; 
	
	/**
	 * 숨은참조사원id 
	 */
	private String hiddenReferenceEmpId; 
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
	 * @return the fk_empId
	 */
	public String getFk_empId() {
		return fk_empId;
	}

	/**
	 * @param fk_empId the fk_empId to set
	 */
	public void setFk_empId(String fk_empId) {
		this.fk_empId = fk_empId;
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
	 * @return the isTemporary
	 */
//	public String getIsTemporary() {
//		return isTemporary;
//	}

	/**
	 * @param isTemporary the isTemporary to set
	 */
//	public void setIsTemporary(String isTemporary) {
//		this.isTemporary = isTemporary;
//	}

	/**
	 * @return the isCancel
	 */
	public String getIsCancel() {
		return isCancel;
	}

	/**
	 * @param isCancel the isCancel to set
	 */
	public void setIsCancel(String isCancel) {
		this.isCancel = isCancel;
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
	 * @return the isDelete
	 */
	public String getIsDelete() {
		return isDelete;
	}

	/**
	 * @param isDelete the isDelete to set
	 */
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
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
	 * @return the incomeEmpId
	 */
	public String getIncomeEmpId() {
		return incomeEmpId;
	}

	/**
	 * @param incomeEmpId the incomeEmpId to set
	 */
	public void setIncomeEmpId(String incomeEmpId) {
		this.incomeEmpId = incomeEmpId;
	}

	/**
	 * @return the reference
	 */
	public String getReference() {
		return reference;
	}

	/**
	 * @param reference the reference to set
	 */
	public void setReference(String reference) {
		this.reference = reference;
	}

	/**
	 * @return the referenceEmpId
	 */
	public String getReferenceEmpId() {
		return referenceEmpId;
	}

	/**
	 * @param referenceEmpId the referenceEmpId to set
	 */
	public void setReferenceEmpId(String referenceEmpId) {
		this.referenceEmpId = referenceEmpId;
	}

	/**
	 * @return the hiddenReference
	 */
	public String getHiddenReference() {
		return hiddenReference;
	}

	/**
	 * @param hiddenReference the hiddenReference to set
	 */
	public void setHiddenReference(String hiddenReference) {
		this.hiddenReference = hiddenReference;
	}

	/**
	 * @return the hiddenReferenceEmpId
	 */
	public String getHiddenReferenceEmpId() {
		return hiddenReferenceEmpId;
	}

	/**
	 * @param hiddenReferenceEmpId the hiddenReferenceEmpId to set
	 */
	public void setHiddenReferenceEmpId(String hiddenReferenceEmpId) {
		this.hiddenReferenceEmpId = hiddenReferenceEmpId;
	}
	
	//////////////////////////////////////////////////

}
