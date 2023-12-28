/** 
* @FileName  : FormVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 12 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : FormVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 12 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class FormVO {
	
	/**
	 * 양식id
	 */
	private Long formId;
	
	/**
	 * 양식명
	 */
	private String formName;
	
	/**
	 * 설명
	 */
	private String description;
	
	/**
	 * 사용 여부 (0: 비사용, 1: 사용)
	 */
	private int isUse;

	/**
	 * @return the formId
	 */
	public Long getFormId() {
		return formId;
	}

	/**
	 * @param formId the formId to set
	 */
	public void setFormId(Long formId) {
		this.formId = formId;
	}

	/**
	 * @return the formName
	 */
	public String getFormName() {
		return formName;
	}

	/**
	 * @param formName the formName to set
	 */
	public void setFormName(String formName) {
		this.formName = formName;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the isUse
	 */
	public int getIsUse() {
		return isUse;
	}

	/**
	 * @param isUse the isUse to set
	 */
	public void setIsUse(int isUse) {
		this.isUse = isUse;
	}
	
}
