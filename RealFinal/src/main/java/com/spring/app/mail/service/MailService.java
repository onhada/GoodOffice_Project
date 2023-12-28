package com.spring.app.mail.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.mail.domain.MailVO;

public interface MailService {

	/** 
	* @Method Name  : isExistMail 
	* @작성일   : Dec 7, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : employee 중 해당 이메일이 존재하는지 확인 
	* @param paraMap
	* @return 
	*/
	EmployeeVO isExistMail(Map<String, String> paraMap);

	/** 
	* @Method Name  : mailWrite 
	* @작성일   : Dec 7, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 메일쓰기
	* @param mailvo
	* @return
	* @throws Throwable 
	*/
	int mailWrite(MailVO mailvo, MultipartHttpServletRequest mrequest) throws Throwable; 

	/** 
	* @Method Name  : getPersonalMailbox 
	* @작성일   : Dec 9, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : personalmailboxtype 테이블에서 개인편지함 가져오기 
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> getPersonalMailbox(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getTotalCount 
	* @작성일   : Dec 9, 2023 
	* @작성자   : 김민경  
	* @변경이력  : 
	* @Method 설명 : 총 게시물 건수(totalCount) 구하기
	* @param paraMap
	* @return 
	*/
	int getTotalCount(Map<String, Object> paraMap);

	/** 
	* @Method Name  : mailList_withPaging 
	* @작성일   : Dec 9, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 페이징 처리한 메일목록 가져오기
	* @param paraMap
	* @return 
	*/
	List<MailVO> mailList_withPaging(Map<String, Object> paraMap);
		
	/** 
	* @Method Name  : updateImportant 
	* @작성일   : Dec 11, 2023 
	* @작성자   : 김민경  
	* @변경이력  : 
	* @Method 설명 : 중요메일 여부 업데이트
	* @param paraMap
	* @return 
	*/
	int updateImportant(Map<String, Object> paraMap);

	/** 
	* @Method Name  : moveToTrashbox 
	* @작성일   : Dec 19, 2023 
	* @작성자   : 김민경
	* @변경이력  : 
	* @Method 설명 : 메일을 휴지통으로 이동하기
	* @param paraMap
	* @return 
	*/
	int moveToTrashbox(Map<String, Object> paraMap);

	/** 
	* @Method Name  : delPermanently 
	* @작성일   : Dec 20, 2023 
	* @작성자   : 김민경
	* @변경이력  : 
	* @Method 설명 : 메일 영구삭제하기
	* @param paraMap
	* @return 
	*/
	int delPermanently(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : moveToPersonalMailbox 
	* @작성일   : Dec 20, 2023 
	* @작성자   : 김민경
	* @변경이력  : 
	* @Method 설명 : 메일을 개인편지함으로 이동
	* @param paraMap
	* @return 
	*/
	int moveToPersonalMailbox(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getOneMail 
	* @작성일   : Dec 20, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 하나의 메일 정보 가져오기 
	* @param paraMap 
	 * @return 
	*/
	MailVO getOneMail(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : getIsImportant 
	* @작성일   : Dec 24, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 중요메일 여부 가져오기
	* @param paraMap
	* @return 
	*/
	String getIsImportant(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : getMailFileList 
	* @작성일   : Dec 22, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 첨부파일 관련 정보(첨부파일제목, 첨부파일크기) 가져오기
	* @param paraMap
	* @return 
	*/
	List<Map<String, String>> getMailFileList(Map<String, Object> paraMap); 
	
	/** 
	* @Method Name  : getSendEmp 
	* @작성일   : Dec 21, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : // 발신사원_str(이름, 이메일) 가져오기 
	* @param paraMap
	* @return 
	*/
	String getSendEmp(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : getIncomeEmp 
	* @작성일   : Dec 21, 2023 
	* @작성자   : 김민경 
	* @변경이력  : 
	* @Method 설명 : 수신사원_str(이름, 이메일) 가져오기 
	* @param paraMap
	* @return 
	*/
	String getIncomeEmp(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : getReferencEmp 
	* @작성일   : Dec 21, 2023 
	* @작성자   : 김민경
	* @변경이력  : 
	* @Method 설명 : 참조사원_str(이름, 이메일) 가져오기 
	* @param paraMap
	* @return 
	*/
	String getReferenceEmp(Map<String, Object> paraMap);
	
	/** 
	* @Method Name  : selectMemo 
	* @작성일   : Dec 23, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 메일메모 조회하기
	* @param paraMap
	* @return 
	*/
	String selectMemo(Map<String, Object> paraMap);

	/** 
	* @Method Name  : insertMemo 
	* @작성일   : Dec 21, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 메일메모 추가하기
	* @param paraMap
	* @return 
	*/
	int insertMemo(Map<String, Object> paraMap);

	/** 
	* @Method Name  : updateMemo 
	* @작성일   : Dec 23, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 메일메모 수정하기
	* @param paraMap
	* @return 
	*/
	int updateMemo(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getOrgMailInfo 
	* @작성일   : Dec 24, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 답장메일을 쓰기 위해 필요한 원메일 정보 가져오기
	* @param paraMap
	* @return 
	*/
	Map<String, String> getOrgMailInfo(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getOrgMailTypeOfPersonalMailbox 
	* @작성일   : Dec 24, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 개인메일함에 있는 메일의 기존메일함 타입 가져오기
	* @param paraMap
	* @return 
	*/
	String getOrgMailTypeOfPersonalMailbox(Map<String, Object> paraMap);

	/** 
	* @Method Name  : getTempMailInfo 
	* @작성일   : Dec 26, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 임시저장 메일 가져오기
	* @param paraMap
	* @return 
	*/
	Map<String, String> getTempMailInfo(Map<String, Object> paraMap);

	/** 
	* @Method Name  : makePersonalMailbox 
	* @작성일   : Dec 26, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 개인편지함 만들기
	* @param paraMap
	* @return 
	*/
	int makePersonalMailbox(Map<String, Object> paraMap);

	/** 
	* @Method Name  : deletePersonalMailbox 
	* @작성일   : Dec 27, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 개인편지함 삭제하기 
	* @param paraMap
	* @return 
	*/
	int deletePersonalMailbox(Map<String, Object> paraMap);

	/** 
	* @Method Name  : emptyMailbox 
	* @작성일   : Dec 27, 2023 
	* @작성자   : hada 
	* @변경이력  : 
	* @Method 설명 : 편지함 비우기
	* @param paraMap
	* @return 
	*/
	int emptyMailbox(Map<String, Object> paraMap);

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
