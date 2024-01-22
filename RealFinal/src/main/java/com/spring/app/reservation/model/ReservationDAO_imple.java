package com.spring.app.reservation.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.reservation.domain.ReservationVO;

/** 
* @FileName  : ReservationDAO_imple.java 
* @Project   : TempFinal 
* @Date      : Dec 28, 2023 
* @작성자      : 김민경 
* @변경이력    : 
* @프로그램설명    : Repository(DAO) 선언
*/
@Repository
public class ReservationDAO_imple implements ReservationDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;

	
	/////////////////////////////////////////////////////////
	
	
	// === 자원카테고리 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getResourceCategoryList() {
		List<Map<String, String>> resourceCategoryList =  sqlsession.selectList("reservation.getResourceCategoryList");
		return resourceCategoryList;
	}
	
	
	// === 카테고리관리_자원카테고리 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getAdminResourceCategoryList() {
		List<Map<String, String>> adminResourceCategoryList =  sqlsession.selectList("reservation.getAdminResourceCategoryList");
		return adminResourceCategoryList;
	}
	
	
	// === 자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getResourceList(Map<String, Object> paraMap) {
		List<Map<String, String>> resourceList =  sqlsession.selectList("reservation.getResourceList", paraMap);
		return resourceList;
	}
	
	
	// === 관리자_자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getAdminResourceList(Map<String, Object> paraMap) {
		List<Map<String, String>> adminResourceList =  sqlsession.selectList("reservation.getAdminResourceList", paraMap);
		return adminResourceList;
	}


	// === 자원카테고리 정보 가져오기 === //
	@Override
	public Map<String, Object> getResourceCategoryInfo(Map<String, Object> paraMap) {
		Map<String, Object> resourceCategoryInfo_map = sqlsession.selectOne("reservation.getResourceCategoryInfo", paraMap);
		return resourceCategoryInfo_map;
	}
	
	
	// === 관리자_자원카테고리 정보 가져오기 === //
	@Override
	public Map<String, Object> getAdminResourceCategoryInfo(Map<String, Object> paraMap) {
		Map<String, Object> adminResourceCategoryInfo_map = sqlsession.selectOne("reservation.getAdminResourceCategoryInfo", paraMap);
		return adminResourceCategoryInfo_map;
	}
	

	// === 자원 정보 가져오기 === //
	@Override
	public Map<String, Object> getResourceInfo(Map<String, Object> paraMap) {
		Map<String, Object> resourceInfo_map = sqlsession.selectOne("reservation.getResourceInfo", paraMap);
		return resourceInfo_map;
	}
	
	
	// === 관리자_자원 정보 가져오기 === //
	@Override
	public Map<String, Object> getAdminResourceInfo(Map<String, Object> paraMap) {
		Map<String, Object> adminResourceInfo_map = sqlsession.selectOne("reservation.getAdminResourceInfo", paraMap);
		return adminResourceInfo_map;
	}


	// === 모든 자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getAllResourceList() {
		List<Map<String, String>> allResourceList =  sqlsession.selectList("reservation.getAllResourceList");
		return allResourceList;
	}


	// === 승인여부, 반납필수여부 알아오기 === //
	@Override
	public Map<String, Object> getResourceOption(String resourceId) {
		Map<String, Object> option_map = sqlsession.selectOne("reservation.getResourceOption", resourceId);
		return option_map;
	}


	// === 해당일시에 등록된 예약이 있는지 조회 === //
	@Override
	public List<Map<String, String>> selectReservation(Map<String, Object> paraMap) {
		List<Map<String, String>> existReservationList = sqlsession.selectList("reservation.selectReservation", paraMap);
		return existReservationList;
	}


	// === 예약하기 (자원예약 table에 insert) === //
	@Override
	public void addReservation(Map<String, Object> paraMap) {
		sqlsession.insert("reservation.addReservation", paraMap);
	}

	
	// === 예약 목록 가져오기 === //
	@Override
	public List<ReservationVO> getReservationList(Map<String, Object> paraMap) {
		List<ReservationVO> reservationList = sqlsession.selectList("reservation.getReservationList", paraMap);
		return reservationList;
	}


	// === 자원예약 한 건에 대한 정보 가져오기 === //
	@Override
	public ReservationVO getReservationInfoDetail(Map<String, Object> paraMap) {
		ReservationVO rsvvo = sqlsession.selectOne("reservation.getReservationInfoDetail", paraMap);
		return rsvvo;
	}


	// === 사원 정보 가져오기 === //
	@Override
	public Map<String, String> getEmpInfo(Map<String, Object> paraMap) {
		Map<String, String> empInfo_map = sqlsession.selectOne("reservation.getEmpInfo", paraMap);  
		return empInfo_map;
	}


	// === 예약 삭제하기 === //
	@Override
	public int delReservation(Map<String, Object> paraMap) {
		int result = sqlsession.delete("reservation.delReservation", paraMap);  
		return result;
	}

	
	// === 예약 자원 반납하기 === //
	@Override
	public int returnRsource(Map<String, Object> paraMap) {
		int result = sqlsession.update("reservation.returnRsource", paraMap);  
		return result;
	}
	
	
	// === 총 예약 건수 가져오기 === //
	@Override
	public int getTotalCount(Map<String, Object> paraMap) {
		int totalCount = sqlsession.selectOne("reservation.getTotalCount", paraMap);
		return totalCount;
	}

	
	// === 예약 승인하기 === //
	@Override
	public int rsvApprove(Map<String, Object> paraMap) {
		int result = sqlsession.update("reservation.rsvApprove", paraMap);  
		return result;
	}
	
	// === 예약 반려하기 === //
	@Override
	public int rsvReject(Map<String, Object> paraMap) {
		int result = sqlsession.update("reservation.rsvReject", paraMap);  
		return result;
	}


	// === 카테고리 삭제하기 === //
	@Override
	public int categoryDel(Map<String, Object> paraMap) {
		int result = sqlsession.delete("reservation.categoryDel", paraMap);  
		return result;
	}


	// === 자원 카테고리 추가하기 === //
	@Override
	public int categoryAdd(Map<String, Object> paraMap) {
		int n = sqlsession.insert("reservation.categoryAdd", paraMap);  
		return n;
	}


	// === 자원 카테고리 수정하기 === //
	@Override
	public int categoryEdit(Map<String, Object> paraMap) {
		int n = sqlsession.update("reservation.categoryEdit", paraMap);  
		return n;
	}


	// === 자원 추가하기 === //
	@Override
	public int resourceAdd(Map<String, Object> paraMap) {
		int n = sqlsession.insert("reservation.resourceAdd", paraMap);  
		return n;
	}


	// === 자원 수정하기 === //
	@Override
	public int resourceEdit(Map<String, Object> paraMap) {
		int n = sqlsession.update("reservation.resourceEdit", paraMap);  
		return n;
	}


	// === 존재하는 첫번째 카테고리id 가져오기 === //
	@Override
	public String getFirstCategoryId() {
		String id = sqlsession.selectOne("reservation.getFirstCategoryId");
		return id;
	}


	// === 자원 삭제하기 === //
	@Override
	public int resourceDel(Map<String, Object> paraMap) {
		int result = sqlsession.delete("reservation.resourceDel", paraMap);  
		return result;
	}


	// === 예약관리자 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getRsvAdminList() {
		List<Map<String, String>> rsvAdminList = sqlsession.selectList("reservation.getRsvAdminList");
		return rsvAdminList;
	}


	// === 예약관리자 총 인원수 가져오기 === //
	@Override
	public int getRsvAdminTotalCount() {
		int rsvAdminTotalCount = sqlsession.selectOne("reservation.getRsvAdminTotalCount");
		return rsvAdminTotalCount;
	}


	// === 예약된 시간을 표시하기 위한 자원 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getReservationMarkList(Map<String, Object> paraMap) {
		List<Map<String, String>> reservationMarkList = sqlsession.selectList("reservation.getReservationMarkList");
		return reservationMarkList;
	}
	

	// === tbl_admin 테이블에 isDelete 컬럼 update === //
	@Override
	public int updateAdminIsDelete(Map<String, Object> paraMap) {
		int n = sqlsession.update("reservation.updateAdminIsDelete", paraMap);
		return n;
	}


	// === tbl_adminHistory 테이블에 삭제사원,삭제일시 update === //
	@Override
	public int updateAdminHistory(Map<String, Object> paraMap) {
		int n = sqlsession.update("reservation.updateAdminHistory", paraMap);
		return n;
	}
	
	
	
}
