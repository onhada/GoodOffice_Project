<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>





<!DOCTYPE html>
<!-- saved from url=(0069)https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics -->
<html lang="ko">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=1280,user-scalable=yes,minimum-scale=0.25,maximum-scale=1">
<!-- <script src="./하이웍스 인사_files/sdk.js.다운로드"></script> -->





<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/header_noSearch.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/app.ff1d5947_2.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/app.ff1d5947.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/characterPicker.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/chunk-vendors.c430c257.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/codemirror.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/synapeditor.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/synapeditorCustomStyle.css">

<!--  예인 추가 css  -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/hr_insa.css">


<!-- Optional JavaScript -->
<%-- <script type="text/javascript" src="<%= ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script> --%>
<script type="text/javascript" src="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- 예진 추가 -->
<!-- JavaScript -->
<script src="<%=ctxPath%>/resources/js/jquery-3.7.1.min.js" type="text/javascript"></script>



<script src="<%=ctxPath%>/resources/js/personnel/jquery.ui.monthpicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.css">


<script>
	jQuery.browser = {};
	(function() {
		jQuery.browser.msie = false;
		jQuery.browser.version = 0;
		if (navigator.userAgent.match(/MSIE ([0-9]+)./)) {
			jQuery.browser.msie = true;
			jQuery.browser.version = RegExp.$1;
		}
	})();
</script>

<script>
	$(document)
			.ready(
					function() {

						$("input#modalMonthPicker").monthpicker(
								{
									monthNames : [ '1월(JAN)', '2월(FEB)',
											'3월(MAR)', '4월(APR)', '5월(MAY)',
											'6월(JUN)', '7월(JUL)', '8월(AUG)',
											'9월(SEP)', '10월(OCT)', '11월(NOV)',
											'12월(DEC)' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									showOn : "both",
									changeYear : false,
									yearRange : 'c-2:c+2',
									dateFormat : 'yy-mm'
								});

						$("button.ui-monthpicker-trigger").hide()

						/////////////////////////////////////////////////////////////////////////////////////////
						// 지급일
						$("input#inputPayday").datepicker(
								{
									dateFormat : 'yy-mm-dd' // Input Display Format 변경
									,
									showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
									,
									showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
									,
									changeYear : true // 콤보박스에서 년 선택 가능
									,
									changeMonth : true // 콤보박스에서 월 선택 가능                
									,
									monthNamesShort : [ '1', '2', '3', '4',
											'5', '6', '7', '8', '9', '10',
											'11', '12' ] //달력의 월 부분 텍스트
									,
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
									,
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ] //달력의 요일 부분 텍스트
									,
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
									,
									showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
								});

						$("input#inputPayday")
								.click(
										function() {
											$("div#ui-datepicker-div")
													.attr(
															'style',
															'position: fixed;top: 488px;left: 705px;z-index: 2001 !important; display: block;');
										})

						/////////////////////////////////////////////////////////////////////////////////////////
						// 산정 시작일
						$("input#inputStartday").datepicker(
								{
									dateFormat : 'yy-mm-dd' // Input Display Format 변경
									,
									showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
									,
									showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
									,
									changeYear : true // 콤보박스에서 년 선택 가능
									,
									changeMonth : true // 콤보박스에서 월 선택 가능                
									,
									monthNamesShort : [ '1', '2', '3', '4',
											'5', '6', '7', '8', '9', '10',
											'11', '12' ] //달력의 월 부분 텍스트
									,
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
									,
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ] //달력의 요일 부분 텍스트
									,
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
									,
									showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
								});

						$("button.ui-datepicker-trigger").hide()

						$("input#inputStartday")
								.click(
										function() {
											$("div#ui-datepicker-div")
													.attr(
															'style',
															'position: fixed;top: 532px;left: 705px;z-index: 2001 !important; display: block;');
										})

						/////////////////////////////////////////////////////////////////////////////////////////
						// 산정 종료일
						$("input#inputEndday").datepicker(
								{
									dateFormat : 'yy-mm-dd' // Input Display Format 변경
									,
									showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
									,
									showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
									,
									changeYear : true // 콤보박스에서 년 선택 가능
									,
									changeMonth : true // 콤보박스에서 월 선택 가능                
									,
									monthNamesShort : [ '1', '2', '3', '4',
											'5', '6', '7', '8', '9', '10',
											'11', '12' ] //달력의 월 부분 텍스트
									,
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
									,
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ] //달력의 요일 부분 텍스트
									,
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
									,
									showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
								});

						$("input#inputEndday")
								.click(
										function() {
											$("div#ui-datepicker-div")
													.attr(
															'style',
															'position: fixed;top: 532px;left: 950px;z-index: 2001 !important; display: block;');
										})

						/* 	
						 $("img.ui-monthpicker-trigger").css({
						 'width': '30px',
						 'padding-left': '10px'
						
						 }); */

						// 산정 시작일, 종료일 동적 제어
						$('input#inputStartday').datepicker("option",
								"maxDate", $("input#inputEndday").val());
						$('input#inputStartday').datepicker(
								"option",
								"onClose",
								function(selectedDate) {
									$("input#inputEndday").datepicker("option",
											"minDate", selectedDate);
									$("button.ui-datepicker-trigger").hide()
								});

						$('input#inputEndday').datepicker("option", "minDate",
								$("input#inputStartday").val());
						$('input#inputEndday').datepicker(
								"option",
								"onClose",
								function(selectedDate) {
									$("input#inputStartday").datepicker(
											"option", "maxDate", selectedDate);
									$("button.ui-datepicker-trigger").hide()
								});

						$("button.ui-datepicker-trigger").hide()

					})

	function closeModal(id) {
		$(id).hide();
	}

	function clickTriggerFile() {
		$("input#fileAttach").trigger("click");
	}

	
