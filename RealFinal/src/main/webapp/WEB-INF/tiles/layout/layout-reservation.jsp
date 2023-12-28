<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css" >

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script>
<%-- <script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>  --%>









<!-- official css -->
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/header_search.css"> --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/inHTML.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/reservation/style.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/reservation/style_new.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/reservation/style_tutorial.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/reservation/style_resources.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/reservation/booking_common.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/reservation/new_lnb.css">




<%-- 스피너 및 datepicker 를 사용하기 위해 jQueryUI CSS 및 JS --%>	
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>






<style type="text/css">
.layer_box.rs-booking-layer{
	width: 440px; !important
}
</style>



<script type="text/javascript">

$(document).ready(function(){
	

	<%-- 모달창 닫기 --%>		
	$(".booking_layer_close").click(function(){
		$("div#resource_reservation_layer").addClass("hide")
	});
	
	
	
	
	
	
	
	
	// === jQuery UI 의 datepicker === //
	$('input.datePicker').datepicker({		
             dateFormat: 'yy-mm-dd'  //Input Display Format 변경
            ,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true        //콤보박스에서 년 선택 가능
            ,changeMonth: true       //콤보박스에서 월 선택 가능                
        //  ,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
        //  ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //  ,buttonImageOnly: true   //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        //  ,buttonText: "선택"       //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년"         //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        //  ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        //  ,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)                
     });
     
     // 초기값을 오늘 날짜로 설정
  // $('input.datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
	 
	 
	 // === 전체 datepicker 옵션 일괄 설정하기 ===  
	 //     한번의 설정으로 $("input#fromDate"), $('input#toDate')의 옵션을 모두 설정할 수 있다.
     $(function() {
         //모든 datepicker에 대한 공통 옵션 설정
         $.datepicker.setDefaults({
              dateFormat: 'yy-mm-dd' //Input Display Format 변경
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
             ,changeYear: true //콤보박스에서 년 선택 가능
             ,changeMonth: true //콤보박스에서 월 선택 가능                
          // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
          // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
          // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
             ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
          // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
          // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
         });
  
/*          // input을 datepicker로 선언
         $("input#fromDate").datepicker();                    
         $("input#toDate").datepicker();
         
         // From의 초기값을 오늘 날짜로 설정
         $('input#fromDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
         
         // To의 초기값을 3일후로 설정
         $('input#toDate').datepicker('setDate', '+3D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) */
      });
	 
	 ///////////////////////////////////////////////////////////////////////
    
	/*  
	 $('input.datePicker').bind("change", (e) => {
		 if( $(e.target).val() != "" ) {
			 $(e.target).next().hide();
		 }
	 });// 생년월일에 마우스로 달력에 있는 날짜를 선택한 경우 이벤트 처리 한것 
 */
})// end of $(document).ready(function(){})-------------------------



// Function Declaration

<%-- 예약하기 모달 창 열기 --%>
function resourceReserve(){
		if($("div#resource_reservation_layer").hasClass("hide") === true) { // 옵션드롭다운이 보이지 않는 중일 경우
			$("div#resource_reservation_layer").removeClass("hide")
		}
		/* else{ // 옵션드롭다운이 보이는 중일 경우 
			$("div#m_write_option_detail").addClass("hide")
		} */
		
	
}




</script>








<title>하이웍스 오피스</title>
<meta name="viewport" content="width=1024">


</head>





