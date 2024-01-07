package com.spring.app.mail.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
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

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.app.common.FileManager;
import com.spring.app.common.MyUtil;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.mail.domain.MailVO;
import com.spring.app.mail.service.MailService;

/**
 *   @FileName  : MailController.java 
 * 
 * @Project   : TempFinal 
 * @Date      : Dec 6, 2023 
 * @작성자      : 김민경
 * @변경이력 :  
 * @프로그램설명 : 메일 컨트롤러입니다.
 */
@Controller
@RequestMapping(value = "/mail/*")
public class MailController {

	@Autowired
	private MailService service;
	
//	@Autowired  // Type에 따라 알아서 Bean 을 주입해준다.
//	private FileManager fileManager;

	
	
	/**
	 *  
	 * 
	 * @Method Name  : mailWrite 
	 * @작성일   : Dec 6, 2023 
	 * @작성자   : 김민경 @변경이력  : 
	 * @Method 설명 : 메일쓰기 폼페이지 요청
	 * @param request
	 * @param response
	 * @param mav      
	 * @return 
	 */
	@GetMapping("mailWrite.gw")
	public ModelAndView mailWrite(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
		HttpSession session = request.getSession();
		EmployeeVO loginUser = new EmployeeVO();
		loginUser.setEmpId((long) 9999); 
		session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */

		long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType"); 
		String mailId = request.getParameter("mailId"); 
		mav.addObject("mailId", mailId);
		String orgMailId = request.getParameter("orgMailId");
	
		
				
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailType",  mailType);
	//	paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		paraMap.put("mailId", mailId);
		
		
		mav.addObject("mailType", mailType);
//		수정필) 이거 임시보관함 제목눌렸을 떄 바로 들어가는 거 해야함 ...		
//		if("4".equals(mailType)) {
//			// 받는 사람, 참조, 숨은 참조, 제목, 파일첨부, 메일내용
//			// service
//		}
		
		mav.addObject("orgMailId", mailId);
		
		
		// ----- 개인편지함 가져오기 시작 ----- //
		List<Map<String, String>> personalMailboxList = null;
		personalMailboxList = service.getPersonalMailbox(paraMap);
		mav.addObject("personalMailboxList", personalMailboxList);
		// ----- 개인편지함 가져오기 끝 ----- //		
		
		
		Map<String, String> orgMailInfo_map = new HashMap<>(); // 원메일id, 발신자, 제목, 내용 
		if(mailId == null) { // 원메일 쓰기인 경우
			orgMailInfo_map.put("mailId", "0");
			
		}
		else if(mailId != null) { // 답장메일 쓰기인 경우 (답장/전체답장/전달)
			if("4".equals(mailType)) {
				orgMailInfo_map = service.getTempMailInfo(paraMap); // 임시저장 메일 가져오기
			}
			else {
				orgMailInfo_map = service.getOrgMailInfo(paraMap); // 답장메일을 쓰기 위해 필요한 원메일 정보 가져오기 
			}
		}
		mav.addObject("orgMailInfo_map", orgMailInfo_map);

		
		
		mav.setViewName("mailWrite.mail");

		return mav;
	}
	
	
	/** 
	* @Method Name  : isExistMail 
	* @작성일   : Dec 7, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : employee 중 해당 이메일이 존재하는지 확인
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("isExistMail.gw")
	public String isExistMail(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		String str_email = request.getParameter("email");
		
		Map<String, String> paraMap = new HashMap<>();
  		paraMap.put("email", str_email);
  		
  		EmployeeVO employee = service.isExistMail(paraMap); // employee 중 해당 이메일이 존재하는지 확인한다. 
  		
		JSONObject jsonObj = new JSONObject(); // {}
		int n = 0;
		if (employee == null) {
			n = 0;
			jsonObj.put("n", n);
		} else if (employee != null && employee.getEmail().equals(str_email)) {
			n = 1;
			jsonObj.put("empMail", employee.getEmail());   
			jsonObj.put("empId", employee.getEmpId());
			jsonObj.put("n", n);
		}
		
		return jsonObj.toString();
/*		
		JSONArray jsonArr = new JSONArray(); // []
		
		
		if(str_email.contains(";") && str_email.length() > 1) { // ;으로 여러개의 이메일을 입력했을 경우. 	[참고] email.length() > 1 은 ;만 작성했을 경우를 방지하기 위함
			
			String[] arr_email = str_email.split("\\;");
			
			for(String email : arr_email) {
				
				email = email.trim();
				
				if (!email.contains("@")) { // 이메일 도메인 주소 모두 입력하지 않고, @ 앞까지만 입력했을 때
					email = email + "@project.com";
				}
				
				Map<String, String> paraMap = new HashMap<>();
	      		paraMap.put("email", email);
	      		
	      		EmployeeVO employee = service.isExistMail(paraMap); // employee 중 해당 이메일이 존재하는지 확인한다. 
	      		
	    		JSONObject jsonObj = new JSONObject(); // {}
	    		int n = 0;
	    		if (employee == null) {
	    			n = 0;
	    			jsonObj.put("n", n);
	    		} 
	    		else if (employee != null && employee.getEmail().equals(email)) {
	    			n = 1;
	    			jsonObj.put("empMail", employee.getEmail());   
	    			jsonObj.put("empId", employee.getEmpId());
	    			jsonObj.put("n", n);
	    		}
	    		jsonArr.put(jsonObj);
	    		
			} // end of for ------------------------------
			
		}
		else { // 하나의 이메일을 입력했을 경우.
			
			if (!str_email.contains("@")) { // 이메일 도메인 주소 모두 입력하지 않고, @ 앞까지만 입력했을 때
				str_email = str_email + "@project.com";
			}
			
			Map<String, String> paraMap = new HashMap<>();
      		paraMap.put("email", str_email);
      		
      		EmployeeVO employee = service.isExistMail(paraMap); // employee 중 해당 이메일이 존재하는지 확인한다. 
      		
    		JSONObject jsonObj = new JSONObject(); // {}
    		int n = 0;
    		if (employee == null) {
    			n = 0;
    			jsonObj.put("n", n);
    		} else if (employee != null && employee.getEmail().equals(str_email)) {
    			n = 1;
    			jsonObj.put("empMail", employee.getEmail());   
    			jsonObj.put("empId", employee.getEmpId());
    			jsonObj.put("n", n);
    		}
    		jsonArr.put(jsonObj);
    		
		}
		
		return jsonArr.toString();
*/		
		
	}
	
	
	/** 
	* @Method Name  : mailWriteEnd 
	* @작성일   : Dec 9, 2023 
	* @작성자   : 김민경
	* @변경이력  : 
	* @Method 설명 : 메일쓰기 완료 요청 
	* @param mrequest
	* @param response
	* @param mav
	* @param paraMap
	* @param mailvo
	* @return 
	*/
	@ResponseBody
	@PostMapping("mailWriteEnd.gw")
