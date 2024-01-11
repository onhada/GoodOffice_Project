package com.spring.app.personnel.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.personnel.domain.WorkhistoryVO;
import com.spring.app.personnel.service.PersonnelService;

/**
 *   @FileName  : PersonnelController.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 10 
 * @작성자      : db228 
 * @변경이력 : 
 * @프로그램설명 : 
 */
@Controller
public class PersonnelController {

	@Autowired
	private PersonnelService service;

	 
	/*
	 * @GetMapping("/index.gw") public String index(HttpServletRequest request ) {
	 * 
	 * // 테스트 코드 시작 EmployeeVO loginUser = new EmployeeVO();
	 * loginUser.setEmpId((long) 200); loginUser.setEmpName("정호석"); HttpSession
	 * session = request.getSession(); session.setAttribute("loginUser", loginUser);
	 * 
	 * long empid = loginUser.getEmpId(); request.setAttribute("empid", empid);
	 * //테스트 코드 끝
	 * 
	 * return "index.index";
	 * 
	 * }
	 */
	/** 
	* @Method Name  : work_modify 
	* @작성일   : 2024. 1. 7 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @return 
	*/
	@GetMapping("/personnel/work_modify.gw")
	public String work_modify(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		return "work_modify_number_next_MyVacationAndWork.personnel";

	}

	/** 
	* @Method Name  : workstatus_day_select 
	* @작성일   : 2024. 1. 7 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @param date
	* @return 
	*/
	@ResponseBody
	@PostMapping("/personnel/workstatus_day_select.gw")
	public String workstatus_day_select(HttpServletRequest request, HttpServletResponse response, String date) {

		 
		 

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("date", date);

		List<WorkhistoryVO> workhistoryList = service.workhistory_print(paraMap); // 현재 근무현황 출력

		 
		JSONArray jsonArr = new JSONArray(); // []


		if (workhistoryList != null) {

			for (WorkhistoryVO vo : workhistoryList) {

				JSONObject jsonObj = new JSONObject(); // {}
				jsonObj.put("workhistoryid", vo.getWorkhistoryid());
				jsonObj.put("fk_empid", vo.getFk_empid());

				String type = vo.getWorktype();

				switch (type) {

				case "1":
					type = "업무";
					break;
				case "2":
					type = "외출";
					break;
				case "3":
					type = "회의";
					break;
				case "4":
					type = "외근";
					break;
				case "5":
					type = "퇴근";
					break;
				case "6":
					type = "출근";
					break;

				default:
					break;
				}
				 
				jsonObj.put("worktype", type);

				String time = vo.getResisterdaytime().substring(11, 16);
				 
				jsonObj.put("resisterdaytime", time);

				 
				jsonArr.put(jsonObj);
			} // end of for-----------------------------------
		}
		return jsonArr.toString();

	}

	/**
	 *  
	 * 
	 * @Method Name  : personal_index 
	 * @작성일   : 2023. 12. 10 
	 * @작성자   : db228  @변경이력  : 
	 * @Method 설명 : 
	 * @param request
	 * @param response @return 
	 */
	@GetMapping("/personnel/personal_index.gw")
	public String personal_index(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String sysdate = service.sysdate_get(); // 현재날짜 가져오기
		request.setAttribute("sysdate", sysdate);

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("sysdate", sysdate);

		String day_hour = service.day_hour(paraMap); // 테스트 하루 근무시간
		request.setAttribute("empid", empid);

		String year = sysdate.substring(0, 4); // 현재 연도

		Map<String, String> paraMapYear = new HashMap<>();
		paraMapYear.put("empid", empid);
		paraMapYear.put("year", year);

		String year_hour = service.year_hour(paraMapYear); //총근무시간

		request.setAttribute("year_hour", year_hour);
		
		String avg_hour = service.avg_hour(paraMapYear); //총근무 분
		
		///////////////////////////////////
		String tardy_cnt = service.tardy_cnt(empid); //지각
		request.setAttribute("tardy_cnt", tardy_cnt);
		
		String early_work_cnt = service.early_work_cnt(empid); //조기퇴근
		request.setAttribute("early_work_cnt", early_work_cnt);
		
		String not_leave_work = service.not_leave_work(empid); //퇴근미체크
		request.setAttribute("not_leave_work", not_leave_work);
		
		String absenteeism = service.absenteeism(empid); //결근
		request.setAttribute("absenteeism", absenteeism);
		
		String workday_cnt = service.workday_cnt(empid); //근무일수
		request.setAttribute("workday_cnt", workday_cnt);
		///
		int avg_min= Integer.parseInt(avg_hour) /Integer.parseInt(workday_cnt);
		int  a=  avg_min   /60;
		 
		int b=  avg_min  %60;
		String avg_str= Integer.toString(a)+"시간 "+Integer.toString(b)+"분";
		request.setAttribute("avg_str", avg_str);
		////
		String vaction_cnt = service.vaction_cnt(empid); //잔여 휴가
		request.setAttribute("vaction_cnt", vaction_cnt);
		
		

		return "personal_index.personnel";

		 

	}