<body class="vsc-initialized">
	<div id="wrap">
		
		
		<!-- 헤더 시작  -->
		<tiles:insertAttribute name="header" />
		<!-- 헤더 끝  -->
		
		
		<!--
		<script type="text/javascript" src="https://gnb.office.hiworks.com/main.js?v=20220215"></script>
		-->
		
		<div id="container">
				
			<!--
			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle"
					style="left: 0px;"></div>
			</div>
			-->
			
			
			
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
								<optgroup label="회의실" cate_no="1163" resource_type="T">
									<option value="1390">회의실 B2</option>
									<option value="1393">회의실 A1</option>
									<option value="1394">회의실 M5</option>
								</optgroup>
								<optgroup label="법인 차량" cate_no="1164" resource_type="T">
									<option value="1391">차량(4인)</option>
									<option value="1395">차량(6인)</option>
								</optgroup>
								<optgroup label="사내 콘도" cate_no="1166" resource_type="D">
									<option value="1396">콘도1(제주)</option>
									<option value="1397">콘도2(속초)</option>
								</optgroup>
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
									<input type="text" name="date" id="booking_date_in_layer" onchange="bookingMain.selectResource();" class="datepicker hasDatepicker" style="width: 147px;" value="2023-11-30">
									<!-- <input type="text" name="date" id="booking_date_in_layer" onchange="bookingMain.selectResource();" class="datepicker hasDatepicker" style="width: 147px;" value="2023-11-30">
									 -->
									<img class="ui-datepicker-trigger icon month" src="<%= ctxPath%>/resources/image/icon/sp_icon.png" alt="예약 날짜 선택" title="예약 날짜 선택">
								</div>
							</dd>
						</dl>
						<dl class="after">
							<dt>
								<label for="">예약 시간</label>
							</dt>
							<dd class="after">
								<div class="fl">
									<select id="start" class="select-box" style="width: 125px;">
										<c:forEach var="item" varStatus="i" begin="0" end="23" step="1">
											<option value="${item}:00:00">${item}:00</option>
											<option value="${item}:30:00">${item}:30</option>
										</c:forEach>
									</select>
									~
									<select id="end" class="select-box" style="width: 125px;">
										<c:forEach var="item" varStatus="i" begin="0" end="23" step="1">
											<option value="${item}:00:00">${item}:00</option>
											<option value="${item}:30:00">${item}:30</option>
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
							<textarea class="rs-layer-textarea" name="booking_reason"></textarea>
						</dd>
					</dl>
					<dl class="after hide" id="add_resource_dl">
						<dt>
							<label for="">복수 자원</label>
						</dt>
						<dd class="after">
							<ul class="multi-select" id="resource_list_layer">
								<li>
									<label><input type="checkbox" name="resource_no[]" value="1393">
										<span class="img">
											<img src="/static/ui/images/resource/default03.jpeg" alt="">
										</span> <span>회의실 A1</span></label>
								</li>
								<li>
									<label><input type="checkbox" name="resource_no[]" value="1394">
										<span class="img">
											<img src="/static/ui/images/resource/default03.jpeg" alt="">
										</span> <span>회의실 M5</span></label>
								</li>
							</ul>
						</dd>
					</dl>
				</div>
				<p>
					<!--  	<button class="weakblue" type="button" id="add_resource_btn"
				onclick="bookingMain.showAddResourceList();">+ 추가 자원 예약</button>	-->
				</p>
				<div class="layer_button">
					<button type="button" class="btn_variables" onclick="bookingMain.addBooking();">저장</button>
					<button type="button" class="booking_layer_close">취소</button>
				</div>
				<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기">
					<span class="blind">레이어 닫기</span>
				</a>
			</form>
		</div>
	</div>
	<div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<%-- ========== 예약하기 모달 끝 ========== --%>




<%-- 
<!-- # 예약확인 모달 시작 -->
<div id="booking_info_detail_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box mid_large popup3"
			style="margin-left: -256px; margin-top: -205px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">예약 확인</div>
			<div class="to-add">
				<dl class="after">
					<dt>
						<label for="">자원 이름</label>
					</dt>
					<dd>콘도2(속초)</dd>
				</dl>
				<dl class="after">
					<dt>
						<label for="">예약 시간</label>
					</dt>
					<dd>2023-12-01 오전 ~ 2023-12-01 오후</dd>
				</dl>
				<dl class="after">
					<dt>
						<label for="">등록자</label>
					</dt>
					<dd>대표이사(2023-12-01 12:49:44)</dd>
				</dl>
				<dl class="after">
					<dt>
						<label for="">사용 용도</label>
					</dt>
					<dd>dd</dd>
				</dl>
				<dl class="after">
					<dt>
						<label for="">예약 상태</label>
					</dt>
					<dd>예약 완료</dd>
				</dl>
				<!-- 예약 승인자의 경우 조건 걸어서 특정한 경우에만 보이도록 (ex. 차량, 콘도) -->
				<!-- [D] 승인된 자원, 복수 자원 -->
				<dl class="after">
					<dt>
						<label for="">예약 승인자</label>
					</dt>
					<dd>대표이사 (ceo)</dd>
				</dl>
			</div>

			<div class="layer_button">
				<button type="button" class="btn_variables booking_layer_close">확인</button>
				<button type="button"
					class="btn_variables booking_return_layer_btn" booking_no="19221">반납</button>
				<!--button type="button" class="btn_variables">수정</button-->
				<button type="button" class="warning del_booking_layer_btn"
					booking_no="19221">삭제</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 예약확인 모달 끝 -->
