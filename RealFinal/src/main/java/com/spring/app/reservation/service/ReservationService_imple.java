package com.spring.app.reservation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.reservation.domain.ReservationVO;
import com.spring.app.reservation.model.ReservationDAO;

/** 
* @FileName  : ReservationService_imple.java 
* @Project   : TempFinal 
* @Date      : Dec 28, 2023 
* @작성자      : 김민경
* @변경이력    : 
* @프로그램설명    : 트랜잭션 처리를 담당하는 곳, 업무를 처리하는 곳, 비지니스(Business)단
*/
@Service
public class ReservationService_imple implements ReservationService {

	@Autowired
	private ReservationDAO dao;

	
	
	// === 자원카테고리 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getResourceCategoryList() {
		List<Map<String, String>> resourceCategoryList =  dao.getResourceCategoryList();
		return resourceCategoryList;
	}
	
	
	// === 카테고리관리_자원카테고리 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getAdminResourceCategoryList() {
		List<Map<String, String>> adminResourceCategoryList =  dao.getAdminResourceCategoryList();
		return adminResourceCategoryList;
	}
	
	
	// === 자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getResourceList(Map<String, Object> paraMap) {
		List<Map<String, String>> resourceList =  dao.getResourceList(paraMap);
		return resourceList;
	}

	
	// === 관리자_자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getAdminResourceList(Map<String, Object> paraMap) {
		List<Map<String, String>> adminResourceList =  dao.getAdminResourceList(paraMap);
		return adminResourceList;
	}
	

	// === 자원카테고리 정보 가져오기 === //
	@Override
	public Map<String, Object> getResourceCategoryInfo(Map<String, Object> paraMap) {
		Map<String, Object> resourceCategoryInfo_map = dao.getResourceCategoryInfo(paraMap);
		return resourceCategoryInfo_map;
	}

	
	// === 관리자_자원카테고리 정보 가져오기 === //
	@Override
	public Map<String, Object> getAdminResourceCategoryInfo(Map<String, Object> paraMap) {
		Map<String, Object> adminResourceCategoryInfo_map = dao.getAdminResourceCategoryInfo(paraMap);
		return adminResourceCategoryInfo_map;
	}
	
	// === 자원 정보 가져오기 === //
	@Override
	public Map<String, Object> getResourceInfo(Map<String, Object> paraMap) {
		Map<String, Object> resourceInfo_map = dao.getResourceInfo(paraMap);
		return resourceInfo_map;
	}

	// === 관리자_자원 정보 가져오기 === //
	@Override
	public Map<String, Object> getAdminResourceInfo(Map<String, Object> paraMap) {
		Map<String, Object> adminResourceInfo_map = dao.getAdminResourceInfo(paraMap);
		return adminResourceInfo_map;
	}
	
	// === 모든 자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getAllResourceList() {
		List<Map<String, String>> allResourceList =  dao.getAllResourceList();
		return allResourceList;
	}


	// === 승인여부, 반납필수여부 알아오기 === //
	@Override
	public Map<String, Object> getResourceOption(String resourceId) {
		Map<String, Object> option_map = dao.getResourceOption(resourceId);
		return option_map;
	}


	// === 해당일시에 등록된 예약이 있는지 조회 === //
	@Override
	public List<Map<String, String>> selectReservation(Map<String, Object> paraMap) {
		List<Map<String, String>> existReservationList = dao.selectReservation(paraMap);
		return existReservationList;
	}


	// === 예약하기 (자원예약 table에 insert) === //
	@Override
	public void addReservation(Map<String, Object> paraMap) {
		dao.addReservation(paraMap);
	}


	// === 예약 목록 가져오기 === //
	@Override
	public List<ReservationVO> getReservationList(Map<String, Object> paraMap) {
		List<ReservationVO> reservationList = dao.getReservationList(paraMap);
		return reservationList;
	}


	// === 자원예약 한 건에 대한 정보 가져오기 === //
	@Override
	public ReservationVO getReservationInfoDetail(Map<String, Object> paraMap) {
		ReservationVO rsvvo = dao.getReservationInfoDetail(paraMap);
		return rsvvo;
	}


	// === 사원 정보 가져오기 === //
	@Override
	public Map<String, String> getEmpInfo(Map<String, Object> paraMap) {
		Map<String, String> empInfo_map = dao.getEmpInfo(paraMap);
		return empInfo_map;
	}


	// === 예약 삭제하기 === //
	@Override
	public int delReservation(Map<String, Object> paraMap) {
		int result = dao.delReservation(paraMap);
		return result;
	}

	
	// === 예약 자원 반납하기 === //
	@Override
	public int returnRsource(Map<String, Object> paraMap) {
		int result = dao.returnRsource(paraMap);
		return result;
	}
	

	// === 로그인 사원이 인사관리자인지 확인 === //
	@Override
	public String isAdmin(Map<String, Object> paraMap) {
		String rsvAdminEmpId = dao.isAdmin(paraMap); 
		return rsvAdminEmpId;
	}

	// === 총 예약 건수 가져오기 === //
	@Override
	public int getTotalCount(Map<String, Object> paraMap) {
		int totalCount = dao.getTotalCount(paraMap);
		return totalCount;
	}

	
	// === 예약 승인하기 === //
	@Override
	public int rsvApprove(Map<String, Object> paraMap) {
		int result = dao.rsvApprove(paraMap);
		return result;
	}

	
	// === 예약 반려하기 === //
	@Override
	public int rsvReject(Map<String, Object> paraMap) {
		int result = dao.rsvReject(paraMap);
		return result;
	}


	// === 카테고리 삭제하기 === //
	@Override
	public int categoryDel(Map<String, Object> paraMap) {
		int result = dao.categoryDel(paraMap);
		return result;
	}


	// === 자원 카테고리 추가하기 === //
	@Override
	public int categoryAdd(Map<String, Object> paraMap) {
		int n = dao.categoryAdd(paraMap);
		return n;
	}


	// === 자원 카테고리 수정하기 === //
	@Override
	public int categoryEdit(Map<String, Object> paraMap) {
		int n = dao.categoryEdit(paraMap);
		return n;
	}


	// === 자원 추가하기 === //
	@Override
	public int resourceAdd(Map<String, Object> paraMap) {
		int n = dao.resourceAdd(paraMap);
		return n;
	}


	// === 자원 수정하기 === //
	@Override
	public int resourceEdit(Map<String, Object> paraMap) {
		int n = dao.resourceEdit(paraMap);
		return n;
	}


	// === 존재하는 첫번째 카테고리id 가져오기 === //
	@Override
	public String getFirstCategoryId() {
		String id = dao.getFirstCategoryId();
		return id;
	}


	// === 자원 삭제하기 === //
	@Override
	public int resourceDel(Map<String, Object> paraMap) {
		int result = dao.resourceDel(paraMap);
		return result;
	}


	// === 예약관리자 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getRsvAdminList() {
		List<Map<String, String>> rsvAdminList = dao.getRsvAdminList();
		return rsvAdminList;
	}


	// === 예약관리자 총 인원수 가져오기 === //
	@Override
	public int getRsvAdminTotalCount() {
		int rsvAdminTotalCount = dao.getRsvAdminTotalCount();
		return rsvAdminTotalCount;
	}


	// === 예약된 시간을 표시하기 위한 자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getReservationMarkList(Map<String, Object> paraMap) {
		List<Map<String, String>> reservationMarkList = dao.getReservationMarkList(paraMap);
		return reservationMarkList;
	}


	// === 예약 관리자 삭제하기 === //
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = { Throwable.class })
	public int delRsvAdmin(Map<String, Object> paraMap) {
		
		int n1=0, n2=0, result=1;
			
		n1 = dao.updateAdminIsDelete(paraMap); // tbl_admin 테이블에 isDelete 컬럼 update 
		result *= n1;
		System.out.println("n1="+n1+"result="+result);		
		n2 = dao.updateAdminHistory(paraMap); // tbl_adminHistory 테이블에 삭제사원,삭제일시 update
		result *= n2;
		System.out.println("n2="+n2+"result="+result);
		
		
		
		return result;
	}

	
	
	

	
}
