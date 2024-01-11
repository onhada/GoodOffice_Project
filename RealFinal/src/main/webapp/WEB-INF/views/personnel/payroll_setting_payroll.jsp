<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.css">
<script src="<%=ctxPath%>/resources/js/personnel/jquery.ui.monthpicker.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("button.salaryFormDownload").click(function(){
		$(location).attr('href', '<%=ctxPath%>/personnel/salaryFormDownload.gw');
	})
	
	
	
	$("input#monthPicker").monthpicker({
        monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
            '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        showOn: "both",
        buttonImage: "<%=ctxPath%>/resources/image/icon/calendar.png",
        buttonImageOnly: true,
        changeYear: false,
        yearRange: 'c-2:c+2',
        dateFormat: 'yy-mm'
    });
	
	$("input#monthPicker").monthpicker( "setDate" , '${requestScope.month}' );

	
	$("img.ui-monthpicker-trigger").css({
		'width': '30px',
	    'padding-left': '10px'
		
	});
	
	
	$("input#monthPicker").change(function(){
		// monthPicker에 값 변경 되었을 경우
		$(location).attr('href', '<%=ctxPath%>/personnel/payrollSetting.gw?monthPicker=' + $("input#monthPicker").val());
	})
	
	
	$("input#inputSearchEmp").keyup(function(key){
		if(key.keyCode == 13) {
			let searchWord = $("input#inputSearchEmp").val().trim();
			
			let searchParam = decodeURI(window.location.search);
			searchParam = searchParam.substring(1, searchParam.length);
			
			let searchParamArr = searchParam.split("&");
			
			let hasSearchWord = false;
			
			for(let i = 0 ; i < searchParamArr.length ; i++){
				if(searchParamArr[i].indexOf('searchWord') != -1){
					// searchWord값이 존재할 경우 확인용 플래그
					searchParamArr[i] = 'searchWord=' + searchWord;
					hasSearchWord = true;
					break;
				}
			}
			
			
			if(hasSearchWord){
				$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&'));
			}else{
				if(searchParam.length == 0){
					$(location).attr('href',  origin + window.location.pathname + '?searchWord=' + searchWord);
				}else{
					$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&') + '&searchWord=' + searchWord);
				}
				
			}
			
			
			
			
		}   
	})
	
	
	
	
	
	
	
	
	$("button.updown").click(function(){
		// 기안일 부분 클릭했을 경우
		
		let searchParam = decodeURI(window.location.search);
		searchParam = searchParam.substring(1, searchParam.length);
		
		let searchParamArr = searchParam.split("&");
		
		if($(this).find('span').hasClass("up")){
			// 현재 오름차순일 경우 내림차순이 되도록 한다
			orderType = 'desc';
			
		}else{
			// 현재 내림차순일 경우 오름차순이 되도록 한다
			orderType = 'asc';
		}
		
		let hasOrderType = false;
		
		for(let i = 0 ; i < searchParamArr.length ; i++){
			if(searchParamArr[i].indexOf('orderType') != -1){
				// orderType값이 존재할 경우 확인용 플래그
				searchParamArr[i] = 'orderType=' + orderType;
				hasOrderType = true;
				break;
			}
		}
		
		
		if(hasOrderType){
			$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&'));
		}else{
			if(searchParam.length == 0){
				$(location).attr('href',  origin + window.location.pathname + '?orderType=' + orderType);
			}else{
				$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&') + '&orderType=' + orderType);
			}
			
		}
	})
	
	
	
	
	
	
	
	
	// 급여대장 등록 모달에서 파일 첨부시
	$("input#fileAttach").change(function(){
		$("div.file-placeholder").html($('input#fileAttach')[0].files[0].name).css('color', '#333');

	})
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 급여대장 확정 후 급여대장 다운로드 버튼 눌렀을 경우(엑셀)
	 $("button#toDownloadPayrollExcel").click(function(){
		const frm = document.toDownloadPayrollFrm;
		frm.method = "post";   
		frm.action = "<%=ctxPath%>/personnel/downloadPayroll.gw";  
		frm.submit();  
	  });
	
}) // end of document.ready() ----------------------------------------------------------------------------------------------------------------------






////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 급여 확정
function fixPayroll(salaryId){
	if(confirm("확정하시겠습니까?")){
		// yes일 경우
		
		//ajax
		$.ajax({
			url: "<%=ctxPath%>/personnel/fixPayroll.gw",
			data: { "salaryId": salaryId, "isFix" : 1},
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isFix){
					location.reload();
				}else{
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
				
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
		});
	}
	
}