--%>



<%--  
<!-- # 예약삭제 모달 시작 -->
<div id="booking_del_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box middle popup4"
			style="margin-left: -175px; margin-top: -120px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">예약 삭제</div>
			<div>
				<div>예약을 삭제하시겠습니까?</div>
			</div>

			<div class="layer_button">
				<button type="button" class="btn_variables del_booking_btn"
					booking_no="150">확인</button>
				<button type="button" class="booking_layer_close">취소</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 예약삭제 모달 끝 -->
--%>



<%--
<!-- # 예약반납 모달 시작 -->
<div id="booking_return_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box middle popup12"
			style="margin-left: -175px; margin-top: -87.5px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">반납 확인</div>
			<div class="font12">
				<span class="point_color">대표이사님이 예약한 자원을 반납 처리합니다.</span>
			</div>
			<div class="layer_button">
				<button type="button" class="btn_variables booking_return_btn"
					booking_no="19226">확인</button>
				<button type="button" class="booking_layer_close">취소</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">레이어 닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 예약반납 모달 끝 -->
--%>


<%-- 
<!-- # 카테고리설명 모달 시작 -->
<div id="category_detail_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box rs-detail-layer popup16"
			style="margin-left: -411px; margin-top: -300.5px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">카테고리 설명</div>
			<div class="scroll ta_c">
				<div class="rs-detail-img">
					<img src="<%= ctxPath%>/resources/image/쉐보레계기판.jpg" alt="">
				</div>
				<div class="rs-name">회의실</div>
				<div class="rs-detail-text">회의실 입니다.</div>

				<div class="rs-tag after hide">
					<div class="title">
						<strong>자원 속성</strong>
					</div>
					<ul>
					</ul>
				</div>
			</div>
			<div class="layer_button">
				<button type="button" class="btn_variables booking_layer_close">확인</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 카테고리설명 모달 끝 -->
--%>



<%--
<!-- # 자원설명 모달 시작 -->
<div id="category_detail_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box rs-detail-layer popup16"
			style="margin-left: -411px; margin-top: -300.5px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">자원 설명</div>
			<div class="scroll ta_c">
				<div class="rs-detail-img">
					<img src="<%= ctxPath%>/img/conferenceroomA1.png" alt="">
				</div>
				<div class="rs-name">회의실 A1</div>
				<div class="rs-detail-text">회의실 A1</div>

				<div class="rs-tag after">
					<div class="title">
						<strong>자원 속성</strong>
					</div>
					<ul>
						<li>오후 02:00부터 오후 05:00까지 이용 불가</li>
						<li>수요일 이용 불가</li>
					</ul>
				</div>
			</div>
			<div class="layer_button">
				<button type="button" class="btn_variables booking_layer_close">확인</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 자원설명 모달 끝 -->
--%>



<%--
<!-- # 예약승인 모달 시작 -->
<div id="booking_acknowledge_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box middle popup8"
			style="margin-left: -175px; margin-top: -95.5px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">예약 승인</div>
			<div class="font12">
				<span class="point_color">대표이사</span> 님의 예약 내용을 확인했으며 예약을 승인합니다.
			</div>
			<div class="layer_button">
				<button type="button" class="btn_variables"
					onclick="bookingAcknowledge.modifyBookingStatus('19236', 'BKCP')">확인</button>
				<button type="button" class="booking_layer_close">취소</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">레이어 닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 예약승인 모달 끝 -->
--%>



