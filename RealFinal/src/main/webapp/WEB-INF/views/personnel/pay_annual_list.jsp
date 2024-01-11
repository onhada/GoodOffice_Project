<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/js/personnel/yearpicker.js"></script>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/yearpicker.css">








<script>
$(document).ready(function() {
	$("input#yearpicker").yearpicker({
		// Initial Year
		year : Number('${requestScope.year}'),
		// Start Year 수정필
		startYear : null,
		// End Year
		endYear : null,
		// Element tag
		itemTag : 'li',
		// Default CSS classes
		selectedClass : 'selected',
		onChange: function(value){
			  $(location).attr('href', '<%=ctxPath%>/personnel/payAnnualList.gw?year=' + value);
		}
	});
	
	

	$("div.yearpicker-container").css('top', '123px');
	
	$("button#downloadPrivatePayrollExcelBtn").click(function(){
		const frm = document.yearFrm;
		frm.method = "post";   
		frm.action = "<%=ctxPath%>/personnel/downloadPrivatePayroll.gw";  
		frm.submit();  
		
	})
	
	
	
	
	$("button#order").click(function(){
		// 기안일 부분 클릭했을 경우
		
		let searchParam = decodeURI(window.location.search);
		searchParam = searchParam.substring(1, searchParam.length);
		
		let searchParamArr = searchParam.split("&");
		
		if($(this).find('i').hasClass("gi-short-arrow-up")){
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

})




function showDetailPrivatePayrollModal(salaryId){
	// 급여명세서 보기 버튼 눌렀을 경우
	
	//ajax
	$.ajax({
		url: "<%=ctxPath%>/personnel/detailPrivatePayroll.gw",
		data: { "salaryId": salaryId},
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			console.log(JSON.stringify(text));
			if(text.isExist){
				
				$("section.detailMonth").html(text.month + ' 급여명세서');
				$("div.detailEmpName").html(text.empName);
				$("div.detailTeam").html(text.team);
				$("div.detailPayday").html(text.payDay);
				$("div.detailStartEndDay").html(text.startDay + ' ~ ' + text.endDay);
				
				$("td.detailBasePay").html(addComma(String(text.basePay)))
				$("td.detailOverTimePay").html(addComma(String(text.overTimePay)))
				$("td.detailNightTimePay").html(addComma(String(text.nightTimePay)))
				$("td.detailHolidayPay").html(addComma(String(text.holidayPay)))
				$("td.detailUnUsedAnnualPay").html(addComma(String(text.unUsedAnnualPay)))
				$("td.detailTotalPay").html(addComma(String(text.totalPay)))
				
				$("td.detailIncomeTax").html(addComma(String(text.incomeTax)))
				$("td.detailLocalTax").html(addComma(String(text.localTax)))
				$("td.detailNationalPension").html(addComma(String(text.nationalPension)))
				$("td.detailHealthInsurance").html(addComma(String(text.healthInsurance)))
				$("td.detailLongTermCareInsurance").html(addComma(String(text.longTermCareInsurance)))
				$("td.detailTotalDeduction").html(addComma(String(text.totalDeduction)))
				
				$("span.detailActualPay").html(addComma(String(text.actualPay)))
				
			}else{
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
			
		},
		error: function(request, status, error) {
			alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
		}
	});
	
	$("div#detailPrivatePayrollModal").show();
}



function addComma(value){
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value; 
}
</script>



<div id="router_split_item" class="split-item right" style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-26d0ffb2="">
			<h2 data-v-26d0ffb2="" class="section-main-header mb-30">급여</h2>
			<section data-v-9252af6e="" data-v-26d0ffb2="" class="mb-30 mt-30">
				<form name="yearFrm">
					<div data-v-9252af6e="" class="section-content">

						<div data-v-6443cae4="" data-v-9252af6e="" class="picker_wrap">
							<input type="text" class="yearpicker" id="yearpicker" name="year" value="${requestScope.year}" readonly="readonly" style="width: 150px;text-align: center;font-size: 24px; border: 1px solid #d6d6d6;border-radius: 50px;" />
							<input type="hidden" name="orderType" value="${requestScope.orderType}" />
							<!-- <button data-v-6443cae4="" class="hw-icon">
								<i data-v-6443cae4="" class="gi gi-short-arrow-left-alt"></i>
							</button>
							<span data-v-6443cae4="" class="picker_date">2023년</span>
							<button data-v-6443cae4="" class="hw-icon">
								<i data-v-6443cae4="" class="gi gi-short-arrow-right-alt"></i>
							</button> -->
						</div>
						<div data-v-9252af6e="" class="d-flex justify-content-between mt-15 mb-15">
							<!-- <div data-v-9252af6e="" class="d-flex align-items-center">
								<label data-v-5eae55e0="" data-v-9252af6e="" class="hu-checkbox-wrapper ml-17">
									<div data-v-5eae55e0="" class="hu-checkbox">
										<span data-v-5eae55e0="" class="checkbox-input"></span>
										<input data-v-5eae55e0="" type="checkbox" checked="checked" class="checkbox-original">
										<span data-v-5eae55e0="" class="title"></span>
									</div>
								</label>
								<span data-v-9252af6e="" class="primary-color ml-10"></span>
								<span data-v-9252af6e="" class="font-size-15">모두</span>
							</div> -->
							<c:if test="${not empty requestScope.svoList}">
								<div data-v-9252af6e="" class="d-flex align-items-center" style="display: table !important; margin-left: auto;">
									<button data-v-9252af6e="" class="el-tooltip excel-button" type="button" id="downloadPrivatePayrollExcelBtn" aria-describedby="el-tooltip-558" tabindex="0">
										<img data-v-9252af6e="" src="https://static.hiworks.com/hr/svg/xls.svg" alt="download excel">
									</button>
								</div>
							</c:if>
						</div>

					</div>
				</form>
				<table data-v-9252af6e="" class="setting-table center">
					<colgroup data-v-9252af6e="">
						<col data-v-9252af6e="" style="width: 13%;">
						<col data-v-9252af6e="" style="width: 25%;">
						<col data-v-9252af6e="">
						<col data-v-9252af6e="">
						<col data-v-9252af6e="">
						<col data-v-9252af6e="">
					</colgroup>
					<thead data-v-9252af6e="">
						<tr data-v-9252af6e="">
							<th data-v-9252af6e="">
								귀속연월
								<button data-v-9252af6e="" class="hw-icon button-sort" id="order">
									<c:if test="${requestScope.orderType eq 'desc'}">
										<i data-v-9252af6e="" class="gis gi-short-arrow-down"></i>
									</c:if>
									<c:if test="${requestScope.orderType eq 'asc'}">
										<i data-v-9252af6e="" class="gis gi-short-arrow-up"></i>
									</c:if>
								</button>
							</th>
							<th data-v-9252af6e="">
								산정 기간
								<!---->
							</th>
							<th data-v-9252af6e="">
								지급일
								<!---->
							</th>
							<th data-v-9252af6e="">
								지급 총액
								<!---->
							</th>
							<th data-v-9252af6e="">
								공제 총액
								<!---->
							</th>
							<th data-v-9252af6e="">
								실 지급액
								<!---->
							</th>
							<th data-v-9252af6e="">
								급여명세서
								<!---->
							</th>
						</tr>
					</thead>
					<tbody data-v-9252af6e="">
						<c:if test="${not empty requestScope.svoList}">
							<c:forEach var="salaryVo" items="${requestScope.svoList}">
								<tr data-v-9252af6e="">
									<td>${salaryVo.month}</td>
									<td>${salaryVo.startDay}~${salaryVo.endDay}</td>
									<td>${salaryVo.payDay}</td>
									<td class="text-right">
										<fmt:formatNumber value="${salaryVo.totalPay}" pattern="#,###" />
									</td>
									<td class="text-right">
										<fmt:formatNumber value="${salaryVo.totalDeduction}" pattern="#,###" />
									</td>
									<td class="text-right">
										<fmt:formatNumber value="${salaryVo.actualPay}" pattern="#,###" />
									</td>
									<td>
										<button id="detailPayrollBtn" onclick="showDetailPrivatePayrollModal(${salaryVo.salaryId})" class="button-sm white" type="button">보기</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>


						<c:if test="${empty requestScope.svoList}">
							<tr data-v-9252af6e="">
								<td data-v-9252af6e="" colspan="7">급여명세서 내역이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</section>
		</div>
	</div>
</div>

