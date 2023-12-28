package com.spring.app.common.domain;


/** 
* @FileName  : EmployeeVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 6 
* @작성자      : 먕지 
* @변경이력     : 
* @프로그램설명  : 
*/
public class EmployeeVO {

	/**
	 * 사원id
	 */
	private Long empId;           
	
	
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
	private String startworkday;  
	
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
	private String postcode;	 
	
	/**
	 * 상태
	 */
	private String status;		 
	
	/**
	 * 프로필이미지
	 */
	private String profileImage; 
	
	/**
	 * 기타정보
	 */
	private String other;		  
	
	/**
	 * 등록일자
	 */
	private String registerday;   
	
	/**
	 * 업데이트일자
	 */
	private String updateday;	  
	
	/**
	 * 사원명
	 */
	private String empName;		
	
	
	/**
	 * 관리자 여부
	 */
	private int isAdmin;
	
	/**
	 * 관리자 기능종류
	 */
	private String adminType;
	
	
	
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
	* @return empType
	*/
	public String getEmpType() {
		return empType;
	}
	
	/** 
	* @param empType the empType to set
	*/
	public void setEmpType(String empType) {
		this.empType = empType;
	}
	
	/** 
	* @return companyTel
	*/
	public String getCompanyTel() {
		return companyTel;
	}
	
	/** 
	* @param companyTel the companyTel to set
	*/
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	
	/** 
	* @return tel
	*/
	public String getTel() {
		return tel;
	}
	
	/** 
	* @param tel the tel to set 
	*/
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	/** 
	* @return email
	*/
	public String getEmail() {
		return email;
	}
	
	/** 
	* @param email the email to set
	*/
	public void setEmail(String email) {
		this.email = email;
	}
	
	/** 
	* @return pwd
	*/
	public String getPwd() {
		return pwd;
	}
	
	/** 
	* @param pwd the pwd to set
	*/
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	/** 
	* @return startworkday
	*/
	public String getStartworkday() {
		return startworkday;
	}
	
	/** 
	* @param startworkday the startworkday to set
	*/
	public void setStartworkday(String startworkday) {
		this.startworkday = startworkday;
	}
	
	/** 
	* @return personalEmail
	*/
	public String getPersonalEmail() {
		return personalEmail;
	}
	
	/** 
	* @param personalEmail the personalEmail to set
	*/
	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}
	
	/** 
	* @return birth
	*/
	public String getBirth() {
		return birth;
	}
	
	/** 
	* @param birth the birth to set
	*/
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	/** 
	* @return address
	*/
	public String getAddress() {
		return address;
	}
	
	/** 
	* @param address the address to set
	*/
	public void setAddress(String address) {
		this.address = address;
	}
	
	/** 
	* @return detailAddress
	*/
	public String getDetailAddress() {
		return detailAddress;
	}
	
	/** 
	* @param detailAddress the detailAddress to set
	*/
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	/** 
	* @return postcode
	*/
	public String getPostcode() {
		return postcode;
	}
	
	/** 
	* @param postcode the postcode to set
	*/
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	/** 
	* @return status
	*/
	public String getStatus() {
		return status;
	}
	
	/** 
	* @param status the status to set
	*/
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	/** 
	* @return profileImage
	*/
	public String getProfileImage() {
		return profileImage;
	}
	
	/** 
	* @param profileImage the profileImage to set
	*/
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	
	/** 
	* @return other
	*/
	public String getOther() {
		return other;
	}
	
	/** 
	* @param other the other to set
	*/
	public void setOther(String other) {
		this.other = other;
	}
	
	/** 
	* @return registerday
	*/
	public String getRegisterday() {
		return registerday;
	}
	
	/** 
	* @param registerday the registerday to set
	*/
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	
	/** 
	* @return updateday
	*/
	public String getUpdateday() {
		return updateday;
	}
	
	/** 
	* @param updateday the updateday to set
	*/
	public void setUpdateday(String updateday) {
		this.updateday = updateday;
	}
	
	/** 
	* @return empName
	*/
	public String getEmpName() {
		return empName;
	}
	
	/** 
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
			return "Personnel";
		case "2":
			return "Approval";
		case "3":
			return "Reservation";
		case "4":
			return "All";
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
	
	
	
}