<%-- 
<!-- # 예약반려 모달 시작 -->
<div id="booking_reject_layer" class="booking_layer_div">
	<div class="layer_box" style="z-index: 1005;">
		<div class="layer_box middle popup10"
			style="margin-left: -175px; margin-top: -126.5px; display: block; z-index: 1005;">
			<div class="title_layer text_variables">예약 반려</div>
			<div class="font12">
				<span class="point_color">대표이사</span> 님의 예약을 아래의 사유로 반려합니다.
			</div>
			<div class="pdt_30">
				<strong>메모 추가</strong>
				<p class="pdt_10">
					<input type="text" id="reject_reason_layer" style="width: 280px;">
				</p>
			</div>
			<div class="layer_button">
				<button type="button" class="btn_variables"
					onclick="bookingAcknowledge.modifyBookingStatus('19236', 'BKRJ')">확인</button>
			</div>
			<a href="javascript:void(0)"
				class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span
				class="blind">레이어 닫기</span></a>
		</div>
	</div>
	<div class="layer_back"
		style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div>
</div>
<!-- # 예약반려 모달 끝 -->
--%>



<%--
<!-- # 카테고리 삭제 모달 시작 -->
<div id="category_del_layer" class="booking_layer_div"><div class="layer_box" style="z-index: 1005;"><div class="layer_box middle popup5" style="margin-left: -175px; margin-top: -96.5px; display: block; z-index: 1005;">
	<div class="title_layer text_variables">카테고리 삭제</div>
	<div>
		카테고리 삭제 시, 자원에 대한 모든 예약 기록이 삭제되며 복구할 수 없습니다.	</div>

	<div class="layer_button">
		<button type="button" class="warning" onclick="bookingCategory.delCategory(1982);">위 내용을 확인했으며 삭제합니다.</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer booking_layer_close" title="레이어 닫기"><span class="blind">닫기</span></a>
</div></div><div class="layer_back" style="position: fixed; width: 100%; height: 100%; z-index: 1000; background-color: rgb(0, 0, 0); opacity: 0.3; top: 0px; left: 0px; margin: 0px; padding: 0px;"></div></div>
<!-- # 카테고리 삭제 모달 끝 -->
--%>


