package com.spring.app.mail.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.mail.domain.MailVO;

/** 
* @FileName  : MailDAO_imple.java 
* @Project   : TempFinal 
* @Date      : Dec 7, 2023 
* @작성자      : 김민경
* @변경이력    : 
* @프로그램설명    : Repository(DAO) 선언
*/
@Repository
public class MailDAO_imple implements MailDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	
	
	// === employee 중 해당 이메일이 존재하는지 확인 === //
	@Override
	public EmployeeVO isExistMail(Map<String, String> paraMap) {
		EmployeeVO employee = sqlsession.selectOne("mail.isExistMail", paraMap);
		return employee;
	}
	
	
	// === 하나의 메일을 tbl_mail 테이블에 insert === //
	@Override
	public int insertMail(MailVO mailvo) {
		int n = sqlsession.insert("mail.insertMail", mailvo);
		return n;
	}
	

	// === 메일첨부파일을 tbl_mailFile 테이블에 insert === //
	@Override
	public int insertFile(MailVO mailvo) {
		int n = sqlsession.insert("mail.insertFile", mailvo);
		return n;
	}


	// === 수신메일을 tbl_incomemail 테이블에 insert === //
	@Override
	public int insertIncomeMail(Map<String, Object> incomeMail_map) {
		int n = sqlsession.insert("mail.insertIncomeMail", incomeMail_map);
		return n;
	}


	// === 참조메일을 tbl_referenceMail 테이블에 insert === //
	@Override
	public int insertReferenceMail(Map<String, Object> referenceMail_map) {
		int n = sqlsession.insert("mail.insertReferenceMail", referenceMail_map);
		return n;
	}
	
	
	// === 숨은참조메일을 tbl_referenceMail 테이블에 insert === //
	@Override
	public int insertHiddenReferenceMail(Map<String, Object> hiddenReferenceMail_map) {
		int n = sqlsession.insert("mail.insertHiddenReferenceMail", hiddenReferenceMail_map);
		return n;
	}
	

	// === 발신메일 테이블에 insert === //
	// 발신메일은 tbl_sendMail 테이블에 insert, 임시저장메일은 tbl_tempMail 테이블에 insert
	@Override
	public int insertSendMail(Map<String, Object> sendMail_map) {
		int n = sqlsession.insert("mail.insertSendMail", sendMail_map);
		return n;
	}
	
	
	
	
	
	
	
	
	
	

	// === personalmailboxtype 테이블에서 개인편지함 가져오기 === //
	@Override
	public List<Map<String, String>> getPersonalMailbox(Map<String, Object> paraMap) {
		List<Map<String, String>> personalMailboxList = sqlsession.selectList("mail.getPersonalMailbox", paraMap);
		return personalMailboxList;
	}
	

	// === 총 게시물 건수(totalCount) 구하기 === 
	@Override
	public int getTotalCount(Map<String, Object> paraMap) {
		int n = sqlsession.selectOne("mail.getTotalCount", paraMap);
		return n;
	}


	// === 페이징 처리한 메일목록 가져오기 === //
	@Override
	public List<MailVO> mailList_withPaging(Map<String, Object> paraMap) {
		List<MailVO> mailList = sqlsession.selectList("mail.mailList_withPaging", paraMap);
		return mailList;
	}
		
		
	// === 중요메일 여부 업데이트 === //
	@Override
	public int updateImportant(Map<String, Object> paraMap) {
		int n = sqlsession.update("mail.updateImportant", paraMap);
		return n;
	}
	
	
	// === 메일을 휴지통으로 이동하기 === //
	@Override
	public int moveToTrashbox(Map<String, Object> paraMap) {
		int n = sqlsession.update("mail.moveToTrashbox", paraMap);
		return n;
	}

	
	// === 메일 영구삭제하기 === //
	@Override
	public int delPermanently(Map<String, Object> paraMap) {
		int n = sqlsession.delete("mail.delPermanently", paraMap);
		return n;
	}
	

	// === 기존편지함에서 삭제(delete) === //
	@Override
	public int deleteOrgMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.delete("mail.deleteOrgMailbox", paraMap);
		return n;
	}


	// === 개인편지함에 추가(insert) === //
	@Override
	public int insertPersonalMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.insert("mail.insertPersonalMailbox", paraMap);
		return n;
	}
	@Override
	public int updatePersonalMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.update("mail.updatePersonalMailbox", paraMap);
		return n;
	}

	
	// === 메일메모의 mailType 변경(update) === //
	@Override
	public int updateMailMemoMailType(Map<String, Object> paraMap) {
		int n = sqlsession.update("mail.updateMailMemoMailType", paraMap);
		return n;
	}
		
		
	// === 하나의 메일 정보 가져오기 === //
	@Override
	public MailVO getOneMail(Map<String, Object> paraMap) {
		MailVO mailInfo = sqlsession.selectOne("mail.getOneMail", paraMap);
		return mailInfo;
	}

	
	// === 중요메일 여부 가져오기 === //
	@Override
	public String getIsImportant(Map<String, Object> paraMap) {
		String isImportant = sqlsession.selectOne("mail.getIsImportant", paraMap); 
		return isImportant;
	}
		
		
	// === 첨부파일 관련 정보(첨부파일제목, 첨부파일크기) 가져오기 === //
	@Override
	public List<Map<String, String>> getMailFileList(Map<String, Object> paraMap) {
		List<Map<String, String>> mailFileList = sqlsession.selectList("mail.getMailFileList", paraMap);
		return mailFileList;
	}
		
	
	// === 보낸사원_str(이름, 이메일) 가져오기 === //
	@Override
	public String getSendEmp(Map<String, Object> paraMap) {
		String sendEmp_str = sqlsession.selectOne("mail.getSendEmp", paraMap);
		return sendEmp_str;
	}
	
	
	// === 받은사원_str(이름, 이메일) 가져오기 === //
	@Override
	public String getIncomeEmp(Map<String, Object> paraMap) {
		String incomeEmp_str = sqlsession.selectOne("mail.getIncomeEmp", paraMap);
		return incomeEmp_str;
	}


	// === 참조사원_str(이름, 이메일) 가져오기 === //
	@Override
	public String getReferenceEmp(Map<String, Object> paraMap) {
		String referenceEmp_str = sqlsession.selectOne("mail.getReferenceEmp", paraMap);
		return referenceEmp_str;
	}


	// === 메일메모 조회하기 === //
	@Override
	public String selectMemo(Map<String, Object> paraMap) {
		String memoContent = sqlsession.selectOne("mail.selectMemo", paraMap);
		return memoContent;
	}

		
	// === 메일메모 추가하기 === //
	@Override
	public int insertMemo(Map<String, Object> paraMap) {
		int n = sqlsession.insert("mail.insertMemo", paraMap); 
		return n;
	}

	
	// === 메일메모 추가하기 === //
	@Override
	public int updateMemo(Map<String, Object> paraMap) {
		int n = sqlsession.update("mail.updateMemo", paraMap); 
		return n;
	}


	// === 답장메일을 쓰기 위해 필요한 원메일 정보 가져오기 === //
	@Override
	public Map<String, String> getOrgMailInfo(Map<String, Object> paraMap) {
		Map<String, String> orgMailInfo_map = sqlsession.selectOne("mail.getOrgMailInfo", paraMap);
		return orgMailInfo_map;
	}


	// === 개인메일함에 있는 메일의 기존메일함 타입 가져오기 === //
	@Override
	public String getOrgMailTypeOfPersonalMailbox(Map<String, Object> paraMap) {
		String orgMailType = sqlsession.selectOne("mail.getOrgMailTypeOfPersonalMailbox", paraMap);
		return orgMailType;
	}


	// === 임시저장 메일 가져오기 === //
	@Override
	public Map<String, String> getTempMailInfo(Map<String, Object> paraMap) {
		Map<String, String> tempMailInfo_map = sqlsession.selectOne("mail.getTempMailInfo", paraMap);
		return tempMailInfo_map;
	}


	// === 받은사원_str(이메일) 가져오기 === //
	@Override
	public String getIncomeEmpMail(Map<String, Object> paraMap) {
		String incomeEmp_str = sqlsession.selectOne("mail.getIncomeEmpMail", paraMap);
		return incomeEmp_str;
	}


	// === 참조사원_str(이메일) 가져오기 === //
	@Override
	public String getReferenceEmpMail(Map<String, Object> paraMap) {
		String referenceEmp_str = sqlsession.selectOne("mail.getReferenceEmpMail", paraMap);
		return referenceEmp_str;
	}
	
	
	// === 숨은참조사원_str(이메일) 가져오기 === //
	@Override
	public String getHiddenReferenceEmpMail(Map<String, Object> paraMap) {
		String hiddenReferenceEmp_str = sqlsession.selectOne("mail.getHiddenReferenceEmpMail", paraMap);
		return hiddenReferenceEmp_str;
	}


	// === 임시저장메일을 이어서 작성하는 경우, tbl_tempMail 테이블에서 delete === //
	@Override
	public void deleteTempMail(String mailId) {
		sqlsession.delete("mail.deleteTempMail", mailId);
	}


	// === 개인편지함 만들기 === //
	@Override
	public int makePersonalMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.insert("mail.makePersonalMailbox", paraMap); 
		return n;
	}


	// === 삭제할 개인편지함 안에 있는 메일을 모두 삭제 === //
	@Override
	public int deleteInnerMailAtPersonalMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.delete("mail.deleteInnerMailAtPersonalMailbox", paraMap); 
		return n;
	}
		
	
	// === 개인편지함 삭제하기 === //
	@Override
	public int deletePersonalMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.delete("mail.deletePersonalMailbox", paraMap); 
		return n;
	}
	
	
	// === 편지함 비우기 === //
	@Override
	public int emptyMailbox(Map<String, Object> paraMap) {
		int n = sqlsession.delete("mail.emptyMailbox", paraMap); 
		return n;
	}


	

	


	
	
	
	


	
	
	
	
	
	
}
