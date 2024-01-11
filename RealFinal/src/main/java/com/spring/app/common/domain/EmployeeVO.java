package com.spring.app.common.domain;

/**
 *   @FileName  : EmployeeVO.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 6 
 * @작성자      : 신예진
 * @변경이력 : 
 * @프로그램설명 : 
 */
public class EmployeeVO {

	/**
	 * 사원id
	 */
	private Long empId;

	/**
	 * 이메일에 사용되는 id
	 */
	private String id;

	/**
	 * 팀id
	 */
	private Long fk_teamId;

	/**
	 * 직위id
	 */
	private Long fk_positionId;

	/**
	 * 직무id
	 */
	private Long fk_jobId;

	/**
	 * 근로형태
	 */
	private String empType;

	/**
	 * 사내전화
	 */
	private String companyTel;

	/**
	 * 휴대전화
	 */
	private String tel;

	/**
	 * 이메일
	 */
	private String email;

	/**
	 * 비밀번호
	 */
	private String pwd;

	/**
	 * 입사일
	 */
	private String startWorkDay;

	/**
	 * 개인이메일
	 */
	private String personalEmail;

	/**
	 * 생년월일
	 */
	private String birth;

	/**
	 * 주소
	 */
	private String address;

	/**
	 * 상세주소
	 */
	private String detailAddress;

	/**
	 * 우편번호
	 */
	private String postCode;

	/**
	 * 상태
	 */
	private String status;

	/**
	 * 기타정보
	 */
	private String other;

	/**
	 * 등록일자
	 */
	private String registerDay;

	/**
	 * 업데이트일자
	 */
	private String updateDay;

	/**
	 * 사원명
	 */
	private String empName;

	/**
	 * 관리자 여부
	 */
	private int isAdmin;

	/**
	 * 전자결재) 전체 문서 열람 허용 여부 (0: 미허용, 1: 허용)
	 */
	private int isReadAllDocument;

	/**
	 * 관리자 기능종류
	 */
	private String adminType;

	/**
	 * 소속 팀명
	 */
	private String teamName;

	/**
	 * 소속 부서명
	 */
	private String depName;

	/**
	 * 직위명
	 */
	private String positionName;

	// 예진 추가 ----------------------------------------------------------- 수정필
	/**
	 * [부서명] 팀명
	 */
	private String team;
	// 예진 추가 끝 ----------------------------------------------------------- 수정필

	/**
	 * 부서id 민경 추가
	 */
	private Long fk_depId;

	/**
	 * 직무명 민경 추가
	 */
	private String jobName;

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
	 * @return the fk_teamId
	 */
	public Long getFk_teamId() {
		return fk_teamId;
	}

	/**
	 * @param fk_teamId the fk_teamId to set
	 */
	public void setFk_teamId(Long fk_teamId) {
		this.fk_teamId = fk_teamId;
	}

	/**
	 * @return the fk_positionId
	 */
	public Long getFk_positionId() {
		return fk_positionId;
	}

	/**
	 * @param fk_positionId the fk_positionId to set
	 */
	public void setFk_positionId(Long fk_positionId) {
		this.fk_positionId = fk_positionId;
	}

	/**
	 * @return the fk_jobId
	 */
	public Long getFk_jobId() {
		return fk_jobId;
	}

	/**
	 * @param fk_jobId the fk_jobId to set
	 */
	public void setFk_jobId(Long fk_jobId) {
		this.fk_jobId = fk_jobId;
	}

	/**
	 *  
	 * 
	 * @return empType
	 */
	public String getEmpType() {
		return empType;
	}

	/**
	 *  
	 * 
	 * @param empType the empType to set
	 */
	public void setEmpType(String empType) {
		this.empType = empType;
	}

	/**
	 *  
	 * 
	 * @return companyTel
	 */
	public String getCompanyTel() {
		return companyTel;
	}