<%-- 
<!-- # 관리자추가 모달 시작 -->
<div class="layer_box large address hide" id="div_booking_view"
	style="margin-left: -411px; margin-top: -310px; display: block;">
	<div class="title_layer text_variables">관리자 추가</div>
	<div class="search-address">
		<div class="hidden">
			<input type="hidden" id="booking_order_key" value="N">
			<dl class="dvdLayer" id="searchP" style="display: block;">
				<dt style="width: 45%">
					<input type="radio" value="name" name="searchField"
						id="rdo_sch_name" onclick="$j('#keyword').focus();"
						checked="checked"><label for="rdo_sch_name">이름 ,
						아이디</label>&nbsp;&nbsp; <input type="radio" value="group"
						name="searchField" id="rdo_sch_group"
						onclick="$j('#keyword').focus();"><label
						for="rdo_sch_group">그룹</label>&nbsp;&nbsp;

				</dt>
				<dd style="width: 55%">
					<input type="text" style="height: 21px; width: 140px;"
						class="text-box" title="검색어 입력" id="keyword"
						onkeypress="if(event.keyCode == 13) addressbook.click_searchBtn();">
					<a href="javascript:void(0);" class="btn-search"
						onclick="addressbook.click_searchBtn();">검색</a>
				</dd>
			</dl>
		</div>
		<div class="after">
			<p class="pdb_10">이미 추가된 관리자는 추가해도 추가되지 않습니다.</p>
			<!-- 관리자 추가일 경우 노출 -->
			<p class="pdb_10 fl" id="searchMessage" style="display: none;">
				<span id="searchKeyword"></span> 검색결과 : <span id="searchCount"></span>
				<a href="javascript:void(0);" class="search_bt weakblue"
					onclick="addressbook.setTab(addressbook.currentTab);"><span
					class="sp_menu searchCancel"></span>검색 취소</a>
			</p>
		</div>
	</div>

	<div class="address-choice-form after">
		<!-- 1. type2를 떼면 관리자 추가
	2. type2를 붙이면 결재선 설정, 결재선 추가, 부서 결재선 등록, 
	3. sign을 붙이면 결재선 설정 (결재, 합의만 있는)
 -->
		<div class="fl">
			<div class="category_list" style="overflow-y: scroll;">
				<select id="leftList" size="19" frameborder="0"
					style="display: none;" onclick="addressbook.click_leftList(this)">
				</select>
				<div id="treeDiv" style="" class="treeDiv OrgTree">
					<ul>
						<li id="addressTreeNode_57182" class="last"><div
								class="container">
								<img onclick="addressbook.ToggleTree(this);"
									src="https://booking.office.hiworks.com/assets/images/common/tree_images/tree_m.gif"
									class="plus"><strong
									onclick="addressbook.selectNode(this);" class="selectedNode">하이웍스산업
									<span
									style="font-weight: normal; color: silver; font-size: 8pt">(11)</span>
								</strong>
							</div>
							<ul style="">
								<li id="addressTreeNode_57184"><div class="container">
										<img onclick="addressbook.ToggleTree(this);"
											src="https://booking.office.hiworks.com/assets/images/common/tree_images/tree_p.gif"
											class="plus"><strong
											onclick="addressbook.selectNode(this);">관리부 <span
											style="font-weight: normal; color: silver; font-size: 8pt">(4)</span></strong>
									</div>
									<ul style="display: none;">
										<li id="addressTreeNode_57187"><div class="container">
												<strong onclick="addressbook.selectNode(this);">인사팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
										<li id="addressTreeNode_57188"><div class="container">
												<strong onclick="addressbook.selectNode(this);">구매총무팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
										<li id="addressTreeNode_57189" class="last"><div
												class="container">
												<strong onclick="addressbook.selectNode(this);">재무회계팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(2)</span>
												</strong>
											</div></li>
									</ul></li>
								<li id="addressTreeNode_57185"><div class="container">
										<img onclick="addressbook.ToggleTree(this);"
											src="https://booking.office.hiworks.com/assets/images/common/tree_images/tree_p.gif"
											class="plus"><strong
											onclick="addressbook.selectNode(this);">생산부 <span
											style="font-weight: normal; color: silver; font-size: 8pt">(3)</span></strong>
									</div>
									<ul style="display: none;">
										<li id="addressTreeNode_57190"><div class="container">
												<strong onclick="addressbook.selectNode(this);">생산1팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
										<li id="addressTreeNode_57191"><div class="container">
												<strong onclick="addressbook.selectNode(this);">생산2팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
										<li id="addressTreeNode_57192" class="last"><div
												class="container">
												<strong onclick="addressbook.selectNode(this);">품질관리팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
									</ul></li>
								<li id="addressTreeNode_57186" class="last"><div
										class="container">
										<img onclick="addressbook.ToggleTree(this);"
											src="https://booking.office.hiworks.com/assets/images/common/tree_images/tree_p.gif"
											class="plus"><strong
											onclick="addressbook.selectNode(this);">영업부 <span
											style="font-weight: normal; color: silver; font-size: 8pt">(3)</span></strong>
									</div>
									<ul style="display: none;">
										<li id="addressTreeNode_57193"><div class="container">
												<strong onclick="addressbook.selectNode(this);">영업1팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
										<li id="addressTreeNode_57194"><div class="container">
												<strong onclick="addressbook.selectNode(this);">영업2팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
										<li id="addressTreeNode_57195" class="last"><div
												class="container">
												<strong onclick="addressbook.selectNode(this);">고객지원팀
													<span
													style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
												</strong>
											</div></li>
									</ul></li>
							</ul></li>
					</ul>
				</div>
				<div id="leftProgressDiv" style="display: none;"
					class="progressDiv">
					<img src="/assets/images/common/icon/progress_big.gif">
				</div>
			</div>
			<div class="list">
				<select multiple="" id="rightList" style="">
					<option value="86920" title="과장 강과장 <영업2팀>">과장 강과장
						&lt;영업2팀&gt;</option>
					<option value="86917" title="이사 김이사 <생산1팀>">이사 김이사
						&lt;생산1팀&gt;</option>
					<option value="86914" title="대표이사 대표이사 <하이웍스산업>">대표이사
						대표이사 &lt;하이웍스산업&gt;</option>
					<option value="86916" title="상무 박상무 <구매총무팀>">상무 박상무
						&lt;구매총무팀&gt;</option>
					<option value="86922" title="주임 안주임 <품질관리팀>">주임 안주임
						&lt;품질관리팀&gt;</option>
					<option value="86921" title="대리 양대리 <재무회계팀>">대리 양대리
						&lt;재무회계팀&gt;</option>
					<option value="86918" title="부장 오부장 <생산2팀>">부장 오부장
						&lt;생산2팀&gt;</option>
					<option value="86923" title="사원 이사원 <고객지원팀>">사원 이사원
						&lt;고객지원팀&gt;</option>
					<option value="86919" title="차장 조차장 <영업1팀>">차장 조차장
						&lt;영업1팀&gt;</option>
					<option value="86924" title="계약직 주알바 <재무회계팀>">계약직 주알바
						&lt;재무회계팀&gt;</option>
					<option value="86915" title="사장 최사장 <인사팀>">사장 최사장
						&lt;인사팀&gt;</option>
				</select>
				<div class="add-btn">
					<a href="javascript:void(0);" class="blind icon btn-to"
						onclick="bookingAdmin.addAdminClick();" id="approval_add">추가</a>
				</div>
				<div class="choice-area approve">
					<a class="text_variables" href="javascript:void(0);"
						onclick="addressbook.click_rightSelect('select');">전체</a> <a
						class="text_variables" href="javascript:void(0);"
						onclick="addressbook.click_rightSelect('deselect');">선택안함</a> <a
						class="text_variables" href="javascript:void(0);"
						onclick="addressbook.click_orderBtn('name', 'asc');">이름순</a>
					<!--a class="text_variables" href="javascript:void(0);" onclick="addressbook.click_orderBtn('name', 'desc');">설정순</a-->
				</div>
			</div>
			<div class="after page_select_wrap">
				<div class="page_select" id="pagingP"></div>
			</div>
			<div id="rightProgressDiv" style="display: none;"
				class="progressDiv">
				<img src="/assets/images/common/icon/progress_big.gif">
			</div>
		</div>

		<div class="to-item approve">
			<h5 class="fl">
				<span>관리자</span> <span id="sp_eaApproval">0</span>
			</h5>
			<div class="fr updown-wrap first" id="approval_swap"></div>
			<div class="to clear" style="height: 294px;">
				<select multiple="" id="select_admin_user_list" ondblclick=""
					style="height: 296px"><option value="86914" disabled="">대표이사
						대표이사&lt;하이웍스산업&gt;</option>
					<option value="86915" disabled="">사장 최사장&lt;인사팀&gt;</option></select>
				<div class="del-btn" id="approval_delete">
					<a href="javascript:void(0);" class="blind icon btn-to"
						onclick="bookingAdmin.delAdminClick();">삭제</a>
				</div>
				<!-- disabled -->
			</div>
		</div>
	</div>
	<div class="layer_button">
		<button type="button" class="btn_variables"
			onclick="addressbook.closeApply();">등록</button>
		<button type="button" onclick="addressbook.closeAddressbook();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer"
		onclick="addressbook.closeAddressbook();" title="레이어 닫기"><span
		class="blind">레이어 닫기</span></a>