//	public ModelAndView mailWriteEnd(Map<String, String> paraMap, ModelAndView mav, MailVO mailvo, MultipartHttpServletRequest mrequest) {
	public String mailWriteEnd(MultipartHttpServletRequest mrequest, HttpServletResponse response, ModelAndView mav, Map<String, String> paraMap, MailVO mailvo) {

		/*
		 * form 태그의 name 명과 MailVO 의 필드명이 같다라면 request.getParameter("form 태그의 name명"); 을
		 * 사용하지 않더라도 자동적으로 MailVO mailvo 에 set 되어진다.
		 */
		
		
/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = mrequest.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */
		
		
		Long loginEmpId = loginUser.getEmpId();
		mrequest.setAttribute("loginEmpId", loginEmpId);
		
		String isTemporary = mrequest.getParameter("isTemporary");
		mrequest.setAttribute("isTemporary", isTemporary);

		String orgMailId = mrequest.getParameter("orgMailId"); 
		if(orgMailId.equals("")) { // 답장메일이 아닌, 원메일일 경우
			orgMailId = "0";
		}
		
String mailId = mrequest.getParameter("mailId");		
System.out.println(mailId+"33#");	

		int n = 0;
		try {
			n = service.mailWrite(mailvo, mrequest); // 메일쓰기
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		
		JSONObject jsonObj = new JSONObject(); // {}
//		if(n==1) {
			jsonObj.put("result", n);
			
			jsonObj.put("isTemporary", isTemporary);
/*
			String incomeMail = mrequest.getParameter("incomeMail"); 
			String reference = mrequest.getParameter("reference"); 
			String hiddenReference = mrequest.getParameter("hiddenReference"); 
			String isTemporary = mrequest.getParameter("isTemporary"); 
			
			
			jsonObj.put("incomeMail ", incomeMail );
			jsonObj.put("reference", reference);
			jsonObj.put("hiddenReference", hiddenReference);
			jsonObj.put("isTemporary", isTemporary);
			
			
			mrequest.setAttribute("incomeMail ", incomeMail );
			mrequest.setAttribute("reference", reference);
			mrequest.setAttribute("hiddenReference", hiddenReference);
			mrequest.setAttribute("isTemporary", isTemporary);
			
			
			mav.addObject("incomeMail", incomeMail);
			mav.addObject("reference", reference);
			mav.addObject("hiddenReference", hiddenReference);
			mav.addObject("isTemporary", isTemporary);
*/	
			
		
			
		//	mav.setViewName("mailWriteResult.mail");
			//  /list.action 페이지로 redirect(페이지이동)해라는 말이다.
//		}
//		else {
//			
//			mav.setViewName("add_error.mail");
//			//  /WEB-INF/views/tiles1/board/error/add_error.jsp 파일을 생성한다.
//		}
		
//		
//		return mav;
//	}
//		JSONObject jsonObj = new JSONObject(); // {}
		return jsonObj.toString();
	
	}
	
	
	/** 
	* @Method Name  : mailWriteResult 
	* @작성일   : Dec 9, 2023 
	* @작성자   : 김민경
	* @변경이력  : 
	* @Method 설명 : 메일쓰기 결과페이지를 보여준다.
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@PostMapping(value="mailWriteResult.gw")
	public ModelAndView mailWriteResult(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, MailVO mailvo) {
		
		
		String isTemporary = request.getParameter("isTemporary");
		mav.addObject("isTemporary", isTemporary);
		
		String referenceMail = request.getParameter("referenceMail");
		mav.addObject("referenceMail", referenceMail);
System.out.println("-s-"+referenceMail);	

		String hiddenReferenceMail = request.getParameter("hiddenReferenceMail");
		mav.addObject("hiddenReferenceMail", hiddenReferenceMail);
System.out.println("d--"+hiddenReferenceMail);		
		
		String incomeMail = request.getParameter("incomeMail"); //
System.out.println("--"+incomeMail);
	//	request.setAttribute("incomeMail ", incomeMail);
		mav.addObject("incomeMail", incomeMail);
		
		
		
		String incomeEmp_str = request.getParameter("incomeEmp_str"); 
		mav.addObject("incomeEmp_str", incomeEmp_str);
		request.setAttribute("incomeEmp_str", incomeEmp_str);
System.out.println("3"+incomeEmp_str);	
		
		mav.setViewName("mailWriteResult.mail");
		
		
		return mav;
		//  /WEB-INF/views/tiles1/email/emailWrite_done.jsp 페이지를 만들어야 한다.
	}
	
	
	
	
	
	
	
	/** 
	* @Method Name  : mailList 
	* @작성일   : Dec 9, 2023 
	* @작성자   : 김민경  
	* @변경이력  : 
	* @Method 설명 : 메일목록 보기 페이지 요청
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("mailList.gw")
	public ModelAndView mailList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		
/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */
		
		
		List<MailVO> mailList = null;
		
		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType"); 
		if(mailType == null) { // 기본적으로 받은메일함으로 들어올 수 있게 한다.
			mailType = "1";
		}
		String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailType",  mailType);
		paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		
		
		
		// ----- 개인편지함 가져오기 시작 ----- //
		List<Map<String, String>> personalMailboxList = null;
		personalMailboxList = service.getPersonalMailbox(paraMap);
		mav.addObject("personalMailboxList", personalMailboxList);
		// ----- 개인편지함 가져오기 끝 ----- //
		
		
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		// 먼저, 총 게시물 건수(totalCount)를 구해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을 때와 없을때로 나뉘어진다. 
		int totalCount = 0;    // 총 게시물 건수 
		int sizePerPage = 10;  // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함. 
		int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		 
		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCount(paraMap);
		mav.addObject("totalCount", totalCount);
	// 	System.out.println("~~~~ 확인용 totalCount : " + totalCount); 
		
	 	// 만약에 총 게시물 건수(totalCount)가 124 개 이라면 총 페이지수(totalPage)는 13 페이지가 되어야 한다.
		// 만약에 총 게시물 건수(totalCount)가 120 개 이라면 총 페이지수(totalPage)는 12 페이지가 되어야 한다.
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage); 
		// (double)124/10 ==> 12.4 ==> Math.ceil(12.4) ==> 13.0 ==> 13
		// (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> 12.0 ==> 12
	 	
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면
			 
			currentShowPageNo = 1;
		}
	 	
		else {
			  
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo); 
				 
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					// get 방식이므로 사용자가 str_currentShowPageNo 에 입력한 값이 0 또는 음수를 입력하여 장난친 경우 
					// get 방식이므로 사용자가 str_currentShowPageNo 에 입력한 값이 실제 데이터베이스에 존재하는 페이지수 보다 더 큰값을 입력하여 장난친 경우   
					currentShowPageNo = 1;
				}
				 
			} catch(NumberFormatException e) {
				// get 방식이므로 사용자가 str_currentShowPageNo 에 입력한 값이 숫자가 아닌 문자를 입력하여 장난친 경우
				currentShowPageNo = 1;
			}
		}
	 	
	 	
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) **** 
		/*
		     currentShowPageNo      startRno     endRno
		    --------------------------------------------
		         1 page        ===>    1           10
		         2 page        ===>    11          20
		         3 page        ===>    21          30
		         4 page        ===>    31          40
		         ......                ...         ...
		 */
		 int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 
		 int endRno = startRno + sizePerPage - 1; // 끝 행번호 
			
		 paraMap.put("startRno", String.valueOf(startRno));
		 paraMap.put("endRno", String.valueOf(endRno));
		 
		 mailList = service.mailList_withPaging(paraMap); // 페이징 처리한 메일목록 가져오기
	 
		 mav.addObject("mailList", mailList);
		 mav.addObject("paraMap", paraMap);
		 
		 
		 
		// === #121. 페이지바 만들기 === //
		int blockSize = 5;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수이다.
		/*
			              1  2  3  4  5  [다음][마지막]  -- 1개블럭
			[맨처음][이전]   6  7  8  9  10 [다음][마지막]  -- 1개블럭
			[맨처음][이전]  11 12 13 
		*/
				
		int loop = 1;
		/*
	    	loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 5개(== blockSize) ] 까지만 증가하는 용도이다.
	    */
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		// *** !! 공식이다. !! *** //
		
	/*
	    1  2  3  4  5  		-- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1 이다.
	    6  7  8  9  10 		-- 두번째 블럭의 페이지번호 시작값(pageNo)은 6 이다.
	    11 12 13 14 15 16  	-- 세번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.
	    
	    currentShowPageNo         pageNo
	   ----------------------------------
	         1                      1 = ((1 - 1)/5) * 5 + 1
	         2                      1 = ((2 - 1)/5) * 5 + 1
	         3                      1 = ((3 - 1)/5) * 5 + 1
	         4                      1
	         5                      1
	         
	         6                      6 = ((6 - 1)/5) * 5 + 1
	         7                      6 = ((7 - 1)/5) * 5 + 1
	         8                      6
	         9                      6
	         10                     6 
	        
	         11                    11 = ((11 - 1)/5) * 5 + 1
	         12                    11 = ((12 - 1)/5) * 5 + 1
	         13                    11 
	         14                    11
	         15                    11
	*/
		
