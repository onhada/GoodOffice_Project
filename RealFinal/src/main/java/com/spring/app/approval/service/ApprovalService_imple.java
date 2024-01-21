package com.spring.app.approval.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.app.approval.domain.AdminHistoryVO;
import com.spring.app.approval.domain.ApprovalDetailVO;
import com.spring.app.approval.domain.ApprovalFileVO;
import com.spring.app.approval.domain.ApprovalOpinionVO;
import com.spring.app.approval.domain.ApprovalProcedureVO;
import com.spring.app.approval.domain.ApprovalVO;
import com.spring.app.approval.domain.BatchVO;
import com.spring.app.approval.domain.DayOffVO;
import com.spring.app.approval.domain.EmpProofDetailVO;
import com.spring.app.approval.domain.FormVO;
import com.spring.app.approval.domain.ModifyDetailVO;
import com.spring.app.approval.domain.ModifyWorkRequestVO;
import com.spring.app.approval.domain.SecurityVO;
import com.spring.app.approval.domain.WorkApplicationVO;
import com.spring.app.approval.model.ApprovalDAO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.EmployeeVO;

/**
 *   @FileName  : ApprovalService_imple.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 5 
 * @작성자      : 신예진 (yejjinny)
 * @변경이력 : 
 * @프로그램설명 : 
 */

@Service
public class ApprovalService_imple implements ApprovalService {

	@Autowired
	private ApprovalDAO dao;

	@Override
	public List<ApprovalVO> getApprovalTempBox_withSearchAndPaging(Map<String, String> paraMap) {
		// 임시저장함
		return dao.getApprovalTempBox_withSearchAndPaging(paraMap);
	}

	@Override
	public List<SecurityVO> getSecurityLevelDetailList() {
		// 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 기존 보안 등급별 열람 정보를 가져온다
		return dao.getSecurityLevelDetailList();
	}

