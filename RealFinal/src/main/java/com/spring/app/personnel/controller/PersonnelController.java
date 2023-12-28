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
* @FileName  : PersonnelController.java 
* @Project   : TempFinal 
* @Date      : 2023. 12. 10 
* @작성자      : db228 
* @변경이력    : 
* @프로그램설명    : 
*/
@Controller
public class PersonnelController {

	
	@Autowired  
	private PersonnelService service;
	
	 
	//private FileManager fileManager;
	@GetMapping("/index.gw")
	public String index(HttpServletRequest request,HttpServletResponse response) {

		
		

		 //테스트 코드 시작
		EmployeeVO loginUser = new EmployeeVO();
		loginUser.setEmpId((long) 200);		 
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		
		long empid= loginUser.getEmpId();
		request.setAttribute("empid", empid);
		 //테스트 코드 끝
		
		
		return "index.index";
		
		
	}
	
	/** 
	* @Method Name  : personal_index 
	* @작성일   : 2023. 12. 10 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @return 
	*/
	@GetMapping("/personal_index.gw")
	public String personal_index(HttpServletRequest request,HttpServletResponse response) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		String sysdate=service.sysdate_get(); //현재날짜 가져오기
		request.setAttribute("sysdate", sysdate);
		
		
		
		String empid=  String.valueOf(  loginUser.getEmpId()  ); //로그인한 사원 아이디
		
		Map<String, String> paraMap= new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("sysdate", sysdate);
		 
		
		
		String day_hour= service.day_hour(paraMap); //테스트 하루 근무시간		
		request.setAttribute("empid", empid);
		
		 
		
		String year=sysdate.substring(0,4); //현재 연도
		 
		
		Map<String, String> paraMapYear= new HashMap<>();
		paraMapYear.put("empid", empid);
		paraMapYear.put("year", year);
		
		String year_hour=service.year_hour(paraMapYear);
		
		 
		request.setAttribute("year_hour", year_hour);
		
		return "personal_index.personnel";
		
		//
		
		 
 
		
	}
	
	
	/** 
	* @Method Name  : workstatus 
	* @작성일   : 2023. 12. 27 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @param a
	* @return 
	*/
	@ResponseBody
	@PostMapping("/workstatus_insert.gw")
	public String workstatus(HttpServletRequest request,HttpServletResponse response, String a) {
	
		 //System.out.println("a: "+request.getParameter("worktype") );
		 
		 
		
		JSONObject jsonObj = new JSONObject();
		
		 
			
			try {
				jsonObj.put("result", 1);
				 
				

			} catch(Exception e) {
				e.printStackTrace();
				jsonObj.put("result", 0);
			} 
		 
		
		return jsonObj.toString();
	}
	
	
	
	
	/** 
	* @Method Name  : workstatus_print 
	* @작성일   : 2023. 12. 27 
	* @작성자   : db228 
	* @변경이력  : 
	* @Method 설명 : 
	* @param request
	* @param response
	* @param worktype
	* @return 
	*/
	@ResponseBody
	@PostMapping("/workstatus_print.gw")
	public String workstatus_print(HttpServletRequest request,HttpServletResponse response, String worktype) {
	
		 //System.out.println("as: "+ worktype);
		 //request.getParameter("worktype")
		 
		
		//JSONObject jsonObj = new JSONObject();
		
		
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");	
		
		String empid=  String.valueOf(  loginUser.getEmpId()  ); //로그인한 사원 아이디
		
		Map<String, String> paraMap= new HashMap<>();
		paraMap.put("empid", empid);
		paraMap.put("worktype", worktype);
		 
		
		List<WorkhistoryVO> workhistoryList=service.workhistory_print(paraMap); //현재 근무현황 출력
		
		
		for( WorkhistoryVO vo : workhistoryList) {
			
			System.out.println(" vo id : "+ vo.getWorkhistoryid());
			System.out.println(" vo empid: "+ vo.getFk_empid());
			System.out.println(" vo type : "+ vo.getWorktype() );
			System.out.println(" vo time: "+ vo.getResisterdaytime());
			
		}
		
		//System.out.println("wl : "+ workhistoryList.get(0).getResisterdaytime());
		//workhistoryList.get(0).getResisterdaytime();
		

		JSONArray jsonArr = new JSONArray(); // []
		
		if(workhistoryList != null) {
			
			for(WorkhistoryVO vo : workhistoryList) {
				
				JSONObject jsonObj = new JSONObject(); // {}
				jsonObj.put("workhistoryid", vo.getWorkhistoryid() );  
				jsonObj.put("fk_empid", vo.getFk_empid());
				
				String type=vo.getWorktype();
				 
				
				switch (type) {
				
					case "1":
						type="업무";
						break;
					case "2":
						type="외출";
						break;
					case "3":
						type="회의";
						break;
					case "4":
						type="외근";
						break;
					case "5":
						type="퇴근";
						break;
					case "6":
						type="출근";
						break;
	
					default:
						break;
				}
				/*
				 * if( "6".equals(type) ) {
				 * 
				 * type="출근";
				 * 
				 * } else if( "5".equals(type) ) { type="퇴근"; }
				 * 
				 */
				jsonObj.put("worktype", type);
			
				
				String time=vo.getResisterdaytime().substring(11,16);
				//System.out.println("tiem; "+time);
				//댓글읽어오기에 있어서 첨부파일 기능을 넣는 경우 시작'
				jsonObj.put("resisterdaytime", time );  
				 
				//댓글읽어오기에 있어서 첨부파일 기능을 넣는 경우 끝
				
				//
				jsonArr.put(jsonObj);
			}// end of for-----------------------------------
		}
		
		return jsonArr.toString();
		 
			/*
			try {
				jsonObj.put("workhistoryList", workhistoryList);
				 
				 
				  

			} catch(Exception e) {
				e.printStackTrace();
				jsonObj.put("result", 0);
			} 
		 
			System.out.println("to: "+jsonObj.toString());
		 
		return jsonObj.toString();
		
		*/
	}
	
	
	
	
	 
}
