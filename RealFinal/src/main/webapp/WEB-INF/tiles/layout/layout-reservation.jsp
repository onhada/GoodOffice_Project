<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js"></script>

<%-- 스피너 및 datepicker 를 사용하기 위해 jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/style_tutorial.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/style_resources.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/booking_common.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/new_lnb.css">


<style type="text/css">
.layer_box.rs-booking-layer {
	width: 440px; !important
}

#reservation_info_detail_layer > div.layer_box > div {
	width: 520px;
}

#reservation_reject_layer > div.layer_box > div {
	width: 350px;
}
</style>



<script type="text/javascript">

$(document).ready(function() {
	
	$(".datepicker").datepicker();

	// ----- datepicker 한글 버젼 변경, 날짜 dateformat 변경 시작 ----- //
	(function(factory) {
		if (typeof define === "function" && define.amd) {
			// AMD. Register as an anonymous module.
			define([ "../widgets/datepicker" ], factory);
		} else {
			// Browser globals
			factory(jQuery.datepicker);
		}
	}(function(datepicker) {
		datepicker.regional.ko = {
			closeText : "닫기",
			prevText : "이전달",
			nextText : "다음달",
			currentText : "오늘",
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			weekHeader : "주",
			dateFormat : "yy-mm-dd", 
	        changeYear: true,        // 콤보박스에서 년 선택 가능
	        changeMonth: true,       // 콤보박스에서 월 선택 가능  
			firstDay : 0,
			isRTL : false,
	        showOtherMonths: true,   // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
			showMonthAfterYear : true,	// 년도 먼저 나오고, 뒤에 월 표시
			yearSuffix : "년",
			minDate: "0D", // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			maxDate: "+3M" // 최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)    
		};
		datepicker.setDefaults(datepicker.regional.ko);

		return datepicker.regional.ko;

	}));
	
	// 초기값을 오늘 날짜로 설정
	$("input.datepicker").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
 
	 
})// end of $(document).ready(function(){})-------------------------

//Function Declaration

<%-- 데이터피커 날짜 이동 --%> 
function moveDate(when){
	
	if(when == 'prev'){
		$("input#viewReservationDate").datepicker('setDate', '-1D');
	}
	else if(when == 'today'){
		$("input#viewReservationDate").datepicker('setDate', 'today');
	}
	else if (when == 'next'){
		$("input#viewReservationDate").datepicker('setDate', '+1D');
	}	
	
}

<%-- 모달 닫기 --%>
function layerClose(id) {
	$('div#' + id + '_layer').addClass("hide");
	window.location.reload();
}

