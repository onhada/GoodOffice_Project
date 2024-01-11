/** 
* @FileName  : ApprovalController.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 5 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.approval.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.approval.domain.AdminHistoryVO;
import com.spring.app.approval.domain.ApprovalActionVO;
import com.spring.app.approval.domain.ApprovalDetailVO;
import com.spring.app.approval.domain.ApprovalFileVO;
import com.spring.app.approval.domain.ApprovalProcedureVO;
import com.spring.app.approval.domain.ApprovalVO;
import com.spring.app.approval.domain.BatchVO;
import com.spring.app.approval.domain.SearchApprovalVO;
import com.spring.app.approval.service.ApprovalService;
import com.spring.app.common.FileManager;
import com.spring.app.common.MyUtil;
import com.spring.app.common.domain.EmployeeVO;

/**
 *   @FileName  : ApprovalController.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 5 
 * @작성자      : 신예진
 * @변경이력 : 
 * @프로그램설명 : 
 */
@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService service;

	// === #155. 파일업로드 및 파일다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI : Dependency
	// Injection) ===
	@Autowired // Type에 따라 알아서 Bean 을 주입해준다.
	private FileManager fileManager;

	/**
	 *  
	 * 
	 * @Method Name  : approvalListAll_ing 
	 * @작성일   : 2023. 12. 5 
	 * @작성자   : 신예진 @변경이력  : 
	 * @Method 설명 : 전자결재 메뉴 선택 및 진행 중인 문서_전체 클릭시
	 * @param req @return 
	 */
	@GetMapping("/approval/document/list/{type}.gw")
	public ModelAndView approvalListAll_ing_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			SearchApprovalVO savo, @PathVariable String type) {

		mav.addObject("type", type);

		HttpSession session = req.getSession();

		String searchType = savo.getSearchType();
		String searchWord = savo.getSearchWord();
		String orderType = savo.getOrderType();
		String str_currentShowPageNo = savo.getCurrentShowPageNo();

		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null) {
			searchWord = "";
		}

		if ("approvalId".equals(searchType) && searchWord != "") {
			searchType = "apd.fk_" + searchType;
		}

		if (orderType == null) {
			orderType = "desc";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		paraMap.put("orderType", orderType);
		paraMap.put("empId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId()));

		// 문서 종류 가져오기
		mav.addObject("formList", service.getFormNameList());

		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함 한 것)
		List<ApprovalVO> ingList = new ArrayList<>();

		if ("A".equals(type)) {
			ingList = service.getApprovalAllIngList_withSearchAndPaging(paraMap);
		} else if ("W".equals(type)) {
			ingList = service.getApprovalWaitingList_withSearchAndPaging(paraMap);
		} else if ("V".equals(type)) {
			ingList = service.getApprovalCheckList_withSearchAndPaging(paraMap);
		} else if ("E".equals(type)) {
			ingList = service.getApprovalScheduleList_withSearchAndPaging(paraMap);
		} else if ("P".equals(type)) {
			ingList = service.getApprovalProgressList_withSearchAndPaging(paraMap);
		}

//		if (!"".equals(searchType) && !"".equals(searchWord)) {
//			paraMap.put("searchType", "");
//			paraMap.put("searchWord", "");
//

//		}
//
//		mav.addObject("aSize", service.getApprovalAllIngList_withSearchAndPaging(paraMap).size());
//		mav.addObject("wSize", service.getApprovalWaitingList_withSearchAndPaging(paraMap).size());
//		mav.addObject("vSize", service.getApprovalCheckList_withSearchAndPaging(paraMap).size());
//		mav.addObject("eSize", service.getApprovalScheduleList_withSearchAndPaging(paraMap).size());
//		mav.addObject("pSize", service.getApprovalProgressList_withSearchAndPaging(paraMap).size());

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = ingList.size();


		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		} else {

			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		mav.addObject("currentShowPageNo", currentShowPageNo);

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo startRno endRno
		 * -------------------------------------------- 1 page ===> 1 10 2 page ===> 11
		 * 20 3 page ===> 21 30 4 page ===> 31 40 ...... ... ...
		 */
		int startRno = ((currentShowPageNo - 1) * sizePerPage); // 시작 행번호
		int endRno = startRno + sizePerPage; // 끝 행번호
		/*
		 * int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 int
		 * endRno = startRno + sizePerPage - 1; // 끝 행번호
		 */


		/*
		 * paraMap.put("startRno", String.valueOf(startRno)); paraMap.put("endRno",
		 * String.valueOf(endRno));
		 */

		if (totalCount == 0) {
			mav.addObject("ingList", ingList);
		} else {
			
			if(ingList.size() < sizePerPage) {
				mav.addObject("ingList", ingList);
			}else {
				mav.addObject("ingList", ingList.subList(startRno, endRno));
			}
		}

//		mav.addObject("allIngList", allIngList.subList(startRno-1, endRno +1));

//		if ("subject".equals(searchType) || "content".equals(searchType) || "subject_content".equals(searchType)
//				|| "name".equals(searchType)) {
//			mav.addObject("paraMap", paraMap);
//		}

		// === #121. 페이지바 만들기 === //
		// 수정필
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 [다음][마지막] -- 1개블럭 [맨처음][이전] 11 12 13 14 15 16 17 18 19
		 * 20 [다음][마지막] -- 1개블럭 [맨처음][이전] 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //

		/*
		 * 1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다. 11 12 13 14 15 16 17
		 * 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다. 21 22 23 24 25 26 27 28 29 30
		 * -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		 * 
		 * currentShowPageNo pageNo ---------------------------------- 1 1 = ((1 -
		 * 1)/10) * 10 + 1 2 1 = ((2 - 1)/10) * 10 + 1 3 1 = ((3 - 1)/10) * 10 + 1 4 1 5
		 * 1 6 1 7 1 8 1 9 1 10 1 = ((10 - 1)/10) * 10 + 1
		 * 
		 * 11 11 = ((11 - 1)/10) * 10 + 1 12 11 = ((12 - 1)/10) * 10 + 1 13 11 = ((13 -
		 * 1)/10) * 10 + 1 14 11 15 11 16 11 17 11 18 11 19 11 20 11 = ((20 - 1)/10) *
		 * 10 + 1
		 * 
		 * 21 21 = ((21 - 1)/10) * 10 + 1 22 21 = ((22 - 1)/10) * 10 + 1 23 21 = ((23 -
		 * 1)/10) * 10 + 1 .. .. 29 21 30 21 = ((30 - 1)/10) * 10 + 1
		 */

		String pageBar = "<ul style='list-style:none;'>";
		String url = "";

		// === [맨처음][이전] 만들기 === //
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
					+ "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ (pageNo - 1) + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
						+ "&currentShowPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);

		mav.addObject("goBackURL", goBackURL);
		mav.addObject("totalCount", totalCount);
		mav.addObject("orderType", orderType);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);
		
		mav.setViewName("document_lists_" + type + ".approval");

		return mav;

	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/** 
	* @Method Name  : approvalDocumentBox_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함
	* @param req
	* @param res
	* @param mav
	* @param savo
	* @param type
	* @return 
	*/
	@GetMapping("/approval/document/box/{type}.gw")
	public ModelAndView approvalDocumentBox_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			SearchApprovalVO savo, @PathVariable String type) {

		mav.addObject("type", type);

		HttpSession session = req.getSession();

		String searchType = savo.getSearchType();
		String searchWord = savo.getSearchWord();
		String orderType = savo.getOrderType();
		String listType = savo.getListType();
		String isViewAll = savo.getIsViewAll();
		String str_currentShowPageNo = savo.getCurrentShowPageNo();

		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null) {
			searchWord = "";
		}

		if ("approvalId".equals(searchType) && searchWord != "") {
			searchType = "apd.fk_" + searchType;
		}

		if (orderType == null) {
			orderType = "desc";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}
		
		if (listType == null) {
			listType = "";
		}
		
		if (isViewAll == null) {
			isViewAll = "0";
		}


		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		paraMap.put("orderType", orderType);
		paraMap.put("listType", listType);
		paraMap.put("isViewAll", isViewAll);
		paraMap.put("empId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId()));
		paraMap.put("positionId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getFk_positionId()));

		// 문서 종류 가져오기
		mav.addObject("formList", service.getFormNameList());

		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함 한 것)
		List<ApprovalVO> boxList = new ArrayList<>();

		if ("all".equals(type)) {
			paraMap.put("isViewAll", savo.getIsViewAll());
			boxList = service.getApprovalAllBox_withSearchAndPaging(paraMap);
			mav.addObject("isViewAll", savo.getIsViewAll());
		} else if ("writer".equals(type)) {
			boxList = service.getApprovalWriterBox_withSearchAndPaging(paraMap);
		} else if ("approval".equals(type)) {
			boxList = service.getApprovalApprovalBox_withSearchAndPaging(paraMap);
		} else if ("refer".equals(type)) {
			boxList = service.getApprovalReferBox_withSearchAndPaging(paraMap);
		} else if ("read".equals(type)) {
			boxList = service.getApprovalReadBox_withSearchAndPaging(paraMap);
		} else if ("return".equals(type)) {
			boxList = service.getApprovalReturnBox_withSearchAndPaging(paraMap);
		} else if ("temp".equals(type)) {
			boxList = service.getApprovalTempBox_withSearchAndPaging(paraMap);
		} else {
			type = "all";
			boxList = service.getApprovalAllBox_withSearchAndPaging(paraMap);
		}

//		if (!"".equals(searchType) && !"".equals(searchWord)) {
//			paraMap.put("searchType", "");
//			paraMap.put("searchWord", "");
//
//			mav.addObject("searchType", searchType);
//			mav.addObject("searchWord", searchWord);
//		}
//		mav.addObject("aSize", service.getApprovalAllIngList_withSearchAndPaging(paraMap).size());
//		mav.addObject("wSize", service.getApprovalWaitingList_withSearchAndPaging(paraMap).size());
//		mav.addObject("vSize", service.getApprovalCheckList_withSearchAndPaging(paraMap).size());
//		mav.addObject("eSize", service.getApprovalScheduleList_withSearchAndPaging(paraMap).size());
//		mav.addObject("pSize", service.getApprovalProgressList_withSearchAndPaging(paraMap).size());

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = boxList.size();


		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		}

		else {

			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		mav.addObject("currentShowPageNo", currentShowPageNo);

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo startRno endRno
		 * -------------------------------------------- 1 page ===> 1 10 2 page ===> 11
		 * 20 3 page ===> 21 30 4 page ===> 31 40 ...... ... ...
		 */
		int startRno = ((currentShowPageNo - 1) * sizePerPage); // 시작 행번호
		int endRno = startRno + sizePerPage; // 끝 행번호
		/*
		 * int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 int
		 * endRno = startRno + sizePerPage - 1; // 끝 행번호
		 */


		/*
		 * paraMap.put("startRno", String.valueOf(startRno)); paraMap.put("endRno",
		 * String.valueOf(endRno));
		 */

		if (totalCount == 0) {
			mav.addObject("boxList", boxList);
		} else {
			if(boxList.size() < sizePerPage) {
				mav.addObject("boxList", boxList);
			}else {
				mav.addObject("boxList", boxList.subList(startRno, endRno));
			}
		}

//		mav.addObject("allIngList", allIngList.subList(startRno-1, endRno +1));

//		if ("subject".equals(searchType) || "content".equals(searchType) || "subject_content".equals(searchType)
//				|| "name".equals(searchType)) {
//			mav.addObject("paraMap", paraMap);
//		}

		// === #121. 페이지바 만들기 === //
		// 수정필
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 [다음][마지막] -- 1개블럭 [맨처음][이전] 11 12 13 14 15 16 17 18 19
		 * 20 [다음][마지막] -- 1개블럭 [맨처음][이전] 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //

		/*
		 * 1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다. 11 12 13 14 15 16 17
		 * 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다. 21 22 23 24 25 26 27 28 29 30
		 * -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		 * 
		 * currentShowPageNo pageNo ---------------------------------- 1 1 = ((1 -
		 * 1)/10) * 10 + 1 2 1 = ((2 - 1)/10) * 10 + 1 3 1 = ((3 - 1)/10) * 10 + 1 4 1 5
		 * 1 6 1 7 1 8 1 9 1 10 1 = ((10 - 1)/10) * 10 + 1
		 * 
		 * 11 11 = ((11 - 1)/10) * 10 + 1 12 11 = ((12 - 1)/10) * 10 + 1 13 11 = ((13 -
		 * 1)/10) * 10 + 1 14 11 15 11 16 11 17 11 18 11 19 11 20 11 = ((20 - 1)/10) *
		 * 10 + 1
		 * 
		 * 21 21 = ((21 - 1)/10) * 10 + 1 22 21 = ((22 - 1)/10) * 10 + 1 23 21 = ((23 -
		 * 1)/10) * 10 + 1 .. .. 29 21 30 21 = ((30 - 1)/10) * 10 + 1
		 */

		String pageBar = "<ul style='list-style:none;'>";
		String url = "";

		// === [맨처음][이전] 만들기 === //
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
					+ "&currentShowPageNo=1&listType=" + listType + "'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ (pageNo - 1) + "&listType=" + listType + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
						+ "&currentShowPageNo=" + pageNo + "&listType=" + listType + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ pageNo + "&listType=" + listType + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ totalPage + "&listType=" + listType + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);

		mav.addObject("totalCount", totalCount);
		mav.addObject("goBackURL", goBackURL);
		mav.addObject("orderType", orderType);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);
		mav.addObject("listType", listType);

		mav.setViewName("document_box_" + type + ".approval");

		return mav;

	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////
	/** 
	* @Method Name  : approvalAdminSettingBasicShow_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 관리자 설정_기본 설정
	* @param req
	* @param res
	* @param mav
	* @return 
	*/
	@GetMapping("/approval/settings/basic.gw")
	public ModelAndView approvalAdminSettingBasicShow_AfterGetListSize(HttpServletRequest req, HttpServletResponse res,
			ModelAndView mav) {
		// 관리자 설정_기본 설정 보여주기용

		mav.setViewName("settings_basic.approval");
		mav.addObject("securityLevelList", service.getSecurityLevelList());
		mav.addObject("securityLevelDetailList", service.getSecurityLevelDetailList());
		
		mav.addObject("type", "settings_basic");
		mav.addObject("noSearch", true);
		return mav;

	}

	/** 
	* @Method Name  : approvalAdminSettingBasic 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전자결재관리자_기본 설정 설정하기
	* @param req
	* @param res
	* @param mav
	* @return 
	*/
	@PostMapping("/approval/settings/basic.gw")
	public ModelAndView approvalAdminSettingBasic_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {
		// 관리자 설정_기본 설정 설정하기

		String levelA = req.getParameter("security_level_a");
		String levelB = req.getParameter("security_level_b");

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("levelA", levelA);
		paraMap.put("levelB", levelB);

		if (service.setSecurityLevel(paraMap)) {
			// true : 업데이트가 잘 되었을 경우

			mav.setViewName("redirect:/approval/settings/basic.gw"); // 실제로 redirect:/view.action 은 POST방식이 아닌 GET방식이다.

		} else {
			mav.addObject("message", "저장에 실패하였습니다!");
			// mav.addObject("type", "settings_basic");
			mav.addObject("loc", req.getContextPath() + "/approval/settings/basic.gw");
			mav.setViewName("msg");
		}

		return mav;

	}

	/** 
	* @Method Name  : approvalAdminSettingForm_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_양식함 관리 메인 화면
	* @param req
	* @param res
	* @param mav
	* @return 
	*/
	@GetMapping("/approval/settings/forms.gw")
	public ModelAndView approvalAdminSettingForm_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {

		String searchWord = req.getParameter("searchWord");
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");

		if (searchWord == null) {
			searchWord = "";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCountApprovalFormList(searchWord);

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		}

		else {

			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		mav.addObject("currentShowPageNo", currentShowPageNo);

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo startRno endRno
		 * -------------------------------------------- 1 page ===> 1 10 2 page ===> 11
		 * 20 3 page ===> 21 30 4 page ===> 31 40 ...... ... ...
		 */
		int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호
		int endRno = startRno + sizePerPage - 1; // 끝 행번호
		/*
		 * int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 int
		 * endRno = startRno + sizePerPage - 1; // 끝 행번호
		 */

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		paraMap.put("searchWord", searchWord);

		// 페이징 처리한 양식 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함 한 것)
		mav.addObject("formList", service.getFormList(paraMap));
		mav.addObject("type", "settings_forms");

//		mav.addObject("allIngList", allIngList.subList(startRno-1, endRno +1));

//		if ("subject".equals(searchType) || "content".equals(searchType) || "subject_content".equals(searchType)
//				|| "name".equals(searchType)) {
//			mav.addObject("paraMap", paraMap);
//		}

		// === #121. 페이지바 만들기 === //
		// 수정필
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 [다음][마지막] -- 1개블럭 [맨처음][이전] 11 12 13 14 15 16 17 18 19
		 * 20 [다음][마지막] -- 1개블럭 [맨처음][이전] 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //

		/*
		 * 1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다. 11 12 13 14 15 16 17
		 * 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다. 21 22 23 24 25 26 27 28 29 30
		 * -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		 * 
		 * currentShowPageNo pageNo ---------------------------------- 1 1 = ((1 -
		 * 1)/10) * 10 + 1 2 1 = ((2 - 1)/10) * 10 + 1 3 1 = ((3 - 1)/10) * 10 + 1 4 1 5
		 * 1 6 1 7 1 8 1 9 1 10 1 = ((10 - 1)/10) * 10 + 1
		 * 
		 * 11 11 = ((11 - 1)/10) * 10 + 1 12 11 = ((12 - 1)/10) * 10 + 1 13 11 = ((13 -
		 * 1)/10) * 10 + 1 14 11 15 11 16 11 17 11 18 11 19 11 20 11 = ((20 - 1)/10) *
		 * 10 + 1
		 * 
		 * 21 21 = ((21 - 1)/10) * 10 + 1 22 21 = ((22 - 1)/10) * 10 + 1 23 21 = ((23 -
		 * 1)/10) * 10 + 1 .. .. 29 21 30 21 = ((30 - 1)/10) * 10 + 1
		 */

		String pageBar = "<ul style='list-style:none;'>";
		String url = "";

		// === [맨처음][이전] 만들기 === //
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchWord="
					+ searchWord + "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?&searchWord="
					+ searchWord + "&currentShowPageNo=" + (pageNo - 1) + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchWord=" + searchWord + "&currentShowPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchWord="
					+ searchWord + "&currentShowPageNo=" + pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchWord="
					+ searchWord + "&currentShowPageNo=" + totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);

		mav.setViewName("settings_forms.approval");
		mav.addObject("totalCount", totalCount);
		mav.addObject("searchWord", searchWord);
		mav.addObject("goBackURL", goBackURL);
		mav.addObject("noSearch", true);

		return mav;

	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/** 
	* @Method Name  : approvalAdminSettingsDocument_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전체문서목록
	* @param req
	* @param res
	* @param mav
	* @param savo
	* @return 
	*/
	@GetMapping("/approval/settings/document.gw")
	public ModelAndView approvalAdminSettingsDocument_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			SearchApprovalVO savo) {

		mav.addObject("type", "settings_document");

		String searchType = savo.getSearchType();
		String searchWord = savo.getSearchWord();
		String orderType = savo.getOrderType();
		String str_currentShowPageNo = savo.getCurrentShowPageNo();

		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null) {
			searchWord = "";
		}

		if ("approvalId".equals(searchType) && searchWord != "") {
			try {
				Long.parseLong(savo.getSearchWord());
			} catch (NumberFormatException e) {
				searchWord = "-1";
			}
		}

		if (orderType == null) {
			orderType = "desc";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		paraMap.put("orderType", orderType);

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCountDocumentAllList(paraMap);

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		}

		else {

			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		mav.addObject("currentShowPageNo", currentShowPageNo);

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo startRno endRno
		 * -------------------------------------------- 1 page ===> 1 10 2 page ===> 11
		 * 20 3 page ===> 21 30 4 page ===> 31 40 ...... ... ...
		 */
		int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호
		int endRno = startRno + sizePerPage - 1; // 끝 행번호
		/*
		 * int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 int
		 * endRno = startRno + sizePerPage - 1; // 끝 행번호
		 */

		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));

		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함 한 것)
		mav.addObject("documentList", service.getDocumentAllList_withSearchAndPaging(paraMap));

		// === #121. 페이지바 만들기 === //
		// 수정필
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 [다음][마지막] -- 1개블럭 [맨처음][이전] 11 12 13 14 15 16 17 18 19
		 * 20 [다음][마지막] -- 1개블럭 [맨처음][이전] 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //

		/*
		 * 1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다. 11 12 13 14 15 16 17
		 * 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다. 21 22 23 24 25 26 27 28 29 30
		 * -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		 * 
		 * currentShowPageNo pageNo ---------------------------------- 1 1 = ((1 -
		 * 1)/10) * 10 + 1 2 1 = ((2 - 1)/10) * 10 + 1 3 1 = ((3 - 1)/10) * 10 + 1 4 1 5
		 * 1 6 1 7 1 8 1 9 1 10 1 = ((10 - 1)/10) * 10 + 1
		 * 
		 * 11 11 = ((11 - 1)/10) * 10 + 1 12 11 = ((12 - 1)/10) * 10 + 1 13 11 = ((13 -
		 * 1)/10) * 10 + 1 14 11 15 11 16 11 17 11 18 11 19 11 20 11 = ((20 - 1)/10) *
		 * 10 + 1
		 * 
		 * 21 21 = ((21 - 1)/10) * 10 + 1 22 21 = ((22 - 1)/10) * 10 + 1 23 21 = ((23 -
		 * 1)/10) * 10 + 1 .. .. 29 21 30 21 = ((30 - 1)/10) * 10 + 1
		 */

		String pageBar = "<ul style='list-style:none;'>";
		String url = "";

		// === [맨처음][이전] 만들기 === //
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
					+ "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ (pageNo - 1) + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
						+ "&currentShowPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);
		

		mav.addObject("goBackURL", goBackURL);
		mav.addObject("totalCount", totalCount);
		mav.addObject("orderType", orderType);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);

		mav.setViewName("settings_document.approval");

		return mav;

	}

	/** 
	* @Method Name  : approvalAdminSettingsDeleteDocument_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 삭제 문서 목록
	* @param req
	* @param res
	* @param mav
	* @param savo
	* @return 
	*/
	@GetMapping("/approval/settings/deleted_document.gw")
	public ModelAndView approvalAdminSettingsDeleteDocument_AfterGetListSize(HttpServletRequest req, HttpServletResponse res,
			ModelAndView mav, SearchApprovalVO savo) {

		mav.addObject("type", "settings_deleted_document");

		String searchType = savo.getSearchType();
		String searchWord = savo.getSearchWord();
		String orderType = savo.getOrderType();
		String str_currentShowPageNo = savo.getCurrentShowPageNo();

		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null) {
			searchWord = "";
		}

		if ("approvalId".equals(searchType) && searchWord != "") {
			try {
				Long.parseLong(savo.getSearchWord());
			} catch (NumberFormatException e) {
				searchWord = "-1";
			}
		}

		if (orderType == null) {
			orderType = "desc";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		paraMap.put("orderType", orderType);

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCountDocumentDeleteList(paraMap);


		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		}

		else {

			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		mav.addObject("currentShowPageNo", currentShowPageNo);

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo startRno endRno
		 * -------------------------------------------- 1 page ===> 1 10 2 page ===> 11
		 * 20 3 page ===> 21 30 4 page ===> 31 40 ...... ... ...
		 */
		int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호
		int endRno = startRno + sizePerPage - 1; // 끝 행번호
		/*
		 * int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 int
		 * endRno = startRno + sizePerPage - 1; // 끝 행번호
		 */

		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));

		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함 한 것)
		mav.addObject("documentList", service.getDocumentDeleteList_withSearchAndPaging(paraMap));

		// === #121. 페이지바 만들기 === //
		// 수정필
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 [다음][마지막] -- 1개블럭 [맨처음][이전] 11 12 13 14 15 16 17 18 19
		 * 20 [다음][마지막] -- 1개블럭 [맨처음][이전] 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //

		/*
		 * 1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다. 11 12 13 14 15 16 17
		 * 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다. 21 22 23 24 25 26 27 28 29 30
		 * -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		 * 
		 * currentShowPageNo pageNo ---------------------------------- 1 1 = ((1 -
		 * 1)/10) * 10 + 1 2 1 = ((2 - 1)/10) * 10 + 1 3 1 = ((3 - 1)/10) * 10 + 1 4 1 5
		 * 1 6 1 7 1 8 1 9 1 10 1 = ((10 - 1)/10) * 10 + 1
		 * 
		 * 11 11 = ((11 - 1)/10) * 10 + 1 12 11 = ((12 - 1)/10) * 10 + 1 13 11 = ((13 -
		 * 1)/10) * 10 + 1 14 11 15 11 16 11 17 11 18 11 19 11 20 11 = ((20 - 1)/10) *
		 * 10 + 1
		 * 
		 * 21 21 = ((21 - 1)/10) * 10 + 1 22 21 = ((22 - 1)/10) * 10 + 1 23 21 = ((23 -
		 * 1)/10) * 10 + 1 .. .. 29 21 30 21 = ((30 - 1)/10) * 10 + 1
		 */

		String pageBar = "<ul style='list-style:none;'>";
		String url = "";

		// === [맨처음][이전] 만들기 === //
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
					+ "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ (pageNo - 1) + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
						+ "&currentShowPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);
		
		mav.addObject("goBackURL", goBackURL);
		mav.addObject("totalCount", totalCount);
		mav.addObject("orderType", orderType);
		mav.addObject("searchType", searchType);
		mav.addObject("searchWord", searchWord);

		mav.setViewName("settings_deleted_document.approval");

		return mav;

	}

	/** 
	* @Method Name  : approvalAdminSettingsAdminList_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전자결재 관리자
	* @param req
	* @param res
	* @param mav
	* @return 
	*/
	@GetMapping("/approval/settings/admin.gw")
	public ModelAndView approvalAdminSettingsAdminList_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {

		mav.addObject("type", "settings_admin");
		mav.addObject("noSearch", true);
		mav.addObject("adminList", service.getAdminList());
		mav.setViewName("settings_admin.approval");

		return mav;

	}

	/** 
	* @Method Name  : approvalDocumentView_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기
	* @param req
	* @param res
	* @param mav
	* @param approvalId
	* @param formId
	* @param viewType
	* @param type
	* @return 
	*/
	@GetMapping("/approval/documentDetail/{viewType}/{type}/view.gw")
	public ModelAndView approvalDocumentView_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			Long approvalId, Long formId, @PathVariable String viewType, @PathVariable String type) {

		HttpSession session = req.getSession();
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("approvalId", approvalId);
		paraMap.put("empId", loginUser.getEmpId());
		paraMap.put("positonId", loginUser.getFk_positionId());
		paraMap.put("formId", formId);
		
		
		// formId, approvalId 가 존재하는지 확인한다
		if(service.isExistApproval(paraMap)) {
			/*
			 * 존재할 경우
			 * 읽으려고 하는 자의 권한을 확인한다
			 * 프로시저 안에 있는 사람일 경우
			 * 전자결재 관리자, 전체 관리자 일경우
			 * 
			 * */
			// 전자결재 절차에 유저가 존재하는지 확인한다
			int userProcedureType = service.getUserProcedureType(paraMap);
			
			if(userProcedureType != 0) {
				// 전자결재 절차에 존재할 경우
				mav.addObject("userProcedureType", userProcedureType);
			}else{
				if("Approval".equals(loginUser.getAdminType()) || "All".equals(loginUser.getAdminType())) {
					// 전자결재 관리자 혹은 전체 관리자일 경우 userProcedureType = 0 으로 넣는다
					mav.addObject("userProcedureType", userProcedureType);
				}else {
					// 읽을 권한이 없을 경우
					
					// 에러 처리
					mav.addObject("message", "읽을 권한이 없습니다.");
					// 이전 페이지로 이동
					mav.addObject("loc", req.getHeader("referer"));
					mav.setViewName("/common/msg");
					return mav;
				}
			}
			
			
			
			

			// 수정필 !!!!!!!!!!!!!!!!! 폼id에 따라 더 추가될 내용이 있음 그거 추가해서 넣기
			if (formId == 109) {
				// 재직증명서
				mav.addObject("empProofDetail", service.getEmpProofDetail(paraMap));
			} else if (formId == 108) {
				// 품의서 합의 부분
				mav.addObject("agreeList", service.getProcedureTypeAgree(approvalId));
			} else if (formId == 101 || formId == 102) {
				// 연장근무 신청 혹은 휴일 근무 신청
				mav.addObject("workApplication", service.getWorkApplicationDetail(approvalId));
			} else if (formId == 104) {
				// 휴가 신청
				mav.addObject("dayOffDetail", service.getDayOffDetail(approvalId));
			} else if (formId == 103) {
				// 근무체크 수정 요청
				mav.addObject("modifyWorkRequest", service.getModifyWorkRequest(approvalId));
			}

			/////////////////////////////////////////////////////////////

			ApprovalDetailVO approvalDetail = service.getApprovalDocumentView(paraMap);

			mav.addObject("approvalDetail", approvalDetail);

			// 의견
			mav.addObject("opinionList", service.getApprovalOpinionList(approvalId));
			mav.addObject("securityLevelList", service.getSecurityLevelList());

			// 기안자인지 확인하기
			// 1: 기안 or 신청자
			mav.addObject("isDraftEmp", service.isDraftEmp(paraMap));
			
			
			// 반려된 것인지 확인하기
			if ("list".equals(viewType)) {
				boolean isReturn = service.isReturn(approvalId);
				if (isReturn) {
					// 반려된 것일 경우 읽음으로 바꾸기
					if (service.updateReadReturn(paraMap) != 1) {
						// 읽음처리 실패했을 경우

						// 에러 표시

						mav.addObject("message", "에러가 발생하였습니다. 다시 시도해주세요.");
						// 이전 페이지로 이동
						mav.addObject("loc", req.getHeader("referer"));
						mav.setViewName("msg");
						return mav;

					}
				}
				mav.addObject("isReturn", isReturn);
			}

			String url = "";
			switch (approvalDetail.getFormName()) {
			case "업무연락":
				url = "document_view_businessContact.approval";
				break;
			case "회람":
				url = "document_view_circulation.approval";
				break;
			case "재직증명서":
				url = "document_view_empProof.approval";
				break;
			case "품의서":
				url = "document_view_roundRobin.approval";
				break;
			case "급여 지급 품의서":
				url = "document_view_salary.approval";
				break;
			case "연장근무 신청":
			case "휴일근무 신청":
				url = "document_view_workApplication.approval";
				break;
			case "휴가 신청":
				url = "document_view_dayOffApplication.approval";
				break;
			case "근무체크 수정 요청":
				url = "document_view_modifyWorkRequest.approval";
				break;
			}
			mav.setViewName(url);

			mav.addObject("viewType", viewType);
			mav.addObject("type", type);
			mav.addObject("noSearch", true);

			return mav;
			
			
		}else {
			// 존재하지 않을 경우
			// 에러 처리
			mav.addObject("message", "존재하지 않는 문서입니다.");
			// 이전 페이지로 이동
			mav.addObject("loc", req.getHeader("referer"));
			mav.setViewName("/common/msg");
			return mav;
		}
		
		
		
		


	}

	/** 
	* @Method Name  : approvalUpdateSecurity 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_보안등급 변경
	* @param req
	* @param res
	* @param mav
	* @param securityId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/updateSecurity.gw", produces = "text/plain;charset=UTF-8")
	public String approvalUpdateSecurity(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			Long securityId, Long approvalId) {

		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("securityId", securityId);
		paraMap.put("approvalId", approvalId);

		JSONObject jsonObj = new JSONObject();
		if (service.updateApprovalSecurity(paraMap) == 1) {
			jsonObj.put("isUpdate", true);
			jsonObj.put("securityId", securityId);
		} else {
			jsonObj.put("isUpdate", false);
		}

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : approvalSearchEmpName 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 사원명 검색
	* @param req
	* @param res
	* @param mav
	* @param empName
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/searchEmpName.gw", produces = "text/plain;charset=UTF-8")
	public String approvalSearchEmpName(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			String empName) {
		// 결재 + 버튼 _ 사원명 검색

		List<EmployeeVO> evoList = service.searchEmpName(empName);

		JSONArray jsonArr = new JSONArray();

		for (EmployeeVO evo : evoList) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("empId", evo.getEmpId());
			jsonObj.put("empName", evo.getEmpName());
			jsonObj.put("depName", evo.getDepName());
			jsonObj.put("teamName", evo.getTeamName());
			jsonObj.put("positionName", evo.getPositionName());

			jsonArr.put(jsonObj);
		}

		return jsonArr.toString();
	}

	/** 
	* @Method Name  : updateApprovalLineSetting 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_결재자 수정
	* @param req
	* @param res
	* @param mav
	* @param approvalList
	* @return 
	*/
	@ResponseBody
	@PostMapping("/approval/updateApprovalLineSetting.gw")
	public String updateApprovalLineSetting(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@RequestBody List<Map<String, Object>> approvalList) {
		// 결재 + 버튼 _ 확인 버튼

		List<ApprovalProcedureVO> updateList = new ArrayList<>();

		for (int i = 0; i < approvalList.size(); i++) {
			ApprovalProcedureVO apvo = new ApprovalProcedureVO();
			apvo.setEmpId(approvalList.get(i).get("empId").toString());
			apvo.setSequence((int) approvalList.get(i).get("sequence"));
			updateList.add(apvo);
		}

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isSuccess",
				service.updateApprovalLineSetting(updateList, new Long((int) approvalList.get(0).get("approvalId")),
						new Long((int) approvalList.get(0).get("procedureType"))));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : addRef 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_참조, 수신참조, 수신 추가
	* @param req
	* @param res
	* @param mav
	* @param refType
	* @param empId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping("/approval/add/{refType}.gw")
	public String addRef(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String refType, Long empId, Long approvalId) {
		// 참조 or 수신참조 or 수신 + 버튼 _ 참조에 추가할 유저 선택시

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isAdd", service.addRef(refType, empId, approvalId));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : delRef 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_참조, 수신참조, 수신 삭제
	* @param req
	* @param res
	* @param mav
	* @param empId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping("/approval/del/refOrIncOrIncR.gw")
	public String delRef(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long empId,
			Long approvalId) {
		// 참조 or 수신 or 수신참조 x 버튼

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isDelete", service.delRef(empId, approvalId));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : updateApprovalFile 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_파일 첨부
	* @param req
	* @param res
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/updateApprovalFile.gw", produces = "text/plain;charset=UTF-8")
	public String updateApprovalFile(MultipartHttpServletRequest req, HttpServletResponse res, ModelAndView mav) {

		// 파일 첨부 업데이트

		List<MultipartFile> fileList = req.getFiles("file_arr");

		// 기존 첨부파일 정보
		String[] orgFileIdList = req.getParameterValues("orgFiles");

		List<ApprovalFileVO> afList = new ArrayList<>();

		if (orgFileIdList != null) {
			for (String str : orgFileIdList) {
				afList.add(service.getApprovalDocumentFile(Long.parseLong(str)));
			}
		}

		// WAS 의 webapp 의 절대경로를 알아와야 한다.
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "image" + File.separator + "approval" + File.separator
				+ "uploadFile"; // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.

		File dir = new File(path);

		if (!dir.exists()) {
			// 이미 path의 폴더가 존재하는 지 확인

			// 없을 경우 생성해라
			dir.mkdirs();
		}

		// >>>> 첨부파일을 위의 path 경로에 올리기 <<<< //

		if (fileList != null && fileList.size() > 0) {
			for (int i = 0; i < fileList.size(); i++) {

				ApprovalFileVO afvo = new ApprovalFileVO();

				MultipartFile mtFile = fileList.get(i); // 파일 하나하나 확인

				try {
					/*
					 * File 클래스는 java.io 패키지에 포함되며, 입출력에 필요한 파일이나 디렉터리를 제어하는 데 사용된다. 파일과 디렉터리의 접근
					 * 권한, 생성된 시간, 경로 등의 정보를 얻을 수 있는 메소드가 있으며, 새로운 파일 및 디렉터리 생성, 삭제 등 다양한 조작 메서드를
					 * 가지고 있다.
					 */
					// === MultipartFile 을 File 로 변환하여 탐색기 저장폴더에 저장하기 시작 ===
					File attachFile = new File(path + File.separator + mtFile.getOriginalFilename());
					mtFile.transferTo(attachFile); // 여기서 저장, 이미 있으면 삭제하고 저장
					/*
					 * form 태그로 부터 전송받은 MultipartFile mtfile 파일을 지정된 대상 파일(attachFile)로 전송한다. 만약에 대상
					 * 파일(attachFile)이 이미 존재하는 경우 먼저 삭제된다.
					 */
					// 탐색기에 가보면 첨부한 파일이 생성되어져 있음을 확인할 수 있다.
					// === MultipartFile 을 File 로 변환하여 탐색기 저장폴더에 저장하기 끝 ===

					afvo.setFileName(
							req.getContextPath() + "resources" + File.separator + "image" + File.separator + "approval"
									+ File.separator + "uploadFile" + File.separator + mtFile.getOriginalFilename()); // 첨부파일명들을
																														// 기록한다.
					afvo.setFileSize(((double) mtFile.getSize()) / 1024 / 1024); // 첨부파일명들을 기록한다.

					// 수정필 _ 반올림 소수 셋쨰자리

					afList.add(afvo);
				} catch (Exception e) {
					e.printStackTrace();
				}

			} // end of
				// for--------------------------------------------------------------------------
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isUpdate", service.insertOrUpdateApprovalFile(req.getParameter("approvalId"), afList));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : deleteSavedFile 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_파일 첨부 삭제
	* @param req
	* @param res
	* @param mav
	* @param fileId
	* @return 
	*/
	@ResponseBody
	@PostMapping("/approval/deleteSavedFile.gw")
	public String deleteSavedFile(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long fileId) {
		// 첨부파일칸에서 삭제했을 경우

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isDelete", service.deleteSavedFile(fileId));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : approvalFileDownload 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_파일 다운로드
	* @param req
	* @param res
	* @param mav 
	*/
	@GetMapping(value = "/approval/fileDownload.gw")
	public void approvalFileDownload(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {

		// *** 웹브라우저에 출력하기 시작 *** //
		// HttpServletResponse response 객체는 전송되어져온 데이터를 조작해서 결과물을 나타내고자 할때 쓰인다.
		res.setContentType("text/html; charset=UTF-8");

		PrintWriter out = null;
		// out 은 웹브라우저에 기술하는 대상체라고 생각하자.

		Long fileId = Long.parseLong(req.getParameter("fileId"));

		try {
			ApprovalFileVO afvo = service.getApprovalDocumentFile(fileId);

			if (afvo == null || (afvo != null && afvo.getFileName() == null)) {
				out = res.getWriter();
				// out 은 웹브라우저에 기술하는 대상체라고 생각하자.

				out.println(
						"<script type='text/javascript'>alert('존재하지 않는 글번호 이거나 첨부파일이 없으므로 파일다운로드가 불가합니다.'); history.back();</script>");
				return;
			}

			else {
				// 정상적으로 다운로드를 할 경우

				String fileName = afvo.getFileRName();
				// 20231124124825759362098213700.pdf 이것이 바로 WAS(톰캣) 디스크에 저장된 파일명이다.

				String orgFilename = afvo.getFileRName();
				// LG_싸이킹청소기_사용설명서.pdf 다운로드시 보여줄 파일명

				// 첨부파일이 저장되어 있는 WAS(톰캣) 디스크 경로명을 알아와야만 다운로드를 해줄 수 있다.
				// 이 경로는 우리가 파일첨부를 위해서 /addEnd.action 에서 설정해두었던 경로와 똑같아야 한다.
				// WAS 의 webapp 의 절대경로를 알아와야 한다.
				HttpSession session = req.getSession();
				String root = session.getServletContext().getRealPath("/");

				// ~~~ 확인용 webapp 의 절대경로 =>
				// C:\NCS\workspace_spring_framework\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\board\

				String path = root + "resources" + File.separator + "image" + File.separator + "approval"
						+ File.separator + "uploadFile";
				/*
				 * File.separator 는 운영체제에서 사용하는 폴더와 파일의 구분자이다. 운영체제가 Windows 이라면 File.separator
				 * 는 "\" 이고, 운영체제가 UNIX, Linux, 매킨토시(맥) 이라면 File.separator 는 "/" 이다.
				 */

				// path 가 첨부파일이 저장될 WAS(톰캣)의 폴더가 된다.
				// System.out.println("~~~ 확인용 path => " + path);
				// ~~~ 확인용 path =>
				// C:\NCS\workspace_spring_framework\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\board\resources\files

				// ***** file 다운로드 하기 ***** //
				boolean flag = false; // file 다운로드 성공, 실패인지 여부를 알려주는 용도
				flag = fileManager.doFileDownload(fileName, orgFilename, path, res);
				// file 다운로드 성공시 flag 는 true,
				// file 다운로드 실패시 flag 는 false 를 가진다.

				if (!flag) {
					// 다운로드가 실패한 경우 메시지를 띄워준다.
					out = res.getWriter();
					// out 은 웹브라우저에 기술하는 대상체라고 생각하자.

					out.println("<script type='text/javascript'>alert('파일다운로드가 실패되었습니다.'); history.back();</script>");
				}

			}

		} catch (NumberFormatException | IOException e) {
			try {
				out = res.getWriter();
				// out 은 웹브라우저에 기술하는 대상체라고 생각하자.

				out.println("<script type='text/javascript'>alert('파일다운로드가 불가합니다.'); history.back();</script>");
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
	}

	/** 
	* @Method Name  : insertOpinion 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_의견 작성
	* @param req
	* @param res
	* @param mav
	* @param opinion
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/insertOpinion.gw", produces = "text/plain;charset=UTF-8")
	public String insertOpinion(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, String opinion,
			Long approvalId) {
		HttpSession session = req.getSession();

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("approvalId", String.valueOf(approvalId));
		paraMap.put("opinion", opinion);
		paraMap.put("empId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId()));

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isInsert", service.insertOpinion(paraMap));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : deleteOpinion 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_의견 삭제
	* @param req
	* @param res
	* @param mav
	* @param opinionId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/deleteOpinion.gw", produces = "text/plain;charset=UTF-8")
	public String deleteOpinion(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long opinionId) {
		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isDelete", service.deleteOpinion(opinionId));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : deleteImportant 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_중요문서 삭제
	* @param req
	* @param res
	* @param mav
	* @param empId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/deleteImportant.gw", produces = "text/plain;charset=UTF-8")
	public String deleteImportant(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long empId,
			Long approvalId) {
		JSONObject jsonObj = new JSONObject();

		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("approvalId", approvalId);

		jsonObj.put("isDelete", service.deleteImportant(paraMap));

		return jsonObj.toString();

	}

	/** 
	* @Method Name  : insertImportant 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_중요문서 추가
	* @param req
	* @param res
	* @param mav
	* @param empId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/insertImportant.gw", produces = "text/plain;charset=UTF-8")
	public String insertImportant(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long empId,
			Long approvalId) {
		JSONObject jsonObj = new JSONObject();

		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("approvalId", approvalId);

		jsonObj.put("isAdd", service.insertImportant(paraMap));

		return jsonObj.toString();

	}

	/** 
	* @Method Name  : updateActionOfApproval 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_결재 처리하기
	* @param req
	* @param res
	* @param mav
	* @param aavo
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/updateActionOfApproval.gw", produces = "text/plain;charset=UTF-8")
	public String updateActionOfApproval(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			ApprovalActionVO aavo) {

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empId", String.valueOf(aavo.getEmpId()));
		paraMap.put("approvalId", String.valueOf(aavo.getApprovalId()));
		paraMap.put("status", String.valueOf(aavo.getApprovalStatus()));
		paraMap.put("opinion", aavo.getOpinion());
		paraMap.put("formId", String.valueOf(aavo.getFormId()));

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isUpdate", service.updateActionOfApproval(paraMap));

		return jsonObj.toString();

	}

	/** 
	* @Method Name  : updateRefRead 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_읽음 처리하기
	* @param req
	* @param res
	* @param mav
	* @param empId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/updateRefRead.gw", produces = "text/plain;charset=UTF-8")
	public String updateRefRead(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long empId,
			Long approvalId) {

		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("approvalId", approvalId);

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isUpdate", service.updateRefRead(paraMap));

		return jsonObj.toString();

	}

//	@ResponseBody
//	@PostMapping("/approval/updateProcessLineSetting.gw")
//	public String updateProcessLineSetting(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
//			@RequestBody List<Map<String, Object>> approvalList) {
//		// 결재 + 버튼 _ 확인 버튼
//
//		List<ApprovalProcedureVO> updateList = new ArrayList<>();
//		
//		for (int i = 0; i < approvalList.size(); i++) {
//			ApprovalProcedureVO apvo = new ApprovalProcedureVO();
//			apvo.setEmpId(approvalList.get(i).get("empId").toString());
//			apvo.setSequence((int) approvalList.get(i).get("sequence"));
//			updateList.add(apvo);
//		}
//
//		JSONObject jsonObj = new JSONObject();
//
//		jsonObj.put("isSuccess",
//				service.updateProcessLineSetting(updateList, new Long((int) approvalList.get(0).get("approvalId")), new Long((int) approvalList.get(0).get("procedureType"))));
//
//		return jsonObj.toString();
//	}

//	@ResponseBody
//	@PostMapping("/approval/updateApplicationLineSetting.gw")
//	public String updateApplicationLineSetting(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
//			@RequestBody List<Map<String, Object>> approvalList) {
//		// 신청 + 버튼 _ 확인 버튼
//
//		List<ApprovalProcedureVO> updateList = new ArrayList<>();
//
//		for (int i = 0; i < approvalList.size(); i++) {
//			ApprovalProcedureVO apvo = new ApprovalProcedureVO();
//			
//			System.out.println("empID : " + approvalList.get(i).get("empId").toString());
//			apvo.setEmpId(approvalList.get(i).get("empId").toString());
//			apvo.setSequence((int) approvalList.get(i).get("sequence"));
//			updateList.add(apvo);
//		}
//
//		JSONObject jsonObj = new JSONObject();
//
//		jsonObj.put("isSuccess",
//				service.updateApplicationLineSetting(updateList, new Long((int) approvalList.get(0).get("approvalId"))));
//
//		return jsonObj.toString();
//	}

	/** 
	* @Method Name  : updateRoundRobinApprovalLineSetting 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_품의서 상세보기_결재자 수정시
	* @param req
	* @param res
	* @param mav
	* @param approvalList
	* @return 
	*/
	@ResponseBody
	@PostMapping("/approval/updateRoundRobinApprovalLineSetting.gw")
	public String updateRoundRobinApprovalLineSetting(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@RequestBody List<Map<String, Object>> approvalList) {
		// 품의서_결재 + 버튼 _ 확인 버튼

		List<ApprovalProcedureVO> updateList = new ArrayList<>();

		for (int i = 0; i < approvalList.size(); i++) {
			ApprovalProcedureVO apvo = new ApprovalProcedureVO();

			apvo.setEmpId(approvalList.get(i).get("empId").toString());
			apvo.setSequence((int) approvalList.get(i).get("sequence"));
			updateList.add(apvo);
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isSuccess",
				service.updateRoundRobinApprovalLineSetting(updateList,
						new Long((int) approvalList.get(0).get("approvalId")),
						new Long((int) approvalList.get(0).get("procedureType"))));

		return jsonObj.toString();
	}


	/** 
	* @Method Name  : cancleApproval 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서 상세보기_기안 취소
	* @param req
	* @param res
	* @param mav
	* @param empId
	* @param approvalId
	* @return 
	*/
	@ResponseBody
	@PostMapping("/approval/cancleApproval.gw")
	public String cancleApproval(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, Long empId,
			Long approvalId) {
		// 기안 취소

		JSONObject jsonObj = new JSONObject();

		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("approvalId", approvalId);
		paraMap.put("empId", empId);

		jsonObj.put("isDelete", service.cancleApproval(paraMap));

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : approvalDocumentWrite 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_작성하기 및 임시저장에서 불러오기
	* @param req
	* @param res
	* @param mav
	* @param writeType
	* @param approvalId
	* @return 
	*/
	@GetMapping("/approval/document/write/{writeType}.gw")
	public ModelAndView approvalDocumentWrite_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String writeType, Long approvalId) {
		// 작성하기 및 수정

		HttpSession session = req.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		mav.addObject("formList", service.getFormNameListByWrite());
		mav.addObject("securityLevelList", service.getSecurityLevelList());
		mav.addObject("noSearch", true);
		if ("index".equals(writeType)) {
			// 작성하기 눌렀을 경우
			mav.setViewName("document_write_index.approval");

		} else if ("temp".equals(writeType)) {
			// 임시저장에서 불러온 경우

			Map<String, Long> paraMap = new HashMap<>();
			paraMap.put("approvalId", approvalId);
			paraMap.put("empId", loginUser.getEmpId());
			Long formId = service.getFormId(approvalId);
			paraMap.put("formId", formId);
			// 보존 연한 정보
			mav.addObject("preservationYear", service.getPreservationYear(formId));

			// 수정필 !!!!!!!!!!!!!!!!! 폼id에 따라 더 추가될 내용이 있음 그거 추가해서 넣기
			if (formId == 109) {
				// 재직증명서
				mav.addObject("empProofDetail", service.getEmpProofDetail(paraMap));
				mav.setViewName("document_write_empProof.approval");

			} else if (formId == 108) {
				// 품의서 합의 부분
				mav.addObject("agreeList", service.getProcedureTypeAgree(approvalId));
				mav.setViewName("document_write_roundRobin.approval");

			} else if (formId == 106) {
				// 회람
				mav.setViewName("document_write_circulation.approval");
			} else if (formId == 107) {
				// 업무연락
				mav.setViewName("document_write_businessContact.approval");
			}
			ApprovalDetailVO approvalDetail = service.getApprovalDocumentView(paraMap);

			mav.addObject("approvalDetail", approvalDetail);

		} else {
			// 에러 수정필
		}
		return mav;
	}

	/** 
	* @Method Name  : approvalDocumentWriteForm 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_작성하기 및 임시저장에서 불러오기
	* @param req
	* @param res
	* @param mav
	* @param writeType
	* @param formId
	* @return 
	*/
	@PostMapping("/approval/document/write/{writeType}.gw")
	public ModelAndView approvalDocumentWriteForm_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String writeType, Long formId) {
		// 작성하기 및 수정

		mav.addObject("formList", service.getFormNameListByWrite());
		mav.addObject("securityLevelList", service.getSecurityLevelList());
		mav.addObject("noSearch", true);
		
		if ("form".equals(writeType)) {
			// 문서 종류를 선택했을 경우

			// 보존 연한 정보
			mav.addObject("preservationYear", service.getPreservationYear(formId));

			if (formId == 107) {
				// 업무연락일 경우

				mav.setViewName("document_write_businessContact.approval");
			} else if (formId == 106) {
				// 회람일 경우

				mav.setViewName("document_write_circulation.approval");
			} else if (formId == 109) {
				// 재직증명서일 경우

				mav.setViewName("document_write_empProof.approval");
			} else if (formId == 108) {
				// 품의서일 경우

				mav.setViewName("document_write_roundRobin.approval");
			}

		} else {
			// 에러 수정필
		}

		return mav;
	}

	/** 
	* @Method Name  : insertDocumentWrite 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_기안하기
	* @param req
	* @param res
	* @param mav
	* @param formType
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/insertDocumentWrite/{formType}.gw", produces = "text/plain;charset=UTF-8")
	public String insertDocumentWrite(MultipartHttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String formType) {
		// 기안하기

		HttpSession session = req.getSession();
		String empId = String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId());

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("title", req.getParameter("approval_document_title"));
		paraMap.put("securityId", req.getParameter("security_level"));

		// 파일 첨부 업데이트
		List<MultipartFile> fileList = req.getFiles("file_arr");
		List<ApprovalFileVO> afList = new ArrayList<>();

		// 기존 첨부파일 정보
		String[] orgFileIdList = req.getParameterValues("orgFiles");

		if (orgFileIdList != null) {
			for (String str : orgFileIdList) {
				afList.add(service.getApprovalDocumentFile(Long.parseLong(str)));
			}
		}

		if (fileList.size() > 0) {

			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "image" + File.separator + "approval" + File.separator
					+ "uploadFile"; // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.

			File dir = new File(path);

			if (!dir.exists()) {
				// 이미 path의 폴더가 존재하는 지 확인
				// 없을 경우 생성해라
				dir.mkdirs();
			}

			// >>>> 첨부파일을 위의 path 경로에 올리기 <<<< //

			if (fileList != null && fileList.size() > 0) {
				for (int i = 0; i < fileList.size(); i++) {

					ApprovalFileVO afvo = new ApprovalFileVO();

					MultipartFile mtFile = fileList.get(i); // 파일 하나하나 확인

					try {
						// === MultipartFile 을 File 로 변환하여 탐색기 저장폴더에 저장하기 시작 ===
						File attachFile = new File(path + File.separator + mtFile.getOriginalFilename());
						mtFile.transferTo(attachFile); // 여기서 저장, 이미 있으면 삭제하고 저장
						// === MultipartFile 을 File 로 변환하여 탐색기 저장폴더에 저장하기 끝 ===

						afvo.setFileName(req.getContextPath() + "resources" + File.separator + "image" + File.separator
								+ "approval" + File.separator + "uploadFile" + File.separator
								+ mtFile.getOriginalFilename()); // 첨부파일명들을 기록한다.
						afvo.setFileSize(((double) mtFile.getSize()) / 1024 / 1024); // 첨부파일명들을 기록한다.

						// 수정필 _ 반올림 소수 셋쨰자리

						afList.add(afvo);
					} catch (Exception e) {
						e.printStackTrace();
					}

				} // end of
					// for--------------------------------------------------------------------------
			}
		}

		String approvalId = "";
		if (req.getParameter("approvalId") != null) {
			// 임시저장했던 애를 기안하려고 하는 경우
			approvalId = req.getParameter("approvalId");
			paraMap.put("approvalId", approvalId);

		}

		Map<String, String[]> paraArrMap = new HashMap<>();

		JSONObject jsonObj = new JSONObject();

		if ("businessContact".equals(formType)) {
			// 업무연락일 경우
			paraMap.put("formId", "107");

			String content = "";
			if (req.getParameter("content") != null) {
				content = req.getParameter("content");
			}
			paraMap.put("content", content);

			String[] approvalArr = req.getParameterValues("approvalEmpId");
			String[] referArr = req.getParameterValues("referEmpId");
			String[] incArr = req.getParameterValues("incEmpId");
			String[] incRArr = req.getParameterValues("incREmpId");

			paraArrMap.put("approvalArr", approvalArr);
			paraArrMap.put("referArr", referArr);
			paraArrMap.put("incArr", incArr);
			paraArrMap.put("incRArr", incRArr);

			if (approvalArr.length >= 1) {
				jsonObj.put("viewType", "list");
			} else {
				jsonObj.put("viewType", "box");
			}

		} else if ("circulation".equals(formType)) {
			// 회람일 경우
			paraMap.put("formId", "106");

			String content = "";
			if (req.getParameter("content") != null) {
				content = req.getParameter("content");
			}
			paraMap.put("content", content);

			String[] referArr = req.getParameterValues("referEmpId");

			paraArrMap.put("referArr", referArr);

			jsonObj.put("viewType", "box");

		} else if ("empProof".equals(formType)) {
			// 재직증명서 경우
			paraMap.put("formId", "109");

			String reason = "";
			if (req.getParameter("reason") != null) {
				reason = req.getParameter("reason");

			}
			paraMap.put("reason", reason);

			String submit = "";
			if (req.getParameter("toSubmit") != null) {
				submit = req.getParameter("toSubmit");
			}
			paraMap.put("submit", submit);

			paraMap.put("issueDay", req.getParameter("issueDay"));

			String[] approvalArr = req.getParameterValues("approvalEmpId");
			String[] applicationArr = req.getParameterValues("applicationEmpId");
			String[] referArr = req.getParameterValues("referEmpId");

			paraArrMap.put("approvalArr", approvalArr);
			paraArrMap.put("referArr", referArr);
			paraArrMap.put("applicationArr", applicationArr);

			if (approvalArr.length >= 1) {
				jsonObj.put("viewType", "list");
			} else {
				jsonObj.put("viewType", "box");
			}

		} else if ("roundRobin".equals(formType)) {
			// 품의서일 경우
			paraMap.put("formId", "108");

			String content = "";
			if (req.getParameter("content") != null) {
				content = req.getParameter("content");
			}
			paraMap.put("content", content);

			String[] approvalArr = req.getParameterValues("approvalEmpId");
			String[] referArr = req.getParameterValues("referEmpId");
			String[] agreeArr = req.getParameterValues("agreeEmpId");
			String[] fiAgreeArr = req.getParameterValues("fiAgreeEmpId");

			paraArrMap.put("approvalArr", approvalArr);
			paraArrMap.put("referArr", referArr);
			paraArrMap.put("agreeArr", agreeArr);
			paraArrMap.put("fiAgreeArr", fiAgreeArr);

			if (approvalArr.length >= 1) {
				jsonObj.put("viewType", "list");
			} else {
				jsonObj.put("viewType", "box");
			}

		}

		// insert한 결과값인 approvalId를 가져온다
		approvalId = service.insertDocumentWrite(paraArrMap, paraMap);

		if (!service.insertOrUpdateApprovalFile(approvalId, afList)) {
			// 임시저장한 문서 파일 업데이트 겸 인서트 에러 처리하기 수정필

			System.out.println("에러랍니다");
		}

		if ("".equals(approvalId)) {
			// 업데이트가 제대로 안된거임
			// 에러처리 수정필
			jsonObj.put("isSuccess", false);
		} else {
			jsonObj.put("isSuccess", true);
			jsonObj.put("approvalId", approvalId);
		}

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : insertTempDocumentWrite 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_작성하기_임시저장하기
	* @param req
	* @param res
	* @param mav
	* @param formType
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/insertTempDocumentWrite/{formType}.gw", produces = "text/plain;charset=UTF-8")
	public String insertTempDocumentWrite(MultipartHttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String formType) {
		// 임시저장

		HttpSession session = req.getSession();
		String empId = String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId());

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("title", req.getParameter("approval_document_title"));
		paraMap.put("securityId", req.getParameter("security_level"));

		// 파일 첨부 업데이트
		List<MultipartFile> fileList = req.getFiles("file_arr");
		List<ApprovalFileVO> afList = new ArrayList<>();

		// 기존 첨부파일 정보
		String[] orgFileIdList = req.getParameterValues("orgFiles");

		if (orgFileIdList != null) {
			for (String str : orgFileIdList) {
				afList.add(service.getApprovalDocumentFile(Long.parseLong(str)));
			}
		}

		if (fileList.size() > 0) {

			// WAS 의 webapp 의 절대경로를 알아와야 한다.
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "image" + File.separator + "approval" + File.separator
					+ "uploadFile"; // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.

			File dir = new File(path);

			if (!dir.exists()) {
				// 이미 path의 폴더가 존재하는 지 확인
				// 없을 경우 생성해라
				dir.mkdirs();
			}

			// >>>> 첨부파일을 위의 path 경로에 올리기 <<<< //

			if (fileList != null && fileList.size() > 0) {
				for (int i = 0; i < fileList.size(); i++) {

					ApprovalFileVO afvo = new ApprovalFileVO();

					MultipartFile mtFile = fileList.get(i); // 파일 하나하나 확인

					try {
						// === MultipartFile 을 File 로 변환하여 탐색기 저장폴더에 저장하기 시작 ===
						File attachFile = new File(path + File.separator + mtFile.getOriginalFilename());
						mtFile.transferTo(attachFile); // 여기서 저장, 이미 있으면 삭제하고 저장
						// === MultipartFile 을 File 로 변환하여 탐색기 저장폴더에 저장하기 끝 ===

						afvo.setFileName(req.getContextPath() + "resources" + File.separator + "image" + File.separator
								+ "approval" + File.separator + "uploadFile" + File.separator
								+ mtFile.getOriginalFilename()); // 첨부파일명들을 기록한다.
						afvo.setFileSize(((double) mtFile.getSize()) / 1024 / 1024); // 첨부파일명들을 기록한다.

						// 수정필 _ 반올림 소수 셋쨰자리

						afList.add(afvo);
					} catch (Exception e) {
						e.printStackTrace();
					}

				} // end of
					// for--------------------------------------------------------------------------
			}
		}


		String approvalId = "";
		if (req.getParameter("approvalId") != null) {
			approvalId = req.getParameter("approvalId");
			paraMap.put("approvalId", approvalId);

		}

		Map<String, String[]> paraArrMap = new HashMap<>();

		JSONObject jsonObj = new JSONObject();

		if ("businessContact".equals(formType)) {
			// 업무연락일 경우
			paraMap.put("formId", "107");

			String content = "";
			if (req.getParameter("content") != null) {
				content = req.getParameter("content");
			}
			paraMap.put("content", content);

			String[] approvalArr = req.getParameterValues("approvalEmpId");
			String[] referArr = req.getParameterValues("referEmpId");
			String[] incArr = req.getParameterValues("incEmpId");
			String[] incRArr = req.getParameterValues("incREmpId");

			paraArrMap.put("approvalArr", approvalArr);
			paraArrMap.put("referArr", referArr);
			paraArrMap.put("incArr", incArr);
			paraArrMap.put("incRArr", incRArr);

		} else if ("circulation".equals(formType)) {
			// 회람일 경우
			paraMap.put("formId", "106");

			String content = "";
			if (req.getParameter("content") != null) {
				content = req.getParameter("content");
			}
			paraMap.put("content", content);

			String[] referArr = req.getParameterValues("referEmpId");

			paraArrMap.put("referArr", referArr);

		} else if ("empProof".equals(formType)) {
			// 재직증명서 경우
			paraMap.put("formId", "109");

			String reason = "";
			if (req.getParameter("reason") != null) {
				reason = req.getParameter("reason");

			}
			paraMap.put("reason", reason);

			String submit = "";
			if (req.getParameter("submit") != null) {
				submit = req.getParameter("submit");

			}
			paraMap.put("submit", submit);

			paraMap.put("issueDay", req.getParameter("issueDay"));

			String[] approvalArr = req.getParameterValues("approvalEmpId");
			String[] applicationArr = req.getParameterValues("applicationEmpId");
			String[] referArr = req.getParameterValues("referEmpId");

			paraArrMap.put("approvalArr", approvalArr);
			paraArrMap.put("referArr", referArr);
			paraArrMap.put("applicationArr", applicationArr);

		} else if ("roundRobin".equals(formType)) {
			// 품의서일 경우
			paraMap.put("formId", "108");

			String content = "";
			if (req.getParameter("content") != null) {
				content = req.getParameter("content");
			}
			paraMap.put("content", content);

			String[] approvalArr = req.getParameterValues("approvalEmpId");
			String[] referArr = req.getParameterValues("referEmpId");
			String[] agreeArr = req.getParameterValues("agreeEmpId");
			String[] fiAgreeArr = req.getParameterValues("fiAgreeEmpId");

			paraArrMap.put("approvalArr", approvalArr);
			paraArrMap.put("referArr", referArr);
			paraArrMap.put("agreeArr", agreeArr);
			paraArrMap.put("fiAgreeArr", fiAgreeArr);

		}

		// insert한 결과값인 approvalId를 가져온다
		approvalId = service.insertTempDocumentWrite(paraArrMap, paraMap);

		if (!service.insertOrUpdateApprovalFile(approvalId, afList)) {
			// 임시저장한 문서 파일 업데이트 겸 인서트 에러 처리하기 수정필

			System.out.println("에러랍니다");
		}

		if ("".equals(approvalId)) {
			// 업데이트가 제대로 안된거임
			// 에러처리 수정필
			jsonObj.put("isSuccess", false);
		} else {
			jsonObj.put("isSuccess", true);
		}

		return jsonObj.toString();
	}

	/** 
	* @Method Name  : approvalBatch 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_진행중인 문서_일괄 처리
	* @param req
	* @param res
	* @param mav
	* @param type
	* @return 
	*/
	@PostMapping("/approval/batch/{type}.gw")
	public ModelAndView approvalBatch_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String type) {

		HttpSession session = req.getSession();
		String empId = String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId());

		BatchVO bvo = new BatchVO();
		bvo.setEmpId(empId);
		bvo.setApprovalIdList(req.getParameterValues("checkApproval"));

		if ("approval".equals(type)) {
			// 일괄 결재

			if (service.batchApproval(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/approval/document/list/W.gw");
			} else {
				System.out.println("에러");
			}

		} else if ("check".equals(type)) {
			if (service.batchCheck(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/approval/document/list/V.gw");
			} else {
				System.out.println("에러");
			}
		} else if ("delete".equals(type)) {
			
			if (service.batchDelete(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/approval/settings/document.gw");
			} else {
				System.out.println("에러");
			}
		} else if("restore".equals(type)) {
			// 잘 끝

			if (service.batchRestore(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/approval/settings/deleted_document.gw");
			} else {
				System.out.println("에러");
			}
		}
		
		

		return mav;
	}

	/** 
	* @Method Name  : approvalViewImportantDoc 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_문서함_중요문서 보기
	* @param req
	* @param res
	* @param mav
	* @param type
	* @param savo
	* @return 
	*/
	@GetMapping("/approval/importantDoc/{viewType}.gw")
	public ModelAndView approvalViewImportantDoc_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String type, SearchApprovalVO savo) {
		mav.addObject("type", type);

		HttpSession session = req.getSession();

		String searchType = savo.getSearchType();
		String searchWord = savo.getSearchWord();
		String orderType = savo.getOrderType();
		String isViewAll = savo.getIsViewAll();
		String str_currentShowPageNo = savo.getCurrentShowPageNo();

		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null) {
			searchWord = "";
		}
		
		if (isViewAll == null) {
			isViewAll = "0";
		}

		if ("approvalId".equals(searchType) && searchWord != "") {
			searchType = "apd.fk_" + searchType;
		}

		if (orderType == null) {
			orderType = "desc";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}


		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		paraMap.put("orderType", orderType);
		paraMap.put("empId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getEmpId()));
		paraMap.put("positionId", String.valueOf(((EmployeeVO) session.getAttribute("loginUser")).getFk_positionId()));

		// 문서 종류 가져오기
		mav.addObject("formList", service.getFormNameList());

		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함 한 것)
		List<ApprovalVO> boxList = new ArrayList<>();

		if ("all".equals(type)) {
			paraMap.put("isViewAll", savo.getIsViewAll());
			boxList = service.getApprovalAllBox_withSearchAndPaging(paraMap);
			mav.addObject("isViewAll", savo.getIsViewAll());
		} else if ("writer".equals(type)) {
			boxList = service.getApprovalWriterBox_withSearchAndPaging(paraMap);
		} else if ("approval".equals(type)) {
			boxList = service.getApprovalApprovalBox_withSearchAndPaging(paraMap);
		} else if ("refer".equals(type)) {
			boxList = service.getApprovalReferBox_withSearchAndPaging(paraMap);
		} else if ("read".equals(type)) {
			boxList = service.getApprovalReadBox_withSearchAndPaging(paraMap);
		} else if ("return".equals(type)) {
			boxList = service.getApprovalReturnBox_withSearchAndPaging(paraMap);
		} else if ("temp".equals(type)) {
			boxList = service.getApprovalTempBox_withSearchAndPaging(paraMap);
		} else {
			type = "all";
			boxList = service.getApprovalAllBox_withSearchAndPaging(paraMap);
		}

		if (!"".equals(searchType) && !"".equals(searchWord)) {
			paraMap.put("searchType", "");
			paraMap.put("searchWord", "");

			mav.addObject("searchType", searchType);
			mav.addObject("searchWord", searchWord);
		}

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = boxList.size();

		totalPage = (int) Math.ceil((double) totalCount / sizePerPage);

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		}

		else {

			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);

				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}

			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		mav.addObject("currentShowPageNo", currentShowPageNo);

		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		 * currentShowPageNo startRno endRno
		 * -------------------------------------------- 1 page ===> 1 10 2 page ===> 11
		 * 20 3 page ===> 21 30 4 page ===> 31 40 ...... ... ...
		 */
		int startRno = ((currentShowPageNo - 1) * sizePerPage); // 시작 행번호
		int endRno = startRno + sizePerPage; // 끝 행번호
		/*
		 * int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 int
		 * endRno = startRno + sizePerPage - 1; // 끝 행번호
		 */

		/*
		 * paraMap.put("startRno", String.valueOf(startRno)); paraMap.put("endRno",
		 * String.valueOf(endRno));
		 */

		if (totalCount == 0) {
			mav.addObject("boxList", boxList);
		} else {
			mav.addObject("boxList", boxList.subList(startRno, endRno));
		}

//		mav.addObject("allIngList", allIngList.subList(startRno-1, endRno +1));

//		if ("subject".equals(searchType) || "content".equals(searchType) || "subject_content".equals(searchType)
//				|| "name".equals(searchType)) {
//			mav.addObject("paraMap", paraMap);
//		}

		// === #121. 페이지바 만들기 === //
		// 수정필
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 [다음][마지막] -- 1개블럭 [맨처음][이전] 11 12 13 14 15 16 17 18 19
		 * 20 [다음][마지막] -- 1개블럭 [맨처음][이전] 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //

		/*
		 * 1 2 3 4 5 6 7 8 9 10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다. 11 12 13 14 15 16 17
		 * 18 19 20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다. 21 22 23 24 25 26 27 28 29 30
		 * -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
		 * 
		 * currentShowPageNo pageNo ---------------------------------- 1 1 = ((1 -
		 * 1)/10) * 10 + 1 2 1 = ((2 - 1)/10) * 10 + 1 3 1 = ((3 - 1)/10) * 10 + 1 4 1 5
		 * 1 6 1 7 1 8 1 9 1 10 1 = ((10 - 1)/10) * 10 + 1
		 * 
		 * 11 11 = ((11 - 1)/10) * 10 + 1 12 11 = ((12 - 1)/10) * 10 + 1 13 11 = ((13 -
		 * 1)/10) * 10 + 1 14 11 15 11 16 11 17 11 18 11 19 11 20 11 = ((20 - 1)/10) *
		 * 10 + 1
		 * 
		 * 21 21 = ((21 - 1)/10) * 10 + 1 22 21 = ((22 - 1)/10) * 10 + 1 23 21 = ((23 -
		 * 1)/10) * 10 + 1 .. .. 29 21 30 21 = ((30 - 1)/10) * 10 + 1
		 */

		String pageBar = "<ul style='list-style:none;'>";
		String url = "";

		// === [맨처음][이전] 만들기 === //
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
					+ "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ (pageNo - 1) + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&orderType=" + orderType
						+ "&currentShowPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);

		mav.addObject("totalCount", totalCount);
		mav.addObject("goBackURL", goBackURL);
		mav.addObject("orderType", orderType);

		mav.setViewName("document_box_" + type + ".approval");

		return mav;
	}
	
	
	
	
	
	
	
	
	
	/** 
	* @Method Name  : addAppovalAdminSettingManager 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전자결재 관리자_추가
	* @param req
	* @param res
	* @param mav
	* @param empId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/addApprovalAdminManager.gw", produces = "text/plain;charset=UTF-8")
	public String addAppovalAdminSettingManager(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			Long empId) {
		
		HttpSession session = req.getSession();
		
		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("userEmpId", ((EmployeeVO) session.getAttribute("loginUser")).getEmpId());
		paraMap.put("adminType", 3L);

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isAdd", service.addAppovalAdminManager(paraMap));

		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : deleteApprovalAdminSettingManager 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전자결재 관리자_삭제
	* @param req
	* @param res
	* @param mav
	* @param adminId
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/deleteApprovalAdminManager.gw", produces = "text/plain;charset=UTF-8")
	public String deleteApprovalAdminSettingManager(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			Long adminId) {
		
		HttpSession session = req.getSession();
		
		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("adminId", adminId);
		paraMap.put("userEmpId", ((EmployeeVO) session.getAttribute("loginUser")).getEmpId());

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isDelete", service.deleteAppovalAdminManager(paraMap));

		return jsonObj.toString();
	}
	
	/** 
	* @Method Name  : grantAdminSettingRead 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전자결재 관리자_전체 문서 허용
	* @param req
	* @param res
	* @param mav
	* @param adminId
	* @param isReadAble
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/grantAdminRead.gw", produces = "text/plain;charset=UTF-8")
	public String grantAdminSettingRead(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			Long adminId, int isReadAble) {
		
		Map<String, Long> paraMap = new HashMap<>();
		paraMap.put("adminId", adminId);
		paraMap.put("isReadAllDocument", (long)isReadAble);

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isUpdate", service.grantAdminRead(paraMap));

		return jsonObj.toString();
	}
	
	/** 
	* @Method Name  : getAdminSettingHistory 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_전자결재 관리자_관리자 설정 이력
	* @param req
	* @param res
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping(value = "/approval/getAdminHistory.gw", produces = "text/plain;charset=UTF-8")
	public String getAdminSettingHistory(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {
		
		List<AdminHistoryVO> adminHistoryList = service.getAdminHistoryList();

		JSONArray jsonArr = new JSONArray();

		for (AdminHistoryVO ahvo : adminHistoryList) {
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("id", ahvo.getId());
			jsonObj.put("empName", ahvo.getEmpName());
			jsonObj.put("registerId", ahvo.getRegisterId());
			jsonObj.put("registerEmpName", ahvo.getRegisterEmpName());
			jsonObj.put("registerDay", ahvo.getRegisterDay());
			jsonObj.put("registerType", ahvo.getRegisterType());

			jsonArr.put(jsonObj);
		}

		return jsonArr.toString();
	}
	
	
	
	
	
	
	/** 
	* @Method Name  : approvalAdminSettingFormDetail_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_양식함관리_양식함 상세보기
	* @param req
	* @param res
	* @param mav
	* @param formId
	* @return 
	*/
	@GetMapping("/approval/formDetail.gw")
	public ModelAndView approvalAdminSettingFormDetail_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,Long formId) {
		
		mav.addObject("formDetail", service.getFormDetail(formId));
		mav.setViewName("settings_forms_detail.approval");
		mav.addObject("type", "settings_forms");
		return mav;
	}
	
	
	/** 
	* @Method Name  : approvalAdminSettingModifyForm_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_양식함관리_양식함 상세보기_수정
	* @param req
	* @param res
	* @param mav
	* @param formId
	* @return 
	*/
	@GetMapping("/approval/modifyForm.gw")
	public ModelAndView approvalAdminSettingModifyForm_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,Long formId) {
		
		mav.addObject("formDetail", service.getFormDetail(formId));
		mav.setViewName("settings_forms_modify.approval");
		mav.addObject("type", "settings_forms");
		return mav;
	}
	
	
	/** 
	* @Method Name  : approvalAdminSettingUpdateForm_AfterGetListSize 
	* @작성일   : 2024. 1. 10 
	* @작성자   : syxzi 
	* @변경이력  : 
	* @Method 설명 : 전자결재_양식함관리_양식함 상세보기_등록
	* @param req
	* @param res
	* @param mav
	* @param formId
	* @param preserved_term
	* @return 
	*/
	@PostMapping("/approval/updateForm.gw")
	public ModelAndView approvalAdminSettingUpdateForm_AfterGetListSize(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, String formId, String preserved_term) {
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("formId", formId);
		paraMap.put("preservationYear", preserved_term);
		
		if(service.updateForm(paraMap)) {
			mav.setViewName("redirect:/approval/formDetail.gw?formId=" + formId);
		}else {
			mav.addObject("message", "수정에 실패하였습니다!");
			// mav.addObject("type", "settings_basic");
			mav.addObject("loc", req.getContextPath() + "/approval/modifyForm.gw?formId=" + formId);
			mav.setViewName("msg");
		}
		
		return mav;
	}
	
	
	
	
	@ResponseBody
	@PostMapping(value = "/approval/isAlreadyAdmin.gw", produces = "text/plain;charset=UTF-8")
	public String getAdminSettingIsAlreadyAdmin(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			Long empId) {
		
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("isExist", service.isAlreadyAdmin(empId));
		
		return jsonObj.toString();
	}


}
