
package com.spring.app.admin.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.app.admin.domain.BatchModifyUserVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.DepartmentVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.common.domain.PositionVO;

/**
 *   @FileName  : AdminDAO_imple.java 
 * 
 * @Project   : TempFinal 
 * @Date      : 2023. 12. 5 
 * @작성자      : 신예진 
 * @변경이력 : 
 * @프로그램설명 : 
 */

@Repository
public class AdminDAO_imple implements AdminDAO {

	@Resource
	private SqlSessionTemplate sqlSession;

	@Override
	public List<DepartmentVO> getDepList() {
		return sqlSession.selectList("admin.getDepList");
	}

	@Override
	public List<PositionVO> getPositionList() {
		return sqlSession.selectList("admin.getPositionList");
	}

	@Override
	public int isExistId(String id) {
		return sqlSession.selectOne("admin.isExistId", id);
	}

	@Override
	public int insertUser(EmployeeVO evo) {
		return sqlSession.insert("admin.insertUser", evo);
	}

	@Override
	public List<EmployeeVO> getEmployeeList_withSearchAndPaging(Map<String, String> paraMap) {
		return sqlSession.selectList("admin.getEmployeeList_withSearchAndPaging", paraMap);
	}

	@Override
	public int getTotalCountEmployeeList(Map<String, String> paraMap) {
		return sqlSession.selectOne("admin.getTotalCountEmployeeList", paraMap);
	}

	@Override
	public int batchWorkType(BatchModifyUserVO bvo) {
		return sqlSession.update("admin.batchWorkType", bvo);
	}

	@Override
	public int batchPosition(BatchModifyUserVO bvo) {
		return sqlSession.update("admin.batchPosition", bvo);
	}

	@Override
	public int batchStatus(BatchModifyUserVO bvo) {
		return sqlSession.update("admin.batchStatus", bvo);
	}

	@Override
	public List<AdminVO> getFullAdminList() {
		return sqlSession.selectList("admin.getFullAdminList");
	}

	@Override
	public List<EmployeeVO> getNoneFullAdminEmployeeList(String searchWord) {
		return sqlSession.selectList("admin.getNoneFullAdminEmployeeList", searchWord);
	}


	@Override
	public int isAlreadyAdmin(Map<String, Long> empMap) {
		return sqlSession.selectOne("admin.isAlreadyAdmin", empMap);
	}

	@Override
	public int deleteAdminByEmpId(Map<String, Long> empMap) {
		return sqlSession.update("admin.deleteAdminByEmpId", empMap);
	}

	@Override
	public int updateAdminHistoryByEmpId(Map<String, Long> empMap) {
		return sqlSession.update("admin.updateAdminHistoryByEmpId", empMap);
	}



}