</script>
</head>
<body cz-shortcut-listen="true">

	<noscript>
		<strong>We're sorry but hiworks-board doesn't work properly without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id="gnb-root">
		<div data-v-3a88b4b3="" class="new_gnb">

			<!-- 헤더시작 -->
			<tiles:insertAttribute name="header" />
			<!-- 헤더끝 -->

		</div>
	</div>

	<div id="app">
		<div data-v-a4c11cac="" class="hu-modal-container" style="z-index: 2000;">
			<div data-v-a4c11cac="" class="hu-modal-background" style="display: none;"></div>
		</div>
		<div data-v-206790f8="" class="hu-popover-container" style="z-index: 2000;"></div>
		<!---->
		<!---->
		<div>
			<!---->
			<div data-ui="skipNavigation" class="skip_navigation">
				<a href="https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics#header">상단 메뉴로 바로가기</a>
				<a href="https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics#sidebar">왼쪽 메뉴로 바로가기</a>
				<a href="https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics#contents">본문 영역으로 바로가기</a>
			</div>
			<div class="split-wrap">


				<!-- 사이드바 시작 -->
				<tiles:insertAttribute name="side" />
				<!-- 사이드바 끝-->



				<div class="split-gutter" draggable="true" draggable-state="{&quot;initialPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65},&quot;startDragPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65},&quot;currentDragPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65}}" style="left: 276px; touch-action: none; position: fixed; top: 65px;">&nbsp;</div>
				<div class="split-gutter-pop" style="left: 296px; top: 495.5px; display: none;">
					드래그하여 메뉴 영역 확대/축소 <br> 더블클릭으로 숨김 가능
				</div>
				<div class="re-open-sidebar" style="display: none;">
					<i class="far fa-ellipsis-v"></i>
				</div>


				<!-- 컨텐츠 시작 -->
				<tiles:insertAttribute name="content" />
				<!-- 컨텐츠 끝 -->




			</div>
		</div>
	</div>


	<!-- 
	<script src="./하이웍스 인사_files/xlsx-populate.min.js.다운로드"></script>
	<script>if (window.location.href.includes("contract-result")) {
    document.querySelector("#gnb-app").remove();
  }</script>
	<script src="./하이웍스 인사_files/main.js.다운로드"></script>
	<script src="./하이웍스 인사_files/synapeditor.config.js.다운로드"></script>
	<script src="./하이웍스 인사_files/synapeditor.min.js.다운로드"></script>
	<script src="./하이웍스 인사_files/codemirror.min.js.다운로드"></script>
	<script src="./하이웍스 인사_files/xml.min.js.다운로드"></script>
	
	 -->






	<ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content dropdown-menu block approval-autocomplete admin_autocomplete" id="ui-id-6" tabindex="0" style="display: none; top: 399px; left: 826px; width: 360px;">
	</ul>

	<!-- 관리자 권한 이력 관리 모달 시작 -->

	<div class="hw-modal-wrap" id="layerPersonnelManagerHistory" style="margin-left: -400px; margin-top: -303.5px; display: none;">
		<div class="hw-modal-header manager-header">관리자 권한 이력 관리</div>

		<div class="hw-modal-body manager-body">
			<table class="setting-table">
				<colgroup>
					<col>
					<col style="width: 50%">
					<col>
				</colgroup>
				<thead>
					<tr>
						<th class="th-border-right th-border-bottom">일시</th>
						<th class="th-border-right th-border-bottom">내용</th>
						<th class="th-border-bottom">권한 제공자</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<div class="hw-modal-footer text-center">
			<button type="button" class="hw-button secondary" onclick="closeModal(layerPersonnelManagerHistory)">닫기</button>
		</div>
	</div>

	<!-- 관리자 권한 이력 관리 모달 끝 -->




	<!-- 급여대장 급여 등록 버튼 모달 시작 -->
	<div data-v-a4c11cac="" class="hu-modal-container" id="insertPayrollModal" style="display: none; z-index: 2000;">
		<form name="insertPayrollFrm">
			<div data-v-a4c11cac="" class="hu-modal-background" style=""></div>
			<div data-v-13ac45d2="" data-v-a4c11cac="" tabindex="-1" class="hu-modal-wrapper" style="">
				<div data-v-13ac45d2="" class="hu-modal-content-wrapper">
					<div data-v-18361ed9="" data-v-13ac45d2="" class="modal-content-wrapper type-default payroll-registration-modal-wrapper">
						<section data-v-18361ed9="" class="modal-content__header">
							<span data-v-18361ed9="">급여대장 등록</span>
						</section>
						<section data-v-18361ed9="" class="modal-content__body">
							<ul data-v-18361ed9="" class="description">
								<li data-v-18361ed9="">급여대장 등록 급여대장 파일에 작성된 내용을 기준으로 급여 내역이 등록됩니다.</li>
								<li data-v-18361ed9="">아래 설정된 지급 기준은 급여 설정 메뉴를 기준으로 자동 반영되며, 수정 가능합니다.</li>
							</ul>
							<div data-v-18361ed9="" class="options">
								<div data-v-18361ed9="" class="option">
									<div data-v-18361ed9="">귀속월</div>
									<div data-v-18361ed9="">
										<div data-v-18361ed9="" class="el-date-editor hw-calendar el-input el-input--prefix el-input--suffix el-date-editor--month">
											<!---->
											<input type="text" readonly="readonly" id="modalMonthPicker" autocomplete="off" name="month" placeholder="선택" class="el-input__inner">
											<span class="el-input__prefix">
												<i class="el-input__icon gi gi-calendar"></i>
												<!---->
											</span>
											<!-- <span class="el-input__suffix">
												<span class="el-input__suffix-inner">
													<i class="el-input__icon"></i>
													
													
													
													
												</span>
												
											</span> -->
											<!---->
											<!---->
										</div>
									</div>
								</div>
								<div data-v-18361ed9="" class="option">
									<div data-v-18361ed9="">지급일</div>
									<div data-v-18361ed9="">
										<div data-v-18361ed9="" class="el-date-editor hw-calendar el-input el-input--prefix el-input--suffix el-date-editor--date">
											<!---->
											<input type="text" id="inputPayday" readonly="readonly" autocomplete="off" name="payDay" placeholder="선택" class="el-input__inner">
											<span class="el-input__prefix">
												<i class="el-input__icon gi gi-calendar"></i>
												<!---->
											</span>
											<!-- <span class="el-input__suffix">
												<span class="el-input__suffix-inner">
													<i class="el-input__icon"></i>
													
													
													
													
												</span>
												
											</span> -->
											<!---->
											<!---->
										</div>
									</div>
								</div>
								<div data-v-18361ed9="" class="option payroll-estimate-date">
									<div data-v-18361ed9="">급여산정기간</div>
									<div data-v-18361ed9="">
										<div data-v-18361ed9="" class="el-date-editor hw-calendar el-input el-input--prefix el-input--suffix el-date-editor--date">
											<!---->
											<input type="text" readonly="readonly" id="inputStartday" autocomplete="off" name="startDay" placeholder="선택" class="el-input__inner">
											<span class="el-input__prefix">
												<i class="el-input__icon gi gi-calendar"></i>
												<!---->
											</span>
											<span class="el-input__suffix">
												<span class="el-input__suffix-inner">
													<i class="el-input__icon"></i>
													<!---->
													<!---->
													<!---->
													<!---->
												</span>
												<!---->
											</span>
											<!---->
											<!---->
										</div>
										<span data-v-18361ed9="" class="tilde">~</span>
										<div data-v-18361ed9="" class="el-date-editor hw-calendar el-input el-input--prefix el-input--suffix el-date-editor--date">
											<!---->
											<input type="text" readonly="readonly" id="inputEndday" autocomplete="off" name="endDay" placeholder="선택" class="el-input__inner">
											<span class="el-input__prefix">
												<i class="el-input__icon gi gi-calendar"></i>
												<!---->
											</span>
											<span class="el-input__suffix">
												<span class="el-input__suffix-inner">
													<i class="el-input__icon"></i>
													<!---->
													<!---->
													<!---->
													<!---->
												</span>
												<!---->
											</span>
											<!---->
											<!---->
										</div>
									</div>
								</div>
								<div data-v-18361ed9="" class="option payroll-file">
									<div data-v-18361ed9="">파일 등록</div>
									<div data-v-18361ed9="">
										<div data-v-18361ed9="" class="file-placeholder">급여대장 파일을 선택하세요. (*xlsx)</div>
										<span data-v-18361ed9="" class="ml-12">
											<button data-v-f8d3258e="" data-v-18361ed9="" type="button" onclick="clickTriggerFile()" class="hw-button text no-space">
												<!---->
												<span data-v-f8d3258e="" class="label ">불러오기</span>
												<!---->
											</button>
										</span>
										<input data-v-18361ed9="" id="fileAttach" name="payrollFile" type="file" accept=".xlsx" class="sr-only">
									</div>
								</div>
							</div>
						</section>
						<section data-v-18361ed9="" class="modal-content__footer">
							<button data-v-cde747bc="" data-v-18361ed9="" type="button" class="hu-button secondary" onclick="closeModal(insertPayrollModal)">
								<!---->
								<span data-v-cde747bc="" class="label">닫기</span>
								<!---->
							</button>
							<button data-v-cde747bc="" data-v-18361ed9="" type="button" class="hu-button primary" onclick="insertPayroll()">
								<!---->
								<span data-v-cde747bc="" class="label">등록</span>
								<!---->
							</button>
						</section>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 급여대장 급여 등록 버튼 모달 끝 -->










	<!-- 급여대장 급여 등록 시 오류 리스트 있을 경우 모달 시작 -->
	<div data-v-a4c11cac="" class="hu-modal-container" id="errorInsertPayrollModal" style="display: none; z-index: 2000;">
		<div data-v-a4c11cac="" class="hu-modal-background" style=""></div>
		<div data-v-13ac45d2="" data-v-a4c11cac="" tabindex="-1" class="hu-modal-wrapper" style="">
			<div data-v-13ac45d2="" class="hu-modal-content-wrapper">
				<div data-v-853a7c46="" data-v-13ac45d2="" class="modal-content-wrapper type-default">
					<section data-v-853a7c46="" class="modal-content__header">
						<span data-v-853a7c46="">급여대장 등록 실패</span>
					</section>
					<section data-v-853a7c46="" class="modal-content__body">
						<div data-v-853a7c46="" class="title">일치하지 않는 대상자가 있어 급여대장 등록이 실패되었습니다.</div>
						<ul data-v-853a7c46="" class="descriptions">
							<li data-v-853a7c46="">
								급여 대상자 구분을 위한
								<span class="invalid">이름, ID 중 일치하지 않는 정보</span>
								가 있습니다. 빨간색으로 표시된 오류 항목을 확인해주세요.
							</li>
							<li data-v-853a7c46="">오류 대상자 수정 후 파일을 재등록해주시기 바랍니다.</li>
						</ul>
						<div data-v-853a7c46="" class="table-wrapper">
							<div data-v-853a7c46="" class="el-table el-table--fit el-table--fluid-height el-table--scrollable-x el-table--enable-row-transition" style="width: 100%; max-height: 450px;">
								<div class="hidden-columns">
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
									<div data-v-853a7c46=""></div>
								</div>
								<div class="el-table__header-wrapper">
									<!-- <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 1935px;">
										<colgroup>
											<col name="el-table_2_column_18" width="60">
											<col name="el-table_2_column_19" width="150">
											<col name="el-table_2_column_20" width="150">
											<col name="el-table_2_column_21" width="120">
											<col name="el-table_2_column_22" width="120">
											<col name="el-table_2_column_23" width="120">
											<col name="el-table_2_column_24" width="120">
											<col name="el-table_2_column_25" width="135">
											<col name="el-table_2_column_26" width="120">
											<col name="el-table_2_column_27" width="120">
											<col name="el-table_2_column_28" width="120">
											<col name="el-table_2_column_29" width="120">
											<col name="el-table_2_column_30" width="120">
											<col name="el-table_2_column_31" width="120">
											<col name="el-table_2_column_32" width="120">
											<col name="el-table_2_column_33" width="120">
											<col name="gutter" width="0">
										</colgroup>
										
									</table> -->
								</div>
								<div class="el-table__body-wrapper is-scrolling-left" style="max-height: 400px;">
									<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 1935px;">
										<colgroup>
											<col name="el-table_2_column_18" width="60">
											<col name="el-table_2_column_19" width="150">
											<col name="el-table_2_column_20" width="150">
											<col name="el-table_2_column_21" width="120">
											<col name="el-table_2_column_22" width="120">
											<col name="el-table_2_column_23" width="120">
											<col name="el-table_2_column_24" width="120">
											<col name="el-table_2_column_25" width="135">
											<col name="el-table_2_column_26" width="120">
											<col name="el-table_2_column_27" width="120">
											<col name="el-table_2_column_28" width="120">
											<col name="el-table_2_column_29" width="120">
											<col name="el-table_2_column_30" width="120">
											<col name="el-table_2_column_31" width="120">
											<col name="el-table_2_column_32" width="120">
											<col name="el-table_2_column_33" width="120">
										</colgroup>


										<thead class="has-gutter">
											<tr class="">
												<th colspan="1" rowspan="1" class="el-table_2_column_18  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell">
													<div class="cell">NO</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_19  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell">
													<div class="cell">이름</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_20  is-center table-col table-id  is-hidden is-leaf table-header el-table__cell">
													<div class="cell">ID</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_21  is-center table-col table-payments  is-leaf table-header el-table__cell">
													<div class="cell">기본급</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_22  is-center table-col table-payments  is-leaf table-header el-table__cell">
													<div class="cell">연장근로 수당</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_23  is-center table-col table-payments  is-leaf table-header el-table__cell">
													<div class="cell">야간근로 수당</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_24  is-center table-col table-payments  is-leaf table-header el-table__cell">
													<div class="cell">휴일근로 수당</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_25  is-center table-col table-payments  is-leaf table-header el-table__cell">
													<div class="cell">미사용 연차 수당</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_26  is-center table-col table-payment-amount  is-leaf table-header el-table__cell">
													<div class="cell">지급 총액</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_27  is-center table-col table-deduction  is-leaf table-header el-table__cell">
													<div class="cell">소득세</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_28  is-center table-col table-deduction  is-leaf table-header el-table__cell">
													<div class="cell">지방소득세</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_29  is-center table-col table-deduction  is-leaf table-header el-table__cell">
													<div class="cell">국민연금</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_30  is-center table-col table-deduction  is-leaf table-header el-table__cell">
													<div class="cell">건강보험</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_31  is-center table-col table-deduction  is-leaf table-header el-table__cell">
													<div class="cell">장기요양보험</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_32  is-center table-col table-deduction-amount  is-leaf table-header el-table__cell">
													<div class="cell">공제 총액</div>
												</th>
												<th colspan="1" rowspan="1" class="el-table_2_column_33  is-center table-col table-actual-payment-amount  is-hidden is-leaf table-header el-table__cell">
													<div class="cell">실 지급액</div>
												</th>
												<th class="el-table__cell gutter" style="width: 0px; display: none;"></th>
											</tr>
										</thead>









										<tbody id="errorListData">



											<!-- 
											<tr class="el-table__row">
												<td rowspan="1" colspan="1" class="el-table_2_column_18 is-center table-col table-name is-hidden table-row el-table__cell">
													<div class="cell">1</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_19  table-col table-name is-hidden table-row el-table__cell">
													<div class="cell">
														<span data-v-853a7c46="" class="">관리자</span>
													</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_20  table-col table-id is-hidden table-row el-table__cell">
													<div class="cell">
														<span data-v-853a7c46="" class="invalid"> admin </span>
													</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_21 is-right table-col table-payments table-row el-table__cell">
													<div class="cell">20,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_22 is-right table-col table-payments table-row el-table__cell">
													<div class="cell">20,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_23 is-right table-col table-payments table-row el-table__cell">
													<div class="cell">20,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_24 is-right table-col table-payments table-row el-table__cell">
													<div class="cell">20,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_25 is-right table-col table-payments table-row el-table__cell">
													<div class="cell">20,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_26 is-right table-col table-payment-amount table-row el-table__cell">
													<div class="cell">100,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_27 is-right table-col table-deduction table-row el-table__cell">
													<div class="cell">10,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_28 is-right table-col table-deduction table-row el-table__cell">
													<div class="cell">10,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_29 is-right table-col table-deduction table-row el-table__cell">
													<div class="cell">10,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_30 is-right table-col table-deduction table-row el-table__cell">
													<div class="cell">10,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_31 is-right table-col table-deduction table-row el-table__cell">
													<div class="cell">10,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_32 is-right table-col table-deduction-amount table-row el-table__cell">
													<div class="cell">50,000</div>
												</td>
												<td rowspan="1" colspan="1" class="el-table_2_column_33 is-right table-col table-actual-payment-amount is-hidden table-row el-table__cell">
													<div class="cell">50,000</div>
												</td>
											</tr> -->
											<!---->
										</tbody>
									</table>
									<!---->
									<!---->
								</div>
								<!---->
								<div class="el-table__fixed" style="width: 360px; bottom: 8px;">
									<div class="el-table__fixed-header-wrapper">
										<table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 1935px;">
											<colgroup>
												<col name="el-table_2_column_18" width="60">
												<col name="el-table_2_column_19" width="150">
												<col name="el-table_2_column_20" width="150">
												<col name="el-table_2_column_21" width="120">
												<col name="el-table_2_column_22" width="120">
												<col name="el-table_2_column_23" width="120">
												<col name="el-table_2_column_24" width="120">
												<col name="el-table_2_column_25" width="135">
												<col name="el-table_2_column_26" width="120">
												<col name="el-table_2_column_27" width="120">
												<col name="el-table_2_column_28" width="120">
												<col name="el-table_2_column_29" width="120">
												<col name="el-table_2_column_30" width="120">
												<col name="el-table_2_column_31" width="120">
												<col name="el-table_2_column_32" width="120">
												<col name="el-table_2_column_33" width="120">
											</colgroup>
											<thead class="">
												<tr class="">
													<th colspan="1" rowspan="1" class="el-table_2_column_18  is-center table-col table-name  is-leaf table-header el-table__cell">
														<div class="cell">NO</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_19  is-center table-col table-name  is-leaf table-header el-table__cell">
														<div class="cell">이름</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_20  is-center table-col table-id  is-leaf table-header el-table__cell">
														<div class="cell">ID</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_21  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">기본급</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_22  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">연장근로 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_23  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">야간근로 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_24  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">휴일근로 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_25  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">미사용 연차 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_26  is-center table-col table-payment-amount  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">지급 총액</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_27  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">소득세</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_28  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">지방소득세</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_29  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">국민연금</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_30  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">건강보험</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_31  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">장기요양보험</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_32  is-center table-col table-deduction-amount  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">공제 총액</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_33  is-center table-col table-actual-payment-amount  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">실 지급액</div>
													</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="el-table__fixed-body-wrapper" style="top: 50px; max-height: 392px;">
										<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 360px;">
											<colgroup>
												<col name="el-table_2_column_18" width="60">
												<col name="el-table_2_column_19" width="150">
												<col name="el-table_2_column_20" width="150">
											</colgroup>
											<tbody id="fixedNameList">
												<!-- <tr class="el-table__row" style="height: 48px;">
													<td rowspan="1" colspan="1" class="el-table_2_column_18 is-center table-col table-name table-row el-table__cell">
														<div class="cell">1</div>
													</td>
													<td rowspan="1" colspan="1" class="el-table_2_column_19  table-col table-name table-row el-table__cell">
														<div class="cell">
															<span data-v-853a7c46="" class="">관리자</span>
														</div>
													</td>
													<td rowspan="1" colspan="1" class="el-table_2_column_20  table-col table-id table-row el-table__cell">
														<div class="cell">
															<span data-v-853a7c46="" class="invalid"> admin </span>
														</div>
													</td>
												</tr> -->
												<!---->
											</tbody>
										</table>
										<!---->
									</div>
									<!---->
								</div>
								<div class="el-table__fixed-right" style="width: 120px; bottom: 8px;">
									<div class="el-table__fixed-header-wrapper">
										<table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 1935px;">
											<colgroup>
												<col name="el-table_2_column_18" width="60">
												<col name="el-table_2_column_19" width="150">
												<col name="el-table_2_column_20" width="150">
												<col name="el-table_2_column_21" width="120">
												<col name="el-table_2_column_22" width="120">
												<col name="el-table_2_column_23" width="120">
												<col name="el-table_2_column_24" width="120">
												<col name="el-table_2_column_25" width="135">
												<col name="el-table_2_column_26" width="120">
												<col name="el-table_2_column_27" width="120">
												<col name="el-table_2_column_28" width="120">
												<col name="el-table_2_column_29" width="120">
												<col name="el-table_2_column_30" width="120">
												<col name="el-table_2_column_31" width="120">
												<col name="el-table_2_column_32" width="120">
												<col name="el-table_2_column_33" width="120">
											</colgroup>
											<thead class="">
												<tr class="">
													<th colspan="1" rowspan="1" class="el-table_2_column_18  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">NO</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_19  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">이름</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_20  is-center table-col table-id  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">ID</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_21  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">기본급</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_22  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">연장근로 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_23  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">야간근로 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_24  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">휴일근로 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_25  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">미사용 연차 수당</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_26  is-center table-col table-payment-amount  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">지급 총액</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_27  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">소득세</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_28  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">지방소득세</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_29  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">국민연금</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_30  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">건강보험</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_31  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">장기요양보험</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_32  is-center table-col table-deduction-amount  is-hidden is-leaf table-header el-table__cell">
														<div class="cell">공제 총액</div>
													</th>
													<th colspan="1" rowspan="1" class="el-table_2_column_33  is-center table-col table-actual-payment-amount  is-leaf table-header el-table__cell">
														<div class="cell">실 지급액</div>
													</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="el-table__fixed-body-wrapper" style="top: 50px; max-height: 392px;">
										<table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 120px;">
											<colgroup>
												<col name="el-table_2_column_33" width="120">
											</colgroup>
											<tbody id="fixedActualList">
												<!-- <tr class="el-table__row" style="height: 48px;">
													<td rowspan="1" colspan="1" class="el-table_2_column_33 is-right table-col table-actual-payment-amount table-row el-table__cell">
														<div class="cell">50,000</div>
													</td>
												</tr> -->
												<!---->
											</tbody>
										</table>
										<!---->
									</div>
									<!---->
								</div>
								<div class="el-table__fixed-right-patch" style="width: 0px; height: 50px;"></div>
								<div class="el-table__column-resize-proxy" style="display: none;"></div>
							</div>
						</div>
					</section>
					<section data-v-853a7c46="" class="modal-content__footer">
						<button data-v-cde747bc="" data-v-853a7c46="" type="button" class="hu-button secondary" onclick="closeModal(errorInsertPayrollModal)">
							<!---->
							<span data-v-cde747bc="" class="label">닫기</span>
							<!---->
						</button>
					</section>
				</div>
			</div>
		</div>
	</div>
	<!-- 급여대장 급여 등록 시 오류 리스트 있을 경우 모달 끝 -->







	<!-- 인사_급여(개인)_급여명세서 보기 모달 시작 -->
	<div data-v-a4c11cac="" class="hu-modal-container" id="detailPrivatePayrollModal" style="display:none; z-index: 2000;">
		<div data-v-a4c11cac="" class="hu-modal-background" style=""></div>
		<div data-v-13ac45d2="" data-v-a4c11cac="" tabindex="-1" class="hu-modal-wrapper" style="">
			<div data-v-13ac45d2="" class="hu-modal-content-wrapper">
				<div data-v-4faad0e8="" data-v-13ac45d2="" id="paystub-detail" class="modal-content-wrapper">
					<section data-v-4faad0e8="" class="modal-content__header detailMonth"></section>
					<section data-v-4faad0e8="" class="modal-content__body">
						<div data-v-4faad0e8="" class="user-info">
							<div data-v-4faad0e8="" class="user-info__item">
								<div data-v-4faad0e8="" class="title font-weight-bold">이름</div>
								<div data-v-4faad0e8="" class="detailEmpName"></div>
							</div>
							<div data-v-4faad0e8="" class="user-info__item">
								<div data-v-4faad0e8="" class="title font-weight-bold">소속</div>
								<div data-v-4faad0e8="" class="detailTeam"></div>
							</div>
							<div data-v-4faad0e8="" class="user-info__item">
								<div data-v-4faad0e8="" class="title font-weight-bold">지급일</div>
								<div data-v-4faad0e8="" class="detailPayday"></div>
							</div>
							<div data-v-4faad0e8="" class="user-info__item">
								<div data-v-4faad0e8="" class="title font-weight-bold">산정 기간</div>
								<div data-v-4faad0e8="" class="detailStartEndDay"></div>
							</div>
						</div>
						<div data-v-4faad0e8="" class="d-flex mt-22">
							<table data-v-4faad0e8="" class="setting-table border-right">
								<colgroup data-v-4faad0e8="">
									<col data-v-4faad0e8="">
									<col data-v-4faad0e8="">
								</colgroup>
								<thead data-v-4faad0e8="">
									<tr data-v-4faad0e8="">
										<th data-v-4faad0e8="">지급 항목</th>
										<th data-v-4faad0e8="">금액(원)</th>
									</tr>
								</thead>
								<tbody data-v-4faad0e8="">
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">기본급</td>
										<td data-v-4faad0e8="" class="detailBasePay text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">연장근로 수당</td>
										<td data-v-4faad0e8="" class="detailOverTimePay text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">야간근로 수당</td>
										<td data-v-4faad0e8="" class="detailNightTimePay text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">휴일근로 수당</td>
										<td data-v-4faad0e8="" class="detailHolidayPay text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">미사용 연차 수당</td>
										<td data-v-4faad0e8="" class="detailUnUsedAnnualPay text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="" class="font-weight-bold">지급 총액</td>
										<td data-v-4faad0e8="" class="detailTotalPay font-weight-bold text-right"></td>
									</tr>
								</tbody>
							</table>
							<table data-v-4faad0e8="" class="setting-table">
								<colgroup data-v-4faad0e8="">
									<col data-v-4faad0e8="">
									<col data-v-4faad0e8="">
								</colgroup>
								<thead data-v-4faad0e8="">
									<tr data-v-4faad0e8="">
										<th data-v-4faad0e8="">공제 항목</th>
										<th data-v-4faad0e8="">금액(원)</th>
									</tr>
								</thead>
								<tbody data-v-4faad0e8="">
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">소득세</td>
										<td data-v-4faad0e8="" class="detailIncomeTax text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">지방소득세</td>
										<td data-v-4faad0e8="" class="detailLocalTax text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">국민연금</td>
										<td data-v-4faad0e8="" class="detailNationalPension text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">건강보험</td>
										<td data-v-4faad0e8="" class="detailHealthInsurance text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="">장기요양보험</td>
										<td data-v-4faad0e8="" class="detailLongTermCareInsurance text-right"></td>
									</tr>
									<tr data-v-4faad0e8="">
										<td data-v-4faad0e8="" class="font-weight-bold">공제 총액</td>
										<td data-v-4faad0e8="" class="detailTotalDeduction font-weight-bold text-right"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div data-v-4faad0e8="" class="actual-payment-container">
							<div data-v-4faad0e8="" class="item">실 지급액: <span class="detailActualPay"></span>원</div>
						</div>
						<!---->
						<div data-v-4faad0e8="" class="text-right mt-40">
							<div data-v-4faad0e8="">
								<span data-v-4faad0e8="" class="font-weight-bold">회사명</span>
								: 하이웍스오피스
							</div>
							<!---->
						</div>
					</section>
					<section data-v-4faad0e8="" class="modal-content__footer text-center">
						<button data-v-cde747bc="" data-v-4faad0e8="" type="button" class="hu-button secondary" onclick="closeModal(detailPrivatePayrollModal)">
							<!---->
							<span data-v-cde747bc="" class="label">닫기</span>
							<!---->
						</button>
					</section>
				</div>
			</div>
		</div>
	</div>

	<!-- 인사_급여(개인)_급여명세서 보기 모달 끝-->












	<div class="v-modal" id="layerApplicationLineSetting" tabindex="0" style="z-index: 2025; display: none;"></div>

	<div data-v-38b211a8="" data-v-5dded26b="" class="el-dialog__wrapper" id="layerApplicationLineSetting" style="z-index: 2038; display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog" class="el-dialog sm-title" style="margin-top: 15vh;">
			<div class="el-dialog__header">
				<div data-v-38b211a8="" class="modal-title">처리 설정</div>
				<button type="button" aria-label="Close" class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<div class="el-dialog__body">
				<div data-v-38b211a8="" class="main-contents">
					<div data-v-38b211a8="" class="border-div">
						<div data-v-38b211a8="" class="d-flex align-items-center justify-content-between">
							<span data-v-38b211a8="">
								<div data-v-147fd5e4="" data-v-38b211a8="" class="position-relative" style="width: 180px; margin-left: 5px; margin-top: 5px;">
									<input data-v-147fd5e4="" placeholder="클릭후 입력하세요" class="hw-input" id="inputApprovalLineSetting">
									<div data-v-147fd5e4="" class="ac-serach-result-wrap" id="ac-serach-result" style="top: 36px; display: none;">

										<!--  
									
										<div data-v-147fd5e4="" index="0" 
											class="result-box clearfix hover"  >
											<div data-v-147fd5e4="" class="search-keyword clearfix w-100">은우
												(하이웍스오피스)</div>
										</div>
									 