	/**
	 *  
	 * 
	 * @Method Name  : workstatus_insert
	 * @작성일   : 2023. 12. 27 
	 * @작성자   : db228  @변경이력  : 
	 * @Method 설명 : 
	 * @param request
	 * @param response
	 * @param a @return 
	 */
	@ResponseBody
	@PostMapping("/personnel/workstatus_insert.gw")
	public String workstatus_insert(HttpServletRequest request, HttpServletResponse response, String worktype) {

		 
		JSONObject jsonObj = new JSONObject();
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("worktype", worktype);

		int n = service.workhistory_insert(paraMap); // 근무현황 인서트

		try {
			jsonObj.put("result", 1);

		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("result", 0);
		}

		return jsonObj.toString();
	}

	/**
	 *  
	 * 
	 * @Method Name  : workstatus_print 
	 * @작성일   : 2023. 12. 27 
	 * @작성자   : db228  @변경이력  : 
	 * @Method 설명 : 
	 * @param request
	 * @param response
	 * @param worktype @return 
	 */
	@ResponseBody
	@PostMapping("/personnel/workstatus_print.gw")
	public String workstatus_print(HttpServletRequest request, HttpServletResponse response, String worktype) {

	 
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		String sysdate = service.sysdate_get(); // 현재날짜 가져오기

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("worktype", worktype);
		paraMap.put("date", sysdate);

		List<WorkhistoryVO> workhistoryList = service.workhistory_print(paraMap); // 현재 근무현황 출력

		 
		 
		JSONArray jsonArr = new JSONArray(); // []

		if (workhistoryList != null) {

			for (WorkhistoryVO vo : workhistoryList) {

				JSONObject jsonObj = new JSONObject(); // {}
				jsonObj.put("workhistoryid", vo.getWorkhistoryid());
				jsonObj.put("fk_empid", vo.getFk_empid());

				String type = vo.getWorktype();

				switch (type) {

				case "1":
					type = "업무";
					break;
				case "2":
					type = "외출";
					break;
				case "3":
					type = "회의";
					break;
				case "4":
					type = "외근";
					break;
				case "5":
					type = "퇴근";
					break;
				case "6":
					type = "출근";
					break;

				default:
					break;
				}
			 
				jsonObj.put("worktype", type);

				String time = vo.getResisterdaytime().substring(11, 16);
			 
				jsonObj.put("resisterdaytime", time);

				 
				jsonArr.put(jsonObj);
			} // end of for-----------------------------------
		}

		return jsonArr.toString();

		 
	}

	/** 
	* @Method Name  : personal_vaction_application 
	* @작성일   : 2024. 1. 7 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @return 
	*/
	@GetMapping("/personnel/personal_vaction_application.gw")
	public String personal_vaction_application(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		String vaction_cnt = service.vaction_cnt(empid);

		 

		request.setAttribute("vaction_cnt", vaction_cnt);

		return "approval_vacation_apply.personnel";
	}

