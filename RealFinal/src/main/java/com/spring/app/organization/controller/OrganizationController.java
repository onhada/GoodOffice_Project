package com.spring.app.organization.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.organization.service.OrganizationService;

/** 
* @FileName  : OrganizationController.java 
* @Project   : TempFinal 
* @Date      : Jan 8, 2024 
* @작성자      : 김민경 
* @변경이력    : 
* @프로그램설명    : 조직 컨트롤러입니다.
*/
@Controller
@RequestMapping(value = "/organization/*")
public class OrganizationController {
	
	@Autowired
	private OrganizationService service;

		
	
	/** 
	* @Method Name  : organizationManage 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 조직관리(조직도) 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("organizationManage.gw")
	public ModelAndView organizationManage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		
//		Map<String, Object> paraMap = new HashMap<>();
		

		List<Map<String, String>> depList = null;
		depList = service.getDepList(); // 부서 목록 가져오기
		mav.addObject("depList", depList);	

//		paraMap.put("type", "dep");
		String[] depId_arr = new String[depList.size()];
		for(int i=0; i<depList.size(); i++) {
			depId_arr[i] = depList.get(i).get("depId"); // 부서별 id 가져오기
		}
//		paraMap.put("depId_arr", depId_arr);
		
		
		
		
		
		
		
		
		List<Map<String, String>> teamList = null;
		teamList = service.getTeamList(); // 팀 목록 가져오기
		mav.addObject("teamList", teamList);
		
		
		Map<String, Object> paraMap = new HashMap<>();
		
		paraMap.put("type", "total");
		List<Map<String, String>> totalEmpCount = service.getEmpCount(paraMap); // 총 사원 수 가져오기
		mav.addObject("totalEmpCount", totalEmpCount);
		


//		
//		List<Map<String, String>> depEmpCount = service.getEmpCount(paraMap); // 부서별 사원 수 가져오기
//		mav.addObject("depEmpCount", depEmpCount);
//		
		
//		paraMap.put("type", "team");
//		String[] teamId_arr = new String[teamList.size()];
//		for(int i=0; i<teamList.size(); i++) {
//			teamId_arr[i] = teamList.get(i).get("teamId"); // 부서별 id 가져오기
//		}
//		paraMap.put("teamId_arr", teamId_arr);
//		
//		int teamEmpCount = service.getEmpCount(paraMap); // 팀별 사원 수 가져오기
//		mav.addObject("teamEmpCount", teamEmpCount);
		
		
		
		mav.setViewName("organizationManage.organization");
		
		return mav;
		
	}	
	
	
	/** 
	* @Method Name  : empInfo 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 임직원관리 페이지 보여주기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("empInfoViewPage.gw")
	public ModelAndView empInfoViewPage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		List<Map<String, String>> depList = null;
		depList = service.getDepList(); // 부서 목록 가져오기
		mav.addObject("depList", depList);	

		List<Map<String, String>> teamList = null;
		teamList = service.getTeamList(); // 팀 목록 가져오기
		mav.addObject("teamList", teamList);
		
		
		List<EmployeeVO> empInfoList = null;
		empInfoList = service.getEmpInfoList(); // 임직원 정보 목록 가져오기
		mav.addObject("empInfoList", empInfoList);	

		
		mav.setViewName("empInfo.organization");
		
		return mav;
		
	}	
	
	
	
	@GetMapping("myInfoViewPage.gw")
	public ModelAndView myinfoViewPage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */		
		

		long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		
		EmployeeVO loginEmp = service.getLoginEmpInfo(paraMap); // 로그인한 사원 정보 가져오기
		mav.addObject("loginEmp", loginEmp);
		
		request.setAttribute("jobId", loginEmp.getFk_jobId());

		String birthYear = loginEmp.getBirth().substring(0, 4);
		String birthMonth = loginEmp.getBirth().substring(5, 7);
		String birthDay = loginEmp.getBirth().substring(8, 10);
		mav.addObject("birthYear", birthYear);
		mav.addObject("birthMonth", birthMonth);
		mav.addObject("birthDay", birthDay);
		
		List<EmployeeVO> jobList = null;
		jobList = service.getJobList(); // 직무 목록 가져오기
		mav.addObject("jobList", jobList);
		
		mav.setViewName("empInfo_myInfo.organization");
		
