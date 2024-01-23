package com.spring.app.personnel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;

import com.spring.app.approval.domain.AdminHistoryVO;
import com.spring.app.approval.domain.FormVO;
import com.spring.app.common.domain.AdminVO;
import com.spring.app.common.domain.EmployeeVO;
import com.spring.app.personnel.domain.SalaryDetailVO;
import com.spring.app.personnel.domain.SalaryVO;
import com.spring.app.personnel.domain.WorkhistoryVO;
import com.spring.app.personnel.model.PersonnelDAO;

 
@Service
public class PersonnelService_imple implements PersonnelService {

	
	@Autowired  //Type에 따라 알아서 Bean 을 주입해준다.
	private PersonnelDAO dao;
	
	
	 


	 
	@Override
	public String sysdate_get() {

		//현재 날짜 가져오기
		String sysdate_get=dao.sysdate_get();
		return sysdate_get;
	}


	 


	@Override
	public String year_hour(Map<String, String> paraMapYear) {

		String year_hour= dao.year_hour( paraMapYear);
		
		return year_hour;
	}


	 
	@Override
	public List<WorkhistoryVO> workhistory_print(Map<String, String> paraMap) {
		
		
		List<WorkhistoryVO> workhistoryList= dao.workhistory_print( paraMap );
		return workhistoryList;
	}


	/**
	 *현재 근무현황 추가
	 */
	@Override
	public int workhistory_insert(Map<String, String> paraMap) {
		int n= dao.workhistory_insert( paraMap);
		return n;
	}


	@Override
	public List<EmployeeVO> personnel_search_name(String empName) {
		 List<EmployeeVO> evo =dao.personnel_search_name( empName);
		return evo;
	}


	@Override
	public String personnel_selct_empid(String empid) {
		String name=dao.personnel_selct_empid(empid);
		return name;
	}


	@Override
	public String vaction_cnt(String empid) {
		
		String cnt=dao.vaction_cnt(empid);
		
		return cnt;
	}


	@Override
	public int va_approval_insert(String empid) {
		int va_approval_insert=dao.va_approval_insert(empid);
		return va_approval_insert;
	}


	@Override
	public int va_dayoff_insert(Map<String, String> paraMap) {
		int va_dayoff_insert=dao.va_dayoff_insert(paraMap);
		return va_dayoff_insert;
	}


	@Override
	public int procedure_insert(Map<String, String> paraMaps) {
		int procedure_insert=dao.procedure_insert(paraMaps);
		return procedure_insert;
	}


	@Override
	public String tardy_cnt(String empid) {
		String tardy_cnt=dao.tardy_cnt(empid);
		return tardy_cnt;
	}


	@Override
	public String early_work_cnt(String empid) {
		String early_work_cnt=dao.early_work_cnt(empid);
		return early_work_cnt;
	}


	@Override
	public String not_leave_work(String empid) {
		String not_leave_work=dao.not_leave_work(empid);
		return not_leave_work;
	}


	@Override
	public String workday_cnt(String empid) {
		String workday_cnt=dao.workday_cnt(empid);
		return workday_cnt;
	}


	@Override
	public String absenteeism(String empid) {
		String absenteeism=dao.absenteeism(empid);
		return absenteeism;
	}


	@Override
	public int mowork_approval_insert(String empid) {
		int mowork_approval_insert=dao.mowork_approval_insert(empid);
		return mowork_approval_insert;
	}


	@Override
	public int work_modify_add_insert(Map<String, String> paraMaps) {
		int work_modify_add_insert=dao.work_modify_add_insert(paraMaps);
		return work_modify_add_insert;
	}


	@Override
	public int work_modify_del_insert(Map<String, String> paraMaps) {
		int work_modify_del_insert=dao.work_modify_del_insert(paraMaps);
		return work_modify_del_insert;
	}


	@Override
	public int work_modify_edit_insert(Map<String, String> paraMaps) {
		int work_modify_edit_insert=dao.work_modify_edit_insert(paraMaps);
		return work_modify_edit_insert;
	}


