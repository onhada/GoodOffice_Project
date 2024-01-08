/** 
* @FileName  : SearchEmployeeVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.admin.domain;

/** 
* @FileName  : SearchEmployeeVO.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 7 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
public class SearchEmployeeVO {
	
	
	/**
	 * 검색어
	 */
	private String searchWord;
	
	/**
	 * 정렬대상 컬럼
	 */
	private String orderCol;
	
	/**
	 * 정렬
	 */
	private String orderType;
	
	/**
	 * 현재 페이지
	 */
	private String currentShowPageNo;

	/**
	 * @return the searchWord
	 */
	public String getSearchWord() {
		return searchWord;
	}

	/**
	 * @param searchWord the searchWord to set
	 */
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	/**
	 * @return the orderCol
	 */
	public String getOrderCol() {
		return orderCol;
	}

	/**
	 * @param orderCol the orderCol to set
	 */
	public void setOrderCol(String orderCol) {
		this.orderCol = orderCol;
	}

	/**
	 * @return the orderType
	 */
	public String getOrderType() {
		return orderType;
	}

	/**
	 * @param orderType the orderType to set
	 */
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	/**
	 * @return the currentShowPageNo
	 */
	public String getCurrentShowPageNo() {
		return currentShowPageNo;
	}

	/**
	 * @param currentShowPageNo the currentShowPageNo to set
	 */
	public void setCurrentShowPageNo(String currentShowPageNo) {
		this.currentShowPageNo = currentShowPageNo;
	}
	
	
	

}