<%-- 예약하기 모달 열기 --%>
function resourceReserve() {
	if ($("div#resource_reservation_layer").hasClass("hide") === true) { // 옵션드롭다운이 보이지 않는 중일 경우
		$("div#resource_reservation_layer").removeClass("hide");
		
		$.ajax({
        	url : "<%=ctxPath%>/reservation/getResourceList.gw",
			type : "get",
			data : { },
			dataType : "json",
			async : false,
			success : function(json) {
				let html = "";
				if(json.length > 0) {
					$.each(json, function(index, item){
						html += "<option value='"+item.resourceId+"'>"+item.resourceName+"</option>"; 
					});
				}
				
				$("select#resource_list_select").append(html);
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});	
	}
}// end of function resourceReserve() ---------------------


<%-- 예약하기 제출하는 폼  --%>
function addReservation(){

	// ---------- 예약일시가 올바른지 확인 시작 ---------- //
	let rsvStartTime = $("select#rsvStartDayTime").val();
	let rsvEndTime = $("select#rsvEndDayTime").val();
	
	let rsvStartHour = rsvStartTime.substring(0, rsvStartTime.indexOf(':'));
	let rsvEndHour = rsvEndTime.substring(0, rsvEndTime.indexOf(':'));
	
	if(rsvStartHour - rsvEndHour > 0 || (rsvStartHour - rsvEndHour == 0 && rsvStartHour != 0)){ // 올바르지 않은 시간을 예약했을 때
		alert("예약 시간이 올바르지 않습니다.");
		return;
	}
	else if(rsvStartHour - rsvEndHour == 0 && rsvStartHour == 0){
		let d = new Date($("input#reservationDate").val());
		let sel_day = +1;
		d.setDate(d.getDate() + sel_day );
		let year    = d.getFullYear();
		let month   = ('0' + (d.getMonth() +  1 )).slice(-2);
		let day     = ('0' + d.getDate()).slice(-2);
		dt = year+"-"+month+"-"+day;
		console.log(dt);
	
		var rsvStartDayTime = $("input#reservationDate").val() + " " + $("select#rsvStartDayTime").val();
		var rsvEndDayTime = dt + " " + $("select#rsvEndDayTime").val();
	}
	else{
		var rsvStartDayTime = $("input#reservationDate").val() + " " + $("select#rsvStartDayTime").val();
		var rsvEndDayTime = $("input#reservationDate").val() + " " + $("select#rsvEndDayTime").val();
	}
	// ---------- 예약일시가 올바른지 확인 끝 ---------- //
	
	
	if( $("textarea#rsvReason").val().trim() == "" ){ // 예약사유를 입력하지 않았을 경우
		alert("예약 사유가 없습니다.");
		return;
	}
	
	$.ajax({
    	url : "<%=ctxPath%>/reservation/addReservation.gw",
		type : "get",
		data : {"resourceId":$("select#resource_list_select").val(),	// 자원id
				"rsvStartDayTime":rsvStartDayTime,						// 예약시작일시
				"rsvEndDayTime":rsvEndDayTime,							// 예약종료일시
				"rsvReason":$("textarea#rsvReason").val()},				// 사용용도
		dataType : "json",
		async : false,
		success : function(json) {
			
			if(json.result == 1){// 예약 성공한 경우 
				alert("예약되었습니다.");
				$("div#resource_reservation_layer").addClass("hide");
				location.href="<%= ctxPath%>/reservation/myReservationList.gw";
			}
			else{// 해당 일시에 등록된 예약이 존재해 예약 실패한 경우
				alert("등록된 예약이 존재합니다.");
			}
			
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
	
}


<%-- 예약확인 모달 열기 --%>
function reservation_info_detail_open(rsvResourceId) {
	$("button.del_reservation_btn").attr("id", rsvResourceId); // 삭제하기 위한 자원예약id 넣기 (from 나의예약)
		
	$('div#reservation_info_detail_layer').removeClass("hide");
	$.ajax({
    	url : "<%=ctxPath%>/reservation/getReservationInfoDetail.gw",
		type : "get",
		data : {"rsvResourceId":rsvResourceId}, 	
		dataType : "json",
		async : false,
		success : function(json) {
			$.each(json, function(index, item){
				
				$("dd#resourceName").text(item.resourceName);
				$("dd#rsvDayTime").text(item.rsvStartDayTime + " ~ " + item.rsvEndDayTime);
				$("dd#rsvEmpName").text(item.rsvEmpName + "(" + item.registerDay + ")");
				$("dd#rsvReason").text(item.rsvReason);
				
				var rsvStatus = "";
				if(item.rsvStatus == 1){
					rsvStatus = "승인대기중"
				}
				else if(item.rsvStatus == 2){
					rsvStatus = "예약완료"
				}
				else if(item.rsvStatus == 3){
					rsvStatus = "예약반려"
				}
				$("dd#rsvStatus").text(rsvStatus);
				
				// --- 승인필수자원인 경우 시작 --- //
				$("dl#approvalEmp").remove();	
				if(item.fk_approvalEmpId != null){ // 승인필수자원인 경우 	
					$.ajax({
				    	url : "<%=ctxPath%>/reservation/getEmpInfo.gw",
						type : "get",
						data : {"empId":item.fk_approvalEmpId},				
						dataType : "json",
						async : false,
						success : function(employeevo) {
							let html = "<dl class='after' id='approvalEmp'>" +
									   		"<dt>"+
									   			"<label for=''>예약 관리자</label>"+
									   		"</dt>"+
									   		"<dd id='fk_approvalEmpId'>"+employeevo.empName+"</dd>"+
									   "</dl>";
							$("div#rsvInfoDetail").append(html);	
						},
						error : function(request, status, error) {
							alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
						}
					});	
				}
				
				// --- 예약 반려인 경우 시작 --- //
				$("dl#rejectReason").remove();	
				if(item.rejectReason != null){ 
					let html = "<dl class='after' id='rejectReason'>" +
							   		"<dt>"+
							   			"<label for=''>반려 사유</label>"+
							   		"</dt>"+
							   		"<dd id='rejectReason'>"+item.rejectReason+"</dd>"+ 
							   "</dl>";
				 	$("div#rsvInfoDetail").append(html);
				}
				
				// --- 반납 버튼 삭제하는 경우 --- //
				if(item.returnStatus == 0 ||  // 반납필수자원이 아닌 경우
				   item.approvalStatus == 1 || item.approvalStatus == 3){ // 결재상태가 대기, 반려인 경우
					$("button#returnStatus").remove();	
				}
			
			});
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}


<%-- 예약 삭제 모달 열기 --%>
function delRsvModalOpen(rsvId){		
	$("div#reservation_del_layer").removeClass("hide");
	$("button.del_reservation_btn").attr("id", rsvId); // 삭제하기 위한 자원예약id 넣기 (from 나의예약)
}


<%-- 예약 삭제하기 --%>
function delRservation(rsvId){
	console.log(rsvId);
	$.ajax({
    	url : "<%=ctxPath%>/reservation/delReservation.gw",
		type : "get",
		data : {"rsvResourceId":rsvId},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){ // 예약삭제 성공한 경우 
				alert("예약이 삭제 되었습니다.");
				window.location.reload();
			}
			else{ // 예약 삭제 실패한 경우
				alert("예약 삭제를 실패했습니다.");
			}
			
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});			
}


<%-- 예약 자원 반납 모달 열기 --%>
function returnRsourceModalOpen(rsvId){
	console.log(rsvId);
	$("div#reservation_return_layer").removeClass("hide");
	$("button.reservation_return_btn").attr("id", rsvId); // 반납하기 위한 자원예약id 넣기 (from 나의예약)
}


<%-- 예약 자원 반납하기--%>
function returnRsource(rsvId){	
	console.log(rsvId);
	
	$.ajax({
    	url : "<%=ctxPath%>/reservation/returnRsource.gw",
		type : "get",
		data : {"rsvResourceId":rsvId},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){ // 자원 반납 성공한 경우 
				alert("반납되었습니다.");
				window.location.reload();
			}
			else{ // 자원 반납 실패한 경우
				alert("반납에 실패했습니다.");
			}
			
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}


<%-- 예약 승인 모달 열기 --%>
function rsvApproveModalOpen(rsvId){
	$("div#reservation_approve_layer").removeClass("hide");	
	$("button.reservation_approve_btn").attr("id", rsvId);
}


<%-- 예약 승인하기 --%>
function rsvApprove(rsvId){		
	console.log(rsvId);
	$.ajax({
    	url : "<%=ctxPath%>/reservation/rsvApprove.gw",
		type : "get",
		data : {"rsvResourceId":rsvId},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){ // 자원 반납 성공한 경우 
				alert("승인되었습니다.");
				window.location.reload();
			}
			else{ // 자원 반납 실패한 경우
				alert("승인에 실패했습니다.");
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}


<%-- 예약 반려 모달 열기 --%>
function rsvRejectModalOpen(rsvId){
	$("div#reservation_reject_layer").removeClass("hide");	
	$("button.reservation_reject_btn").attr("id", rsvId);
}


<%-- 예약 반려하기 --%>
function rsvReject(rsvId){ 
	
	const rejectReason = $("input#rejectReason").val();
	if(rejectReason.trim() == ""){
		alert("반려사유를 입력하세요");
		return;
	}
	
	$.ajax({
    	url : "<%=ctxPath%>/reservation/rsvReject.gw",
		type : "get",
		data : {"rsvResourceId":rsvId,
				"rejectReason":rejectReason},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){ // 자원 반납 성공한 경우 
				alert("반려되었습니다.");
				window.location.reload();
			}
			else{ // 자원 반납 실패한 경우
				alert("반려에 실패했습니다.");
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}


<%-- 카테고리 삭제 모달 열기 --%>
function categoryDelModalOpen(id){
	$("button.categoryDel_btn").attr("id", id); // 카테고리삭제하기 위한 자원예약id 넣기 (from 카테고리관리)
	$("div#category_del_layer").removeClass("hide");	
}


<%-- 카테고리 삭제하기 --%>
function categoryDel(categoryId){
	$.ajax({
    	url : "<%=ctxPath%>/reservation/categoryDel.gw",
		type : "get",
		data : {"resourceCategoryId":categoryId},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){ // 성공한 경우 
				alert("삭제되었습니다.");
				window.location.reload();
			}
			else{ // 실패한 경우
				alert("삭제에 실패했습니다.");
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}


<%-- 자원 삭제 모달 열기 --%>
function resourceDelModalOpen(id){
	$("button.resourceDel_btn").attr("id", id); // 카테고리삭제하기 위한 자원예약id 넣기 (from 카테고리관리)
	$("div#resource_del_layer").removeClass("hide");	
}


<%-- 자원 삭제하기 --%>
function resourceDel(resourceId){
	$.ajax({
    	url : "<%=ctxPath%>/reservation/resourceDel.gw",
		type : "get",
		data : {"resourceId":resourceId},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){ // 성공한 경우 
				alert("삭제되었습니다.");
				window.location.reload();
			}
			else{ // 실패한 경우
				alert("삭제에 실패했습니다.");
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}


<%-- 관리자추가 모달 열기 --%>
function rsvAdminAddModalOpen(){
	$("div#rsvAdmin_add_layer").removeClass("hide");	
	$("div#rsvAdmin_add_layer").addClass("layer_box");	
}

	
</script>



<title>Good Office</title>
<meta name="viewport" content="width=1024">


</head>


<body class="vsc-initialized">
	<div id="wrap">


		<!-- 헤더 시작  -->
		<tiles:insertAttribute name="header" />
		<!-- 헤더 끝  -->

		<div id="container">


			<!-- 사이드바 시작  -->
			<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝  -->

			<!-- 컨텐츠 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->


		</div>
		<div id="dimmed"></div>
		<div id="dimmed2"></div>


		<!-- /////////////////////// 모달 시작 /////////////////////// -->


		<%-- ========== 카테고리설명 모달 시작 ========== --%>
		<div id="category_detail_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box rs-detail-layer popup16" style="margin-left: -411px; margin-top: -300.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">카테고리 설명</div>
					<div class="scroll ta_c">
						<div class="rs-detail-img">
							<img src="<%= ctxPath%>${requestScope.viewPath}${requestScope.resourceCategoryInfo_map.imageFile}" alt="">
						</div>
						<div class="rs-name">${requestScope.resourceCategoryInfo_map.resourceCategoryName}</div>
						<div class="rs-detail-text">${requestScope.resourceCategoryInfo_map.description}</div>

						<div class="rs-tag after hide">
							<div class="title">
								<strong>자원 속성</strong>
							</div>
							<ul>
							</ul>
						</div>
					</div>
					<div class="layer_button">
						<button type="button" class="btn_variables reservation_layer_close" onclick="layerClose('category_detail');">확인</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer reservation_layer_close" onclick="layerClose('category_detail');" title="레이어 닫기">
						<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 카테고리설명 모달 끝 ========== --%>

				
		<%-- ========== 자원설명 모달 시작 ========== --%>
		<div id="resource_detail_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box rs-detail-layer popup16" style="margin-left: -411px; margin-top: -300.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">자원 설명</div>
					<div class="scroll ta_c">
						<div class="rs-detail-img">
							<img class="rs-imgFile" src="" alt="">
						</div>
						<div class="rs-name"></div>
						<div class="rs-detail-text"></div>
					</div>
					<div class="layer_button">
						<button type="button" class="btn_variables booking_layer_close" onclick="layerClose('resource_detail');">확인</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" onclick="layerClose('resource_detail');" title="레이어 닫기">
						<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 자원설명 모달 끝 ========== --%>
		
		
		<%-- ========== 예약하기 모달 시작 ========== --%>
		<div id="resource_reservation_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box rs-booking-layer popup1 " style="margin-left: -221px; margin-top: -193.5px; display: block; z-index: 1005;">
					<form id="booking_resource_frm">
						<div class="title_layer text_variables">예약하기</div>
						<div class="to-add detail-search">
							<dl class="after">
								<dt>
									<label for="">자원 이름</label>
								</dt>
								<dd>
									<select id="resource_list_select" name="resource_no[]" class="select-box" style="width: 270px" onchange="bookingMain.selectResource();">
										
									</select>
								</dd>
							</dl>
							<div id="resource_type_layer_div">
								<dl class="after">
									<dt>
										<label for="">날짜</label>
									</dt>
									<dd>
										<div class="fl">
											<input type="text" name="reservationDate" id="reservationDate" class="datepicker" style="width: 147px;">
											<label for="reservationDate">
												<img class="ui-datepicker-trigger icon month" src="<%=ctxPath%>/resources/image/icon/sp_icon.png" alt="예약 날짜 선택" title="예약 날짜 선택">
											</label>
										</div>
									</dd>
								</dl>
								<dl class="after">
									<dt>
										<label for="">예약 시간</label>
									</dt>
									<dd class="after">
										<div class="fl">
											<select id="rsvStartDayTime" class="select-box" style="width: 125px;">
												<c:forEach var="item" varStatus="i" begin="0" end="23" step="1">
													<option value="${item}:00:00">${item}:00</option>
												</c:forEach>
											</select>
											~
											<select id="rsvEndDayTime" class="select-box" style="width: 125px;">
												<c:forEach var="item" varStatus="i" begin="0" end="23" step="1">
													<option value="${item}:00:00">${item}:00</option>
												</c:forEach>
											</select>
										</div>
									</dd>
								</dl>
							</div>
							<dl class="after">
								<dt>
									<label for="">사용 용도</label>
								</dt>
								<dd class="after">
									<textarea class="rs-layer-textarea" id="rsvReason"></textarea>
								</dd>
							</dl>
						</div>
						<div class="layer_button">
							<button type="button" class="btn_variables" onclick="addReservation();">저장</button>
							<button type="button" class="reservation_layer_close" onclick="layerClose('resource_reservation');">취소</button>
						</div>
						<a href="javascript:void(0)" class="icon btn_closelayer reservation_layer_close" onclick="layerClose('resource_reservation');" title="레이어 닫기">
							<span class="blind">레이어 닫기</span>
						</a>
					</form>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 예약하기 모달 끝 ========== --%>

 
		<%-- ========== 예약확인 모달 시작 ========== --%>
		<div id="reservation_info_detail_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box mid_large popup3" style="margin-left: -256px; margin-top: -205px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">예약 확인</div>
					<div class="to-add" id="rsvInfoDetail">
						<dl class="after">
							<dt>
								<label for="">자원 이름</label>
							</dt>
							<dd id="resourceName"></dd>
						</dl>
						<dl class="after">
							<dt>
								<label for="">예약 시간</label>
							</dt>
							<dd id="rsvDayTime"></dd>
						</dl>
						<dl class="after">
							<dt>
								<label for="">등록자</label>
							</dt>
							<dd id="rsvEmpName"></dd>
						</dl>
						<dl class="after">
							<dt>
								<label for="">사용 용도</label>
							</dt>
							<dd id="rsvReason"></dd>
						</dl>
						<dl class="after">
							<dt>
								<label for="">예약 상태</label>
							</dt>
							<dd id="rsvStatus"></dd>
						</dl>
					</div>

					<div class="layer_button">
						<button type="button" class="btn_variables booking_layer_close" onclick="layerClose('reservation_info_detail');">확인</button>
						<c:if test='${reservedResource.returnStatus != "0" and requestScope.type == ""}'>
						<button type="button" class="btn_variables booking_return_layer_btn" id="returnStatus" onclick="returnRsourceModalOpen()">반납</button>
						</c:if>
						<button type="button" class="warning" onclick="delRsvModalOpen()">삭제</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" onclick="layerClose('reservation_info_detail');" title="레이어 닫기">
						<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 예약확인 모달 끝 ========== --%>


		<%-- ========== 예약삭제 모달 시작 ========== --%>
		<div id="reservation_del_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup4" style="margin-left: -175px; margin-top: -120px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">예약 삭제</div>
					<div>
						<div>예약을 삭제하시겠습니까?</div>
					</div>

					<div class="layer_button">
						<button type="button" class="btn_variables del_reservation_btn" onclick="delRservation(this.id)">확인</button>
						<button type="button" class="booking_layer_close " onclick="layerClose('reservation_del');">취소</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" onclick="layerClose('reservation_del');" title="레이어 닫기">
						<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 예약삭제 모달 끝 ========== --%>


		<%-- ========== 예약반납 모달 시작 ========== --%>
		<div id="reservation_return_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup12" style="margin-left: -175px; margin-top: -87.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">반납 확인</div>
					<div class="font12">
						<span class="point_color">예약한 자원을 반납 처리합니다.</span>
					</div>
					<div class="layer_button">
						<button type="button" class="btn_variables reservation_return_btn" onclick="returnRsource(this.id)">확인</button>
						<button type="button" class="booking_layer_close" onclick="layerClose('reservation_return');">취소</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기" onclick="layerClose('reservation_return');">
						<span class="blind">레이어 닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 예약반납 모달 끝 ========== --%>
		

		<%-- ========== 예약승인 모달 시작 ========== --%>
		<div id="reservation_approve_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup8" style="margin-left: -175px; margin-top: -95.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">예약 승인</div>
					<div class="font12">
						예약 내용을 확인했으며 예약을 승인합니다.
					</div>
					<div class="layer_button">
						<button type="button" class="btn_variables reservation_approve_btn" onclick="rsvApprove(this.id)">확인</button>
						<button type="button" class="booking_layer_close" onclick="layerClose('reservation_approve');">취소</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기" onclick="layerClose('reservation_approve');">
						<span class="blind">레이어 닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 예약승인 모달 끝 ========== --%>


		<%-- ========== 예약반려 모달 시작 ========== --%>
		<div id="reservation_reject_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup10" style="margin-left: -175px; margin-top: -126.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">예약 반려</div>
					<div class="font12">
						예약을 아래의 사유로 반려합니다.
					</div>
					<div class="pdt_30">
						<strong>메모 추가</strong>
						<p class="pdt_10">
							<input type="text" id="rejectReason" style="width: 280px;">
						</p>
					</div>
					<div class="layer_button">
						<button type="button" class="btn_variables reservation_reject_btn" onclick="rsvReject(this.id)">확인</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기" onclick="layerClose('reservation_reject');">
						<span class="blind">레이어 닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 예약반려 모달 끝 ========== --%>


		<%-- ========== 카테고리 삭제 모달 시작 ========== --%>
		<div id="category_del_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup5" style="margin-left: -175px; margin-top: -96.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">카테고리 삭제</div>
					<div>카테고리 삭제 시, 자원에 대한 모든 예약 기록이 삭제되며 복구할 수 없습니다.</div>

					<div class="layer_button">
						<button type="button" class="warning categoryDel_btn" onclick="categoryDel(this.id)">위 내용을 확인했으며 삭제합니다.</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기" onclick="layerClose('category_del');">
						<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 카테고리 삭제 모달 끝 ========== --%>
		
		
		<%-- ========== 자원 삭제 모달 시작 ========== --%>
		<div id="resource_del_layer" class="booking_layer_div hide">
			<div class="layer_box" style="z-index: 1005;">
				<div class="layer_box middle popup5" style="margin-left: -175px; margin-top: -96.5px; display: block; z-index: 1005;">
					<div class="title_layer text_variables">자원 삭제</div>
					<div>자원 삭제 시, 자원에 대한 모든 예약 기록이 삭제되며 복구할 수 없습니다.</div>

					<div class="layer_button">
						<button type="button" class="warning resourceDel_btn" onclick="resourceDel(this.id)">위 내용을 확인했으며 삭제합니다.</button>
					</div>
					<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기" onclick="layerClose('category_del');">
						<span class="blind">닫기</span>
					</a>
				</div>
			</div>
			<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
		</div>
		<%-- ========== 자원 삭제 모달 끝 ========== --%>


		<!-- /////////////////////// 모달 끝 /////////////////////// -->

	</div>


</body>
</html>