	@Override
	public String avg_hour(Map<String, String> paraMapYear) {
		String avg_hour=dao.avg_hour(paraMapYear);
		return avg_hour;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 예진 코드 시작 -------------------------------------------------------------------------------------
	
	
	
	@Override
	public List<FormVO> getFormList() {
		return dao.getFormList();
	}

	@Override
	public List<AdminVO> getAdminList() {
		return dao.getAdminList();
	}

	@Override
	public List<AdminHistoryVO> getAdminHistoryList() {
		return dao.getAdminHistoryList();
	}

	@Override
	public SalaryVO isExistPayrollThisMonth(String month) {
		return dao.isExistPayrollThisMonth(month);
	}

	@Override
	public List<SalaryDetailVO> getSalaryDetail_withSearch(Map<String, String> paraMap) {
		return dao.getSalaryDetail_withSearch(paraMap);
	}

	@Override
	public boolean fixPayroll(Map<String, String> paraMap) {
		if (dao.fixPayroll(paraMap) == 1) {
			return true;
		} else {
			return false;
		}

	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean deletePayroll(Long salaryId) {
		if (dao.deleteSalaryDetail(salaryId) > 0) {
			if (dao.deleteSalary(salaryId) == 1) {
				return true;
			} else {
				return false;
			}

		} else {
			return false;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = {
			Throwable.class })
	@Override
	public boolean insertPayroll(List<SalaryDetailVO> paraList, SalaryVO svo) {
		boolean isInsert = true;

		try {
			int insertCnt = 0;
			// 급여 등록
			if (dao.insertSalary(svo) == 1) {
				// 급여 등록 되었을 경우 급여 정보를 등록한다

				for (SalaryDetailVO sdvo : paraList) {
					sdvo.setSalaryId(svo.getSalaryId());

					if (dao.insertSalaryDetail(sdvo) != 1) {
						// 급여 정보 등록 에러 났을 경우 롤백
						throw new Exception();
					} else {
						insertCnt++;
					}
				}

			} else {
				isInsert = false;
			}

			// 둘중 하나에서 에러 발생시 강제로 에러발생시켜 롤백 시킴
			if (insertCnt != paraList.size()) {
				throw new Exception();
			}

		} catch (Exception e) {
			isInsert = false;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return isInsert;
	}

	@Override
	public Long getSalarySequence() {
		return dao.getSalarySequence();
	}

	@Override
	public Long isExistEmployee(SalaryDetailVO sdvo) {
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("id", sdvo.getId());
		paraMap.put("empName", sdvo.getEmpName());
		return dao.getEmpId(paraMap);
	}

	@Override
	public void payrollToExcel(String salaryId, Model model) {
		// === 조회결과물인 empList 를 가지고 엑셀 시트 생성하기 ===
		// 시트를 생성하고, 행을 생성하고, 셀을 생성하고, 셀안에 내용을 넣어주면 된다.

		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트생성
		SXSSFSheet sheet = workbook.createSheet("급여대장");

		// 시트 열 너비 설정
		sheet.setColumnWidth(0, 2000);
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(2, 4000);
		sheet.setColumnWidth(3, 4000);
		sheet.setColumnWidth(4, 4000);
		sheet.setColumnWidth(5, 4000);
		sheet.setColumnWidth(6, 4000);
		sheet.setColumnWidth(7, 4000);
		sheet.setColumnWidth(8, 4000);
		sheet.setColumnWidth(9, 4000);
		sheet.setColumnWidth(10, 4000);
		sheet.setColumnWidth(11, 4000);
		sheet.setColumnWidth(12, 4000);
		sheet.setColumnWidth(13, 4000);
		sheet.setColumnWidth(14, 4000);
		sheet.setColumnWidth(15, 4000);
		sheet.setColumnWidth(16, 4000);
		sheet.setColumnWidth(17, 4000);

		// 행의 위치를 나타내는 변수
		int rowLocation = 0;

		////////////////////////////////////////////////////////////////////////////////////////
		
		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		// CellStyle 배경색(ForegroundColor)만들기
		mergeRowStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex()); // IndexedColors.DARK_BLUE.getIndex()
																					// 는 색상(남색)의 인덱스값을 리턴시켜준다.
		mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex()); // IndexedColors.LIGHT_YELLOW.getIndex()
																					// 는 연한노랑의 인덱스값을 리턴시켜준다.
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// CellStyle 천단위 쉼표, 금액
		CellStyle moneyStyle = workbook.createCellStyle();
		moneyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));

		// Cell 폰트(Font) 설정하기
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; 으로 한다.
		mergeRowFont.setFontName("나눔고딕");
		mergeRowFont.setFontHeight((short) 500);
		mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
		mergeRowFont.setBold(true);

		mergeRowStyle.setFont(mergeRowFont);

		// CellStyle 테두리 Border
		headerStyle.setBorderTop(BorderStyle.THICK);
		headerStyle.setBorderBottom(BorderStyle.THICK);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);

		// Cell Merge 셀 병합시키기
		// 병합할 행 만들기
		Row mergeRow = sheet.createRow(rowLocation); // 엑셀에서 행의 시작은 0 부터 시작한다.

		
		// 값 가져오기
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchWord", "");
		paraMap.put("salaryId", salaryId);
		
