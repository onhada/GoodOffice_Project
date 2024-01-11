/** 
* @FileName  : SalaryVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 9 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.personnel.domain;

/** 
* @FileName  : SalaryVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 9 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class SalaryVO {
	
	
	/**
	 * 급여id
	 */
	private Long salaryId;
	
	/**
	 * 급여대장 작성사원id
	 */
	private Long empId;
	
	/**
	 * 귀속월
	 */
	private String month;
	
	/**
	 * 산정 시작일자
	 */
	private String startDay;
	
	/**
	 * 산정 종료일자
	 */
	private String endDay;
	
	/**
	 * 급여지급일
	 */
	private String payDay;
	
	/**
	 * 등록일자
	 */
	private String registerDay;
	
	/**
	 * 확정여부 (0: 미확정, 1: 확정)
	 */
	private int isFix;
	
	
	/**
	 * 지급총액 (전체 값)
	 */
	private Long totalPay;
	
	/**
	 * 공제총액 (전체 값)
	 */
	private Long totalDeduction;
	
	/**
	 * 실지급액 (전체 값)
	 */
	private Long actualPay;

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
	 * @return the month
	 */
	public String getMonth() {
		return month;
	}

	/**
	 * @param month the month to set
	 */
	public void setMonth(String month) {
		this.month = month;
	}

	/**
	 * @return the startDay
	 */
	public String getStartDay() {
		return startDay;
	}

	/**
	 * @param startDay the startDay to set
	 */
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	/**
	 * @return the endDay
	 */
	public String getEndDay() {
		return endDay;
	}

	/**
	 * @param endDay the endDay to set
	 */
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	/**
	 * @return the payDay
	 */
	public String getPayDay() {
		return payDay;
	}

	/**
	 * @param payDay the payDay to set
	 */
	public void setPayDay(String payDay) {
		this.payDay = payDay;
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
	 * @return the isFix
	 */
	public int getIsFix() {
		return isFix;
	}

	/**
	 * @param isFix the isFix to set
	 */
	public void setIsFix(int isFix) {
		this.isFix = isFix;
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
	
	
	
}
