/** 
* @FileName  : AdminController.java 
* @Project   : TempFinal 
* @Date      : 2024. 1. 6 
* @작성자      : syxzi 
* @변경이력	 : 
* @프로그램설명	 : 
*/
package com.spring.app.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.admin.domain.BatchModifyUserVO;
import com.spring.app.admin.domain.SearchEmployeeVO;
import com.spring.app.admin.service.AdminService;
import com.spring.app.common.MyUtil;
import com.spring.app.common.domain.EmployeeVO;

/**
 *   @FileName  : AdminController.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2024. 1. 6 
 * @작성자      : syxzi 
 * @변경이력 : 
 * @프로그램설명 : 
 */
@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	// 수정필 지우기
	@GetMapping("/admin/test.gw")
	public ModelAndView adminTest(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {

		mav.setViewName("admin_managerSet.admin");

		return mav;
	}

	/**
	 *  
	 * 
	 * @Method Name  : userManage 
	 * @작성일   : 2024. 1. 7 
	 * @작성자   : syxzi  @변경이력  : 
	 * @Method 설명 : 오피스관리_사용자 관리_메인
	 * @param req
	 * @param res
	 * @param mav
	 * @param sevo @return 
	 */
	@GetMapping("/admin/userManage.gw")
	public ModelAndView userManageAdmin(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			SearchEmployeeVO sevo) {

		String searchWord = sevo.getSearchWord();
		String orderCol = sevo.getOrderCol();
		String orderType = sevo.getOrderType();
		String str_currentShowPageNo = sevo.getCurrentShowPageNo();

		if (orderCol == null) {
			orderCol = "empName";
		}

		if (searchWord == null) {
			searchWord = "";
		}

		if (orderType == null) {
			orderType = "asc";
		}

		if (searchWord != null) {
			searchWord = searchWord.trim();
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("orderCol", orderCol);
		paraMap.put("searchWord", searchWord);
		paraMap.put("orderType", orderType);

		/*
		 * if (!"".equals(searchWord)) { paraMap.put("searchWord", "");
		 * 
		 * mav.addObject("searchWord", searchWord); }
		 */

		int totalCount = 0; // 총 게시물 건수
		// 수정필
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCountEmployeeList(paraMap);

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
		mav.addObject("employeeList", service.getEmployeeList_withSearchAndPaging(paraMap));

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
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?orderCol="
					+ orderCol + "&searchWord=" + searchWord + "&orderType=" + orderType
					+ "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?orderCol="
					+ orderCol + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ (pageNo - 1) + "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?orderCol=" + orderCol + "&searchWord=" + searchWord + "&orderType=" + orderType
						+ "&currentShowPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;
		} // end of while-------------------------

		// === [다음][마지막] 만들기 === //
		if (pageNo <= totalPage) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?orderCol="
					+ orderCol + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?orderCol="
					+ orderCol + "&searchWord=" + searchWord + "&orderType=" + orderType + "&currentShowPageNo="
					+ totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";

		mav.addObject("pageBar", pageBar);

		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(req);

		mav.addObject("goBackURL", goBackURL);
		mav.addObject("teamList", service.getDepList());
		mav.addObject("positionList", service.getPositionList());
		mav.addObject("searchWord", searchWord);
		mav.addObject("orderType", orderType);
		mav.addObject("orderCol", orderCol);
		mav.addObject("totalCount", totalCount);
		mav.addObject("type", "userManage");
		mav.setViewName("admin_userManage.admin");

		return mav;
	}

	/**
	 *  
	 * 
	 * @Method Name  : isExistId 
	 * @작성일   : 2024. 1. 7 
	 * @작성자   : syxzi  @변경이력  : 
	 * @Method 설명 :  오피스관리_사용자 관리_사용자 등록 전 아이디 중복 여부 체크
	 * @param req
	 * @param res
	 * @param mav
	 * @param id @return 
	 */
	@ResponseBody
	@PostMapping(value = "/approval/isExistId.gw", produces = "text/plain;charset=UTF-8")
	public String isExistId(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, String id) {

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isExist", service.isExistId(id));

		return jsonObj.toString();
	}

	/**
	 *  
	 * 
	 * @Method Name  : insertUser 
	 * @작성일   : 2024. 1. 7 
	 * @작성자   : syxzi  @변경이력  : 
	 * @Method 설명 :  오피스관리_사용자 관리_사용자 등록
	 * @param req
	 * @param res
	 * @param mav
	 * @param evo @return 
	 */
	@ResponseBody
	@PostMapping(value = "/admin/insertUser.gw", produces = "text/plain;charset=UTF-8")
	public String insertUserAdmin(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, EmployeeVO evo) {

		JSONObject jsonObj = new JSONObject();

		jsonObj.put("isAdd", service.insertUser(evo));

		return jsonObj.toString();
	}

	@PostMapping("/admin/batch/{type}.gw")
	public ModelAndView adminBatchAdmin(HttpServletRequest req, HttpServletResponse res, ModelAndView mav,
			@PathVariable String type) {

		BatchModifyUserVO bvo = new BatchModifyUserVO();
		bvo.setEmpIdList(req.getParameterValues("checkUser"));

		if ("workType".equals(type)) {
			// 일괄 근무형태 수정

			bvo.setEmpType(req.getParameter("empType"));

			if (service.batchWorkType(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/admin/userManage.gw");
			} else {
				//System.out.println("에러");
			}

		} else if ("position".equals(type)) {
			bvo.setPositionId(req.getParameter("positionId"));

			if (service.batchPosition(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/admin/userManage.gw");
			} else {
				//System.out.println("에러");
			}
		} else if ("status".equals(type)) {
			bvo.setStatus(req.getParameter("userStatus"));

			if (service.batchStatus(bvo) > 0) {
				// 잘 끝

				mav.setViewName("redirect:/admin/userManage.gw");
			} else {
				//System.out.println("에러");
			}
		}

		return mav;
	}

	@GetMapping("/admin/managerSet.gw")
	public ModelAndView adminManagerSetAdmin(HttpServletRequest req, HttpServletResponse res, ModelAndView mav) {

		String searchWord = req.getParameter("searchWord");
		if (searchWord == null) {
			searchWord = "";
		}

		// 전체 관리자 정보
		mav.addObject("fullAdminList", service.getFullAdminList());

		// 전체 관리자가 아닌 사원 정보
		mav.addObject("noneFullAdminList", service.getNoneFullAdminEmployeeList(searchWord));
		mav.addObject("searchWord", searchWord);
		mav.addObject("type", "managerSet");
		mav.setViewName("admin_managerSet.admin");

		return mav;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/approval/confirmFullAdmin.gw", produces = "text/plain;charset=UTF-8")
	public String adminConfirmFullAdmin(HttpServletRequest req, HttpServletResponse res, ModelAndView mav, String[] addAdminList, String[] delAdminList) {
		
		HttpSession session = req.getSession();
		
		JSONObject jsonObj = new JSONObject();

		Map<String, String[]> paraMap = new HashMap<>();
		paraMap.put("addAdminList", addAdminList);
		paraMap.put("delAdminList", delAdminList);
		
		jsonObj.put("isUpdate", service.confirmFullAdmin(paraMap, ((EmployeeVO)session.getAttribute("loginUser")).getEmpId()));

		return jsonObj.toString();
	}

}
