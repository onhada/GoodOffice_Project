package com.spring.app.personnel.domain;

/**
 *   @FileName  : SalaryDetailVO.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2024. 1. 9 
 * @작성자      : 신예진 (yejjinny) 
 * @변경이력 : 
 * @프로그램설명 : 
 */
public class SalaryDetailVO {

	/**
	 * 급여 상세id
	 */
	private Long salaryDetailId;

	/**
	 * 급여id
	 */
	private Long salaryId;

	/**
	 * 급여 대상 사원id
	 */
	private Long empId;

	/**
	 * 기본급
	 */
	private Long basePay;

	/**
	 * 연장근로수당
	 */
	private Long overTimePay;
	
	/**
	 * 야간근로수당
	 */
	private Long nightTimePay;
	
	/**
	 * 휴일근로수당
	 */
	private Long holidayPay;
	
	/**
	 * 미사용연차수당
	 */
	private Long unUsedAnnualPay;
	
	/**
	 * 지급총액
	 */
	private Long totalPay;
	
	/**
	 * 소득세
	 */
	private Long incomeTax;
	
	/**
	 * 지방소득세
	 */
	private Long localTax;
	
	/**
	 * 국민연금
	 */
	private Long nationalPension;
	
	/**
	 * 건강보험
	 */
	private Long healthInsurance;
	
	/**
	 * 장기요양보험
	 */
	private Long longTermCareInsurance;
	
	/**
	 * 공제총액
	 */
	private Long totalDeduction;
	
	/**
	 * 실지급액
	 */
	private Long actualPay;
	
	/**
	 * 대상 사원명
	 */
	private String empName;
	
	/**
	 * 대상 사원 이메일 속 id
	 */
	private String id;
	
	/**
	 * 대상사원
	 * [부서명] 팀명
	 */
	private String team;
	
	/**
	 * 대상 사원 직위명
	 */
	private String positionName;
	
	/**
	 * 급여 등록시 문제있다면 false
	 * 없으면 true
	 */
	boolean isCheck;
	
	

	/**
	 * @return the salaryDetailId
	 */
	public Long getSalaryDetailId() {
		return salaryDetailId;
	}

	/**
	 * @param salaryDetailId the salaryDetailId to set
	 */
	public void setSalaryDetailId(Long salaryDetailId) {
		this.salaryDetailId = salaryDetailId;
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
	 * @return the basePay
	 */
	public Long getBasePay() {
		return basePay;
	}

	/**
	 * @param basePay the basePay to set
	 */
	public void setBasePay(Long basePay) {
		this.basePay = basePay;
	}

	/**
	 * @return the overTimePay
	 */
	public Long getOverTimePay() {
		return overTimePay;
	}

	/**
	 * @param overTimePay the overTimePay to set
	 */
	public void setOverTimePay(Long overTimePay) {
		this.overTimePay = overTimePay;
	}

	/**
	 * @return the nightTimePay
	 */
	public Long getNightTimePay() {
		return nightTimePay;
	}

	/**
	 * @param nightTimePay the nightTimePay to set
	 */
	public void setNightTimePay(Long nightTimePay) {
		this.nightTimePay = nightTimePay;
	}

	/**
	 * @return the holidayPay
	 */
	public Long getHolidayPay() {
		return holidayPay;
	}

	/**
	 * @param holidayPay the holidayPay to set
	 */
	public void setHolidayPay(Long holidayPay) {
		this.holidayPay = holidayPay;
	}

	/**
	 * @return the unUsedAnnualPay
	 */
	public Long getUnUsedAnnualPay() {
		return unUsedAnnualPay;
	}

	/**
	 * @param unusedAnnualPay the unUsedAnnualPay to set
	 */
	public void setUnUsedAnnualPay(Long unUsedAnnualPay) {
		this.unUsedAnnualPay = unUsedAnnualPay;
	}

	/**
	 * @return the totalPay
	 */
	public Long getTotalPay() {
		return totalPay;
	}

	/**
	 * @param totalPay the totalPay to set
	 */
	public void setTotalPay(Long totalPay) {
		this.totalPay = totalPay;
	}

	/**
	 * @return the incomeTax
	 */
	public Long getIncomeTax() {
		return incomeTax;
	}

	/**
	 * @param incomeTax the incomeTax to set
	 */
	public void setIncomeTax(Long incomeTax) {
		this.incomeTax = incomeTax;
	}

	/**
	 * @return the localTax
	 */
	public Long getLocalTax() {
		return localTax;
	}

	/**
	 * @param localTax the localTax to set
	 */
	public void setLocalTax(Long localTax) {
		this.localTax = localTax;
	}

	/**
	 * @return the nationalPension
	 */
	public Long getNationalPension() {
		return nationalPension;
	}

	/**
	 * @param nationalPension the nationalPension to set
	 */
	public void setNationalPension(Long nationalPension) {
		this.nationalPension = nationalPension;
	}

	/**
	 * @return the healthInsurance
	 */
	public Long getHealthInsurance() {
		return healthInsurance;
	}

	/**
	 * @param healthInsurance the healthInsurance to set
	 */
	public void setHealthInsurance(Long healthInsurance) {
		this.healthInsurance = healthInsurance;
	}

	/**
	 * @return the longTermCareInsurance
	 */
	public Long getLongTermCareInsurance() {
		return longTermCareInsurance;
	}

	/**
	 * @param longTermCareInsurance the longTermCareInsurance to set
	 */
	public void setLongTermCareInsurance(Long longTermCareInsurance) {
		this.longTermCareInsurance = longTermCareInsurance;
	}

	/**
	 * @return the totalDeduction
	 */
	public Long getTotalDeduction() {
		return totalDeduction;
	}

	/**
	 * @param totalDeduction the totalDeduction to set
	 */
	public void setTotalDeduction(Long totalDeduction) {
		this.totalDeduction = totalDeduction;
	}

	/**
	 * @return the actualPay
	 */
	public Long getActualPay() {
		return actualPay;
	}

	/**
	 * @param actualPay the actualPay to set
	 */
	public void setActualPay(Long actualPay) {
		this.actualPay = actualPay;
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
	 * @return the isCheck
	 */
	public boolean isCheck() {
		return isCheck;
	}

	/**
	 * @param isCheck the isCheck to set
	 */
	public void setCheck(boolean isCheck) {
		this.isCheck = isCheck;
	}
	
	
	
}
