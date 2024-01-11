package com.spring.app.admin.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.app.admin.domain.BatchModifyUserVO;
import com.spring.app.admin.model.AdminDAO;
import com.spring.app.approval.model.ApprovalDAO;
import com.spring.app.common.Sha256;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.DepartmentVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.common.domain.PositionVO;

/**
 *   @FileName  : AdminService_imple.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 5 
 * @작성자      : 신예진
 * @변경이력 : 
 * @프로그램설명 : 
 */

@Service
public class AdminService_imple implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private ApprovalDAO adao;
	
	@Override
	public List<DepartmentVO> getDepList() {
		return dao.getDepList();
	}

	@Override
	public List<PositionVO> getPositionList() {
		return dao.getPositionList();
	}

	@Override
	public boolean isExistId(String id) {
		
		if(dao.isExistId(id) > 0) {
			// 존재할 경우
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean insertUser(EmployeeVO evo) {
		String email = evo.getId() + "@project.com";
		evo.setEmail(email);
		
		String pwd = Sha256.encrypt(evo.getPwd());
		evo.setPwd(pwd);
			
		if(dao.insertUser(evo) == 1) {
			// 사용자 등록 되었을 경우
			return true;
		}else {
			return false;
		}
	}


	@Override
	public List<EmployeeVO> getEmployeeList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getEmployeeList_withSearchAndPaging(paraMap);
	}

	@Override
	public int getTotalCountEmployeeList(Map<String, String> paraMap) {
		return dao.getTotalCountEmployeeList(paraMap);
	}

	@Override
	public int batchWorkType(BatchModifyUserVO bvo) {
		return dao.batchWorkType(bvo);
	}

	@Override
	public int batchPosition(BatchModifyUserVO bvo) {
		return dao.batchPosition(bvo);
	}

	@Override
	public int batchStatus(BatchModifyUserVO bvo) {
		return dao.batchStatus(bvo);
	}

	@Override
	public List<AdminVO> getFullAdminList() {
		return dao.getFullAdminList();
	}

	@Override
	public List<EmployeeVO> getNoneFullAdminEmployeeList(String searchWord) {
		return dao.getNoneFullAdminEmployeeList(searchWord);
	}

	@Override
	public boolean confirmFullAdmin(Map<String, String[]> paraMap, Long userEmpId) {
		
		String[] addAdminList = paraMap.get("addAdminList"); // empId
		String[] delAdminList = paraMap.get("delAdminList"); // adminId
		
		Map<String, Long> adminMap = new HashMap<>();
		adminMap.put("userEmpId", userEmpId);
		
		if(delAdminList != null && delAdminList.length > 0) {
			for(String adminId : delAdminList) {
				
				adminMap.put("adminId", Long.parseLong(adminId));
				
				if(adao.deleteAppovalAdminManager(adminMap) == 1) {
					// 삭제 
					
					if(adao.updateAdminHistory(adminMap) == 1) {
						// 삭제 사원 등록
						continue;
					}else {
						return false;
					}
				}else {
					return false;
				}
			}
		}
		
		
		
		Map<String, Long> empMap = new HashMap<>();
		empMap.put("userEmpId", userEmpId);
		
		if(addAdminList != null && addAdminList.length > 0) {
			for(String empId : addAdminList) {
				empMap.put("empId", Long.parseLong(empId));
				
				if(dao.isAlreadyAdmin(empMap) > 0) {
					// 이미 다른 기능의 관리자로 되어있을 경우
					System.out.println("// 이미 다른 기능의 관리자로 되어있을 경우");
					
					
					if(dao.deleteAdminByEmpId(empMap) > 0) {
						// 다른 기능의 관리자를 해제한다
						
						System.out.println("// 다른 기능의 관리자를 해제한다");
						
						if(dao.updateAdminHistoryByEmpId(empMap) > 0) {
							// 해제 기록을 남긴다
							
						}else {
							return false;
						}
					}else {
						return false;
					}
					
				}
				
				
				Long adminId = adao.getAdminSequence();
				
				empMap.put("adminId", adminId);
				empMap.put("adminType", 1L);
				
				
				if(dao.addFullAdminManager(empMap) == 1) {
					
					if(adao.addAdminHistory(empMap) == 1) {
						continue;
					}else {
						return false;
					}
					
				}else {
					return false;
				}
			}
		}
		
		// 여기까진 문제 없기 때문에 return true
		return true;
	}


}