		SalaryVO svo = dao.getSalary(salaryId);
		List<SalaryDetailVO> sdList = dao.getSalaryDetail_withSearch(paraMap);
		
		
		// 병합할 행에 "우리회사 사원정보" 로 셀을 만들어 셀에 스타일을 주기
		for (int i = 0; i < 17; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle);
			cell.setCellValue(svo.getMonth() + " 급여대장");
		} // end of for-------------------------

		// 셀 병합하기
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 17)); // 시작 행, 끝 행, 시작 열, 끝 열
		////////////////////////////////////////////////////////////////////////////////////////////////

		// 헤더 행 생성
		Row headerRow = sheet.createRow(++rowLocation); // 엑셀에서 행의 시작은 0 부터 시작한다.
														// ++rowLocation는 전위연산자임.

		// 해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0); // 엑셀에서 열의 시작은 0 부터 시작한다.
		headerCell.setCellValue("No");
		headerCell.setCellStyle(headerStyle);
				
		// 해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1); // 엑셀에서 열의 시작은 0 부터 시작한다.
		headerCell.setCellValue("이름");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 세번째 열 셀 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("ID");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("소속조직");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 다섯번째 열 셀 생성
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("직위");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 여섯번째 열 셀 생성
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("기본급");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 일곱번째 열 셀 생성
		headerCell = headerRow.createCell(6);
		headerCell.setCellValue("연장근로 수당");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 여덟번째 열 셀 생성
		headerCell = headerRow.createCell(7);
		headerCell.setCellValue("야간근로 수당");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 아홉번째 열 셀 생성
		headerCell = headerRow.createCell(8);
		headerCell.setCellValue("휴일근무 수당");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열번째 열 셀 생성
		headerCell = headerRow.createCell(9);
		headerCell.setCellValue("미사용 연차 수당");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열한번째 열 셀 생성
		headerCell = headerRow.createCell(10);
		headerCell.setCellValue("지급 총액");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열두번째 열 셀 생성
		headerCell = headerRow.createCell(11);
		headerCell.setCellValue("소득세");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열세번째 열 셀 생성
		headerCell = headerRow.createCell(12);
		headerCell.setCellValue("지방소득세");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열네번째 열 셀 생성
		headerCell = headerRow.createCell(13);
		headerCell.setCellValue("국민연금");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열다섯번째 열 셀 생성
		headerCell = headerRow.createCell(14);
		headerCell.setCellValue("건강보험");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열여섯번째 열 셀 생성
		headerCell = headerRow.createCell(15);
		headerCell.setCellValue("장기요양보험");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열일곱번째 열 셀 생성
		headerCell = headerRow.createCell(16);
		headerCell.setCellValue("공제 총액");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 열여덟번째 열 셀 생성
		headerCell = headerRow.createCell(17);
		headerCell.setCellValue("실 지급액");
		headerCell.setCellStyle(headerStyle);

		Row bodyRow = null;
		Cell bodyCell = null;

		for (int i = 0; i < sdList.size(); i++) {

			// 행생성
			bodyRow = sheet.createRow(i + (rowLocation + 1));

			// 데이터 부서번호 표시
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue((i+1));

			// 데이터 부서명 표시
			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(sdList.get(i).getEmpName());

			// 데이터 사원번호 표시
			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(sdList.get(i).getId());

			// 데이터 사원명 표시
			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(sdList.get(i).getTeam());

			// 데이터 입사일자 표시
			bodyCell = bodyRow.createCell(4);
			bodyCell.setCellValue(sdList.get(i).getPositionName());

			// 데이터 월급 표시
			bodyCell = bodyRow.createCell(5);
			bodyCell.setCellValue(sdList.get(i).getBasePay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(6);
			bodyCell.setCellValue(sdList.get(i).getOverTimePay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(7);
			bodyCell.setCellValue(sdList.get(i).getNightTimePay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(8);
			bodyCell.setCellValue(sdList.get(i).getHolidayPay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(9);
			bodyCell.setCellValue(sdList.get(i).getUnUsedAnnualPay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(10);
			bodyCell.setCellValue(sdList.get(i).getTotalPay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(11);
			bodyCell.setCellValue(sdList.get(i).getIncomeTax());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(12);
			bodyCell.setCellValue(sdList.get(i).getLocalTax());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(13);
			bodyCell.setCellValue(sdList.get(i).getNationalPension());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(14);
			bodyCell.setCellValue(sdList.get(i).getHealthInsurance());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(15);
			bodyCell.setCellValue(sdList.get(i).getLongTermCareInsurance());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(16);
			bodyCell.setCellValue(sdList.get(i).getTotalDeduction());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(17);
			bodyCell.setCellValue(sdList.get(i).getActualPay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액


		} // end of for------------------------------

		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", svo.getMonth() + " 급여대장");

	}

	@Override
	public List<SalaryVO> getSalaryByYear(Map<String, String> paraMap) {
		return dao.getSalaryByYear(paraMap);
	}

	@Override
	public SalaryVO getSalary(String salaryId) {
		return dao.getSalary(salaryId);
	}

	@Override
	public SalaryDetailVO getSalaryDetailBySalaryIdAndEmpId(Map<String, String> paraMap) {
		return dao.getSalaryDetailBySalaryIdAndEmpId(paraMap);
	}

	@Override
	public void privatePayrollToExcel(Map<String, String> paraMap, Model model) {
		// === 조회결과물인 empList 를 가지고 엑셀 시트 생성하기 ===
		// 시트를 생성하고, 행을 생성하고, 셀을 생성하고, 셀안에 내용을 넣어주면 된다.

		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트생성
		SXSSFSheet sheet = workbook.createSheet("급여명세서");

		// 시트 열 너비 설정
		sheet.setColumnWidth(0, 2000);
		sheet.setColumnWidth(1, 4000);
		sheet.setColumnWidth(2, 4000);
		sheet.setColumnWidth(3, 4000);
		sheet.setColumnWidth(4, 4000);
		sheet.setColumnWidth(5, 4000);
		sheet.setColumnWidth(6, 4000);

		// 행의 위치를 나타내는 변수
		int rowLocation = 0;

		////////////////////////////////////////////////////////////////////////////////////////

		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		// import org.apache.poi.ss.usermodel.VerticalAlignment 으로 해야함.

		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		// CellStyle 배경색(ForegroundColor)만들기
		mergeRowStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex()); // IndexedColors.DARK_BLUE.getIndex()
																					// 는 색상(남색)의 인덱스값을 리턴시켜준다.
		mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex()); // IndexedColors.LIGHT_YELLOW.getIndex()
																					// 는 연한노랑의 인덱스값을 리턴시켜준다.
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// CellStyle 천단위 쉼표, 금액
		CellStyle moneyStyle = workbook.createCellStyle();
		moneyStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));

		// Cell 폰트(Font) 설정하기
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; 으로 한다.
		mergeRowFont.setFontName("나눔고딕");
		mergeRowFont.setFontHeight((short) 500);
		mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
		mergeRowFont.setBold(true);

		mergeRowStyle.setFont(mergeRowFont);

		// CellStyle 테두리 Border
		headerStyle.setBorderTop(BorderStyle.THICK);
		headerStyle.setBorderBottom(BorderStyle.THICK);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);

		// Cell Merge 셀 병합시키기
		Row mergeRow = sheet.createRow(rowLocation); // 엑셀에서 행의 시작은 0 부터 시작한다.

		List<SalaryVO> svoList = dao.getSalaryByYear(paraMap);
		
		for (int i = 0; i < 6; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle);
			cell.setCellValue(paraMap.get("year") + "년 급여명세서");
		} // end of for-------------------------

		// 셀 병합하기
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 5)); // 시작 행, 끝 행, 시작 열, 끝 열
		////////////////////////////////////////////////////////////////////////////////////////////////

		// 헤더 행 생성
		Row headerRow = sheet.createRow(++rowLocation); // 엑셀에서 행의 시작은 0 부터 시작한다.
														// ++rowLocation는 전위연산자임.

				
		// 해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0); // 엑셀에서 열의 시작은 0 부터 시작한다.
		headerCell.setCellValue("귀속연월");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("산정 기간");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 세번째 열 셀 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("지급일");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("지급 총액");
		headerCell.setCellStyle(headerStyle);

		// 해당 행의 다섯번째 열 셀 생성
		headerCell = headerRow.createCell(4);
		headerCell.setCellValue("공제 총액");
		headerCell.setCellStyle(headerStyle);
		
		// 해당 행의 여섯번째 열 셀 생성
		headerCell = headerRow.createCell(5);
		headerCell.setCellValue("실 지급일");
		headerCell.setCellStyle(headerStyle);
		

		Row bodyRow = null;
		Cell bodyCell = null;

		for (int i = 0; i < svoList.size(); i++) {

			// 행생성
			bodyRow = sheet.createRow(i + (rowLocation + 1));

			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(svoList.get(i).getMonth());

			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(svoList.get(i).getStartDay() + " ~ " + svoList.get(i).getEndDay());

			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(svoList.get(i).getPayDay());

			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(svoList.get(i).getTotalPay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(4);
			bodyCell.setCellValue(svoList.get(i).getTotalDeduction());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액
			
			bodyCell = bodyRow.createCell(5);
			bodyCell.setCellValue(svoList.get(i).getActualPay());
			bodyCell.setCellStyle(moneyStyle); // 천단위 쉼표, 금액


		} // end of for------------------------------

		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", paraMap.get("year") + "년 급여명세서");		
	}

	// 예진 코드 끝 --------------------------------------------------------------------------------------



 
	 

}
