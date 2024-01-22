package com.spring.app.reservation.controller;


import java.io.File;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.common.FileManager;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.reservation.domain.ReservationVO;
import com.spring.app.reservation.service.ReservationService;

/** 
* @FileName  : ReservationController.java 
* @Project   : TempFinal 
* @Date      : Dec 28, 2023 
* @작성자      : 김민경 
* @변경이력    : 
* @프로그램설명    : 예약 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/reservation/*")
public class ReservationController {
	
	@Autowired
	private ReservationService service;

	@Autowired  
	private FileManager fileManager;
		

	///////////////////////////////////////////////////////////////////

	
	/** 
	* @Method Name  : myReservationList 
	* @작성일   : Dec 30, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 나의 예약 목록 페이지 보여주기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("myReservationList.gw")
	public ModelAndView myReservationList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	

		
		List<ReservationVO> reservationList = null;
		
		// ----- 예약된 자원 목록 가져오기 시작 ----- // 
		paraMap.put("type", "reserved");
		reservationList = service.getReservationList(paraMap); 
		mav.addObject("reservedList", reservationList);
		// ----- 예약된 자원 목록 가져오기 끝 ----- // 
		
		// ----- 대기 자원 목록 가져오기 시작 ----- // 
		paraMap.put("type", "waiting");
		reservationList = service.getReservationList(paraMap);
		mav.addObject("waitingForApprovalList", reservationList);
		// ----- 대기 자원 목록 가져오기 끝 ----- // 
		
		
		mav.addObject("sideType", "myReservationList");
		
		mav.setViewName("myReservationList.reservation");
		
		return mav;
	}	
	
	
	/** 
	* @Method Name  : resourceList 
	* @작성일   : Dec 30, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원카테고리별 예약 페이지 보여주기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("reservationResource.gw")
	public ModelAndView reservationResource(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		String resourceCategoryId = request.getParameter("resourceCategoryId");
		paraMap.put("resourceCategoryId", resourceCategoryId);

		mav.addObject("sideType", resourceCategoryId);
		
		// ----- 자원카테고리 정보 가져오기 시작 ----- //
		Map<String, Object> resourceCategoryInfo_map = new HashMap<>();
		resourceCategoryInfo_map = service.getResourceCategoryInfo(paraMap);
		mav.addObject("resourceCategoryInfo_map", resourceCategoryInfo_map);
		String viewPath = this.getClass().getResource("").getPath(); 
		viewPath = File.separator+"resources"+File.separator+"image"+File.separator+"reservation"+File.separator;
		mav.addObject("viewPath", viewPath);
		// ----- 자원카테고리 정보 가져오기 끝 ----- //
		
		// ----- 자원 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceList = null;
		resourceList = service.getResourceList(paraMap);
		mav.addObject("resourceList", resourceList);
		// ----- 자원 목록 가져오기 끝 ----- //				
		
		String[] resourceId_arr = new String[resourceList.size()];
		for(int i=0; i<resourceList.size(); i++) {
			resourceId_arr[i] = resourceList.get(i).get("resourceId");
		}
		paraMap.put("resourceId_arr", resourceId_arr);
		
		// ----- 예약된 시간을 색칠하기 위한 자원 목록 가져오기 시작 ----- // 
		List<Map<String, String>> reservationMarkList = null;

		reservationMarkList = service.getReservationMarkList(paraMap); 
		request.setAttribute("reservationMarkList", reservationMarkList);
		// ----- 예약된 시간을 표시하기 위한 자원 목록 가져오기 끝 ----- // 	
		
		
		mav.setViewName("resourceList.reservation");
		
		return mav;
	}
	
	
	/** 
	* @Method Name  : getReservationMarkList 
	* @작성일   : Jan 5, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약된 시간대에 색칠해서 표시하기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("getReservationMarkList.gw")
	public String getReservationMarkList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String resourceCategoryId = request.getParameter("resourceCategoryId");
		String searchDay = request.getParameter("searchDay");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("resourceCategoryId", resourceCategoryId);
		
		// ----- 자원 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceList = null;
		resourceList = service.getResourceList(paraMap);
		mav.addObject("resourceList", resourceList);
		// ----- 자원 목록 가져오기 끝 ----- //
		
		String[] resourceId_arr = new String[resourceList.size()];
		for(int i=0; i<resourceList.size(); i++) {
			resourceId_arr[i] = resourceList.get(i).get("resourceId");
		}
		
		paraMap.put("resourceId_arr", resourceId_arr);
		paraMap.put("searchDay", searchDay);
		
		// ----- 예약된 시간을 표시하기 위한 자원 목록 가져오기 시작 ----- // 
		List<Map<String, String>> reservationMarkList = null;
		reservationMarkList = service.getReservationMarkList(paraMap); 
		request.setAttribute("reservationMarkList", reservationMarkList);
		// ----- 예약된 시간을 표시하기 위한 자원 목록 가져오기 끝 ----- // 
			
		JSONArray jsonArr = new JSONArray(); // [] 
		
		if(reservationMarkList != null) {
			for(Map<String, String> reservationMark_map : reservationMarkList) {
				JSONObject jsonObj = new JSONObject(); // {} 
				jsonObj.put("rsvResourceId", reservationMark_map.get("rsvResourceId"));
				jsonObj.put("fk_resourceId", reservationMark_map.get("fk_resourceId"));
				jsonObj.put("fk_empId", reservationMark_map.get("fk_empId"));
				jsonObj.put("empName", reservationMark_map.get("empName"));
				jsonObj.put("rsvDate", reservationMark_map.get("rsvDate"));
				jsonObj.put("startTime", reservationMark_map.get("startTime"));
				jsonObj.put("endTime", reservationMark_map.get("endTime"));
				
				jsonArr.put(jsonObj); // [{},{},{}]
			}// end of for------------
		}
		return jsonArr.toString();
	}
		
	
	/** 
	* @Method Name  : getResourceInfo 
	* @작성일   : Dec 30, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원 정보 가져오기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("getResourceInfo.gw")
	public String getResourceInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		String resourceId = request.getParameter("resourceId"); 
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("resourceId", resourceId);
		
		// ----- 자원 정보 가져오기 시작 ----- //
		Map<String, Object> resourceInfo_map = new HashMap<>();
		resourceInfo_map = service.getResourceInfo(paraMap); 
		request.setAttribute("resourceInfo_map", resourceInfo_map);
		// ----- 자원 정보 가져오기 끝 ----- //
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("resourceInfo_map", resourceInfo_map);
		
		
		return jsonObj.toString();
	}		
	
	
	/** 
	* @Method Name  : getResourceList 
	* @작성일   : Dec 30, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 :모든 자원목록 정보 가져오기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("getResourceList.gw")
	public String getResourceList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		List<Map<String, String>> allResourceList = null;
		allResourceList = service.getAllResourceList(); // 모든 자원 목록 가져오기
				
		JSONArray jsonArr = new JSONArray(); // [] 
		
		if(allResourceList != null) {
			for(Map<String, String> allResource_map : allResourceList) {
				JSONObject jsonObj = new JSONObject(); // {} 
				jsonObj.put("resourceId", allResource_map.get("resourceId"));
				jsonObj.put("fk_resourceCategoryId", allResource_map.get("fk_resourceCategoryId"));
				jsonObj.put("resourceName", allResource_map.get("resourceName"));
				
				jsonArr.put(jsonObj); // [{},{},{}]
			}// end of for------------
		}
		
		return jsonArr.toString();
	}
	
	
	/** 
	* @Method Name  : addReservation 
	* @작성일   : Dec 30, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원 예약하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("addReservation.gw")
	public String addReservation(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		String resourceId = request.getParameter("resourceId");
		String rsvStartDayTime = request.getParameter("rsvStartDayTime");
		String rsvEndDayTime = request.getParameter("rsvEndDayTime");
		String rsvReason = request.getParameter("rsvReason");
		
		Map<String, Object> option_map = new HashMap<>();
		option_map = service.getResourceOption(resourceId); // 승인여부, 반납필수여부 알아오기
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("resourceId", resourceId);
		paraMap.put("rsvStartDayTime", rsvStartDayTime);
		paraMap.put("rsvEndDayTime", rsvEndDayTime);
		paraMap.put("rsvReason", rsvReason);
		paraMap.put("isApproval", option_map.get("isApproval")); // 승인여부 (0:승인없이예약가능, 1:승인필요함)
		paraMap.put("isReturn", option_map.get("isReturn")); // 반납필수여부 (0:반납필요없음, 1:반납필수임)
	
		int result = 0;
		List<Map<String, String>> existReservationList = null;
		existReservationList = service.selectReservation(paraMap); // 해당일시에 등록된 예약이 있는지 조회
		
		if(existReservationList.size() == 0) { // 해당일시에 등록된 예약이 없을 경우
			result = 1;
			service.addReservation(paraMap); // 예약하기 (자원예약 table에 insert)
		}
	
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : getReservationInfoDetail 
	* @작성일   : Dec 31, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원예약 한 건에 대한 정보 가져오기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("getReservationInfoDetail.gw")
	public String getReservationInfoDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		String rsvResourceId = request.getParameter("rsvResourceId");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		
		List<ReservationVO> reservationDetailInfo = null;
				
		// ----- 예약 상세정보 가져오기 시작 ----- // 
		paraMap.put("type", "oneDetailInfo");
		paraMap.put("rsvResourceId", rsvResourceId);
		reservationDetailInfo = service.getReservationList(paraMap); 
		// ----- 예약 상세정보 가져오기 끝 ----- // 
		
		JSONArray jsonArr = new JSONArray(); // [] 
		
		if(reservationDetailInfo != null) {
			for(ReservationVO rsvvo : reservationDetailInfo) {
				
				JSONObject jsonObj = new JSONObject(); // {} 
				jsonObj.put("rsvResourceId", rsvvo.getRsvResourceId());
				jsonObj.put("rsvEmpName", rsvvo.getRsvEmpName()); 
				
				jsonObj.put("resourceId", rsvvo.getResourceId());
				jsonObj.put("resourceName", rsvvo.getResourceName());
				jsonObj.put("resourceCategoryId", rsvvo.getResourceCategoryId());
				jsonObj.put("resourceCategoryName", rsvvo.getResourceCategoryName());
				
				jsonObj.put("rsvStartDayTime", rsvvo.getRsvStartDayTime());
				jsonObj.put("rsvEndDayTime", rsvvo.getRsvEndDayTime());
				jsonObj.put("rsvReason", rsvvo.getRsvReason());
				jsonObj.put("rsvStatus", rsvvo.getRsvStatus());
				
				jsonObj.put("approvalStatus", rsvvo.getApprovalStatus());
				jsonObj.put("approvalDay", rsvvo.getApprovalDay());
				jsonObj.put("fk_approvalEmpId", rsvvo.getFk_approvalEmpId());
				jsonObj.put("rejectReason", rsvvo.getRejectReason());
				
				jsonObj.put("returnStatus", rsvvo.getReturnStatus());
				jsonObj.put("registerDay", rsvvo.getRegisterDay());
				jsonObj.put("updateDay", rsvvo.getUpdateDay());
				
				jsonArr.put(jsonObj); // [{},{},{}]
			}// end of for------------
		}
		
		return jsonArr.toString();
	}
	
	
	/** 
	* @Method Name  : getEmpInfo 
	* @작성일   : Dec 31, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 사원 정보 가져오기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("getEmpInfo.gw")
	public Map<String, String> getEmpInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String empId = request.getParameter("empId");
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		
		Map<String, String> empInfo_map = new HashMap<>();
		empInfo_map = service.getEmpInfo(paraMap); // 사원 정보 가져오기

		return empInfo_map;
	}
	
	
	/** 
	* @Method Name  : delRservation 
	* @작성일   : Dec 31, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("delReservation.gw")
	public String delReservation(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String rsvResourceId = request.getParameter("rsvResourceId");
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("rsvResourceId", rsvResourceId);
		
		int result = 0;
		result = service.delReservation(paraMap);
	
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : returnRsource 
	* @작성일   : Jan 1, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약 자원 반납하기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("returnRsource.gw")
	public String returnRsource(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String rsvResourceId = request.getParameter("rsvResourceId");
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("rsvResourceId", rsvResourceId);
	
		int result = 0;
		result = service.returnRsource(paraMap);

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : manageApproval 
	* @작성일   : Jan 1, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 승인 관리 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("approvalManageAdmin.gw")
	public ModelAndView approvalManageAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
		
		String type = request.getParameter("type"); 	
		if(type == null) {
			type = "approvalWait";
		}
		mav.addObject("type", type);
		
		
		// ----- 승인대기/승인/반려 목록 가져오기 시작 ----- // 
		List<ReservationVO> reservationList = null;
		int totalCount = 0;
		paraMap.put("type", type);
		reservationList = service.getReservationList(paraMap); 
		totalCount = service.getTotalCount(paraMap);
		mav.addObject("reservationList", reservationList); 	// 목록 가져오기 
		mav.addObject("totalCount", totalCount);			// 총 예약 건수 가져오기
		// ----- 승인대기 목록 가져오기 끝 ----- // 
		
		mav.addObject("sideType", "manageApproval");	
		
		mav.setViewName("manageApproval.reservation");
		
		return mav;
	}
	
	
	/** 
	* @Method Name  : rsvApprove
	* @작성일   : Jan 2, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약 승인하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("rsvApprove.gw")
	public String rsvApprove(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();	

		String rsvResourceId = request.getParameter("rsvResourceId");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);	
		paraMap.put("rsvResourceId", rsvResourceId);
		
		int result = 0;
		result = service.rsvApprove(paraMap);

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : rsvReject 
	* @작성일   : Jan 2, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약 반려하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("rsvReject.gw")
	public String rsvReject(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		String rsvResourceId = request.getParameter("rsvResourceId");
		String rejectReason = request.getParameter("rejectReason");
		
		Map<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("loginEmpId", loginEmpId);	
		paraMap.put("rsvResourceId", rsvResourceId);
		paraMap.put("rejectReason", rejectReason);
		
		int result = 0;
		result = service.rsvReject(paraMap);

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : returnManageAdmin 
	* @작성일   : Jan 2, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 반납 관리 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("returnManageAdmin.gw")
	public ModelAndView returnManageAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
		
		String type = request.getParameter("type"); 	
		if(type == null) {
			type = "returnWait";
		}
		mav.addObject("type", type);
		

		// ----- 반납대기/빈납완료 목록 가져오기 시작 ----- // 
		List<ReservationVO> reservationList = null;
		int totalCount = 0;
		paraMap.put("type", type);
		reservationList = service.getReservationList(paraMap); 
		totalCount = service.getTotalCount(paraMap);
		mav.addObject("reservationList", reservationList); 	// 목록 가져오기 
		mav.addObject("totalCount", totalCount);			// 총 예약 건수 가져오기
		// ----- 반납대기/빈납완료 목록 가져오기 시작 ----- // 
				
		mav.addObject("sideType", "manageReturn");
		
		mav.setViewName("manageReturn.reservation");
		
		return mav;
	}
	
	
	/** 
	* @Method Name  : categoryManageAdmin 
	* @작성일   : Jan 2, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 카테고리 관리 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("categoryManageAdmin.gw")
	public ModelAndView categoryManageAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();	
		
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		String type = "category";
		request.setAttribute("type", type);
		
		// ----- 카테고리관리_자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> adminResourceCategoryList = null;
		adminResourceCategoryList = service.getAdminResourceCategoryList();
		mav.addObject("adminResourceCategoryList", adminResourceCategoryList);
		// ----- 카테고리관리_자원카테고리 목록 가져오기 끝 ----- //	
		
		mav.addObject("sideType", "manageCategory");
		
		mav.setViewName("manageCategory.reservation");
		
		return mav;
	}	
	
	
	/** 
	* @Method Name  : categoryDel 
	* @작성일   : Jan 2, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 카테고리 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("categoryDel.gw")
	public String categoryDel(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String resourceCategoryId = request.getParameter("resourceCategoryId");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("resourceCategoryId", resourceCategoryId);	
		
		int result = 0;
		result = service.categoryDel(paraMap);

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : categoryORresourceAdd 
	* @작성일   : Jan 2, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 카테고리 추가/수정 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("categoryManageAddAdmin.gw")
	public ModelAndView categoryAddAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String type = "category";
		request.setAttribute("type", type);
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
		
	
		String resourceCategoryId = request.getParameter("resourceCategoryId");
		request.setAttribute("resourceCategoryId", resourceCategoryId);
		if(resourceCategoryId == null) {
			resourceCategoryId = "";
		}
		// =============== 카테고리 수정으로 들어왔을 경우 시작 =============== //
		else {
		paraMap.put("resourceCategoryId", resourceCategoryId);
		
		// ----- 관리자_자원카테고리 정보 가져오기 시작 ----- //
		Map<String, Object> adminResourceCategoryInfo_map = new HashMap<>();
		adminResourceCategoryInfo_map = service.getAdminResourceCategoryInfo(paraMap);
		mav.addObject("adminResourceCategoryInfo_map", adminResourceCategoryInfo_map);
		
		request.setAttribute("imageFile", adminResourceCategoryInfo_map.get("imageFile"));
		request.setAttribute("isDelete", adminResourceCategoryInfo_map.get("isDelete"));
								
		String viewPath = this.getClass().getResource("").getPath(); 
		viewPath = File.separator+"resources"+File.separator+"image"+File.separator+"reservation"+File.separator;
		request.setAttribute("viewPath", viewPath);
		// ----- 관리자_자원카테고리 정보 가져오기 끝 ----- //
		}
		// =============== 카테고리 수정으로 들어왔을 경우 끝 =============== //
		
		mav.setViewName("categoryORresourceAdd.reservation");
		
		return mav;
	}	
	
	
	/** 
	* @Method Name  : categoryManageAddEndAdmin 
	* @작성일   : Jan 3, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 카테고리 추가/수정 완료 요청
	* @param mrequest
	* @param response
	* @param mav
	* @return 
	*/
	@PostMapping("categoryManageAddEndAdmin.gw")
	public ModelAndView categoryManageAddEndAdmin(MultipartHttpServletRequest mrequest, HttpServletResponse response, ModelAndView mav) { 		
		
		String name = mrequest.getParameter("name");
		String description = mrequest.getParameter("description");
		MultipartFile imageFile = mrequest.getFile("imageFile");// ????????
		String resourceType = mrequest.getParameter("resourceType");
		String isDelete = mrequest.getParameter("isDelete");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("name", name);	
		paraMap.put("description", description);	
		paraMap.put("imageFile", imageFile);			
		paraMap.put("resourceType", resourceType);	
		paraMap.put("isDelete", isDelete);	
	
		if(imageFile.getSize() != 0) { // 유저가 사진을 첨부하는 경우 
			
			String path = this.getClass().getResource("").getPath(); 
			path = File.separator + path.substring(1, path.indexOf(".metadata")) + "TempFinal"
				 + File.separator + "src"+File.separator + "main" + File.separator + "webapp"
				 + File.separator + "resources" + File.separator + "image"+File.separator + "reservation";

			String newFileName = "";
			// 저장될 파일명 
			
			byte[] bytes = null;
			// 첨부파일의 내용물을 담는 것
			
			try {
				bytes = imageFile.getBytes();
				// 첨부파일의 내용물을 읽어오는 것
				
				String originalFilename = imageFile.getOriginalFilename();
				// attach.getOriginalFilename() 이 첨부파일명의 파일명(예: 예시사진.png) 이다.
				
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
				// 첨부되어진 파일을 업로드 하는 것이다.
				
				paraMap.put("newFileName", newFileName);	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else { // 유저가 제공되는 사진 중 선택했을 경우 or 카테고리 수정을 하면서 사진을 변경하지 않은 경우
			
			String newFileName = mrequest.getParameter("resource_Imgfile");
			paraMap.put("newFileName", newFileName);	
			
		}


		String resourceCategoryId = mrequest.getParameter("resourceCategoryId");	
		int n = 0;
		
		if(resourceCategoryId.trim().length() == 0) {	
			n = service.categoryAdd(paraMap); // 자원 카테고리 추가하기	
		}
		else {
			paraMap.put("resourceCategoryId", resourceCategoryId); 	
			n = service.categoryEdit(paraMap); // 자원 카테고리 수정하기
		}
		
		if(n == 1) {
			mav.setViewName("redirect:/reservation/categoryManageAdmin.gw"); 
		}
	
		return mav;
	}
	
	
	/** 
	* @Method Name  : resourceManageAdmin 
	* @작성일   : Jan 3, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원 관리 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("resourceManageAdmin.gw")
	public ModelAndView resourceManageAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
		
		String type = "resource"; 
		request.setAttribute("type", type);
		
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		
		String resourceCategoryId = request.getParameter("resourceCategoryId");
		if(resourceCategoryId == null) {
			resourceCategoryId = service.getFirstCategoryId(); // 존재하는 첫번째 카테고리id 가져오기
		}
		paraMap.put("resourceCategoryId", resourceCategoryId);		
		request.setAttribute("resourceCategoryId", resourceCategoryId);
		
		
		// ----- 관리자_자원 목록 가져오기 시작 ----- //
		List<Map<String, String>> adminResourceList = null;
		adminResourceList = service.getAdminResourceList(paraMap);
		mav.addObject("adminResourceList", adminResourceList);
		// ----- 관리자_자원 목록 가져오기 끝 ----- //	
		
		
		mav.addObject("sideType", "manageResource");
		
		mav.setViewName("manageCategory.reservation");
		
		return mav;
	}	
	
	
	/** 
	* @Method Name  : resourceManageAddAdmin 
	* @작성일   : Jan 4, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원 추가/수정 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("resourceManageAddAdmin.gw")
	public ModelAndView resourceManageAddAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String type = "resource";
		request.setAttribute("type", type);
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
	
		String resourceCategoryId = request.getParameter("resourceCategoryId");
		paraMap.put("resourceCategoryId", resourceCategoryId);	
		mav.addObject("resourceCategoryId", resourceCategoryId);
		
		String resourceId = request.getParameter("resourceId");
		if(resourceId == null) {
			resourceId = "";
		}
		// =============== 자원 수정으로 들어왔을 경우 시작 =============== //
		else {
		paraMap.put("resourceId", resourceId);
		
		// ----- 관리자_자원 정보 가져오기 시작 ----- //
		Map<String, Object> adminResourceInfo_map = new HashMap<>();
		adminResourceInfo_map = service.getAdminResourceInfo(paraMap); 
		mav.addObject("adminResourceInfo_map", adminResourceInfo_map);
		
		request.setAttribute("imageFile", adminResourceInfo_map.get("imageFile"));
		request.setAttribute("isDelete", adminResourceInfo_map.get("isDelete"));
		request.setAttribute("isApproval", adminResourceInfo_map.get("isApproval"));
		request.setAttribute("isReturn", adminResourceInfo_map.get("isReturn"));
		
		String viewPath = this.getClass().getResource("").getPath(); 
		viewPath = File.separator+"resources"+File.separator+"image"+File.separator+"reservation"+File.separator;
		request.setAttribute("viewPath", viewPath);
		// ----- 자원 정보 가져오기 끝 ----- //
		}
		// =============== 자원 수정으로 들어왔을 경우 끝 =============== //
		
		mav.setViewName("categoryORresourceAdd.reservation");
		
		return mav;
	}	
	
	
	@PostMapping("resourceManageAddEndAdmin.gw")
	/** 
	* @Method Name  : resourceManageAddEndAdmin 
	* @작성일   : Jan 4, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원 추가/수정 완료 요청
	* @param mrequest
	* @param response
	* @param mav
	* @return 
	*/
	public ModelAndView resourceManageAddEndAdmin(MultipartHttpServletRequest mrequest, HttpServletResponse response, ModelAndView mav) { 		
		
		String fk_resourcecategoryid = mrequest.getParameter("fk_resourcecategoryid");
		String name = mrequest.getParameter("name");
		String description = mrequest.getParameter("description");
		MultipartFile imageFile = mrequest.getFile("imageFile");// ????????
		String isApproval = mrequest.getParameter("isApproval");
		String isReturn = mrequest.getParameter("isReturn");
		String isDelete = mrequest.getParameter("isDelete");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("fk_resourcecategoryid", fk_resourcecategoryid);	
		paraMap.put("name", name);	
		paraMap.put("description", description);	
		paraMap.put("imageFile", imageFile);			
		paraMap.put("isApproval", isApproval);			
		paraMap.put("isReturn", isReturn);	
		paraMap.put("isDelete", isDelete);	
	
		if(imageFile.getSize() != 0) { // 유저가 사진을 첨부하는 경우 
			
			String path = this.getClass().getResource("").getPath(); 
			path = File.separator + path.substring(1, path.indexOf(".metadata")) + "TempFinal"
				 + File.separator + "src"+File.separator + "main" + File.separator + "webapp"
				 + File.separator + "resources" + File.separator + "image"+File.separator + "reservation";

			String newFileName = "";
			// 저장될 파일명 
			
			byte[] bytes = null;
			// 첨부파일의 내용물을 담는 것
			
			try {
				bytes = imageFile.getBytes();
				// 첨부파일의 내용물을 읽어오는 것
				
				String originalFilename = imageFile.getOriginalFilename();
				// attach.getOriginalFilename() 이 첨부파일명의 파일명(예: 강아지.png) 이다.
				
				newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
				// 첨부되어진 파일을 업로드 하는 것이다.
				
				paraMap.put("newFileName", newFileName);	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else { // 유저가 제공되는 사진 중 선택했을 경우 or 카테고리 수정을 하면서 사진을 변경하지 않은 경우
			
			String newFileName = mrequest.getParameter("resource_Imgfile");
			paraMap.put("newFileName", newFileName);	
			
		}


		String resourceId = mrequest.getParameter("resourceId");	
		int n = 0;
		
		if(resourceId.trim().length() == 0) {	
			n = service.resourceAdd(paraMap); // 자원 추가하기	
		}
		else {
			paraMap.put("resourceId", resourceId); 	
			n = service.resourceEdit(paraMap); // 자원수정하기
		}
		
		
		if(n == 1) {
			mav.setViewName("redirect:/reservation/resourceManageAdmin.gw"); 
		}
	
		return mav;
	}
	
	
	/** 
	* @Method Name  : resourceDel 
	* @작성일   : Jan 5, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 자원 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("resourceDel.gw")
	public String resourceDel(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String resourceId = request.getParameter("resourceId");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("resourceId", resourceId);	
		
		
		int result = 0;
		result = service.resourceDel(paraMap);

	
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("result", result);
	
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : rsvAdminManageAdmin 
	* @작성일   : Jan 5, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약관리자 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("rsvAdminManageAdmin.gw")
	public ModelAndView rsvAdminManageAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		// ----- 자원카테고리 목록 가져오기 시작 ----- //
		List<Map<String, String>> resourceCategoryList = null;
		resourceCategoryList = service.getResourceCategoryList();
		mav.addObject("resourceCategoryList", resourceCategoryList);
		// ----- 자원카테고리 목록 가져오기 끝 ----- //	
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);		
		
		
		// ----- 예약관리자 목록 가져오기 시작 ----- //
		List<Map<String, String>> rsvAdminList = null;
		rsvAdminList = service.getRsvAdminList();
		mav.addObject("rsvAdminList", rsvAdminList);
		// ----- 예약관리자 목록 가져오기 끝 ----- //	
		
		// ----- 예약관리자 총 인원수 가져오기 시작 ----- //
		int rsvAdmintotalCount = 0;
		rsvAdmintotalCount = service.getRsvAdminTotalCount();
		mav.addObject("rsvAdmintotalCount", rsvAdmintotalCount);
		// ----- 예약관리자 총 인원수 가져오기 끝 ----- //
		
		
		mav.addObject("sideType", "manageRsvAdmin");
		
		mav.setViewName("manageRsvAdmin.reservation");
		
		return mav;
	}
	
	
	/** 
	* @Method Name  : delRsvAdmin 
	* @작성일   : Jan 7, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 예약관리자 삭제하기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("delRsvAdmin.gw")
	public String delRsvAdmin(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
		String adminId = request.getParameter("adminId");
	
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);			
		paraMap.put("adminId", adminId);
		
		int result = service.delRsvAdmin(paraMap); // 예약 관리자 삭제하기
		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
		
		return jsonObj.toString();
	}
	
	
	
}
