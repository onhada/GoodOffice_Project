package com.spring.app.reservation.domain;

public class ReservationVO {
	
	
	/**
	 * 자원id
	 */
	private String resourceId;
	/**
	 * 자원명
	 */
	private String resourceName; 
	/**
	 * 자원카테고리id
	 */
	private String resourceCategoryId; 
	/**
	 * 자원카테고리명
	 */
	private String resourceCategoryName;
	
	/**
	 * 예약사원이름
	 */
	private String rsvEmpName;
	/**
	 * 예약사원이메일
	 */
	private String rsvEmpEmail;
	
	/**
	 * 자원예약id
	 */
	private String rsvResourceId;
	/**
	 * 예약시작일시
	 */
	private String rsvStartDayTime; 
	/**
	 * 예약종료일시
	 */
	private String rsvEndDayTime;
	/**
	 * 사용용도 
	 */
	private String rsvReason;
	/**
	 * 예약상태 (1:승인대기중, 2:예약완료, 3:예약반려)
	 */
	private String rsvStatus;
	
	/**
	 * 결재상태 (1:대기, 2:승인, 3:반려)
	 */
	private String approvalStatus;
	/**
	 * 결재일자
	 */
	private String approvalDay;
	/**
	 * 승인사원id
	 */
	private String fk_approvalEmpId;
	/**
	 * 예약 반려 사유
	 */
	private String rejectReason;
	
	/**
	 * 반납상태 (0:반납필요자원아님, 1:반납대기, 2:반납완료)
	 */
	private String returnStatus; 
	
	/**
	 * 등록일자
	 */
	private String registerDay; 
	/**
	 * 업데이트일자
	 */
	private String updateDay;
	
	///////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * @return the resourceId
	 */
	public String getResourceId() {
		return resourceId;
	}
	/**
	 * @param resourceId the resourceId to set
	 */
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	/**
	 * @return the resourceName
	 */
	public String getResourceName() {
		return resourceName;
	}
	/**
	 * @param resourceName the resourceName to set
	 */
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	/**
	 * @return the resourceCategoryId
	 */
	public String getResourceCategoryId() {
		return resourceCategoryId;
	}
	/**
	 * @param resourceCategoryId the resourceCategoryId to set
	 */
	public void setResourceCategoryId(String resourceCategoryId) {
		this.resourceCategoryId = resourceCategoryId;
	}
	/**
	 * @return the resourceCategoryName
	 */
	public String getResourceCategoryName() {
		return resourceCategoryName;
	}
	/**
	 * @param resourceCategoryName the resourceCategoryName to set
	 */
	public void setResourceCategoryName(String resourceCategoryName) {
		this.resourceCategoryName = resourceCategoryName;
	}
	/**
	 * @return the rsvEmpName
	 */
	public String getRsvEmpName() {
		return rsvEmpName;
	}
	/**
	 * @param rsvEmpName the rsvEmpName to set
	 */
	public void setRsvEmpName(String rsvEmpName) {
		this.rsvEmpName = rsvEmpName;
	}
	/**
	 * @return the rsvEmpEmail
	 */
	public String getRsvEmpEmail() {
		return rsvEmpEmail;
	}
	/**
	 * @param rsvEmpEmail the rsvEmpEmail to set
	 */
	public void setRsvEmpEmail(String rsvEmpEmail) {
		this.rsvEmpEmail = rsvEmpEmail;
	}
	/**
	 * @return the rsvResourceId
	 */
	public String getRsvResourceId() {
		return rsvResourceId;
	}
	/**
	 * @param rsvResourceId the rsvResourceId to set
	 */
	public void setRsvResourceId(String rsvResourceId) {
		this.rsvResourceId = rsvResourceId;
	}
	/**
	 * @return the rsvStartDayTime
	 */
	public String getRsvStartDayTime() {
		return rsvStartDayTime;
	}
	/**
	 * @param rsvStartDayTime the rsvStartDayTime to set
	 */
	public void setRsvStartDayTime(String rsvStartDayTime) {
		this.rsvStartDayTime = rsvStartDayTime;
	}
	/**
	 * @return the rsvEndDayTime
	 */
	public String getRsvEndDayTime() {
		return rsvEndDayTime;
	}
	/**
	 * @param rsvEndDayTime the rsvEndDayTime to set
	 */
	public void setRsvEndDayTime(String rsvEndDayTime) {
		this.rsvEndDayTime = rsvEndDayTime;
	}
	/**
	 * @return the rsvReason
	 */
	public String getRsvReason() {
		return rsvReason;
	}
	/**
	 * @param rsvReason the rsvReason to set
	 */
	public void setRsvReason(String rsvReason) {
		this.rsvReason = rsvReason;
	}
	/**
	 * @return the rsvStatus
	 */
	public String getRsvStatus() {
		return rsvStatus;
	}
	/**
	 * @param rsvStatus the rsvStatus to set
	 */
	public void setRsvStatus(String rsvStatus) {
		this.rsvStatus = rsvStatus;
	}
	/**
	 * @return the approvalStatus
	 */
	public String getApprovalStatus() {
		return approvalStatus;
	}
	/**
	 * @param approvalStatus the approvalStatus to set
	 */
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	/**
	 * @return the approvalDay
	 */
	public String getApprovalDay() {
		return approvalDay;
	}
	/**
	 * @param approvalDay the approvalDay to set
	 */
	public void setApprovalDay(String approvalDay) {
		this.approvalDay = approvalDay;
	}
	/**
	 * @return the fk_approvalEmpId
	 */
	public String getFk_approvalEmpId() {
		return fk_approvalEmpId;
	}
	/**
	 * @param fk_approvalEmpId the fk_approvalEmpId to set
	 */
	public void setFk_approvalEmpId(String fk_approvalEmpId) {
		this.fk_approvalEmpId = fk_approvalEmpId;
	}
	/**
	 * @return the rejectReason
	 */
	public String getRejectReason() {
		return rejectReason;
	}
	/**
	 * @param rejectReason the rejectReason to set
	 */
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	/**
	 * @return the returnStatus
	 */
	public String getReturnStatus() {
		return returnStatus;
	}
	/**
	 * @param returnStatus the returnStatus to set
	 */
	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
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
	
	
	
	
	
	
}
