package com.spring.app.common.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.app.common.domain.EmployeeVO;

@Repository
public class CommonDAO_imple implements CommonDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;

	
	// === 로그인 처리하기 === //
	@Override
	public EmployeeVO getLoginMember(Map<String, Object> paraMap) {
		EmployeeVO loginuser = sqlsession.selectOne("common.getLoginMember", paraMap);
		return loginuser;
	}


	
	
}