	/**
	 *  
	 * 
	 * @param companyTel the companyTel to set
	 */
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}

	/**
	 *  
	 * 
	 * @return tel
	 */
	public String getTel() {
		return tel;
	}

	/**
	 *  
	 * 
	 * @param tel the tel to set 
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 *  
	 * 
	 * @return email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 *  
	 * 
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 *  
	 * 
	 * @return pwd
	 */
	public String getPwd() {
		return pwd;
	}

	/**
	 *  
	 * 
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 *  
	 * 
	 * @return personalEmail
	 */
	public String getPersonalEmail() {
		return personalEmail;
	}

	/**
	 *  
	 * 
	 * @param personalEmail the personalEmail to set
	 */
	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}

	/**
	 *  
	 * 
	 * @return birth
	 */
	public String getBirth() {
		return birth;
	}

	/**
	 *  
	 * 
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}

	/**
	 *  
	 * 
	 * @return address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 *  
	 * 
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 *  
	 * 
	 * @return detailAddress
	 */
	public String getDetailAddress() {
		return detailAddress;
	}

	/**
	 *  
	 * 
	 * @param detailAddress the detailAddress to set
	 */
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	/**
	 *  
	 * 
	 * @return status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 *  
	 * 
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 *  
	 * 
	 * @return other
	 */
	public String getOther() {
		return other;
	}

	/**
	 *  
	 * 
	 * @param other the other to set
	 */
	public void setOther(String other) {
		this.other = other;
	}

	/**
	 *  
	 * 
	 * @return empName
	 */
	public String getEmpName() {
		return empName;
	}

	/**
	 *  
	 * 
	 * @param empName the empName to set
	 */
	public void setEmpName(String empName) {
		this.empName = empName;
	}

	/**
	 * @return the isAdmin
	 */
	public int getIsAdmin() {
		return isAdmin;
	}

	/**
	 * @param isAdmin the isAdmin to set
	 */
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	/**
	 * @return the adminType
	 */
	public String getAdminType() {
		// 작성자에 따라 컨트롤러 클래스명 다를 수 있기에 수정필

		switch (adminType) {
		case "1":
			return "All";
		case "2":
			return "Personnel";
		case "3":
			return "Approval";
		case "4":
			return "Reservation";
		default:
			return adminType;
		}

	}

	/**
	 * @param adminType the adminType to set
	 */
	public void setAdminType(String adminType) {
		this.adminType = adminType;
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
	 * @return the startWorkDay
	 */
	public String getStartWorkDay() {
		return startWorkDay;
	}

	/**
	 * @param startWorkDay the startWorkDay to set
	 */
	public void setStartWorkDay(String startWorkDay) {
		this.startWorkDay = startWorkDay;
	}

	/**
	 * @return the postCode
	 */
	public String getPostCode() {
		return postCode;
	}

	/**
	 * @param postCode the postCode to set
	 */
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	/**
	 * @return the registerDay
	 */
	public String getRegisterDay() {
		return registerDay;
	}

	/**
	 * @param registerDay the registerDay to set
	 */
	public void setRegisterDay(String registerDay) {
		this.registerDay = registerDay;
	}

	/**
	 * @return the updateDay
	 */
	public String getUpdateDay() {
		return updateDay;
	}

	/**
	 * @param updateDay the updateDay to set
	 */
	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}

	/**
	 * @return the isReadAllDocument
	 */
	public int getIsReadAllDocument() {
		return isReadAllDocument;
	}

	/**
	 * @param isReadAllDocument the isReadAllDocument to set
	 */
	public void setIsReadAllDocument(int isReadAllDocument) {
		this.isReadAllDocument = isReadAllDocument;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the team
	 */
	public String getTeam() {
		return team;
	}

	/**
	 * @param team the team to set
	 */
	public void setTeam(String team) {
		this.team = team;
	}

	/**
	 * @return the fk_depId
	 */
	public Long getFk_depId() {
		return fk_depId;
	}

	/**
	 * @param fk_depId the fk_depId to set
	 */
	public void setFk_depId(Long fk_depId) {
		this.fk_depId = fk_depId;
	}

	/**
	 * @return the jobName
	 */
	public String getJobName() {
		return jobName;
	}

	/**
	 * @param jobName the jobName to set
	 */
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

}