//		String pageBar = "<ul style='list-style:none;'>";
//		String url = "mailList.gw";
//		
//		// === [맨처음][이전] 만들기 === // 
//		if(pageNo != 1) {
//			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo=1'>[맨처음]</a></li>";
//			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
//		}
//		
//		while( !(loop > blockSize || pageNo > totalPage) ) {
//			
//			if(pageNo == currentShowPageNo) {
//				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";
//			}
//			else {
//				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>"; 
//			}
//			
//			loop++;
//			pageNo++;
//		}// end of while-------------------------
//		
//		// === [다음][마지막] 만들기 === //
//		if(pageNo <= totalPage) {
//			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+pageNo+"'>[다음]</a></li>";
//			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
//		}
//		
//		pageBar += "</ul>";
//		
		
		
		

		String pageBar = "";
		String url = "mailList.gw";
		
		// === [맨처음] 만들기 === // 
		if(currentShowPageNo != 1) {
			pageBar += "<a href='"+url+"?mailType="+mailType+"&currentShowPageNo=1' title='처음' style='cursor: pointer;'><span class='icon pagenav1'></span></a>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<span class='paging_numbers'><strong>"+pageNo+"</strong></span>";
			}
			else {
				pageBar += "<a href='"+url+"?mailType="+mailType+"&currentShowPageNo="+pageNo+"' style='cursor: pointer;'><span>"+pageNo+"</span></a>";
			}
			
			loop++;
			pageNo++;
		}// end of while-------------------------
		
		// === [마지막] 만들기 === //
		if(currentShowPageNo < totalPage) {
			pageBar += "<a href='"+url+"?mailType="+mailType+"&currentShowPageNo="+totalPage+"' title='끝' style='cursor: pointer;'><span class='icon pagenav4'></span></a>";
		}

		
		mav.addObject("pageBar", pageBar);
		
		
		// === #123. 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후
		//           사용자가 "검색된결과목록보기" 버튼을 클릭했을때 돌아갈 페이지를 알려주기 위해
		//           현재 페이지 주소를 뷰단으로 넘겨준다.
		String goBackURL = MyUtil.getCurrentURL(request);
	 //	System.out.println("~~~ 확인용(list.action) goBackURL : " + goBackURL);
		/*
		    ~~~ 확인용 goBackURL : /list.action
		    ~~~ 확인용 goBackURL : /list.action?searchType=&searchWord=&currentShowPageNo=5
		    ~~~ 확인용 goBackURL : /list.action?searchType=subject&searchWord=java
		    ~~~ 확인용 goBackURL : /list.action?searchType=name&searchWord=서영학 
		    ~~~ 확인용 goBackURL : /list.action?searchType=name&searchWord=서영학&currentShowPageNo=9
		*/
		
		mav.addObject("goBackURL", goBackURL);
		
		mav.setViewName("mailList.mail");
	    //  /WEB-INF/views/tiles1/board/list.jsp 파일을 생성한다.
		
		return mav;
	}
	
	
	/** 
	* @Method Name  : updateImportant 
	* @작성일   : Dec 11, 2023 
	* @작성자   : 김민경  
	* @변경이력  : 
	* @Method 설명 : 중요메일 여부 업데이트
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("updateImportant.gw")
	public String updateImportant(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		String mailType = request.getParameter("mailType"); 
		String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
		String mailId = request.getParameter("mailId");
		String isImportant = request.getParameter("isImportant");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("mailType", mailType);
		paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		paraMap.put("mailId", mailId);
		paraMap.put("isImportant", isImportant);
		
		
		int n = service.updateImportant(paraMap); // 중요메일 여부 업데이트

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}	
	
	
	/** 
	* @Method Name  : moveToTrashbox 
	* @작성일   : Dec 19, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 메일을 휴지통으로 이동하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("moveToTrashbox.gw")
	public String moveToTrashbox(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String mailType = request.getParameter("mailType"); 
		String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
		String mailId = request.getParameter("mailId");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("mailType", mailType);
		paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		paraMap.put("mailId", mailId);
		//paraMap.put("fromOrgMailbox", mailType); // 어떤 메일함에서 휴지통으로 이동했는지 남기기
		
		int n = service.moveToTrashbox(paraMap); // 메일을 휴지통으로 이동하기

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);
		jsonObj.put("fromOrgMailbox", mailType);
		
		return jsonObj.toString();
	}

	
	/** 
	* @Method Name  : delPermanently 
	* @작성일   : Dec 20, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 메일 영구삭제하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("delPermanently.gw")
	public String delPermanently(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String mailType = request.getParameter("mailType"); 
		String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
		String mailId = request.getParameter("mailId");
		String fromOrgMailbox = request.getParameter("fromOrgMailbox");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("mailType", mailType);
		paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		paraMap.put("mailId", mailId);
		paraMap.put("fromOrgMailbox", fromOrgMailbox);
		
		
		int n = service.delPermanently(paraMap); // 메일 영구삭제하기

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : moveToPersonalMailbox 
	* @작성일   : Dec 20, 2023 
	* @작성자   : 김민경  
	* @변경이력  : 
	* @Method 설명 : 메일을 개인편지함으로 이동
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("moveToPersonalMailbox.gw")
	public String moveToPersonalMailbox(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */
		

		
		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType"); 
		String fromPersonalMailboxTypeId = request.getParameter("fromPersonalMailboxTypeId"); 
		String toPersonalMailboxTypeId = request.getParameter("toPersonalMailboxTypeId"); 
		String mailId = request.getParameter("mailId");
		String isImportant = request.getParameter("isImportant");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailType", mailType);
		paraMap.put("fromPersonalMailboxTypeId", fromPersonalMailboxTypeId);
		paraMap.put("toPersonalMailboxTypeId", toPersonalMailboxTypeId);
		paraMap.put("mailId", mailId);
		paraMap.put("isImportant", isImportant);
		
		
		int n = service.moveToPersonalMailbox(paraMap); // 메일을 개인편지함으로 이동

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : mailView 
	* @작성일   : Dec 21, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 하나의 메일 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("mailView.gw")
	public ModelAndView mailView(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */
		

		Map<String, Object> paraMap = new HashMap<>();
		
		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType"); 
		String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
		String mailId = request.getParameter("mailId");
		String fromMailbox = request.getParameter("fromMailbox");
		
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailType", mailType);
		paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		paraMap.put("mailId", mailId);
		paraMap.put("fromMailbox", fromMailbox);
		
		// ----- 개인편지함 가져오기 시작 ----- //
		List<Map<String, String>> personalMailboxList = null;
		personalMailboxList = service.getPersonalMailbox(paraMap);
		mav.addObject("personalMailboxList", personalMailboxList);
		// ----- 개인편지함 가져오기 끝 ----- //
		
		
	
		MailVO mailInfo = service.getOneMail(paraMap); // 메일 정보 가져오기 : mailId, subject, mailContent, sendDay, orgmailId, memoContent

		if(mailType.equals("6")) {
			String orgMailType = service.getOrgMailTypeOfPersonalMailbox(paraMap); // 개인메일함에 있는 메일의 기존메일함 타입 가져오기 
			paraMap.put("orgMailType", orgMailType);
		}

		if(!mailType.equals("5")) {
			String isImportant = service.getIsImportant(paraMap); // 중요메일 여부 가져오기
			mav.addObject("isImportant", isImportant); 
		}
		
		List<Map<String, String>> mailFileList = null;
		mailFileList = service.getMailFileList(paraMap); // 첨부파일 관련 정보(첨부파일제목, 첨부파일크기) 가져오기

		String sendEmp_str = service.getSendEmp(paraMap); // 보낸사원_str(이름, 이메일) 가져오기 
		String incomeEmp_str = service.getIncomeEmp(paraMap); // 받은사원_str(이름, 이메일) 가져오기 
		String referenceEmp_str = service.getReferenceEmp(paraMap); // 참조사원_str(이름, 이메일) 가져오기 
	
		
		mav.addObject("paraMap", paraMap);
		
		mav.addObject("mailInfo", mailInfo); 
		
		mav.addObject("mailFileList", mailFileList);
		mav.addObject("sendEmp_str", sendEmp_str);
		mav.addObject("incomeEmp_str", incomeEmp_str);
		mav.addObject("referenceEmp_str", referenceEmp_str);
		
		
		mav.setViewName("mailView.mail");
		
		return mav;
	}	
	
	
	/** 
	* @Method Name  : saveMemo 
	* @작성일   : Dec 21, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 메일메모 추가하기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("saveMemo.gw")
	public String saveMemo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */

		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType"); 
	//	String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
		String mailId = request.getParameter("mailId");
		String memoContent = request.getParameter("memoContent");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailId", mailId);
		paraMap.put("mailType", mailType);
	//	paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
		paraMap.put("memoContent", memoContent);	
		
		int n = 0;
		// 해당메일의 로그인한 사원에게 메모가 있다면 update, 메모가 없다면 insert 해야함.
		String isMemo = service.selectMemo(paraMap); // 메일메모 조회하기