	@Override
	public List<SecurityVO> getSecurityLevelList() {
		// 전자결재_관리자 설정_기본 설정_보안 등급별 열람 설정을 하기 위해 보안등급 정보를 가져온다
		return dao.getSecurityLevelList();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	public boolean setSecurityLevel(Map<String, String> paraMap) {
		// 전자결재_관리자 설정_기본 설정_보안 등급 설정

		int n = 0;
		n = dao.setSecurityLevelA(paraMap.get("levelA"));

		if (n == 1) {
			n = dao.setSecurityLevelB(paraMap.get("levelB"));
			if (n == 1) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	@Override
	public List<FormVO> getFormList(Map<String, String> paraMap) {
		return dao.getFormList(paraMap);
	}

	@Override
	public int getTotalCountApprovalFormList(String searchWord) {
		return dao.getTotalCountApprovalFormList(searchWord);
	}

	@Override
	public List<ApprovalVO> getDocumentAllList_withSearchAndPaging(Map<String, String> paraMap) {

		// 전자결재절차 테이블 속 fk_empId 중에 존재하는 전자결재 id만 찾기
		List<ApprovalVO> approvalAllIngList = dao.getDocumentAllList_withSearchAndPaging(paraMap);

		// 전체 결과값 저장용
		Map<String, Long> paramMap = new HashMap<>();

		for (ApprovalVO avo : approvalAllIngList) {

			paramMap.put("fk_approvalId", avo.getFk_approvalId());

			if (dao.hasReturn(avo.getFk_approvalId()) != 0) {
				// 반려가 있을 경우

				avo.setStatus("반려");

			} else {
				// 반려가 없을 경우

				if (dao.hasAllAccept(paramMap) == 0) {
					// 전원이 승인했다면

					avo.setStatus("결재 완료");
				} else {
					// 전원이 승인하지 않았다면

					avo.setStatus("결재 중");
				}

			}

		}

		return approvalAllIngList;
	}

	@Override
	public int getTotalCountDocumentAllList(Map<String, String> paraMap) {
		return dao.getTotalCountDocumentAllList(paraMap);
	}

	@Override
	public int getTotalCountDocumentDeleteList(Map<String, String> paraMap) {
		return dao.getTotalCountDocumentDeleteList(paraMap);
	}

	@Override
	public List<ApprovalVO> getDocumentDeleteList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getDocumentDeleteList_withSearchAndPaging(paraMap);
	}

	@Override
	public List<AdminVO> getAdminList() {
		return dao.getAdminList();
	}

	@Override
	public ApprovalDetailVO getApprovalDocumentView(Map<String, Long> paraMap) {

		ApprovalDetailVO advo = dao.getApprovalDocumentView(paraMap);

		// 절차
		advo.setApvo(dao.getApprovalDocumentView_Procedure(paraMap.get("approvalId")));

		// 파일 첨부
		advo.setFvo(dao.getApprovalDocumentView_File(paraMap.get("approvalId")));

		return advo;
	}

	@Override
	public List<ApprovalOpinionVO> getApprovalOpinionList(Long approvalId) {
		return dao.getApprovalOpinionList(approvalId);
	}

	@Override
	public int isDraftEmp(Map<String, Long> paraMap) {
		// 기안 or 신청자인지 확인
		return dao.isDraftEmp(paraMap);
	}

	@Override
	public int updateApprovalSecurity(Map<String, Long> paraMap) {
		return dao.updateApprovalSecurity(paraMap);
	}

	@Override
	public List<EmployeeVO> searchEmpName(String empName) {
		return dao.searchEmpName(empName);
	}

	@Override
	public List<ApprovalProcedureVO> getProcedureTypeApproval(Long approvalId) {
		return dao.getProcedureTypeApproval(approvalId);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean updateApprovalLineSetting(List<ApprovalProcedureVO> updateList, Long approvalId,
			Long procedureType) {
		// 기존의 결재 절차 정보를 가져온다
		List<ApprovalProcedureVO> orgList = new ArrayList<>();

		if (procedureType == 3 || procedureType == 4) {
			orgList = getProcedureTypeApproval(approvalId);
		} else if (procedureType == 1 || procedureType == 2) {
			orgList = dao.getProcedureTypeApplication(approvalId);
		} else {
			return false;
		}

		Map<String, String> paraMap = new HashMap<>();

		boolean check = true;

		paraMap.put("approvalId", String.valueOf(approvalId));
		paraMap.put("procedureType", String.valueOf(procedureType));

		if (orgList.size() == updateList.size()) {
			// 기존 결재자 수와 수정한 결재자 수가 같을 경우

			for (int i = 0; i < updateList.size(); i++) {
				if (!updateList.get(i).getEmpId().equals(orgList.get(i).getEmpId())) {
					// 기존에 있던 결재 절차의 순서대로 일치하면서 empId는 동일하지 않을 경우 (즉, 업데이트해야할 경우)

					paraMap.put("empId", updateList.get(i).getEmpId());
					paraMap.put("procedureId", String.valueOf(orgList.get(i).getProcedureId()));

					if (dao.updateApprovalLineSetting(paraMap) == 0) {
						check = false;
						return check;
					}
				}
			}
		} else if (orgList.size() < updateList.size()) {
			// 업데이트할 결재자 수가 더 많을 경우 (insert & update)

			// insert 시 sequence 값에 더해져서 사용할 수 있도록 한다.
			int seqCnt = 0;

			for (int i = 0; i < updateList.size(); i++) {
				paraMap.put("empId", updateList.get(i).getEmpId());

				if (i < orgList.size()) {
					// 아직 기존 결재자 수보다 적은 상태일 경우 (이땐 update를 해야한다)

					if (!updateList.get(i).getEmpId().equals(orgList.get(i).getEmpId())) {
						paraMap.put("procedureId", String.valueOf(orgList.get(i).getProcedureId()));

						if (dao.updateApprovalLineSetting(paraMap) == 0) {
							check = false;
							return check;
						}
					}

				} else {
					// 기존 결재자수보다 더 커진 상태일 경우 (이땐 insert를 해야한다)

					// 가장 마지막 sequence 값 얻어오기
					int lastSeq = dao.getApprovalProcedureLastSeq(approvalId);

					paraMap.put("sequence", String.valueOf(lastSeq + (++seqCnt)));

					if (dao.insertApprovalLineSetting(paraMap) == 0) {
						check = false;
						return check;
					}
				}

			}

		} else {
			// 업데이트할 결재자 수가 더 적을 경우 (delete)

			for (int i = 0; i < orgList.size(); i++) {
				paraMap.put("procedureId", String.valueOf(orgList.get(i).getProcedureId()));

				if (i < updateList.size()) {
					// 아직 업데이트할 결재자보다 적을 경우 (이땐 update를 해야한다)

					if (!updateList.get(i).getEmpId().equals(orgList.get(i).getEmpId())) {
						paraMap.put("empId", updateList.get(i).getEmpId());

						if (dao.updateApprovalLineSetting(paraMap) == 0) {
							check = false;
							return check;
						}
					}

				} else {
					// 기존 결재자 수가 업데이트자 수보다 적은 상태일 경우 (이땐 delete를 해야한다)

					paraMap.put("empId", orgList.get(i).getEmpId());

					if (dao.deleteApprovalLineSetting(paraMap) == 0) {
						check = false;
						return check;
					}
				}

			}
		}

		return check;
	}

	@Override
	public boolean addRef(String refType, Long empId, Long approvalId) {
		// 전자결재_상세보기_참조 or 수신 or 수신참조 + 버튼 클릭시

		int procedureType = 0;
		switch (refType) {
		case "reference":
			procedureType = 5;
			break;
		case "income":
			procedureType = 6;
			break;
		case "incomeRef":
			procedureType = 7;
			break;
		default:
			procedureType = 0;
		}

		// 가장 마지막 sequence 값 얻어오기
		int lastSeq = dao.getApprovalProcedureLastSeq(approvalId);

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("refType", String.valueOf(procedureType));
		paraMap.put("empId", String.valueOf(empId));
		paraMap.put("approvalId", String.valueOf(approvalId));
		paraMap.put("sequence", String.valueOf(++lastSeq));

		if (dao.addRef(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int getUserProcedureType(Map<String, Long> paraMap) {
		// 유저 결재절차 타입
		
		Integer userProcedureType = dao.getUserProcedureType(paraMap);
		
		if(userProcedureType == null) {
			return 0;
		}else {
			return userProcedureType;
		}
	}

	@Override
	public boolean delRef(Long empId, Long approvalId) {

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("empId", String.valueOf(empId));
		paraMap.put("approvalId", String.valueOf(approvalId));

		if (dao.delRef(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean insertOrUpdateApprovalFile(String approvalId, List<ApprovalFileVO> afList) {

		List<ApprovalFileVO> orgAfList = dao.getApprovalDocumentView_File(Long.parseLong(approvalId));
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("approvalId", approvalId);

		boolean isUpdate = true;

		if (orgAfList.size() == afList.size()) {
			// 기존 등록된 첨부파일과 새 첨부파일의 수가 같을 경우 (= 업데이트)

			for (int i = 0; i < afList.size(); i++) {
				paraMap.put("fileName", afList.get(i).getFileName());
				paraMap.put("fileSize", String.valueOf(afList.get(i).getFileSize()));
				paraMap.put("approvalFileId", String.valueOf(orgAfList.get(i).getApprovalFileId()));
				if (dao.updateApprovalFile(paraMap) == 0) {
					return false;
				}
			}
		} else if (orgAfList.size() > afList.size()) {
			// 기존 등록된 첨부파일이 새 첨부파일보다 더 많을 경우

			for (int i = 0; i < orgAfList.size(); i++) {
				paraMap.put("approvalFileId", String.valueOf(orgAfList.get(i).getApprovalFileId()));

				if (i < afList.size()) {

					paraMap.put("fileName", afList.get(i).getFileName());
					paraMap.put("fileSize", String.valueOf(afList.get(i).getFileSize()));

					if (dao.updateApprovalFile(paraMap) == 0) {
						isUpdate = false;
						return isUpdate;
					}
				} else {
					// 더 많은 애들은 지운다

					if (dao.deleteApprovalFile(paraMap) == 0) {
						isUpdate = false;
						return isUpdate;
					}
				}
			}

		} else {
			// orgAfList.size() < afList.size()

			for (int i = 0; i < afList.size(); i++) {
				paraMap.put("fileName", afList.get(i).getFileName());
				paraMap.put("fileSize", String.valueOf(afList.get(i).getFileSize()));

				if (i < orgAfList.size()) {

					paraMap.put("approvalFileId", String.valueOf(orgAfList.get(i).getApprovalFileId()));

					if (dao.updateApprovalFile(paraMap) == 0) {
						isUpdate = false;
						return isUpdate;
					}
				} else {
					// 더 많은 애들은 등록한다

					if (dao.insertApprovalFile(paraMap) == 0) {
						isUpdate = false;
						return isUpdate;
					}
				}
			}
		}

		return isUpdate;
	}

	@Override
	public boolean deleteSavedFile(Long fileId) {
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("approvalFileId", String.valueOf(fileId));

		if (dao.deleteApprovalFile(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public ApprovalFileVO getApprovalDocumentFile(Long fileId) {
		return dao.getApprovalDocumentFile(fileId);
	}

	@Override
	public boolean insertOpinion(Map<String, String> paraMap) {

		if (dao.insertOpinion(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteOpinion(Long opinionId) {
		if (dao.deleteOpinion(opinionId) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isReturn(Long approvalId) {
		if (dao.hasReturn(approvalId) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteImportant(Map<String, Long> paraMap) {
		if (dao.deleteImportant(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean insertImportant(Map<String, Long> paraMap) {
		if (dao.insertImportant(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean updateActionOfApproval(Map<String, String> paraMap) {

		if (dao.updateActionOfApproval(paraMap) == 1) {
			if ("3".equals(paraMap.get("status"))) {
				// 반려일 경우

				if (dao.updateApprovalComplete(paraMap) == 1) {

					if (paraMap.get("opinion") != null && !"".equals(paraMap.get("opinion"))) {
						// 의견 내용이 있을 경우
						if (dao.insertOpinion(paraMap) == 1) {
							return true;
						} else {
							return false;
						}
					} else {
						return true;
					}

				} else {
					return false;
				}

			} else if ("2".equals(paraMap.get("status"))) {
				// 승인일 경우

				Map<String, Long> paramMap = new HashMap<>();
				paramMap.put("fk_approvalId", Long.parseLong(paraMap.get("approvalId")));

				if (dao.hasApplicantAndApproverAllAccept(paramMap) == 0) {
					// 모두 승인하였을 경우

					if (dao.updateApprovalComplete(paraMap) == 1) {

						if ("103".equals(paraMap.get("formId"))) {
							// 근무체크 수정 요청

							// 업데이트할 근무정보를 취득한다
							ModifyWorkRequestVO mvo = dao
									.getModifyWorkRequest(Long.parseLong(paraMap.get("approvalId")));
							// 업데이트한다
							for (ModifyDetailVO mdvo : mvo.getModifyDetailList()) {

								if ("수정".equals(mdvo.getRequestType_Kor())) {
									// update

									if (dao.updateWorkHistoryByRequest(mdvo) != 1) {
										return false;
									}

								} else if ("추가".equals(mdvo.getRequestType_Kor())) {
									// insert

									if (dao.insertWorkHistoryByRequest(mdvo) != 1) {
										return false;
									}

								} else {
									// 삭제일 경우
									// delete

									if (dao.deleteWorkHistoryByRequest(mdvo) != 1) {
										return false;
									}
								}
							}

						} else if ("104".equals(paraMap.get("formId"))) {
							// 휴가 신청일 경우 근무내역에 등록시킨다
							DayOffVO dvo = dao.getDayOffSimple(Long.parseLong(paraMap.get("approvalId")));

							ModifyDetailVO mdvo = new ModifyDetailVO();
							mdvo.setEmpId(dvo.getEmpId());
							mdvo.setWorkType("7");
							mdvo.setModifyRequestDateTime(dvo.getDayOffDay());

							if (dao.insertWorkHistoryByRequest(mdvo) != 1) {
								return false;
							}

						}

						if (paraMap.get("opinion") != null && !"".equals(paraMap.get("opinion"))) {
							// 의견 내용이 있을 경우
							if (dao.insertOpinion(paraMap) == 1) {
								return true;
							} else {
								return false;
							}
						} else {
							return true;
						}

					} else {
						return false;
					}
				} else {
					if (paraMap.get("opinion") != null && !"".equals(paraMap.get("opinion"))) {
						if (dao.insertOpinion(paraMap) == 1) {
							return true;
						} else {
							return false;
						}
					} else {
						return true;
					}
				}
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public boolean updateRefRead(Map<String, Long> paraMap) {
		if (dao.updateRefRead(paraMap) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public EmpProofDetailVO getEmpProofDetail(Map<String, Long> paraMap) {
		return dao.getEmpProofDetail(paraMap);
	}


	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean updateRoundRobinApprovalLineSetting(List<ApprovalProcedureVO> updateList, Long approvalId,
			Long procedureType) {
		// 기존의 결재 절차 정보를 가져온다
		List<ApprovalProcedureVO> orgList = new ArrayList<>();

		if (procedureType == 3) {
			// 결재일 경우
			orgList = getProcedureTypeApproval(approvalId);
		} else if (procedureType == 8) {
			// 합의일 경우
			orgList = dao.getProcedureTypeAgree(approvalId);
		} else if (procedureType == 9) {
			// 재무합의일 경우
			orgList = dao.getProcedureTypeFiAgree(approvalId);
		} else {
			return false;
		}

		Map<String, String> paraMap = new HashMap<>();

		boolean check = true;

		paraMap.put("approvalId", String.valueOf(approvalId));
		paraMap.put("procedureType", String.valueOf(procedureType));

		if (orgList.size() == updateList.size()) {
			// 기존 결재자 수와 수정한 결재자 수가 같을 경우


			// insert 시 sequence 값에 더해져서 사용할 수 있도록 한다.
			int seqCnt = 0;

			for (int i = 0; i < updateList.size(); i++) {
				if (!updateList.get(i).getEmpId().equals(orgList.get(i).getEmpId())) {
					// 기존에 있던 결재 절차의 순서대로 일치하면서 empId는 동일하지 않을 경우 (즉, 삭제 및 등록해야할 경우)

					paraMap.put("empId", updateList.get(i).getEmpId());
					paraMap.put("procedureId", String.valueOf(orgList.get(i).getProcedureId()));

					if (dao.deleteApprovalLineSetting(paraMap) == 0) {
						check = false;
						return check;
					} else {
						// 정상적으로 삭제 되었을 경우 등록한다

						// 가장 마지막 sequence 값 얻어오기
						int lastSeq = dao.getApprovalProcedureLastSeq(approvalId);

						paraMap.put("sequence", String.valueOf(lastSeq + (++seqCnt)));

						if (dao.insertApprovalLineSetting(paraMap) == 0) {
							check = false;
							return check;
						}
					}
				}
			}
		} else if (orgList.size() < updateList.size()) {
			// 업데이트할 결재자 수가 더 많을 경우 (insert & update)

			// insert 시 sequence 값에 더해져서 사용할 수 있도록 한다.
			int seqCnt = 0;

			for (int i = 0; i < updateList.size(); i++) {
				paraMap.put("empId", updateList.get(i).getEmpId());

				if (i < orgList.size()) {
					// 아직 기존 결재자 수보다 적은 상태일 경우 (이땐 update를 해야한다)

					if (!updateList.get(i).getEmpId().equals(orgList.get(i).getEmpId())) {
						// 삭제한다

						paraMap.put("procedureId", String.valueOf(orgList.get(i).getProcedureId()));

						if (dao.deleteApprovalLineSetting(paraMap) == 0) {
							check = false;
							return check;
						} else {
							// 정상적으로 삭제 되었을 경우 등록한다
							// 가장 마지막 sequence 값 얻어오기
							int lastSeq = dao.getApprovalProcedureLastSeq(approvalId);

							paraMap.put("sequence", String.valueOf(lastSeq + (++seqCnt)));

							if (dao.insertApprovalLineSetting(paraMap) == 0) {
								check = false;
								return check;
							}
						}
					}

				} else {
					// 기존 결재자수보다 더 커진 상태일 경우 (이땐 insert를 해야한다)

					// 가장 마지막 sequence 값 얻어오기
					int lastSeq = dao.getApprovalProcedureLastSeq(approvalId);
					paraMap.put("sequence", String.valueOf(lastSeq + (++seqCnt)));

					if (dao.insertApprovalLineSetting(paraMap) == 0) {
						check = false;
						return check;
					}
				}

			}

		} else {
			// 업데이트할 결재자 수가 더 적을 경우 (delete)

			// insert 시 sequence 값에 더해져서 사용할 수 있도록 한다.
			int seqCnt = 0;

			for (int i = 0; i < orgList.size(); i++) {
				paraMap.put("procedureId", String.valueOf(orgList.get(i).getProcedureId()));
				if (i < updateList.size()) {
					// 아직 업데이트할 결재자보다 적을 경우 (이땐 update를 해야한다)

					if (!updateList.get(i).getEmpId().equals(orgList.get(i).getEmpId())) {
						paraMap.put("empId", updateList.get(i).getEmpId());

						if (dao.deleteApprovalLineSetting(paraMap) == 0) {
							check = false;
							return check;
						} else {
							// 정상적으로 삭제 되었을 경우 등록한다

							// 가장 마지막 sequence 값 얻어오기
							int lastSeq = dao.getApprovalProcedureLastSeq(approvalId);

							paraMap.put("sequence", String.valueOf(lastSeq + (++seqCnt)));

							if (dao.insertApprovalLineSetting(paraMap) == 0) {
								check = false;
								return check;
							}
						}
					}

				} else {
					// 기존 결재자 수가 업데이트자 수보다 적은 상태일 경우 (이땐 delete를 해야한다)

					paraMap.put("empId", orgList.get(i).getEmpId());

					if (dao.deleteApprovalLineSetting(paraMap) == 0) {
						check = false;
						return check;
					}
				}

			}
		}

		return check;
	}


	@Override
	public List<ApprovalProcedureVO> getProcedureTypeAgree(Long approvalId) {
		return dao.getProcedureTypeAgree(approvalId);
	}

	@Override
	public WorkApplicationVO getWorkApplicationDetail(Long approvalId) {
		return dao.getWorkApplicationDetail(approvalId);
	}

	@Override
	public List<FormVO> getFormNameList() {
		return dao.getFormNameList();
	}

	@Override
	public DayOffVO getDayOffDetail(Long approvalId) {
		return dao.getDayOffDetail(approvalId);
	}

	@Override
	public ModifyWorkRequestVO getModifyWorkRequest(Long approvalId) {
		return dao.getModifyWorkRequest(approvalId);
	}

	@Override
	public int updateReadReturn(Map<String, Long> paraMap) {
		return dao.updateReadReturn(paraMap);
	}

	@Override
	public boolean cancleApproval(Map<String, Long> paraMap) {
		// 기안자가 맞는지 확인하기
		if (isDraftEmp(paraMap) == 1) {
			// 기안자일 경우
			if (dao.cancleApproval(paraMap) == 1) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	@Override
	public int getPreservationYear(Long formId) {
		return dao.getPreservationYear(formId);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public String insertDocumentWrite(Map<String, String[]> paraArrMap, Map<String, String> paraMap) {
		
		paraMap.put("isTemporary", "0");
		
		if (paraMap.get("approvalId") != null) {

			// 프로시저 삭제
			if (dao.deleteApprovalProcedure(paraMap.get("approvalId")) > 0) {
			}
			

			if ("107".equals(paraMap.get("formId"))) {
				// 업무연락일 경우
				
				if (dao.updateApprovalDocument(paraMap) == 1) {
					if (dao.updateBusinessContact(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신 처리
						if (paraArrMap.get("incArr") != null) {
							paraMap.put("refType", "6");

							for (String empId : paraArrMap.get("incArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신참조 처리
						if (paraArrMap.get("incRArr") != null) {
							paraMap.put("refType", "7");
							for (String empId : paraArrMap.get("incRArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}

			} else if ("106".equals(paraMap.get("formId"))) {
				// 회람일 경우
				if (dao.updateApprovalDocument_circular(paraMap) == 1) {
					if (dao.updateCircular(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 회람 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("109".equals(paraMap.get("formId"))) {
				// 재직증명서일 경우

				String userEmpId = paraMap.get("empId");

				if (dao.updateApprovalDocument(paraMap) == 1) {
					if (dao.updateEmpProof(paraMap) == 1) {
						int cnt = 0;

						// 기안 먼저 처리한다
						if (paraArrMap.get("applicationArr") != null) {
							paraMap.put("procedureType", "2");

							for (String empId : paraArrMap.get("applicationArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));

								if (empId.equals(userEmpId)) {
									// 기안자용 설정
									if (dao.insertApplicant(paraMap) != 1) {
										return "";
									}

								} else {
									paraMap.put("empId", empId);
									if (dao.insertApprovalLineSetting(paraMap) != 1) {
										return "";
									}
								}
							}
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "4");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("108".equals(paraMap.get("formId"))) {
				// 품의서일 경우
				if (dao.updateApprovalDocument(paraMap) == 1) {
					if (dao.updateRoundRobin(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 합의
						if (paraArrMap.get("agreeArr") != null) {
							paraMap.put("procedureType", "8");

							for (String empId : paraArrMap.get("agreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 재무합의처리
						if (paraArrMap.get("fiAgreeArr") != null) {
							paraMap.put("procedureType", "9");
							for (String empId : paraArrMap.get("fiAgreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

					}
				}
			}

		} else {
			// 임시저장하지 않았따면

			// 시퀀스값 하나 독점하기
			paraMap.put("approvalId", dao.getApprovalSequence());

			if ("107".equals(paraMap.get("formId"))) {
				// 업무연락일 경우
				if (dao.insertApprovalDocument(paraMap) == 1) {
					if (dao.insertBusinessContact(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신 처리
						if (paraArrMap.get("incArr") != null) {
							paraMap.put("refType", "6");

							for (String empId : paraArrMap.get("incArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신참조 처리
						if (paraArrMap.get("incRArr") != null) {
							paraMap.put("refType", "7");
							for (String empId : paraArrMap.get("incRArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}

			} else if ("106".equals(paraMap.get("formId"))) {
				// 회람일 경우
				if (dao.insertApprovalDocument_circular(paraMap) == 1) {
					if (dao.insertCircular(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 회람 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("109".equals(paraMap.get("formId"))) {
				// 재직증명서일 경우

				String userEmpId = paraMap.get("empId");

				if (dao.insertApprovalDocument(paraMap) == 1) {
					if (dao.insertEmpProof(paraMap) == 1) {
						int cnt = 0;

						// 기안 먼저 처리한다
						if (paraArrMap.get("applicationArr") != null) {
							paraMap.put("procedureType", "2");

							for (String empId : paraArrMap.get("applicationArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));

								if (empId.equals(userEmpId)) {
									// 기안자용 설정
									if (dao.insertApplicant(paraMap) != 1) {
										return "";
									}

								} else {
									paraMap.put("empId", empId);
									if (dao.insertApprovalLineSetting(paraMap) != 1) {
										return "";
									}
								}
							}
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "4");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("108".equals(paraMap.get("formId"))) {
				// 품의서일 경우
				if (dao.insertApprovalDocument(paraMap) == 1) {
					if (dao.insertRoundRobin(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 합의
						if (paraArrMap.get("agreeArr") != null) {
							paraMap.put("procedureType", "8");

							for (String empId : paraArrMap.get("agreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 재무합의처리
						if (paraArrMap.get("fiAgreeArr") != null) {
							paraMap.put("procedureType", "9");
							for (String empId : paraArrMap.get("fiAgreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

					}
				}
			}
		}

		return paraMap.get("approvalId");

	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public String insertTempDocumentWrite(Map<String, String[]> paraArrMap, Map<String, String> paraMap) {
		
		paraMap.put("isTemporary", "1");
		
		
		if (paraMap.get("approvalId") != null) {
			// 임시저장한 거라면
			// 원래 있던 값들 다 지우고 넣어야함

			// 프로시저 삭제
			if (dao.deleteApprovalProcedure(paraMap.get("approvalId")) > 0) {
			}

			if ("107".equals(paraMap.get("formId"))) {
				// 업무연락일 경우

				if (dao.updateApprovalDocument(paraMap) == 1) {
					if (dao.updateBusinessContact(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신 처리
						if (paraArrMap.get("incArr") != null) {
							paraMap.put("refType", "6");

							for (String empId : paraArrMap.get("incArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신참조 처리
						if (paraArrMap.get("incRArr") != null) {
							paraMap.put("refType", "7");
							for (String empId : paraArrMap.get("incRArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}

			} else if ("106".equals(paraMap.get("formId"))) {
				// 회람일 경우
				if (dao.updateApprovalDocument_circular(paraMap) == 1) {
					if (dao.updateCircular(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 회람 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("109".equals(paraMap.get("formId"))) {
				// 재직증명서일 경우

				String userEmpId = paraMap.get("empId");

				if (dao.updateApprovalDocument(paraMap) == 1) {
					if (dao.updateEmpProof(paraMap) == 1) {
						int cnt = 0;

						// 기안 먼저 처리한다
						if (paraArrMap.get("applicationArr") != null) {
							paraMap.put("procedureType", "2");

							for (String empId : paraArrMap.get("applicationArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));

								if (empId.equals(userEmpId)) {
									// 기안자용 설정
									if (dao.insertApplicant(paraMap) != 1) {
										return "";
									}

								} else {
									paraMap.put("empId", empId);
									if (dao.insertApprovalLineSetting(paraMap) != 1) {
										return "";
									}
								}
							}
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "4");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("108".equals(paraMap.get("formId"))) {
				// 품의서일 경우
				if (dao.updateApprovalDocument(paraMap) == 1) {
					if (dao.updateRoundRobin(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 합의
						if (paraArrMap.get("agreeArr") != null) {
							paraMap.put("procedureType", "8");

							for (String empId : paraArrMap.get("agreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 재무합의처리
						if (paraArrMap.get("fiAgreeArr") != null) {
							paraMap.put("procedureType", "9");
							for (String empId : paraArrMap.get("fiAgreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

					}
				}
			}

		} else {
			// 임시저장하지 않았따면

			// 시퀀스값 하나 독점하기
			paraMap.put("approvalId", dao.getApprovalSequence());

			if ("107".equals(paraMap.get("formId"))) {
				// 업무연락일 경우
				if (dao.insertApprovalDocument(paraMap) == 1) {
					if (dao.insertBusinessContact(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신 처리
						if (paraArrMap.get("incArr") != null) {
							paraMap.put("refType", "6");

							for (String empId : paraArrMap.get("incArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

						// 수신참조 처리
						if (paraArrMap.get("incRArr") != null) {
							paraMap.put("refType", "7");
							for (String empId : paraArrMap.get("incRArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}

			} else if ("106".equals(paraMap.get("formId"))) {
				// 회람일 경우
				if (dao.insertApprovalDocument_circular(paraMap) == 1) {
					if (dao.insertCircular(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 회람 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("109".equals(paraMap.get("formId"))) {
				// 재직증명서일 경우

				String userEmpId = paraMap.get("empId");

				if (dao.insertApprovalDocument(paraMap) == 1) {
					if (dao.insertEmpProof(paraMap) == 1) {
						int cnt = 0;

						// 기안 먼저 처리한다
						if (paraArrMap.get("applicationArr") != null) {
							paraMap.put("procedureType", "2");

							for (String empId : paraArrMap.get("applicationArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));

								if (empId.equals(userEmpId)) {
									// 기안자용 설정
									if (dao.insertApplicant(paraMap) != 1) {
										return "";
									}

								} else {
									paraMap.put("empId", empId);
									if (dao.insertApprovalLineSetting(paraMap) != 1) {
										return "";
									}
								}
							}
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "4");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}
					}
				}
			} else if ("108".equals(paraMap.get("formId"))) {
				// 품의서일 경우
				if (dao.insertApprovalDocument(paraMap) == 1) {
					if (dao.insertRoundRobin(paraMap) == 1) {
						int cnt = 0;

						// 기안자 처리한다
						paraMap.put("sequence", String.valueOf(++cnt));
						paraMap.put("procedureType", "1");
						if (dao.insertApplicant(paraMap) != 1) {
							return "";
						}

						// 결재 먼저 처리한다
						if (paraArrMap.get("approvalArr") != null) {
							paraMap.put("procedureType", "3");

							for (String empId : paraArrMap.get("approvalArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 합의
						if (paraArrMap.get("agreeArr") != null) {
							paraMap.put("procedureType", "8");

							for (String empId : paraArrMap.get("agreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 재무합의처리
						if (paraArrMap.get("fiAgreeArr") != null) {
							paraMap.put("procedureType", "9");
							for (String empId : paraArrMap.get("fiAgreeArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.insertApprovalLineSetting(paraMap) != 1) {
									return "";
								}
							}
						}

						// 참조 처리
						if (paraArrMap.get("referArr") != null) {
							paraMap.put("refType", "5");

							for (String empId : paraArrMap.get("referArr")) {
								paraMap.put("sequence", String.valueOf(++cnt));
								paraMap.put("empId", empId);
								if (dao.addRef(paraMap) != 1) {
									return "";
								}
							}
						}

					}
				}
			}
		}

		return paraMap.get("approvalId");
	}

	@Override
	public Long getFormId(Long approvalId) {
		return dao.getFormId(approvalId);
	}

	@Override
	public int batchApproval(BatchVO bvo) {
		return dao.batchApproval(bvo);
	}

	@Override
	public int batchCheck(BatchVO bvo) {
		return dao.batchCheck(bvo);
	}

	@Override
	public int batchDelete(BatchVO bvo) {
		return dao.batchDelete(bvo);
	}
	
	@Override
	public int batchRestore(BatchVO bvo) {
		return dao.batchRestore(bvo);
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean addAppovalAdminManager(Map<String, Long> paraMap) {
		
		Long adminId = dao.getAdminSequence();
		
		paraMap.put("adminId", adminId);
		
		if(dao.addAppovalAdminManager(paraMap) == 1) {
			if(dao.addAdminHistory(paraMap) == 1) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
		
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean deleteAppovalAdminManager(Map<String, Long> paraMap) {
		if(dao.deleteAppovalAdminManager(paraMap) == 1) {
			if(dao.updateAdminHistory(paraMap) == 1) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}

	@Override
	public boolean grantAdminRead(Map<String, Long> paraMap) {
		if(dao.grantAdminRead(paraMap) == 1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<AdminHistoryVO> getAdminHistoryList() {
		return dao.getAdminHistoryList();
	}

	@Override
	public FormVO getFormDetail(Long formId) {
		return dao.getFormDetail(formId);
	}

	@Override
	public List<FormVO> getFormNameListByWrite() {
		return dao.getFormNameListByWrite();
	}

	@Override
	public boolean updateForm(Map<String, String> paraMap) {
		
		if(dao.updateForm(paraMap) == 1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean isReadAble(Map<String, Long> paraMap) {
		if(dao.isReadAble(paraMap) == 1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean isAlreadyAdmin(Long empId) {
		if(dao.isAlreadyAdmin(empId) > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean isExistApproval(Map<String, Long> paraMap) {
		
		if(dao.isExistApproval(paraMap) == 1) {
			return true;
		}else {
			return false;
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<ApprovalVO> getApprovalProgressList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalProgressList_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalScheduleList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalScheduleList_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalCheckList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalCheckList_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalWaitingList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalWaitingList_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalAllIngList_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalAllIngList_withSearchAndPaging(paraMap);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int getTotalCountApprovalAllIngList(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalAllIngList(paraMap);
	}

	@Override
	public int getTotalCountApprovalWaitingList(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalWaitingList(paraMap);
	}

	@Override
	public int getTotalCountApprovalCheckList(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalCheckList(paraMap);
	}

	@Override
	public int getTotalCountApprovalScheduleList(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalScheduleList(paraMap);
	}

	@Override
	public int getTotalCountApprovalProgressList(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalProgressList(paraMap);
	}

	
	
	
	
	
	
	
	
	
	
	@Override
	public List<ApprovalVO> getApprovalAllBox_withSearchAndPaging(Map<String, String> paraMap) {
		List<ApprovalVO> approvalAllBoxList = new ArrayList<>();
		if ("1".equals(paraMap.get("isViewAll"))) {
			approvalAllBoxList = dao.getApprovalAllBox_withViewAllAndSearchAndPaging(paraMap);
		} else {
			approvalAllBoxList = dao.getApprovalAllBox_withSearchAndPaging(paraMap);
		}
		return approvalAllBoxList;
	}

	@Override
	public List<ApprovalVO> getApprovalWriterBox_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalWriterBox_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalApprovalBox_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalApprovalBox_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalReferBox_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalReferBox_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalReadBox_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalReadBox_withSearchAndPaging(paraMap);
	}

	@Override
	public List<ApprovalVO> getApprovalReturnBox_withSearchAndPaging(Map<String, String> paraMap) {
		return dao.getApprovalReturnBox_withSearchAndPaging(paraMap);
	}

	
	
	
	
	
	
	
	
	
	
	
	@Override
	public int getTotalCountApprovalAllBox(Map<String, String> paraMap) {
		
		if ("1".equals(paraMap.get("isViewAll"))) {
			return dao.getTotalCountApprovalAllBox_withViewAll(paraMap);
		} else {
			return dao.getTotalCountApprovalAllBox(paraMap);
		}
	}

	@Override
	public int getTotalCountApprovalWriterBox(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalWriterBox(paraMap);
	}

	@Override
	public int getTotalCountApprovalApprovalBox(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalApprovalBox(paraMap);
	}

	@Override
	public int getTotalCountApprovalReferBox(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalReferBox(paraMap);
	}

	@Override
	public int getTotalCountApprovalReadBox(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalReadBox(paraMap);
	}

	@Override
	public int getTotalCountApprovalReturnBox(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalReturnBox(paraMap);
	}

	@Override
	public int getTotalCountApprovalTempBox(Map<String, String> paraMap) {
		return dao.getTotalCountApprovalTempBox(paraMap);
	}

}
