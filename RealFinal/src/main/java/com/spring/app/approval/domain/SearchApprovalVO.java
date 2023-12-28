/** 
* @FileName  : SearchApprovalVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 9 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.domain;

/** 
* @FileName  : SearchApprovalVO.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 9 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 전자결재 페이지 속에서 검색을 하였을 경우
*/
public class SearchApprovalVO {
	
	/**
	 * 검색구분
	 */
	private String searchType;
	
	/**
	 * 검색어
	 */
	private String searchWord;
	
	/**
	 * 정렬
	 */
	private String orderType;
	
	/**
	 * 현재 페이지
	 */
	private String currentShowPageNo;
	
	/**
	 * 열람 보기 여부 (0: 열람 보지않음, 1: 열람 허용)
	 */
	private String isViewAll;

	/**
	 * @return the searchType
	 */
	public String getSearchType() {
		return searchType;
	}

	/**
	 * @param searchType the searchType to set
	 */
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

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

	/**
	 * @return the isViewAll
	 */
	public String getIsViewAll() {
		return isViewAll;
	}

	/**
	 * @param isViewAll the isViewAll to set
	 */
	public void setIsViewAll(String isViewAll) {
		this.isViewAll = isViewAll;
	}

	
	

}
