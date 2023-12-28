package com.spring.app.reservation.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/** 
* @FileName  : ReservationDAO_imple.java 
* @Project   : TempFinal 
* @Date      : Dec 28, 2023 
* @작성자      : hada 
* @변경이력    : 
* @프로그램설명    : Repository(DAO) 선언
*/
@Repository
public class ReservationDAO_imple implements ReservationDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	
	
}