System.out.println("메모있음?"+isMemo);
		if(isMemo == null) {
			n = service.insertMemo(paraMap); // 메일메모 추가하기
		}
		else {
			n = service.updateMemo(paraMap); // 메일메모 수정하기
		}
		
		

		JSONObject jsonObj = new JSONObject(); // {}
//		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}	
	
	
	/** 
	* @Method Name  : selectMemo 
	* @작성일   : Dec 23, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 메일메모 조회하기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("selectMemo.gw")
	public String selectMemo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */

		Long loginEmpId = loginUser.getEmpId();
		String mailId = request.getParameter("mailId");
		String mailType = request.getParameter("mailType"); 
	//	String personalMailboxTypeId = request.getParameter("personalMailboxTypeId"); 
	//	String memoContent = request.getParameter("memoContent");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailId", mailId);
		paraMap.put("mailType", mailType);
	//	paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
	//	paraMap.put("memoContent", memoContent);	
		
		String memoContent = service.selectMemo(paraMap); // 메일메모 조회하기
		int n = 0;
		if(memoContent != null) { // 기존의 메일메모가 존재하는 경우
			n = 1;
		}
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("memoContent", memoContent);
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}
	
	
	
	@GetMapping("mailPreview.gw")
	public String mailPreview(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String incomeMail = request.getParameter("incomeMail");
		request.setAttribute("incomeMail", incomeMail);
System.out.println(incomeMail);		
		return "mail/mailPreview";
	}	
	
	
	
	/** 
	* @Method Name  : mailboxManage 
	* @작성일   : Dec 26, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 환경설정_편지함관리 뷰페이지로 이동
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("mailboxManage.gw")
	public ModelAndView mailboxManage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {


/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */
		
		Long loginEmpId = loginUser.getEmpId();
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);

		//----- 개인편지함 가져오기 시작 ----- //
		List<Map<String, String>> personalMailboxList = null;
		personalMailboxList = service.getPersonalMailbox(paraMap);
		mav.addObject("personalMailboxList", personalMailboxList);
		// ----- 개인편지함 가져오기 끝 ----- //
		

		mav.setViewName("mailboxManage.mail");
		
		return mav;
	}
		
	
	
	

	
	
	/** 
	* @Method Name  : makePersonalMailbox 
	* @작성일   : Dec 26, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 개인편지함 만들기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("makePersonalMailbox.gw")
	public String makePersonalMailbox(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */

		Long loginEmpId = loginUser.getEmpId();
		String personalMailboxTypeName = request.getParameter("personalMailboxTypeName");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("personalMailboxTypeName", personalMailboxTypeName);
	
		
		int n = 0;
		n = service.makePersonalMailbox(paraMap); // 개인편지함 만들기
		
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}
	
	
	/** 
	* @Method Name  : deletePersonalMailbox 
	* @작성일   : Dec 27, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 개인편지함 삭제하기 
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("deletePersonalMailbox.gw")
	public String deletePersonalMailbox(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */

		Long loginEmpId = loginUser.getEmpId();
		String personalMailboxTypeId = request.getParameter("personalMailboxTypeId");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("personalMailboxTypeId", personalMailboxTypeId);
	
		
		int n = 0;
		n = service.deletePersonalMailbox(paraMap); // 개인편지함 삭제하기 
		
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);	
		
		
		return jsonObj.toString();
	}
		
	
	/** 
	* @Method Name  : emptyMailbox 
	* @작성일   : Dec 27, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 편지함 비우기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@ResponseBody
	@PostMapping("emptyMailbox.gw")
	public String emptyMailbox(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

/* 로그인 확인을 위한 테스트코드 시작 */
HttpSession session = request.getSession();
EmployeeVO loginUser = new EmployeeVO();
loginUser.setEmpId((long) 9999); 
session.setAttribute("loginUser", loginUser);
/* 로그인 확인을 위한 테스트코드 끝 */

		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType");
		String personalMailboxId = request.getParameter("personalMailboxId");
System.out.println(personalMailboxId+mailType);	
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailType", mailType);
		paraMap.put("personalMailboxId", personalMailboxId);
	
		
		int n = 0;
		n = service.emptyMailbox(paraMap); // 편지함 비우기
		
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);	
		
		
		return jsonObj.toString();
	}
	
	
}