		return mav;
		
	}	
	
	
	@ResponseBody
	@GetMapping("selectEmpInfo.gw")
	public String selectEmpInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String depId = request.getParameter("depId");
		String teamId = request.getParameter("teamId");
System.out.println("dd"+depId);		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("depId", depId);
		paraMap.put("teamId", teamId);
		
System.out.println(paraMap.get("teamId"));			
		List<EmployeeVO> empInfoList = null;
		empInfoList = service.getSpecificEmpInfoList(paraMap); // 특정 부서 or 팀에 소속된 임직원 정보 목록 가져오기
		mav.addObject("empInfoList", empInfoList);	
		
	System.out.println(empInfoList.size());	
		
			
		JSONArray jsonArr = new JSONArray(); // [] 
		
		if(empInfoList != null) {
			for(EmployeeVO empInfo : empInfoList) {
				JSONObject jsonObj = new JSONObject(); // {} 

				jsonObj.put("empId", empInfo.getEmpId());
				jsonObj.put("empName", empInfo.getEmpName());
				jsonObj.put("positionName", empInfo.getPositionName());
				jsonObj.put("fk_depId", empInfo.getFk_depId());
				jsonObj.put("depName", empInfo.getDepName());
				jsonObj.put("fk_teamId", empInfo.getFk_teamId());
				jsonObj.put("teamName", empInfo.getTeamName());
				
				
				jsonArr.put(jsonObj); // [{},{},{}]
			}// end of for------------
		}
		
		return jsonArr.toString();
	}
	
	
	
	
	/** 
	* @Method Name  : empManage 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직위/직무설정 페이지 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("positionManage.gw")
	public ModelAndView empManage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		// 직위 조회하기
		List<EmployeeVO> positionList = null;
		positionList = service.getPositionList(); 
		mav.addObject("positionList", positionList);	
		
		// 직무 조회하기
		List<EmployeeVO> jobList = null;
		jobList = service.getJobList(); 
		mav.addObject("jobList", jobList);	
		
		
		mav.setViewName("positionManage.organization");
		
		return mav;
		
	}	
	
	
	
	
	/** 
	* @Method Name  : addJob 
	* @작성일   : Jan 9, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 새로운 직무 추가하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("addJob.gw")
	public String addJob(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String jobName = request.getParameter("jobName");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("jobName", jobName);
		
		String existJobName = "";
		existJobName = service.selectExistJob(paraMap); // 기존직무 중 같은 이름의 직무가 있는지 조회하기 

		int result = 0;
		if(existJobName == null){ // 존재하지 않는다면, 새 직무 추가하기 
			result = service.insertNewJob(paraMap);
		}
		

		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : delJob
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직무 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("delJob.gw")
	public String delJob(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String jobId = request.getParameter("jobId");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("jobId", jobId);
		
		List<Map<String, String>> empNameList = null;
		empNameList = service.selectJobIdFromEmp(paraMap); // 삭제하려는 직무의 사원이 있는지 조회한다
		
		int result = 0;
		if(empNameList.size() == 0) { // 삭제하려는 직무의 사원이 존재하지 않을 경우 
			result = service.delJob(paraMap); // 직무 삭제하기 
		}
		else if(empNameList.size() > 0) {
			result = 2;
		}
		
		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : addPosition 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직위 추가하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("addPosition.gw")
	public String addPosition(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String positionId = request.getParameter("positionId");
		String positionName = request.getParameter("positionName");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("positionId", positionId);
		paraMap.put("positionName", positionName);
		
		String existPositionId = "";
		existPositionId = service.selectExistPositionId(paraMap); // 기존직위 중 같은 등급의 직위가 있는지 조회하기 

		String existPositionName = "";
		existPositionName = service.selectExistPosition(paraMap); // 기존직위 중 같은 이름의 직위가 있는지 조회하기 

		
		int result = 0;
		if(existPositionName == null){ // 같은 이름의 직위가 존재하지 않는다면
			if(existPositionId == null) { // 같은 등급의 직위가 존재하지 않는다면 
				result = service.insertNewPosition(paraMap); // 직위 추가하기
			}
		}
		

		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : delPosition 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 직위 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("delPosition.gw")
	public String delPosition(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String positionId = request.getParameter("positionId");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("positionId", positionId);
		
		List<Map<String, String>> empNameList = null;
		empNameList = service.selectPositionIdFromEmp(paraMap); // 삭제하려는 직위의 사원이 있는지 조회한다
		
		int result = 0;
		if(empNameList.size() == 0) { // 삭제하려는 직위의 사원이 존재하지 않을 경우 
			
			List<Map<String, String>> lowPositionEmpList = null;
			lowPositionEmpList = service.getLowPositionEmp(paraMap); // 삭제하려는 직위보다 낮은 직위의 사원 가져오기
			
			List<Map<String, String>> positionIdList = null;
			positionIdList = service.selectSecurityPositionId(paraMap); // 전자결재 보안등급 설정된 직위 조회하기

			if(lowPositionEmpList.size() != 0) {
				result = 3;
			}
			else if(positionIdList.size() != 0) {
				result = 4;
			}
			else {
				result = service.delPosition(paraMap); // 직위를 삭제한다 
			}
			
		}
		else if(empNameList.size() > 0) {
			result = 2;
		}
		
		
		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : addNewDep 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 부서 추가하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("addNewDep.gw")
	public String addNewDep(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String depName = request.getParameter("depName");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("depName", depName);
		
		String existDepName = "";
		existDepName = service.selectExistDep(paraMap); // 기존부서 중 동일한 부서명이 있는지 조회하기 

		int result = 0;
		if(existDepName == null){ // 존재하지 않는다면
			result = service.insertNewDep(paraMap); // 부서 추가하기
		}
		

		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : delDep 
	* @작성일   : Jan 10, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 부서 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("delDep.gw")
	public String delDep(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String depId = request.getParameter("depId");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("depId", depId);
		
		List<Map<String, String>> existTeamList = null;
		existTeamList = service.selectExistTeamOfDep(paraMap); // 부서 내 팀이 존재하는지 조회하기 

		int result = 0;
		if(existTeamList.size() == 0){ // 존재하지 않는다면
			result = service.deleteDep(paraMap); // 부서 삭제하기
		}
		

		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : addNewTeam 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 팀 추가하기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("addNewTeam.gw")
	public String addNewTeam(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String depId = request.getParameter("depId");
		String teamName = request.getParameter("teamName");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("depId", depId);
		paraMap.put("teamName", teamName);
		
		
		String existTeamName = "";
		existTeamName = service.selectExistTeam(paraMap); // 기존팀 중 동일한 팀명이 있는지 조회하기 

		int result = 0;
		if(existTeamName == null){ // 존재하지 않는다면
			result = service.insertNewTeam(paraMap); // 팀 추가하기
		}
		

		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	
	/** 
	* @Method Name  : delTeam 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 팀 삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@GetMapping("delTeam.gw")
	public String delTeam(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String teamId = request.getParameter("teamId");

		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("teamId", teamId);
		
		List<Map<String, String>> existEmpOfTeamList = null;
		existEmpOfTeamList = service.selectExistEmpOfTeam(paraMap); // 팀내 사원이 존재하는지 조회하기 

		int result = 0;
		if(existEmpOfTeamList.size() == 0){ // 존재하지 않는다면
			result = service.deleteTeam(paraMap); // 팀 삭제하기
		}
		

		JSONObject jsonObj = new JSONObject(); // {} 
		jsonObj.put("result", result);
		
				
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : editMyinfo 
	* @작성일   : Jan 11, 2024 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 내 정보 수정하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@PostMapping("editMyinfo.gw")
	public ModelAndView editMyinfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		String empId = request.getParameter("empId");
		String jobId = request.getParameter("jobId");
		String companyTel = request.getParameter("companyTel");
		String tel = request.getParameter("tel");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		 
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("empId", empId);
		paraMap.put("jobId", jobId);
		paraMap.put("companyTel", companyTel);
		paraMap.put("tel", tel);
		paraMap.put("birth", birthYear+"-"+birthMonth+"-"+birthDay);
		paraMap.put("postcode", postcode);
		paraMap.put("address", address);
		paraMap.put("detailAddress", detailAddress);
		
		
		int result = 0;
		result = service.editMyinfo(paraMap); // 내 정보 수정하기
	System.out.println(result+"dd");	
		if(result == 1) {
			mav.setViewName("redirect:/organization/myInfoViewPage.gw"); 
		}
		else {
			//mav.setViewName("board/error/add_error.tiles1"); // 이거 살려야하나? 걍 버ㅕㄹ=ㅕ도 되는 거 아ㅕㄴ?
			
		}
	
		return mav;
	}
}