</div>
<!-- # 관리자추가 모달 끝 -->
--%>
<!-- /////////////////////// 모달 끝 /////////////////////// -->

	</div> <!-- [참고] 해당 /div id='wrap'임  -->
	
	<div id="main_layer_div"></div>

	<div class="layer_box small alarm hide popup1 " style="" id="HWA_MAIN">
		<p class="text" id="HWA_MSG"></p>
		<div class="layer_button">
			<button class="btn_variables" type="button" onclick="hidePopup();"
				id="HWA_MAIN_OK">확인</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>

	<div class="layer_box large hide dns_intro_layer" style="width: 550px;">
		<div class="title_layer text_variables">메일 서비스 이용 안내</div>
		<p class="bold body_bold">메일 서비스를 이용하시려면 하이웍스용 DNS 정보 설정이 필요합니다.</p>
		<p class="mgt_15">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			가비아 등록 도메인은 자동 설정을 지원합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('https://domain.gabia.com/api/hiworksdns/domainsetting')">가비아
				도메인 자동 설정하기</button>
		</div>
		<p class="pdt_20">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			타사 등록 도메인은 DNS 정보를 직접 설정해야 합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('https://customer.gabia.com/manuals_pop/manual_set.php?service=webmail_hosting&amp;fact=mailzine&amp;seq_no=2221')">
				설정 방법 보기</button>
		</div>
		<p class="bold body_bold mgt_50">
			※ 하이웍스용 DNS 정보 설정을 완료하셨다면 메일 용량을 할당한 후 메일 서비스를<br> 이용할 수 있습니다.
			‘오피스 관리’에서 계정별 메일 용량을 설정해주세요.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('/gabia.biz/admin/Orgmain')">
				오피스관리 페이지 가기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>


	