//급여 확정해제
function unFixPayroll(salaryId){
	if(confirm("확정 해제하시겠습니까?")){
		// yes일 경우
		
		//ajax
		$.ajax({
			url: "<%=ctxPath%>/personnel/fixPayroll.gw",
			data: { "salaryId": salaryId, "isFix" : 0},
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isFix){
					location.reload();
				}else{
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
				
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
		});
	}
	
}


// 급여확정 후 삭제
function deletePayroll(salaryId){
	if(confirm("업로드한 급여대장이 삭제됩니다.\n삭제하시겠습니까?")){
		// yes일 경우
		
		//ajax
		$.ajax({
			url: "<%=ctxPath%>/personnel/deletePayroll.gw",
			data: { "salaryId": salaryId},
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isDelete){
					location.reload();
				}else{
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
				
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
		});
	}
}


// 급여대장 등록 모달 보이기
function showInsertPayrollModal(){
	$("input#modalMonthPicker").val('')
	$("input#inputPayday").val('')
	$("input#inputStartday").val('')
	$("input#inputEndday").val('')
	$("input#fileAttach").val('')
	$("div.file-placeholder").html('급여대장 파일을 선택하세요. (*xlsx)').css('color','#c4c4c4');
	
	$("div#insertPayrollModal").show();
}