-->


										<!--  -->
									</div>
								</div>
							</span>
							<span data-v-38b211a8="" class="mr-6 mt-21 font-size-12 color-d6 none-select"> 인원 : 3명 </span>
						</div>
						<div data-v-38b211a8="" class="line-div">
							<div data-v-38b211a8="" class="vb vb-invisible" style="width: auto; height: 160px; position: relative; overflow: hidden;">
								<div class="vb-content" style="display: block; overflow: hidden scroll; height: 100%; width: calc(100% + 8px);">
									<!---->
									<div data-v-38b211a8="" id="b-content">
										<!-- <div data-v-38b211a8="" class="line-box draggableFlag">
										<span data-v-38b211a8="">김이사</span><i data-v-38b211a8=""
											class="fal fa-times-circle ml-5"></i>
									</div>
									<div data-v-38b211a8="" class="line-box draggableFlag">
										<span data-v-38b211a8="">관리자</span><i data-v-38b211a8=""
											class="fal fa-times-circle ml-5"></i>
									</div>
									<div data-v-38b211a8="" class="line-box draggableFlag">
										<span data-v-38b211a8="">차은우</span><i data-v-38b211a8=""
											class="fal fa-times-circle ml-5"></i>
									</div> -->
									</div>
									<!---->
								</div>
								<div class="vb-dragger" style="position: absolute; height: 0px; top: 0px;">
									<div class="vb-dragger-styler"></div>
								</div>
							</div>
						</div>
					</div>
					<div data-v-38b211a8="" class="direction-div">
						<div data-v-38b211a8="" class="text-top-to-bottom">결재방향</div>
					</div>
				</div>
			</div>
			<div class="el-dialog__footer">
				<span data-v-38b211a8="" class="dialog-footer">
					<button data-v-f8d3258e="" data-v-38b211a8="" type="button" class="hw-button secondary">
						<!---->
						<span data-v-f8d3258e="" class="label" onclick="btncancel()">취소</span>
						<!---->
					</button>
					<button data-v-f8d3258e="" data-v-38b211a8="" type="button" class="hw-button primary">
						<!---->
						<input type="hidden" id="empidcheck" value="" />
						<input type="hidden" id="empnamecheck" value="" />
						<span data-v-f8d3258e="" class="label" onclick="btncheck()">확인</span>
						<!---->
					</button>
				</span>
			</div>
		</div>
	</div>
	<!-- 신청 모달 -->
	<div class="v-modal" id="layerApplicationLineSettingh" tabindex="0" style="z-index: 2025; display: none;"></div>

	<div data-v-38b211a8="" data-v-5dded26b="" class="el-dialog__wrapper" id="layerApplicationLineSettingh" style="z-index: 2038; display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog" class="el-dialog sm-title" style="margin-top: 15vh;">
			<div class="el-dialog__header">
				<div data-v-38b211a8="" class="modal-title">처리 설정</div>
				<button type="button" aria-label="Close" class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<div class="el-dialog__body">
				<div data-v-38b211a8="" class="main-contents">
					<div data-v-38b211a8="" class="border-div">
						<div data-v-38b211a8="" class="d-flex align-items-center justify-content-between">
							<span data-v-38b211a8="">
								<div data-v-147fd5e4="" data-v-38b211a8="" class="position-relative" style="width: 180px; margin-left: 5px; margin-top: 5px;">
									<input data-v-147fd5e4="" placeholder="클릭후 입력하세요" class="hw-input" id="inputApprovalLineSettingh">
									<div data-v-147fd5e4="" class="ac-serach-result-wrap" id="ac-serach-resulth" style="top: 36px; display: none;">

										<!--  
									
										<div data-v-147fd5e4="" index="0" 
											class="result-box clearfix hover"  >
											<div data-v-147fd5e4="" class="search-keyword clearfix w-100">은우
												(하이웍스오피스)</div>
										</div>
									 
