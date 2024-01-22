package com.spring.app.mail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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

	
	/////////////////////////////////////////////////////////////
	
	
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		Long loginEmpId = loginUser.getEmpId();

		String mailType = request.getParameter("mailType"); 
		String mailId = request.getParameter("mailId"); 
		mav.addObject("mailId", mailId);
	
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailType",  mailType);
		paraMap.put("mailId", mailId);
		
		mav.addObject("mailType", mailType);
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
		else if(mailId != null) { // 답장메일 쓰기인 경우
			if("4".equals(mailType)) {
				orgMailInfo_map = service.getTempMailInfo(paraMap); // 임시저장 메일 가져오기
			}
			else {
				orgMailInfo_map = service.getOrgMailInfo(paraMap); // 답장메일 쓰기인 경우 : 필요한 원메일 정보 가져오기 
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
	public String mailWriteEnd(MultipartHttpServletRequest mrequest, HttpServletResponse response, ModelAndView mav, Map<String, String> paraMap, MailVO mailvo) {

		HttpSession session = mrequest.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		Long loginEmpId = loginUser.getEmpId();
		
		mrequest.setAttribute("loginEmpId", loginEmpId);
		
		String isTemporary = mrequest.getParameter("isTemporary");
		mrequest.setAttribute("isTemporary", isTemporary);

		String orgMailId = mrequest.getParameter("orgMailId"); 
		if(orgMailId.equals("")) { // 답장메일이 아닌, 원메일일 경우
			orgMailId = "0";
		}		

		int n = 0;
		try {
			n = service.mailWrite(mailvo, mrequest); // 메일쓰기
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", n);
		jsonObj.put("isTemporary", isTemporary);

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

		String hiddenReferenceMail = request.getParameter("hiddenReferenceMail");
		mav.addObject("hiddenReferenceMail", hiddenReferenceMail);
	
		String incomeMail = request.getParameter("incomeMail");
		mav.addObject("incomeMail", incomeMail);
		
		String incomeEmp_str = request.getParameter("incomeEmp_str"); 
		mav.addObject("incomeEmp_str", incomeEmp_str);
		request.setAttribute("incomeEmp_str", incomeEmp_str);
		
		
		mav.setViewName("mailWriteResult.mail");
		
		return mav;
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
	
		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		Long loginEmpId = loginUser.getEmpId();
		
		List<MailVO> mailList = null;
		
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
		
		
		int totalCount = 0;    // 총 게시물 건수 
		int sizePerPage = 10;  // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함. 
		int totalPage = 0;         // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)
		 
		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCount(paraMap);
		mav.addObject("totalCount", totalCount);
	
		
	 	totalPage = (int) Math.ceil((double)totalCount/sizePerPage); 
		
		if(str_currentShowPageNo == null) {
			currentShowPageNo = 1;
		}
	 	
		else {
			  
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo); 
				 
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				 
			} catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
	 	
		
		int startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; // 시작 행번호 
		int endRno = startRno + sizePerPage - 1; // 끝 행번호 
			
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		mailList = service.mailList_withPaging(paraMap); // 페이징 처리한 메일목록 가져오기
	 
		mav.addObject("mailList", mailList);
		mav.addObject("paraMap", paraMap);
		 
		 
		// === 페이지바 만들기 === //
		int blockSize = 5;
				
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
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
		
		String goBackURL = MyUtil.getCurrentURL(request);
		mav.addObject("goBackURL", goBackURL);
		
		mav.setViewName("mailList.mail");
	   
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
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
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 하나의 메일 보여주기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("mailView.gw")
	public ModelAndView mailView(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
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
	* @작성자   : 김민경 
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType"); 
		String mailId = request.getParameter("mailId");
		String memoContent = request.getParameter("memoContent");
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailId", mailId);
		paraMap.put("mailType", mailType);
		paraMap.put("memoContent", memoContent);	
		
		int n = 0;
		// 해당메일의 로그인한 사원에게 메모가 있다면 update, 메모가 없다면 insert 해야함.
		String isMemo = service.selectMemo(paraMap); // 메일메모 조회하기

		if(isMemo == null) {
			n = service.insertMemo(paraMap); // 메일메모 추가하기
		}
		else {
			n = service.updateMemo(paraMap); // 메일메모 수정하기
		}
		

		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("n", n);
		
		return jsonObj.toString();
	}	
	
	
	/** 
	* @Method Name  : selectMemo 
	* @작성일   : Dec 23, 2023 
	* @작성자   : 김민경 
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		Long loginEmpId = loginUser.getEmpId();
		String mailId = request.getParameter("mailId");
		String mailType = request.getParameter("mailType"); 
		
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("loginEmpId", loginEmpId);
		paraMap.put("mailId", mailId);
		paraMap.put("mailType", mailType);
		
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
	
	
	/** 
	* @Method Name  : mailPreview 
	* @작성일   : Jan 12, 2024 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 메일 미리보기
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("mailPreview.gw")
	public String mailPreview(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String incomeMail = request.getParameter("incomeMail");
		request.setAttribute("incomeMail", incomeMail);
	
		return "mail/mailPreview";
	}	
	
	
	/** 
	* @Method Name  : mailboxManage 
	* @작성일   : Dec 26, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 환경설정_편지함관리 뷰페이지로 이동
	* @param request
	* @param response
	* @param mav
	* @return 
	*/
	@GetMapping("mailboxManage.gw")
	public ModelAndView mailboxManage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		long loginEmpId = loginUser.getEmpId();
		
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
	* @작성자   : 김민경 
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
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
	* @작성자   : 김민경 
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
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
	* @작성자   : 김민경 
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

		HttpSession session = request.getSession();
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		Long loginEmpId = loginUser.getEmpId();
		String mailType = request.getParameter("mailType");
		String personalMailboxId = request.getParameter("personalMailboxId");

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
