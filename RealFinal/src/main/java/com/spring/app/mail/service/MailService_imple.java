package com.spring.app.mail.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.app.common.FileManager;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.mail.domain.MailVO;
import com.spring.app.mail.model.MailDAO;

/**
 *   @FileName  : MailService_imple.java 
 * 
 * @Project   : TempFinal 
 * @Date      : Dec 7, 2023 
 * @작성자      : 김민경 
 * @변경이력 : 
 * @프로그램설명 : 트랜잭션 처리를 담당하는 곳, 업무를 처리하는 곳, 비지니스(Business)단
 */
@Service
public class MailService_imple implements MailService {

	@Autowired
	private MailDAO dao;

	@Autowired
	private FileManager fileManager;

	
	
	// === employee 중 해당 이메일이 존재하는지 확인 === //
	@Override
	public EmployeeVO isExistMail(Map<String, String> paraMap) {
		EmployeeVO employee = dao.isExistMail(paraMap);
		return employee;
	}

	// === 메일쓰기 === //
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = { Throwable.class })
	public int mailWrite(MailVO mailvo, MultipartHttpServletRequest mrequest) throws Throwable {

		// 메일쓰기가 원메일쓰기인지 아니면 답장메일쓰기인지를 구분하여?? tbl_mail 테이블에 insert 를 해주어야 한다.

		/*
		 * @ 메일은 묶어서 보여줄 필요가 없으니까 아래 코드 필요 없는듯? // === 원글쓰기인지, 답변글쓰기인지 구분하기 시작 === //
		 * if(mailvo.getOrgMailId()==0) { // 원글쓰기인 경우 // groupno 컬럼의 값은 groupno 컬럼의
		 * 최대값(max)+1 로 해야한다. int groupno = dao.getGroupnoMax()+1;
		 * boardvo.setGroupno(String.valueOf(groupno)); } // === 원글쓰기인지, 답변글쓰기인지 구분하기 끝
		 * === //
		 */

		int n1=0, n2=0, n3=0, n4=0, n5=0, n6=0, result = 1;
		// n1 하나의 mail, n2 메일첨부파일, n3 수신메일, n4 참조메일, n5 숨은참조메일, n6 발신메일 

		
		
		
		/* --------------- 하나의메일 --------------- */
		n1 = dao.insertMail(mailvo); // 하나의 메일을 tbl_mail 테이블에 insert
		result *= n1;
		
		
		
		/* --------------- 메일첨부파일 --------------- */
		List<MultipartFile> fileList = mrequest.getFiles("file_arr"); // "file_arr" 은 /board/src/main/webapp/WEB-INF/views/mail/mailWrite.jsp 페이지의 464 라인에 보여지는 formData.append("file_arr", item); 의 값이다.
		// MultipartFile interface는 Spring에서 업로드된 파일을 다룰 때 사용되는 인터페이스로 파일의 이름과 실제 데이터, 파일 크기 등을 구할 수 있다.
		
		
		if(fileList.size()>0) {		
			
			/*
		        >>>> 첨부파일이 업로드 되어질 특정 경로(폴더)지정해주기
		                   우리는 WAS 의 webapp/resources/mail_attacFile 라는 폴더로 지정해준다.
		    */
		    // WAS 의 webapp 의 절대경로를 알아와야 한다.
		    HttpSession session = mrequest.getSession();
		    String root = session.getServletContext().getRealPath("/");
		    String path = root + "resources"+File.separator+"mail_attacFile";
		    // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.
	
		 // System.out.println("~~~~ 확인용 path => " + path);
		    // ~~~~ 확인용  path 의 절대경로 => /Users/hada/dev/NCS/workspace_spring_framework/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/board/email_attach_file
		     
		    File dir = new File(path);
		    if(!dir.exists()) {
		    	dir.mkdirs();
		    }
		    
		    
		    String newFileName = "";
			// WAS(톰캣)의 디스크에 저장될 파일명 
			
			byte[] bytes = null;
			// 첨부파일의 내용물을 담는 것
			
			long fileSize = 0;
			// 첨부파일의 크기 
			
			
			for(int i=0; i<fileList.size(); i++) {
				
				try {
					MultipartFile attach = fileList.get(i);
					
					bytes = attach.getBytes();
					// 첨부파일의 내용물을 읽어오는 것
					
					String originalFilename = attach.getOriginalFilename();
					// attach.getOriginalFilename() 이 첨부파일명의 파일명(예: 강아지.png) 이다.
					
					newFileName = fileManager.doFileUpload(bytes, originalFilename, path); 
					// 첨부되어진 파일을 업로드 하는 것이다.
				
					
					mailvo.setFileName(newFileName);
					// WAS(톰캣)에 저장된 파일명(20231124113600755016855987700.pdf)
					
					mailvo.setOrgFileName(originalFilename);
					// 게시판 페이지에서 첨부된 파일(LG_싸이킹청소기_사용설명서.pdf)을 보여줄 때 사용.
					// 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.
					
					fileSize = attach.getSize();  // 첨부파일의 크기(단위는 byte임) 
					mailvo.setFileSize(String.valueOf(fileSize));
					
					
					n2 = dao.insertFile(mailvo); // 메일첨부파일을 tbl_mailFile 테이블에 insert
					result *= n2;
					System.out.println("엔투"+n2);
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}// end of for---------------------------------------
					
		}	

		
		
		/* --------------- 수신메일 --------------- */
		String[] arr_incomeEmpId = mrequest.getParameterValues("incomeEmpId");
		for (int i = 0; i < arr_incomeEmpId.length; i++) {

			Map<String, Object> incomeMail_map = new HashMap<>();
			incomeMail_map.put("incomeEmpId", arr_incomeEmpId[i]);
			//	System.out.println("확인용(수신empID) arr_incomeEmpId["+i+"] : " + arr_incomeEmpId[i]);

			n3 = dao.insertIncomeMail(incomeMail_map); // 수신메일을 tbl_incomemail 테이블에 insert
			result *= n3;

		}
		
		
		
		/* --------------- 참조메일 --------------- */
		String[] arr_referenceEmpId = mrequest.getParameterValues("referenceEmpId");
		if(arr_referenceEmpId != null) {
			for (int i = 0; i < arr_referenceEmpId.length; i++) {
	
				Map<String, Object> referenceMail_map = new HashMap<>();
				referenceMail_map.put("referenceEmpId", arr_referenceEmpId[i]);
				// System.out.println("확인용(참조empID) arr_referenceEmpId[" + i + "] : " + arr_referenceEmpId[i]);
				
				n4 = dao.insertReferenceMail(referenceMail_map); // 참조메일을 tbl_referenceMail 테이블에 insert
				result *= n4;
				
			}
		}
		
		
		
		/* --------------- 숨은참조메일 --------------- */
		String[] arr_hiddenReferenceEmpId = mrequest.getParameterValues("hiddenReferenceEmpId");
		if(arr_hiddenReferenceEmpId != null) {
			System.out.println(arr_hiddenReferenceEmpId);
			for (int i = 0; i < arr_hiddenReferenceEmpId.length; i++) {
	
				Map<String, Object> hiddenReferenceMail_map = new HashMap<>();
				hiddenReferenceMail_map.put("hiddenReferenceEmpId", arr_hiddenReferenceEmpId[i]);
				System.out.println("확인용(참조empID) arr_hiddenReferenceEmpId[" + i + "] : " + arr_hiddenReferenceEmpId[i]);
				
				n5 = dao.insertHiddenReferenceMail(hiddenReferenceMail_map); // 숨은참조메일을 tbl_referenceMail 테이블에 insert
				result *= n5;
				
			}
		}
		
		
		
		/* --------------- 발신메일(보낸편지함, 보낼편지함, 임시보관함) --------------- */
		String isTemporary = (String) mrequest.getAttribute("isTemporary");
	
		Map<String, Object> sendMail_map = new HashMap<>();
		sendMail_map.put("loginEmpId", mrequest.getAttribute("loginEmpId"));
		sendMail_map.put("isTemporary", isTemporary);

		String mailId = mrequest.getParameter("mailId");
System.out.println("$$"+mailId);	
		if(mailId != null) {
			dao.deleteTempMail(mailId); // 임시저장메일을 이어서 작성하는 경우, tbl_tempMail 테이블에서 delete
		}
		
		// 발신메일은 tbl_sendMail 테이블에 insert, 임시저장메일은 tbl_tempMail 테이블에 insert
		n6 = dao.insertSendMail(sendMail_map); 
		result *= n6;
		
			

		return result;
	}

	
	// === personalmailboxtype 테이블에서 개인편지함 가져오기 === //
	@Override
	public List<Map<String, String>> getPersonalMailbox(Map<String, Object> paraMap) {
		List<Map<String, String>> personalMailboxList = dao.getPersonalMailbox(paraMap);
		return personalMailboxList;
	}
	
	
	// === 총 게시물 건수(totalCount) 구하기 === //
	@Override
	public int getTotalCount(Map<String, Object> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}

	
	// === 페이징 처리한 메일목록 가져오기 === //
	@Override
	public List<MailVO> mailList_withPaging(Map<String, Object> paraMap) {
		List<MailVO> mailList = dao.mailList_withPaging(paraMap);
		return mailList;
	}

	
	// === 중요메일 여부 업데이트 === //
	@Override
	public int updateImportant(Map<String, Object> paraMap) {
		int n = dao.updateImportant(paraMap);
		return n;
	}


	// === 메일을 휴지통으로 이동하기 === //
	@Override
	public int moveToTrashbox(Map<String, Object> paraMap) {
		int n = dao.moveToTrashbox(paraMap);
		return n;
	}
	
	
	// === 메일 영구삭제하기 === //
	@Override
	public int delPermanently(Map<String, Object> paraMap) {
		int n = dao.delPermanently(paraMap);
		return n;
	}
	
	
	// === 메일을 개인편지함으로 이동 === //
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = { Throwable.class })
	public int moveToPersonalMailbox(Map<String, Object> paraMap) {
		
		int n1=0, n2=0, n3=0, result=1;
		// n1:기존편지함에서 삭제(delete), n2:개인편지함에 추가(insert), n3:메일메모의 mailType 변경(update)
		
		
		/* ~~~~~ 기존편지함에서 삭제(delete) ~~~~~ */
		if(!"6".equals(paraMap.get("mailType"))) { // 기존편지함이 개인편지함이 아닐 경우 
			n1 = dao.deleteOrgMailbox(paraMap); // 기존편지함에서 삭제(delete)
			result *= n1;
		}
	System.out.println("1"+result);	
	System.out.println("1"+paraMap.get("mailType"));		
		/* ~~~~~ 개인편지함에 추가(insert 또는 update) ~~~~~ */
		if(!paraMap.get("mailType").equals("6")) { // 기존편지함이 개인편지함이 아닐 경우 
			System.out.println("ddddd");
			n2 = dao.insertPersonalMailbox(paraMap); // 개인편지함에 추가(insert)
			result *= n2;
		}
		else { // 기존편지함이 개인편지함일 경우 
			System.out.println("eee");
			n2 = dao.updatePersonalMailbox(paraMap); // 개인편지함에 추가(update) : fk_personalMailboxTypeId 컬럼을 새로 이동한 메일함으로 update 
			result *= n2;
		}
System.out.println("2"+result);					
		String isMemo = dao.selectMemo(paraMap); // 메일메모 조회(select)
		if(isMemo != null) { //메일메모가 있다면 
			n3 = dao.updateMailMemoMailType(paraMap); // 메일메모의 mailType 변경(update) 
			result *= n3;
		}
System.out.println("3"+result);			
		return result;
	}
	
	
	// === 하나의 메일 정보 가져오기 === //
	@Override
	public MailVO getOneMail(Map<String, Object> paraMap) {
		MailVO mailInfo = dao.getOneMail(paraMap);
		return mailInfo;
	}

	
	// === 중요메일 여부 가져오기 === //
	@Override
	public String getIsImportant(Map<String, Object> paraMap) {
		String isImportant = dao.getIsImportant(paraMap);
		return isImportant;
	}

	
	// === 첨부파일 관련 정보(첨부파일제목, 첨부파일크기) 가져오기 === //
	@Override
	public List<Map<String, String>> getMailFileList(Map<String, Object> paraMap) {
		List<Map<String, String>> mailFileList = dao.getMailFileList(paraMap);
		return mailFileList;
	}
	
	
	// === 보낸사원_str(이름, 이메일) 가져오기 === // 
	@Override
	public String getSendEmp(Map<String, Object> paraMap) {
		String sendEmp_str = dao.getSendEmp(paraMap);
		return sendEmp_str;
	}
	
		
	// === 받은사원_str(이름, 이메일) 가져오기 === // 
	@Override
	public String getIncomeEmp(Map<String, Object> paraMap) {
		String incomeEmp_str = dao.getIncomeEmp(paraMap);
		return incomeEmp_str;
	}
	
	
	// === 참조사원_str(이름, 이메일) 가져오기 === // 
	@Override
	public String getReferenceEmp(Map<String, Object> paraMap) {
		String referenceEmp_str = dao.getReferenceEmp(paraMap);
		return referenceEmp_str;
	}

	
	// === 메일메모 조회하기 === //
	@Override
	public String selectMemo(Map<String, Object> paraMap) {
		String memoContent = dao.selectMemo(paraMap);
		return memoContent;
	}

	
	// === 메일메모 추가하기 === //
	@Override
	public int insertMemo(Map<String, Object> paraMap) {
		int n = dao.insertMemo(paraMap); 
		return n;
	}

	
	// === 메일메모 수정하기 === //
	@Override
	public int updateMemo(Map<String, Object> paraMap) {
		int n = dao.updateMemo(paraMap); 
		return n;
	}

	
	// === 답장메일을 쓰기 위해 필요한 원메일 정보 가져오기 === //
	@Override
	public Map<String, String> getOrgMailInfo(Map<String, Object> paraMap) {
		Map<String, String> orgMailInfo_map = dao.getOrgMailInfo(paraMap);
		return orgMailInfo_map;
	}

	
	// === 개인메일함에 있는 메일의 기존메일함 타입 가져오기 === //
	@Override
	public String getOrgMailTypeOfPersonalMailbox(Map<String, Object> paraMap) {
		String orgMailType = dao.getOrgMailTypeOfPersonalMailbox(paraMap);
		return orgMailType;
	}

	
	// === 임시저장 메일 가져오기 === //
	@Transactional
	@Override
	public Map<String, String> getTempMailInfo(Map<String, Object> paraMap) {
		Map<String, String> tempMailInfo_map = dao.getTempMailInfo(paraMap); // 메일id, 제목, 메일내용
		
		String incomeEmp_str = dao.getIncomeEmpMail(paraMap); // 받는사람 
		tempMailInfo_map.put("incomeEmp_str", incomeEmp_str);
		
		String referenceEmp_str = dao.getReferenceEmpMail(paraMap); // 참조
		tempMailInfo_map.put("referenceEmp_str", referenceEmp_str);
		
		String hiddenReferenceEmp_str = dao.getHiddenReferenceEmpMail(paraMap); // 숨은참조
		tempMailInfo_map.put("hiddenReferenceEmp_str", hiddenReferenceEmp_str);
		
		return tempMailInfo_map;
	}

	
	// === 개인편지함 만들기 === //
	@Override
	public int makePersonalMailbox(Map<String, Object> paraMap) {
		int n = dao.makePersonalMailbox(paraMap); 
		return n;
	}
	
	
	// === 개인편지함 삭제하기 === //
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = { Throwable.class })
	public int deletePersonalMailbox(Map<String, Object> paraMap) {
		int n1=0, n2=0, result=1;
		
		n1 = dao.deleteInnerMailAtPersonalMailbox(paraMap); // 삭제할 개인편지함 안에 있는 메일을 모두 삭제 
		result *= n1;
		
		n2 = dao.deletePersonalMailbox(paraMap); // 개인편지함을 삭제  
		result *= n2;
		
		return result;
	}
	
	
	// === 편지함 비우기 === //
	@Override
	public int emptyMailbox(Map<String, Object> paraMap) {
		int n = dao.emptyMailbox(paraMap); 
		return n;
	}
	
	
	
	
	
	
}