	/** 
	* @Method Name  : personal_vaction_insert 
	* @작성일   : 2024. 1. 7 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @param datepi
	* @param empidList
	* @param empnameList
	* @param reason
	* @param vtype
	* @param empidListh
	* @param empnameListh
	* @param empidListRef
	* @param empnameListRef
	* @return 
	*/
	@ResponseBody
	@PostMapping("/personnel/vaction_insert.gw")
	public String personal_vaction_insert(HttpServletRequest request, HttpServletResponse response, String datepi,
			String empidList, String empnameList, String reason, String vtype, String empidListh, String empnameListh,
			String empidListRef, String empnameListRef) {
 

		System.out.println("dlis : "+empnameListh);
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디

		//int va_approval_insert = service.va_approval_insert(empid);

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("datepi", datepi);
		paraMap.put("reason", reason);
		paraMap.put("vtype", vtype);

		//int va_dayoff_insert = service.va_dayoff_insert(paraMap);
		 

		int sts = 1; // 기안 처리 순서

		// 신청 신청자는 상태 2로
		String[] empidLisths = empidListh.split(",");
		String[] empnameLisths = empnameListh.split(",");

		for (int i = 0; i < empidLisths.length; i++) {

		 

			if (i == 0) { // 신청한 사람일경우
				 
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidLisths[i]);
				paraMaps.put("ptype", "2");
				paraMaps.put("status", "2");
				paraMaps.put("seq", Integer.toString(sts));
				//int n = service.procedure_insert(paraMaps);
				sts++;
			} else {
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidLisths[i]);
				paraMaps.put("ptype", "2");
				paraMaps.put("status", "1");
				paraMaps.put("seq", Integer.toString(sts));
				//int n = service.procedure_insert(paraMaps);
				sts++;
			}

		}

		// 처리
		String[] empidLists = empidList.split(",");
		String[] empnameLists = empnameList.split(",");

		for (int i = 0; i < empidLists.length; i++) {

			if (!empidLists[i].equals("")) {
				 
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidLists[i]);
				paraMaps.put("ptype", "4");
				paraMaps.put("status", "1");
				paraMaps.put("seq", Integer.toString(sts));
				//int n = service.procedure_insert(paraMaps);
				sts++;
			}

		}

		// 참조 는 확인으로
		String[] empidListRefs = empidListRef.split(",");
		String[] empnameListRefs = empnameListRef.split(",");

		int n = 0;
		for (int i = 0; i < empidListRefs.length; i++) {

			if (!empidListRefs[i].equals("")) {
				 
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidListRefs[i]);
				paraMaps.put("ptype", "5");
				paraMaps.put("status", "5");
				paraMaps.put("seq", Integer.toString(sts));
				//n = service.procedure_insert(paraMaps);
				sts++;
			}

		}

	 
		JSONObject jsonObj = new JSONObject();

		if (n == 0) {
			jsonObj.put("result", "0");
		} else {
			jsonObj.put("result", "1");
		}

		return jsonObj.toString();
	}

	
	@ResponseBody
	@PostMapping("/personnel/workmodi_insert.gw")
	public String personal_workmodi_insert(HttpServletRequest request, HttpServletResponse response, String datepi,
			String empidList, String empnameList, String reason , String empidListh, String empnameListh,
			String empidListRef, String empnameListRef, String deleteidval, String addtypeval,
			String addhourval, String addminval, String idval, String editvalhourval, String editvalminval) {
 

		System.out.println("dlis datepi: "+datepi);
		System.out.println("dlis : "+empidList);
		System.out.println("dlis : "+empnameList);
		
		System.out.println("dlis : "+reason);
		System.out.println("dlis : "+empidListh);
		System.out.println("dlis : "+empnameListh);
		System.out.println("dlis : "+empidListRef);
		System.out.println("dlis : "+empnameListRef);
		//System.out.println("dlis : "+empnameListh);
		//System.out.println("dlis : "+empnameList);
		
		System.out.println("dlis deleteidval: "+deleteidval);
		System.out.println("dlis addtypeval: "+addtypeval);
		System.out.println("dlis addhourval: "+addhourval);
		System.out.println("dlis addminval: "+addminval);
		System.out.println("dlis idval: "+idval);
		System.out.println("dlis editvalhourval: "+editvalhourval);
		System.out.println("dlis String editvalminval: "+editvalminval);
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");

		String empid = String.valueOf(loginUser.getEmpId()); // 로그인한 사원 아이디


		int mowork_approval_insert = service.mowork_approval_insert(empid);
		
		//////////////////////////////////근무체크 수정 insert
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("datepi", datepi);
		paraMap.put("reason", reason);
		//paraMap.put("vtype", vtype);

		//int va_dayoff_insert = service.va_dayoff_insert(paraMap);
		// 삭제
		if(deleteidval != "") {
			//System.out.println("ddds");
			String[] deleteidvals = deleteidval.split(",");
			//String[] empnameLists = empnameList.split(",");

			for (int i = 0; i < deleteidvals.length; i++) {

				
				
				if (!deleteidvals[i].equals("")) {
					 
					System.out.println("del: "+deleteidvals[i]);
					Map<String, String> paraMaps = new HashMap<>();
					paraMaps.put("deleteid", deleteidvals[i]);
					//paraMaps.put("ptype", "4");
					//paraMaps.put("status", "1");
					//paraMaps.put("seq", Integer.toString(sts));
					int n = service.work_modify_del_insert(paraMaps);
					//sts++;
				}

			}
		}
		//추가
		if(addhourval != "") {
			//System.out.println("ddds");
			String[] addhourvals = addhourval.split(",");
			String[] addminvals = addminval.split(",");
			String[] addtypevals = addtypeval.split(",");
			//String[] empnameLists = empnameList.split(",");

			for (int i = 0; i < addhourvals.length; i++) {

				
				
				if (!addhourvals[i].equals("")) {
					 
					String time= datepi+" "+addhourvals[i]+":"+addminvals[i];
					
					//System.out.println("time : "+time);
					////
					String typemod="";
					switch (addtypevals[i]) {

					case "업무":
						typemod = "1";
						break;
					case "외출":
						typemod = "2";
						break;
					case "회의":
						typemod = "3";
						break;
					case "외근":
						typemod = "4";
						break;
					case "퇴근":
						typemod = "5";
						break;
					case "출근":
						typemod = "6";
						break;

					default:
						break;
					}
					//System.out.println("type: "+typemod);
				 
					Map<String, String> paraMaps = new HashMap<>();
					//paraMaps.put("historyid", addhourvals[i]);
					paraMaps.put("time", time);
					paraMaps.put("typemod", typemod);
					//paraMaps.put("status", "1");
					//paraMaps.put("seq", Integer.toString(sts));
					int n = service.work_modify_add_insert(paraMaps);
					//sts++;
				}

			}
		}
		
		/////수정
		
		if(idval != null) {
			//System.out.println("null");
			String[] idvals = idval.split(",");
			String[] editvalhourvals = editvalhourval.split(",");
			String[] editvalminvals = editvalminval.split(",");
			//String[] empnameLists = empnameList.split(",");

			for (int i = 0; i < idvals.length; i++) {

				if (!idvals[i].equals("")) {
					 
					String time= datepi+" "+editvalhourvals[i]+":"+editvalminvals[i];
					 
					Map<String, String> paraMaps = new HashMap<>();
					paraMaps.put("editid", idvals[i]);
					paraMaps.put("time", time);
					//paraMaps.put("ptype", "4");
					//paraMaps.put("status", "1");
					//paraMaps.put("seq", Integer.toString(sts));
					int n = service.work_modify_edit_insert(paraMaps);
					//sts++;
				}
				 

			}
		}
				


		////////////////////////////////////////////
		int sts = 1; // 기안 처리 순서

		// 신청 신청자는 상태 2로
		String[] empidLisths = empidListh.split(",");
		String[] empnameLisths = empnameListh.split(",");

		for (int i = 0; i < empidLisths.length; i++) {

		 

			if (i == 0) { // 신청한 사람일경우
				 
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidLisths[i]);
				paraMaps.put("ptype", "2");
				paraMaps.put("status", "2");
				paraMaps.put("seq", Integer.toString(sts));
				int n = service.procedure_insert(paraMaps);
				sts++;
			} else {
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidLisths[i]);
				paraMaps.put("ptype", "2");
				paraMaps.put("status", "1");
				paraMaps.put("seq", Integer.toString(sts));
				int n = service.procedure_insert(paraMaps);
				sts++;
			}

		}

		// 처리
		String[] empidLists = empidList.split(",");
		String[] empnameLists = empnameList.split(",");

		for (int i = 0; i < empidLists.length; i++) {

			if (!empidLists[i].equals("")) {
				 
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidLists[i]);
				paraMaps.put("ptype", "4");
				paraMaps.put("status", "1");
				paraMaps.put("seq", Integer.toString(sts));
				int n = service.procedure_insert(paraMaps);
				sts++;
			}

		}

		// 참조 는 확인으로
		String[] empidListRefs = empidListRef.split(",");
		String[] empnameListRefs = empnameListRef.split(",");

		int n = 0;
		for (int i = 0; i < empidListRefs.length; i++) {

			if (!empidListRefs[i].equals("")) {
				 
				Map<String, String> paraMaps = new HashMap<>();
				paraMaps.put("empid", empidListRefs[i]);
				paraMaps.put("ptype", "5");
				paraMaps.put("status", "5");
				paraMaps.put("seq", Integer.toString(sts));
				n = service.procedure_insert(paraMaps);
				sts++;
			}

		}

	 
		JSONObject jsonObj = new JSONObject();

		if (n == 0) {
			jsonObj.put("result", "0");
		} else {
			jsonObj.put("result", "1");
		}

		return jsonObj.toString();
	}
	/**
	 *  
	 * 
	 * @Method Name  : personnel_search_name 
	 * @작성일   : 2023. 12. 31 
	 * @작성자   : db228  @변경이력  : 
	 * @Method 설명 : 
	 * @param request
	 * @param response
	 * @param empName @return 
	 */
	@ResponseBody
	@PostMapping("/personnel/search_name.gw")
	public String personnel_search_name(HttpServletRequest request, HttpServletResponse response, String empName) {

		List<EmployeeVO> empList = service.personnel_search_name(empName);

		JSONArray jsonArr = new JSONArray();

		for (EmployeeVO evo : empList) {

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("empId", evo.getEmpId());
			jsonObj.put("empName", evo.getEmpName());
			jsonObj.put("teamName", evo.getTeamName());

			jsonArr.put(jsonObj);
		}

		return jsonArr.toString();

	}

	/** 
	* @Method Name  : personnel_selct_empid 
	* @작성일   : 2024. 1. 7 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @param empid
	* @return 
	*/
	@ResponseBody
	@PostMapping("/personnel/selct_empid.gw")
	public String personnel_selct_empid(HttpServletRequest request, HttpServletResponse response, String empid) {

		String empname = service.personnel_selct_empid(empid);

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("empname", empname);

		return jsonObj.toString();

	}

}