-->


										<!--  -->
									</div>
								</div>
							</span>
							<span data-v-38b211a8="" class="mr-6 mt-21 font-size-12 color-d6 none-select"> 인원 : 3명 </span>
						</div>
						<div data-v-38b211a8="" class="line-div">
							<div data-v-38b211a8="" class="vb vb-invisible" style="width: auto; height: 160px; position: relative; overflow: hidden;">
								<div class="vb-content" style="display: block; overflow: hidden scroll; height: 100%; width: calc(100% + 8px);">
									<!---->
									<div data-v-38b211a8="" id="b-contenth">
										<div data-v-38b211a8="" class="line-box draggableFlag">
											<span data-v-38b211a8="">${sessionScope.loginUser.empName}</span>
											<i data-v-38b211a8="" class="fal fa-times-circle ml-5"></i>
										</div>
										<!-- 
									<div data-v-38b211a8="" class="line-box draggableFlag">
										<span data-v-38b211a8="">관리자</span><i data-v-38b211a8=""
											class="fal fa-times-circle ml-5"></i>
									</div>
									<div data-v-38b211a8="" class="line-box draggableFlag">
										<span data-v-38b211a8="">차은우</span><i data-v-38b211a8=""
											class="fal fa-times-circle ml-5"></i>
									</div> -->
									</div>
									<!---->
								</div>
								<div class="vb-dragger" style="position: absolute; height: 0px; top: 0px;">
									<div class="vb-dragger-styler"></div>
								</div>
							</div>
						</div>
					</div>
					<div data-v-38b211a8="" class="direction-div">
						<div data-v-38b211a8="" class="text-top-to-bottom">결재방향</div>
					</div>
				</div>
			</div>
			<div class="el-dialog__footer">
				<span data-v-38b211a8="" class="dialog-footer">
					<button data-v-f8d3258e="" data-v-38b211a8="" type="button" class="hw-button secondary">
						<!---->
						<span data-v-f8d3258e="" class="label" onclick="btncancelh()">취소</span>
						<!---->
					</button>
					<button data-v-f8d3258e="" data-v-38b211a8="" type="button" class="hw-button primary">
						<!---->
						<input type="hidden" id="empidcheckh" value=${sessionScope.loginUser.empId } />
						<input type="hidden" id="empnamecheckh" value=${sessionScope.loginUser.empName } />
						<span data-v-f8d3258e="" class="label" onclick="btncheckh()">확인</span>
						<!---->
					</button>
				</span>
			</div>
		</div>
	</div>
</body>
</html>