<!-- # ui-datepicker-div (이것도 모달이라고 불러...?) 시작  -->
<!-- 
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="position: fixed; top: 314.5px; left: 354px; z-index: 1006; display: none;">
	<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
		<a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전달">
			<span class="ui-icon ui-icon-circle-triangle-w">이전달</span>
		</a>
		<a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음달">
			<span class="ui-icon ui-icon-circle-triangle-e">다음달</span>
		</a>
		<div class="ui-datepicker-title">
			<select class="ui-datepicker-year" data-handler="selectYear" data-event="change">
				<option value="2022">2022</option>
				<option value="2023" selected="selected">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
			</select>
			년
			<select class="ui-datepicker-month" data-handler="selectMonth" data-event="change">
				<option value="0">1월</option>
				<option value="1">2월</option>
				<option value="2">3월</option>
				<option value="3">4월</option>
				<option value="4">5월</option>
				<option value="5">6월</option>
				<option value="6">7월</option>
				<option value="7">8월</option>
				<option value="8">9월</option>
				<option value="9">10월</option>
				<option value="10">11월</option>
				<option value="11" selected="selected">12월</option>
			</select>
		</div>
	</div>
	<table class="ui-datepicker-calendar">
		<thead>
			<tr>
				<th scope="col" class="ui-datepicker-week-end"><span title="일">일</span></th>
				<th scope="col"><span title="월">월</span></th>
				<th scope="col"><span title="화">화</span></th>
				<th scope="col"><span title="수">수</span></th>
				<th scope="col"><span title="목">목</span></th>
				<th scope="col"><span title="금">금</span></th>
				<th scope="col" class="ui-datepicker-week-end"><span title="토">토</span></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class=" ui-datepicker-week-end ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023">
					<a class="ui-state-default ui-priority-secondary" href="#">26</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023">
					<a class="ui-state-default ui-priority-secondary" href="#">27</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023">
					<a class="ui-state-default ui-priority-secondary" href="#">28</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023">
					<a class="ui-state-default ui-priority-secondary" href="#">29</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023">
					<a class="ui-state-default ui-priority-secondary" href="#">30</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">1</a>
				</td>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">2</a>
				</td>
			</tr>
			<tr>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">3</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">4</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">5</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">6</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">7</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">8</a>
				</td>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">9</a>
				</td>
			</tr>
			<tr>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">10</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">11</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">12</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">13</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">14</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">15</a>
				</td>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">16</a>
				</td>
			</tr>
			<tr>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">17</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">18</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">19</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">20</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">21</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">22</a>
				</td>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">23</a>
				</td>
			</tr>
			<tr>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">24</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">25</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">26</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">27</a>
				</td>
				<td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#">28</a>
				</td>
				<td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">29</a>
				</td>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">30</a>
				</td>
			</tr>
			<tr>
				<td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023">
					<a class="ui-state-default" href="#">31</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024">
					<a class="ui-state-default ui-priority-secondary" href="#">1</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024">
					<a class="ui-state-default ui-priority-secondary" href="#">2</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024">
					<a class="ui-state-default ui-priority-secondary" href="#">3</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024">
					<a class="ui-state-default ui-priority-secondary" href="#">4</a>
				</td>
				<td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024">
					<a class="ui-state-default ui-priority-secondary" href="#">5</a>
				</td>
				<td class=" ui-datepicker-week-end ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024">
					<a class="ui-state-default ui-priority-secondary" href="#">6</a>
				</td>
			</tr>
		</tbody>
	</table>
</div> -->
<!-- # ui-datepicker-div (이것도 모달이라고 불러...?) 끝  -->


	<deepl-input-controller></deepl-input-controller>
</body>
</html>