//급여대장 등록 하기
function insertPayroll(){
	// 등록전 이미 등록되어있는지 확인한다
	// 값이 다 있는지 확인하기
	// 산정 시작일이 산정 등록일자보다 전인지, 반대도 확인
	
	isCheck = true;
	
	if($("input#modalMonthPicker").val() == '' ){
		alert("귀속월을 선택하세요.")
		isCheck = false;
		return isCheck;
	}else{
		//ajax
		$.ajax({
			url: "<%=ctxPath%>/personnel/isExistThisMonth.gw",
			data: { "month": $("input#modalMonthPicker").val()},
			type: "post",
			async: false,
			dataType: "json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isExist){
					alert("해당 귀속월에는 작성한 급여대장이 있습니다.\n삭제한 후 진행해주세요.")
					isCheck = false;
					return isCheck;
				}
				
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				isCheck = false;
				return isCheck;
			}
		});
	}
	
	if($("input#inputPayday").val() == '' ){
		alert("지급일을 선택하세요.")
		isCheck = false;
		return isCheck;
	}
	
	if($("input#inputStartday").val() == '' ){
		alert("산정 시작일자를 선택하세요.")
		isCheck = false;
		return isCheck;
	}
	
	if($("input#inputEndday").val() == '' ){
		alert("산정 종료일자를 선택하세요.")
		isCheck = false;
		return isCheck;
	}
	
	if($("input#fileAttach").val() == ''){
		// 파일이 첨부되어있다면 등록되어있는지 확인한다
		alert("지정된 파일이 없습니다.")
		isCheck = false;
		return isCheck;
	}
	
	
	if(isCheck){
		let formData = new FormData($("form[name='insertPayrollFrm']").get(0));   // 폼태그에 작성된 모든 데이터 보내기  
		// jQuery선택자.get(0) 은 jQuery 선택자인 jQuery Object 를 DOM(Document Object Model) element 로 바꿔주는 것이다. 
		// DOM element 로 바꿔주어야 순수한 javascript 문법과 명령어를 사용할 수 있게 된다.
		
		// 또는
		// let formData = new FormData(document.getElementById("excel_upload_frm")); // 폼태그에 작성된 모든 데이터 보내기 
		
	    $.ajax({
	          url : "<%=ctxPath%>/personnel/insertPayroll.gw",
	          type : "post",
	          data : formData,
	          processData:false,  // 파일 전송시 설정 
	          contentType:false,  // 파일 전송시 설정 
	          async: false,
	          dataType:"json",
	          success:function(json){
	        	  // console.log("~~~ 확인용 : " + JSON.stringify(json));
	              // ~~~ 확인용 : {"result":1}
	              if(typeof json.isInsert != 'undefined') {
	            	  
	            	  if(json.isInsert){
	            		  // 성공했을 경우
	            		  alert("작성에 성공하였습니다.");
	            		  location.reload();
	                  } else {
	                	  alert("문제가 생겼습니다. 다시 시도 해주십시오.");
	                  }
	              }else{
	            	  // 오류 났으므로 오류난 리스트 보여주기
	            	  
	            	  $("div#insertPayrollModal").hide();
	            	  
	            	  
	            	  let html_errorListData = ``;
	            	  let html_fixedNameList = ``;
	            	  let html_fixedActualList = ``;
	            	  
	            	  for(let i = 0 ; i < json.length ; i++){
	            		  html_errorListData +=
	            			  `<tr class="el-table__row">
									<td rowspan="1" colspan="1" class="el-table_2_column_18 is-center table-col table-name is-hidden table-row el-table__cell">
										<div class="cell">` + (i+1) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_19  table-col table-name is-hidden table-row el-table__cell">
										<div class="cell">
											<span data-v-853a7c46="" class="">` + json[i]['empName'] + `</span>
										</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_20  table-col table-id is-hidden table-row el-table__cell">
										<div class="cell">
											<span data-v-853a7c46="" class="invalid">` + json[i]['id'] + `</span>
										</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_21 is-right table-col table-payments table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['basePay'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_22 is-right table-col table-payments table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['overTimePay'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_23 is-right table-col table-payments table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['nightTimePay'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_24 is-right table-col table-payments table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['holidayPay'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_25 is-right table-col table-payments table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['unUsedAnnualPay'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_26 is-right table-col table-payment-amount table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['totalPay'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_27 is-right table-col table-deduction table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['incomeTax'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_28 is-right table-col table-deduction table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['localTax'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_29 is-right table-col table-deduction table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['nationalPension'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_30 is-right table-col table-deduction table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['healthInsurance'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_31 is-right table-col table-deduction table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['longTermCareInsurance'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_32 is-right table-col table-deduction-amount table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['totalDeduction'].toString()) + `</div>
									</td>
									<td rowspan="1" colspan="1" class="el-table_2_column_33 is-right table-col table-actual-payment-amount is-hidden table-row el-table__cell">
										<div class="cell">` + addComma(json[i]['actualPay'].toString())+ `</div>
									</td>
								</tr>`;
	            		  
								
								
	            		  html_fixedNameList += 
	            			  `<tr class="el-table__row" style="height: 48px;">
									<td rowspan="1" colspan="1" class="el-table_2_column_18 is-center table-col table-name table-row el-table__cell">
									<div class="cell">` + (i+1) + `</div>
								</td>
								<td rowspan="1" colspan="1" class="el-table_2_column_19  table-col table-name table-row el-table__cell">
									<div class="cell">
										<span data-v-853a7c46="" class="">` + json[i]['empName'] + `</span>
									</div>
								</td>
								<td rowspan="1" colspan="1" class="el-table_2_column_20  table-col table-id table-row el-table__cell">
									<div class="cell">
										<span data-v-853a7c46="" class="invalid">` + json[i]['id'] + `</span>
									</div>
								</td>
							</tr>`;
							
							
							
	            		  html_fixedActualList += 
	            			  `<tr class="el-table__row" style="height: 48px;">
									<td rowspan="1" colspan="1" class="el-table_2_column_33 is-right table-col table-actual-payment-amount table-row el-table__cell">
									<div class="cell">` + addComma(json[i]['actualPay'].toString()) + `</div>
								</td>
							</tr>`;
	            	  }
	            	  
	            	  $("tbody#errorListData").html(html_errorListData);
	            	  $("tbody#fixedNameList").html(html_fixedNameList);
	            	  $("tbody#fixedActualList").html(html_fixedActualList);
	            	  
	            	  $("div#errorInsertPayrollModal").show();
	              } 
	            	  
	          },
	          error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			  }
	      });
	}
	
	
	
}

function addComma(value){
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value; 
}

</script>



<div id="router_split_item" class="split-item right" style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-3fa27d9e="" class="setting-tab">
			<div data-v-3fa27d9e="" class="el-tabs el-tabs--top">
				<div class="el-tabs__header is-top">
					<div class="el-tabs__nav-wrap is-top">
						<div class="el-tabs__nav-scroll">
							<div role="tablist" class="el-tabs__nav is-top" style="transform: translateX(0px);">
								<div class="el-tabs__active-bar is-top" style="width: 110px; transform: translateX(0px);"></div>
								<div id="tab-PayrollTab" aria-controls="pane-PayrollTab" role="tab" aria-selected="true" tabindex="0" class="el-tabs__item is-top is-active">급여대장</div>
								<!-- <div id="tab-PaySettingTab" aria-controls="pane-PaySettingTab" role="tab" tabindex="-1" class="el-tabs__item is-top">급여 설정</div> -->
							</div>
						</div>
					</div>
				</div>
				<div class="el-tabs__content">
					<div data-v-3fa27d9e="" role="tabpanel" id="pane-PayrollTab" aria-labelledby="tab-PayrollTab" class="el-tab-pane"></div>
					<div data-v-3fa27d9e="" role="tabpanel" aria-hidden="true" id="pane-PaySettingTab" aria-labelledby="tab-PaySettingTab" class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-df99e578="" data-v-3fa27d9e="" class="container">
				<div data-v-df99e578="" class="information-wrapper">
					<h4 data-v-df99e578="">급여대장 작성</h4>
					<ul data-v-df99e578="">
						<li data-v-df99e578="">급여대장 업로드 양식을 다운로드 받아 직원별 급여 대장을 작성하세요. 일괄 업로드 후 급여를 확정할 수 있습니다.</li>
						<li data-v-df99e578="">대상자 추가 및 수정은 등록된 급여대장 삭제 후, 파일을 수정하여 다시 등록해야합니다.</li>
						<li data-v-df99e578="">확정된 급여대장은 급여지급일에 맞춰 사용자의 급여 메뉴를 통해 급여명세서로 교부됩니다.</li>
					</ul>
					<div data-v-df99e578="">

						<!-- 엑셀 다운되게 -->
						<button data-v-f8d3258e="" data-v-df99e578="" type="button" class="salaryFormDownload hw-button text no-space">
							<!---->
							<span data-v-f8d3258e="" class="label">급여대장입력 양식 다운로드 </span>
							<!---->
						</button>
					</div>
				</div>
				<section data-v-df99e578="" class="payroll-wrapper">
					<div data-v-df99e578="" class="header">
						<div data-v-df99e578="" class="header-left">
							<div data-v-df99e578="" class="month-picker">
								<div data-v-20e681c6="" data-v-df99e578="" class="picker_wrap">
									<input type="text" name="monthPicker" id="monthPicker" readonly="readonly" style="padding-left: 5px; width: 100px;" value="" />
									<!-- <button data-v-20e681c6="" class="hw-icon">
										<i data-v-20e681c6="" class="gi gi-short-arrow-left-alt"></i>
									</button>
									<span data-v-20e681c6="" class="picker_date">2023년 12월</span>
									<button data-v-20e681c6="" class="hw-icon">
										<i data-v-20e681c6="" class="gi gi-short-arrow-right-alt"></i>
									</button> -->
								</div>
							</div>

							<!-- 폼 등록전 -->
							<c:if test="${empty requestScope.salary}">
								<div data-v-1f6af9b4="" data-v-df99e578="" class="status waiting">
									<span data-v-1f6af9b4=""> 작성대기 </span>
								</div>
							</c:if>



							<!-- 폼등록 후 -->
							<c:if test="${not empty requestScope.salary}">
								<!-- 확정 전 -->
								<c:if test="${requestScope.salary.isFix eq 0}">
									<div data-v-1f6af9b4="" data-v-df99e578="" class="status writing">
										<span data-v-1f6af9b4=""> 작성중 </span>
									</div>
								</c:if>

								<!-- 확정 후 -->
								<c:if test="${requestScope.salary.isFix eq 1}">
									<div data-v-1f6af9b4="" data-v-df99e578="" class="status confirm">
										<span data-v-1f6af9b4=""> 급여확정 ${requestScope.registerDay}</span>
									</div>
								</c:if>

							</c:if>
						</div>
						<div data-v-df99e578="" class="header-right">
							<button data-v-f8d3258e="" data-v-df99e578="" type="button" class="hw-button text no-space">
								<!---->
								<span data-v-f8d3258e="" class="label">전자결재 품의연동 </span>
								<!---->
							</button>
						</div>
					</div>









					<!-- 폼등록전 -->
					<c:if test="${empty requestScope.salary}">
						<div data-v-df99e578="" class="summary">
							<div data-v-5440997e="" data-v-df99e578="" class="summary">
								<div data-v-5440997e="" class="empty-payroll">등록된 급여 내역이 없습니다.</div>
							</div>
						</div>
					</c:if>





					<!-- 폼등록 직후 -->
					<c:if test="${not empty requestScope.salary}">

						<div data-v-df99e578="" class="summary">
							<div data-v-5440997e="" data-v-df99e578="" class="summary">
								<div data-v-5440997e="" class="writing-payroll summary-sort">
									<ul data-v-5440997e="">
										<li data-v-5440997e="">
											<span data-v-5440997e="" class="title">산정 기간</span>
											<span data-v-5440997e="" class="content">${requestScope.salary.startDay} ~ ${requestScope.salary.endDay}</span>
										</li>
										<li data-v-5440997e="">
											<span data-v-5440997e="" class="title">급여 지급일</span>
											<span data-v-5440997e="" class="content">${requestScope.salary.payDay}</span>
										</li>
										<li data-v-5440997e="">
											<span data-v-5440997e="" class="title">대상자</span>
											<span data-v-5440997e="" class="content">${fn:length(requestScope.sdList)}명</span>
										</li>
										<li data-v-5440997e="">
											<span data-v-5440997e="" class="title">지급 총액</span>
											<span data-v-5440997e="" class="content">
												<fmt:formatNumber value="${requestScope.salary.totalPay}" pattern="#,###" />
												원
											</span>
										</li>
										<li data-v-5440997e="">
											<span data-v-5440997e="" class="title">공제 총액</span>
											<span data-v-5440997e="" class="content">
												<fmt:formatNumber value="${requestScope.salary.totalDeduction}" pattern="#,###" />
												원
											</span>
										</li>
										<li data-v-5440997e="">
											<span data-v-5440997e="" class="title">실 지급 총액</span>
											<span data-v-5440997e="" class="content">
												<fmt:formatNumber value="${requestScope.salary.actualPay}" pattern="#,###" />
												원
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:if>


					<div data-v-df99e578="" class="actions">

						<!-- 등록 전 -->
						<c:if test="${empty requestScope.salary}">
							<div data-v-41d95e92="" data-v-df99e578="" class="actions">
								<button data-v-f8d3258e="" data-v-41d95e92="" type="button" class="hw-button button-round primary" onclick="showInsertPayrollModal()">
									<!---->
									<span data-v-f8d3258e="" class="label">급여대장 등록 </span>
									<!---->
								</button>
							</div>
						</c:if>





						<!-- 등록 후 -->
						<c:if test="${not empty requestScope.salary}">

							<!-- 확정 전 -->
							<c:if test="${requestScope.salary.isFix eq 0}">
								<div data-v-41d95e92="" data-v-df99e578="" class="actions">
									<button data-v-f8d3258e="" data-v-41d95e92="" type="button" class="hw-button info" onclick="deletePayroll(${requestScope.salary.salaryId})">

										<span data-v-f8d3258e="" class="label">삭제</span>

									</button>
									<button data-v-f8d3258e="" data-v-41d95e92="" type="button" class="hw-button button-round primary" onclick="fixPayroll(${requestScope.salary.salaryId})">

										<span data-v-f8d3258e="" class="label">급여확정</span>

									</button>
								</div>
							</c:if>

							<!-- 확정 후 -->
							<c:if test="${requestScope.salary.isFix eq 1}">
								<div data-v-41d95e92="" data-v-df99e578="" class="actions">
									<button data-v-cde747bc="" data-v-41d95e92="" type="button" class="hu-button pill-shape-outline button-round" onclick="unFixPayroll(${requestScope.salary.salaryId})">

										<span data-v-cde747bc="" class="label">
											<span data-v-3492dd16="" data-v-41d95e92="" class="mr-6" data-v-cde747bc="" style="e9135: #909090;">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16.001" viewBox="0 0 16 16.001">
												<g data-name="Layer 2">
										        	<path data-name="사각형 33993" transform="translate(0 .001)" style="fill:transparent" d="M0 0h16v16H0z"></path>
											        <path data-name="패스 4070" d="M9.517.115A7.51 7.51 0 0 0 1 5.449V1H0v6.366h5.964v-1h-4.15a6.521 6.521 0 1 1 .989 4.72l-.84.541A7.5 7.5 0 1 0 9.516.115z" style="fill:#909090" transform="translate(0 -.001)"></path>
											    </g>
											</svg>
											</span>
											확정해제
										</span>

									</button>
									<button data-v-cde747bc="" data-v-41d95e92="" type="button" class="hu-button button-round primary" id="toDownloadPayrollExcel">
										<span data-v-cde747bc="" class="label">급여대장 다운로드 </span>
									</button>
									<form name="toDownloadPayrollFrm">
										<input type="hidden" name="salaryId" value="${requestScope.salary.salaryId}"/>
									</form>
								</div>
							</c:if>

						</c:if>

					</div>
				</section>





				<c:if test="${not empty requestScope.sdList}">
					<section data-v-df99e578="" class="payroll-list-wrapper">
						<div data-v-df99e578="">
							<div data-v-3a733414="" data-v-df99e578="" class="list">
								<div data-v-3a733414="" class="header">
									<div data-v-3a733414="" class="header-left">
										<span data-v-3a733414="">전체 ${fn:length(requestScope.sdList)}명</span>
									</div>
									<div data-v-3a733414="" class="header-right">
										<!---->
										<div data-v-3a733414="" class="hw-input-group prefix" style="width: 240px;">
											<input placeholder="이름, ID 검색" id="inputSearchEmp" value="${requestScope.searchWord}" class="hw-input">
											<i class="icon fal fa-search"></i>
										</div>
									</div>
								</div>
								<div data-v-3a733414="" class="table-wrapper">
									<div data-v-3a733414="" class="el-table el-table--fit el-table--fluid-height el-table--scrollable-x el-table--enable-row-transition" style="width: 100%; max-height: 500px;">
										<div class="hidden-columns">
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
											<div data-v-3a733414=""></div>
										</div>
										<!-- <div class="el-table__header-wrapper is-scrolling-left">
									</div> -->
										<div class="el-table__body-wrapper is-scrolling-left" style="max-height: 460px;">
											<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 2303px;">
												<colgroup>
													<col name="el-table_3_column_35" width="150">
													<col name="el-table_3_column_36" width="150">
													<col name="el-table_3_column_37" width="200">
													<col name="el-table_3_column_38" width="150">
													<col name="el-table_3_column_39" width="120">
													<col name="el-table_3_column_40" width="120">
													<col name="el-table_3_column_41" width="120">
													<col name="el-table_3_column_42" width="120">
													<col name="el-table_3_column_43" width="153">
													<col name="el-table_3_column_44" width="140">
													<col name="el-table_3_column_45" width="120">
													<col name="el-table_3_column_46" width="120">
													<col name="el-table_3_column_47" width="120">
													<col name="el-table_3_column_48" width="120">
													<col name="el-table_3_column_49" width="120">
													<col name="el-table_3_column_50" width="140">
													<col name="el-table_3_column_51" width="140">
												</colgroup>

												<thead class="has-gutter">
													<tr class="">
														<th colspan="1" rowspan="1" class="el-table_3_column_35  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell">
															<div class="cell">
																<span data-v-3a733414="">이름</span>
																<i data-v-3a733414="" class="sort-icon gis gi-short-arrow-up"></i>
															</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_36  is-center table-col table-id  is-hidden is-leaf table-header el-table__cell">
															<div class="cell">
																<span data-v-3a733414="">ID</span>
																<!---->
															</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_37  is-center table-col table-org  is-leaf table-header el-table__cell">
															<div class="cell">
																<span data-v-3a733414="">소속조직</span>
																<!---->
															</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_38  is-center table-col table-position  is-leaf table-header el-table__cell">
															<div class="cell">
																<span data-v-3a733414="">직위</span>
																<!---->
															</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_39  is-center table-col table-payments  is-leaf table-header el-table__cell">
															<div class="cell">기본급</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_40  is-center table-col table-payments  is-leaf table-header el-table__cell">
															<div class="cell">연장근로 수당</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_41  is-center table-col table-payments  is-leaf table-header el-table__cell">
															<div class="cell">야간근로 수당</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_42  is-center table-col table-payments  is-leaf table-header el-table__cell">
															<div class="cell">휴일근로 수당</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_43  is-center table-col table-payments  is-leaf table-header el-table__cell">
															<div class="cell">미사용 연차 수당</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_44  is-center table-col table-payment-amount  is-leaf table-header el-table__cell">
															<div class="cell">지급 총액</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_45  is-center table-col table-deduction  is-leaf table-header el-table__cell">
															<div class="cell">소득세</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_46  is-center table-col table-deduction  is-leaf table-header el-table__cell">
															<div class="cell">지방소득세</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_47  is-center table-col table-deduction  is-leaf table-header el-table__cell">
															<div class="cell">국민연금</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_48  is-center table-col table-deduction  is-leaf table-header el-table__cell">
															<div class="cell">건강보험</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_49  is-center table-col table-deduction  is-leaf table-header el-table__cell">
															<div class="cell">장기요양보험</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_50  is-center table-col table-deduction-amount  is-leaf table-header el-table__cell">
															<div class="cell">공제 총액</div>
														</th>
														<th colspan="1" rowspan="1" class="el-table_3_column_51  is-center table-col table-actual-payment-amount  is-hidden is-leaf table-header el-table__cell">
															<div class="cell">실 지급액</div>
														</th>
														<th class="el-table__cell gutter" style="width: 0px; display: none;"></th>
													</tr>
												</thead>
												<tbody>

													<c:forEach var="sdVo" items="${requestScope.sdList}">

														<tr class="el-table__row">
															<td rowspan="1" colspan="1" class="el-table_3_column_35  table-col table-name is-hidden table-row el-table__cell">
																<div class="cell">${sdVo.empName}</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_36  table-col table-id is-hidden table-row el-table__cell">
																<div class="cell">${sdVo.id}</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_37  table-col table-org table-row el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">${sdVo.team}</span>
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_38  table-col table-position table-row el-table__cell">
																<div class="cell">${sdVo.positionName}</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_39 is-right table-col table-payments table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.basePay}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_40 is-right table-col table-payments table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.overTimePay}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_41 is-right table-col table-payments table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.nightTimePay}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_42 is-right table-col table-payments table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.holidayPay}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_43 is-right table-col table-payments table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.unUsedAnnualPay}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_44 is-right table-col table-payment-amount table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.totalPay}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_45 is-right table-col table-deduction table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.incomeTax}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_46 is-right table-col table-deduction table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.localTax}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_47 is-right table-col table-deduction table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.nationalPension}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_48 is-right table-col table-deduction table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.healthInsurance}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_49 is-right table-col table-deduction table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.longTermCareInsurance}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_50 is-right table-col table-deduction-amount table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.totalDeduction}" pattern="#,###" />
																</div>
															</td>
															<td rowspan="1" colspan="1" class="el-table_3_column_51 is-right table-col table-actual-payment-amount is-hidden table-row el-table__cell">
																<div class="cell">
																	<fmt:formatNumber value="${sdVo.actualPay}" pattern="#,###" />
																</div>
															</td>
														</tr>
													</c:forEach>
													<!---->
												</tbody>
											</table>
											<!---->
											<!---->
										</div>
										<!---->
										<div class="el-table__fixed" style="width: 300px; bottom: 8px;">
											<div class="el-table__fixed-header-wrapper">
												<table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 2303px;">
													<colgroup>
														<col name="el-table_3_column_35" width="150">
														<col name="el-table_3_column_36" width="150">
														<col name="el-table_3_column_37" width="200">
														<col name="el-table_3_column_38" width="150">
														<col name="el-table_3_column_39" width="120">
														<col name="el-table_3_column_40" width="120">
														<col name="el-table_3_column_41" width="120">
														<col name="el-table_3_column_42" width="120">
														<col name="el-table_3_column_43" width="153">
														<col name="el-table_3_column_44" width="140">
														<col name="el-table_3_column_45" width="120">
														<col name="el-table_3_column_46" width="120">
														<col name="el-table_3_column_47" width="120">
														<col name="el-table_3_column_48" width="120">
														<col name="el-table_3_column_49" width="120">
														<col name="el-table_3_column_50" width="140">
														<col name="el-table_3_column_51" width="140">
													</colgroup>
													<thead class="">
														<tr class="">
															<th colspan="1" rowspan="1" class="el-table_3_column_35  is-center table-col table-name  is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">이름</span>
																	<i data-v-3a733414="" class="sort-icon gis gi-short-arrow-up"></i>
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_36  is-center table-col table-id  is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">ID</span>
																	<!---->
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_37  is-center table-col table-org  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">소속조직</span>
																	<!---->
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_38  is-center table-col table-position  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">직위</span>
																	<!---->
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_39  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">기본급</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_40  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">연장근로 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_41  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">야간근로 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_42  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">휴일근로 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_43  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">미사용 연차 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_44  is-center table-col table-payment-amount  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">지급 총액</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_45  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">소득세</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_46  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">지방소득세</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_47  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">국민연금</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_48  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">건강보험</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_49  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">장기요양보험</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_50  is-center table-col table-deduction-amount  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">공제 총액</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_51  is-center table-col table-actual-payment-amount  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">실 지급액</div>
															</th>
														</tr>
													</thead>
												</table>
											</div>
											<div class="el-table__fixed-body-wrapper" style="top: 40px; max-height: 452px;">
												<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 300px;">
													<colgroup>
														<col name="el-table_3_column_35" width="150">
														<col name="el-table_3_column_36" width="150">
													</colgroup>
													<tbody>


														<c:forEach var="sdVo" items="${requestScope.sdList}">
															<tr class="el-table__row" style="height: 40px;">
																<td rowspan="1" colspan="1" class="el-table_3_column_35  table-col table-name table-row el-table__cell">
																	<div class="cell">${sdVo.empName}</div>
																</td>
																<td rowspan="1" colspan="1" class="el-table_3_column_36  table-col table-id table-row el-table__cell">
																	<div class="cell">${sdVo.id}</div>
																</td>
															</tr>
														</c:forEach>
														<!---->
													</tbody>
												</table>
												<!---->
											</div>
											<!---->
										</div>
										<div class="el-table__fixed-right" style="width: 140px; bottom: 8px;">
											<div class="el-table__fixed-header-wrapper">
												<table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 2303px;">
													<colgroup>
														<col name="el-table_3_column_35" width="150">
														<col name="el-table_3_column_36" width="150">
														<col name="el-table_3_column_37" width="200">
														<col name="el-table_3_column_38" width="150">
														<col name="el-table_3_column_39" width="120">
														<col name="el-table_3_column_40" width="120">
														<col name="el-table_3_column_41" width="120">
														<col name="el-table_3_column_42" width="120">
														<col name="el-table_3_column_43" width="153">
														<col name="el-table_3_column_44" width="140">
														<col name="el-table_3_column_45" width="120">
														<col name="el-table_3_column_46" width="120">
														<col name="el-table_3_column_47" width="120">
														<col name="el-table_3_column_48" width="120">
														<col name="el-table_3_column_49" width="120">
														<col name="el-table_3_column_50" width="140">
														<col name="el-table_3_column_51" width="140">
													</colgroup>
													<thead class="">
														<tr class="">
															<th colspan="1" rowspan="1" class="el-table_3_column_35  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">이름</span>
																	<i data-v-3a733414="" class="sort-icon gis gi-short-arrow-up"></i>
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_36  is-center table-col table-id  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">ID</span>
																	<!---->
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_37  is-center table-col table-org  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">소속조직</span>
																	<!---->
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_38  is-center table-col table-position  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">
																	<span data-v-3a733414="">직위</span>
																	<!---->
																</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_39  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">기본급</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_40  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">연장근로 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_41  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">야간근로 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_42  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">휴일근로 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_43  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">미사용 연차 수당</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_44  is-center table-col table-payment-amount  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">지급 총액</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_45  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">소득세</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_46  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">지방소득세</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_47  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">국민연금</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_48  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">건강보험</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_49  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">장기요양보험</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_50  is-center table-col table-deduction-amount  is-hidden is-leaf table-header el-table__cell">
																<div class="cell">공제 총액</div>
															</th>
															<th colspan="1" rowspan="1" class="el-table_3_column_51  is-center table-col table-actual-payment-amount  is-leaf table-header el-table__cell">
																<div class="cell">실 지급액</div>
															</th>
														</tr>
													</thead>
												</table>
											</div>
											<div class="el-table__fixed-body-wrapper" style="top: 40px; max-height: 452px;">
												<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 140px;">
													<colgroup>
														<col name="el-table_3_column_51" width="140">
													</colgroup>
													<tbody>

														<c:forEach var="sdVo" items="${requestScope.sdList}">
															<tr class="el-table__row" style="height: 40px;">
																<td rowspan="1" colspan="1" class="el-table_3_column_51 is-right table-col table-actual-payment-amount table-row el-table__cell">
																	<div class="cell">
																		<fmt:formatNumber value="${sdVo.actualPay}" pattern="#,###" />
																	</div>
																</td>
															</tr>
															<tr class="el-table__row" style="height: 40px;">
																<td rowspan="1" colspan="1" class="el-table_3_column_51 is-right table-col table-actual-payment-amount table-row el-table__cell">
																	<div class="cell">
																		<fmt:formatNumber value="${sdVo.actualPay}" pattern="#,###" />
																	</div>
																</td>
															</tr>
														</c:forEach>
														<!---->
													</tbody>
												</table>
												<!---->
											</div>
											<!---->
										</div>
										<div class="el-table__fixed-right-patch" style="width: 0px; height: 40px;"></div>
										<div class="el-table__column-resize-proxy" style="display: none;"></div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</c:if>
			</div>
		</div>
	</div>
</div>
