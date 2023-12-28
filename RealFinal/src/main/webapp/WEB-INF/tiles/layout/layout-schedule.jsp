<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- === #25. tiles 를 사용하는 레이아웃2 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>



<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/inHTML.css">
<%-- 필요없는듯 ?? <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/header_search.css"> --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/schedule_sidebar.css">
<%--  <!-- 아래 두개 지워도 잘 굴러가는데? 최종적으로 확인하고 필요없으면 지워도 될듯 ! ) 
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/schedule_monthly.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/schedule.css"> --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/schedule.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/style_new.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/style.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/schedule/style(1).css">







<title>하이웍스 오피스</title>
<meta name="viewport" content="width=1024">


</head>

<body class="vsc-initialized">
	<div id="wrap">
		
		
		<!-- 헤더자리 -->
		<!-- 헤더 시작  -->
		<tiles:insertAttribute name="header" />
		<!-- 헤더 끝  -->
		
		<!-- 
		<script type="text/javascript"
			src="https://gnb.office.hiworks.com/main.js?v=v1.231122.1"></script>
		-->
		
		
		<div id="container">
		
			<!-- 
			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle"
					style="left: 0px;"></div>
			</div>
 			-->
 
 
 			<!-- 사이드바 자리 -->
			<!-- 사이드바 시작  -->
			<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝  -->
			
			
			<!-- 컨텐츠 자리 -->
			<!-- 컨텐츠 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->
			
			
		</div>
		<div id="dimmed"></div>
		<div id="dimmed2"></div>
		
	</div>
	<div id="main_layer_div"></div>

	<div class="layer_box small alarm hide popup1 " style="" id="HWA_MAIN">
		<p class="text" id="HWA_MSG"
			style="padding-top: 10px; padding-left: 30px; padding-right: 30px;"></p>
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
				onclick="location:href=window.open('https://domain.gabia.com/api/hiworksdns/domainsetting?domain=gabia.biz')">가비아
				도메인 자동 설정하기</button>
		</div>
		<p class="pdt_20">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			타사 등록 도메인은 DNS 정보를 직접 설정해야 합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('https://customer.gabia.com/manuals_pop/manual_set.php?service=webmail_hosting&amp;fact=mailzine&amp;seq_no=2221')">설정
				방법 보기</button>
		</div>
		<p class="bold body_bold mgt_50">
			※ 하이웍스용 DNS 정보 설정을 완료하셨다면 메일 용량을 할당한 후 메일 서비스를<br> 이용할 수 있습니다.
			‘오피스 관리’에서 계정별 메일 용량을 설정해주세요.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('/gabia.biz/admin/Orgmain')">오피스관리
				페이지 가기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>



	<div id="owner-dimmed"></div>
	<deepl-input-controller></deepl-input-controller>
	<div id="ui-datepicker-div"
		class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
		

<!-- /////////////////////// 모달 시작 /////////////////////// -->
	
	<%-- 
	<!-- 일정추가,수정 시작 -->
	<div class="layer_box mid_large hide popup4" id="layer_schedule"
		style="margin-left: -256px; margin-top: -293px; display: block;">
		<input type="hidden" name="no" id="__no" value="0">
		<div class="title_layer text_variables" id="__cal_name">일정 추가</div>	
		<div class="to-add">
			<form method="post" name="lForm" id="lForm"
				action="javascript:void(0);">
				<ul class="sch_form text100">
					<li><span>캘린더</span>
						<div id="__project_name">
							<select id="__cal_list"><option value="1116618" type="m">나의
									프로젝트</option>
								<option value="1116863" type="m">재무팀,인사팀</option>
								<option value="1116865" type="m">sd</option>
								<option value="1116864" type="s">사내동호회 (대표이사)</option></select>
						</div></li>
					<li><span>일정 제목</span>
						<div>
							<input type="text" name="cal_subject" id="__subject">
						</div></li>
					<li><span>시작</span>
						<div>
							<input type="text"
								class="w100 cal_date repeat_info hasDatepicker"
								id="__start_date" value="2023-12-01"
								onchange="HiworksEvent.change_start_date(this);" readonly="">
							<select name="start_time" id="__start_time"
								class="w100 mgr_10 cal_time repeat_info"
								onchange="HiworksEvent.change_start_time(this);"><option
									value="00:00">오전 12:00</option>
								<option value="00:30">오전 12:30</option>
								<option value="01:00">오전 01:00</option>
								<option value="01:30">오전 01:30</option>
								<option value="02:00">오전 02:00</option>
								<option value="02:30">오전 02:30</option>
								<option value="03:00">오전 03:00</option>
								<option value="03:30">오전 03:30</option>
								<option value="04:00">오전 04:00</option>
								<option value="04:30">오전 04:30</option>
								<option value="05:00">오전 05:00</option>
								<option value="05:30">오전 05:30</option>
								<option value="06:00">오전 06:00</option>
								<option value="06:30">오전 06:30</option>
								<option value="07:00">오전 07:00</option>
								<option value="07:30">오전 07:30</option>
								<option value="08:00">오전 08:00</option>
								<option value="08:30">오전 08:30</option>
								<option value="09:00">오전 09:00</option>
								<option value="09:30">오전 09:30</option>
								<option value="10:00">오전 10:00</option>
								<option value="10:30">오전 10:30</option>
								<option value="11:00">오전 11:00</option>
								<option value="11:30">오전 11:30</option>
								<option value="12:00">오후 12:00</option>
								<option value="12:30">오후 12:30</option>
								<option value="13:00">오후 01:00</option>
								<option value="13:30">오후 01:30</option>
								<option value="14:00">오후 02:00</option>
								<option value="14:30">오후 02:30</option>
								<option value="15:00">오후 03:00</option>
								<option value="15:30">오후 03:30</option>
								<option value="16:00">오후 04:00</option>
								<option value="16:30">오후 04:30</option>
								<option value="17:00">오후 05:00</option>
								<option value="17:30">오후 05:30</option>
								<option value="18:00">오후 06:00</option>
								<option value="18:30">오후 06:30</option>
								<option value="19:00">오후 07:00</option>
								<option value="19:30">오후 07:30</option>
								<option value="20:00">오후 08:00</option>
								<option value="20:30">오후 08:30</option>
								<option value="21:00">오후 09:00</option>
								<option value="21:30">오후 09:30</option>
								<option value="22:00">오후 10:00</option>
								<option value="22:30">오후 10:30</option>
								<option value="23:00">오후 11:00</option>
								<option value="23:30">오후 11:30</option>
							</select> <label><input type="checkbox"
								class="_checkbox repeat_info" title="종일" id="__allday"
								onclick="HiworksEvent.allDay(this);"> 종일</label>
						</div></li>
					<li><span>종료</span>
						<div>
							<input type="text"
								class="w100 cal_date repeat_info hasDatepicker" id="__end_date"
								value="2023-12-01"
								onchange="HiworksEvent.change_end_date(this);" readonly="">
							<select name="end_time" id="__end_time"
								class="w100 mgr_10 cal_time repeat_info"><option
									value="00:00">오전 12:00</option>
								<option value="00:30">오전 12:30</option>
								<option value="01:00">오전 01:00</option>
								<option value="01:30">오전 01:30</option>
								<option value="02:00">오전 02:00</option>
								<option value="02:30">오전 02:30</option>
								<option value="03:00">오전 03:00</option>
								<option value="03:30">오전 03:30</option>
								<option value="04:00">오전 04:00</option>
								<option value="04:30">오전 04:30</option>
								<option value="05:00">오전 05:00</option>
								<option value="05:30">오전 05:30</option>
								<option value="06:00">오전 06:00</option>
								<option value="06:30">오전 06:30</option>
								<option value="07:00">오전 07:00</option>
								<option value="07:30">오전 07:30</option>
								<option value="08:00">오전 08:00</option>
								<option value="08:30">오전 08:30</option>
								<option value="09:00">오전 09:00</option>
								<option value="09:30">오전 09:30</option>
								<option value="10:00">오전 10:00</option>
								<option value="10:30">오전 10:30</option>
								<option value="11:00">오전 11:00</option>
								<option value="11:30">오전 11:30</option>
								<option value="12:00">오후 12:00</option>
								<option value="12:30">오후 12:30</option>
								<option value="13:00">오후 01:00</option>
								<option value="13:30">오후 01:30</option>
								<option value="14:00">오후 02:00</option>
								<option value="14:30">오후 02:30</option>
								<option value="15:00">오후 03:00</option>
								<option value="15:30">오후 03:30</option>
								<option value="16:00">오후 04:00</option>
								<option value="16:30">오후 04:30</option>
								<option value="17:00">오후 05:00</option>
								<option value="17:30">오후 05:30</option>
								<option value="18:00">오후 06:00</option>
								<option value="18:30">오후 06:30</option>
								<option value="19:00">오후 07:00</option>
								<option value="19:30">오후 07:30</option>
								<option value="20:00">오후 08:00</option>
								<option value="20:30">오후 08:30</option>
								<option value="21:00">오후 09:00</option>
								<option value="21:30">오후 09:30</option>
								<option value="22:00">오후 10:00</option>
								<option value="22:30">오후 10:30</option>
								<option value="23:00">오후 11:00</option>
								<option value="23:30">오후 11:30</option>
							</select> 
							<!-- <label><input type="checkbox" class="_checkbox"
								title="반복" id="__chk_is_repeat"> 반복  </label> -->
						</div></li>
					<div id="__repeatDetail" class="hide">
						<li><span>반복 빈도</span> <select
							class="w100 mgr_10 repeat_info" name="__sel_repeat_freq_list"
							id="__sel_repeat_freq_list"
							onchange="HiworksSchedule.change_repeat_option();"
							style="float: left">
								<option value="day" selected="">매일</option>
								<option value="week">매주</option>
								<option value="agendaweek">매주 월-금</option>
								<option value="month">매월</option>
								<option value="year">매년</option>
						</select> <select class="w50 mgr_10 repeat_info" id="__sel_repeat_freq"
							style="float: left;"><option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option></select> <span id="freq_txt">일 마다</span></li>
						<li class="hide" id="__repeatDetail_option"><span>&nbsp;</span></li>
						<li><span>반복 범위</span> <label><input type="radio"
								class="repeat_info" name="repeat_type" value="1" checked="">
								계속 반복</label> <label><input type="radio" class="repeat_info"
								name="repeat_type" style="margin-left: 5px" value="2"> <input
								type="text" class="repeat_info" style="width: 30px"
								id="_repeat_cnt" value="1"
								onkeyup="HiworksEvent.repeat_cnt(this);"> 번</label> <label><input
								type="radio" class="repeat_info" name="repeat_type"
								style="margin-left: 5px" value="3"> 반복 종료일 <input
								type="text" class="cal_date hasDatepicker" style="width: 80px"
								id="_repeat_end_date"
								onchange="HiworksEvent.change_repeat_enddate(this);" readonly=""></label>
						</li>
						<li class="hide" id="_repeat_info_txt">
							<div style="width: 435px; border: 1px solid #c5c5c5;">&nbsp;</div>
						</li>
					</div>
					<li><span>내용</span>
						<div>
							<textarea name="contents" id="__contents" cols="30" rows="10"></textarea>
						</div></li>
					<!-- 
					<li><span>알림</span>
						<div id="__schedule_alarm_info">
							<ul class="sch_form text100" id="__schedule_alarm_list">
								<li id="__alarm_mail"><label class="mgr_10"><input
										type="checkbox" class="_checkbox" value="mail"> 메일</label> <select
									class="w100 mgr_10 alarm_time _select" id="__sel_alarm_mail"><option
											value="1">정시</option>
										<option value="2">5분 전</option>
										<option value="3" selected="">15분 전</option>
										<option value="4">30분 전</option>
										<option value="5">1시간 전</option>
										<option value="6">하루 전</option>
										<option value="7">당일 오전 0시</option>
										<option value="8">당일 정오</option>
										<option value="9">하루 전 정오</option></select>
									<button class="weakblue hide" name="_btn_alarm"
										onclick="HiworksSchedule.layer_shared_list('mail');"
										style="display: none;">대상자 선택</button> <input type="text"
									class="w150" name="__alarm_data" id="__alarm_mail_data">
								</li>
								<li id="__alarm_sms"><label class="mgr_10"><input
										type="checkbox" class="_checkbox" value="sms"> 문자</label> <select
									class="w100 mgr_10 alarm_time _select" id="__sel_alarm_sms"><option
											value="1">정시</option>
										<option value="2">5분 전</option>
										<option value="3" selected="">15분 전</option>
										<option value="4">30분 전</option>
										<option value="5">1시간 전</option>
										<option value="6">하루 전</option>
										<option value="7">당일 오전 0시</option>
										<option value="8">당일 정오</option>
										<option value="9">하루 전 정오</option></select>
									<button class="weakblue hide" name="_btn_alarm"
										onclick="HiworksSchedule.layer_shared_list('sms');"
										style="display: none;">대상자 선택</button> <input type="text"
									class="w150" name="__alarm_data" id="__alarm_sms_data">
								</li>
								<li id="__alarm_messenger"><label class="mgr_10"><input
										type="checkbox" class="_checkbox" value="messenger"
										onclick="HiworksSchedule.updateMessengerAlarmList(this);">
										메신저</label> <select class="w100 mgr_10 alarm_time _select"
									id="__sel_alarm_messenger"><option value="1">정시</option>
										<option value="2">5분 전</option>
										<option value="3" selected="">15분 전</option>
										<option value="4">30분 전</option>
										<option value="5">1시간 전</option>
										<option value="6">하루 전</option>
										<option value="7">당일 오전 0시</option>
										<option value="8">당일 정오</option>
										<option value="9">하루 전 정오</option></select></li>
							</ul>
						</div></li>
						 -->
				</ul>

			</form>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="HiworksSchedule.layer_schedule_save();">저장</button>
			<button type="button" onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 일정추가,수정 끝 -->
	--%>



	<%-- 	
	<!-- 내캘린더 추가/수정 모달 시작 -->
	<div class="layer_box mid_large hide popup2" id="layer_make_my_project"
		style="margin-left: -256px; margin-top: -112px; display: block;">
		<div class="title_layer text_variables">내 캘린더</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>
						<input type="text" id="__cal_name">
					</div></li>
				<li><span>색깔</span>
					<div>
						<button type="button" class="label on" name="cc">
							<span class="c1"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c2"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c3"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c4"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c5"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c6"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c7"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c8"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c9"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c10"></span>
						</button>
						<br>
					</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables btn_make shared_btn"
				onclick="HiworksSchedule.makeCalendar('P');" style="display: none;">저장</button>
			<button type="button"
				class="btn_variables btn_mod btn_mod2 shared_btn"
				onclick="HiworksSchedule.modifyCalendar('P');"
				style="display: inline-block;">저장</button>
			<!-- (수정필)삭제버튼은 수정의 경우에만 보이게 수정 -->
			<button type="button" class="btn_mod shared_btn"
				onclick="HiworksSchedule.deleteCalendar('P');"
				style="display: inline-block;">삭제</button>
			<button type="button" class="btn_make btn_mod btn_mod2 shared_btn"
				onclick="hidePopup();" style="display: inline-block;">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 내캘린더추가 추가/수정 모달 끝 -->	
	--%>


	
	<%--
	<!-- 공유캘린더 추가/수정 모달 시작 -->
	<div class="layer_box large address hide popup3"
		id="layer_make_shared_project"
		style="margin-left: -411px; margin-top: -358px; display: block;">

		<div class="title_layer text_variables">공유 캘린더</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>
						<input type="text" id="__cal_name">
					</div></li>

				<li><span>색깔</span>
					<div>
						<button type="button" class="label" name="cc">
							<span class="share c1"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c2"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c3"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c4"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c5"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c6"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c7"></span>
						</button>
						<button type="button" class="label on" name="cc">
							<span class="share c8"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c9"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c10"></span>
						</button>
					</div></li>
				<!-- (수정필) 소유자는 수정의 경우에만 보이게 코드짜. -->	
				<li id="modify_show_owner" style="display: list-item;">
					<!--<span></span>--> <span>소유자</span>
					<div style="width: auto;">
						<span>대표이사</span>
					</div> <a href="#" id="btn-owner"
					style="margin-left: 15px; color: rgb(119, 158, 192);">변경</a>
				</li>
			</ul>

			<h4 class="pdb_10" style="font-weight: normal;">공유 대상</h4>

			<div class="search-address" id="searchP"
				style="display: block; margin-top: 0px;">

				<span id="spnSearchCtl"> <input type="radio" value="name"
					name="searchField" id="rdo_sch_name" checked="checked"><label
					for="rdo_sch_name">이름</label>&nbsp;&nbsp; <input type="radio"
					value="const" name="searchField" id="rdo_sch_const"><label
					for="rdo_sch_const">조직</label>&nbsp;&nbsp;
				</span> <input type="text" style="height: 21px" class="text-box"
					title="검색어 입력" id="keyword"
					onkeydown="javascript: if (event.keyCode == 13) {AddrLayer.searchMemberOrConst()}">
				<a href="#" class="btn-search"
					onclick="AddrLayer.searchMemberOrConst()">검색</a> <a href="#"
					id="addrCancelSearch" style="display: none"
					class="search_bt weakblue"
					onclick="AddrLayer.rollbackSearchMemberOrConst()"><span
					class="sp_menu searchCancel"></span>검색 취소</a>
				<div>
					<div class="title"
						style="display: none; width: 100%; font-weight: normal;"
						id="searchMessage">
						<a class="btn-search">검색초기화</a>
					</div>
				</div>
			</div>



			<div class="address-choice-form type2 after">
				<div class="category_list" id="spLeftList" style="overflow: hidden;">
					<iframe src="/gabia.biz/schedule/addrlayer/org_tree_v3"
						style="width: 200px; height: 430px; border: 0px; padding-left: 10px"></iframe>
				</div>
				<div class="list" id="spRightList">
					<select multiple="" name="" id="selAddressList"><option
							value="86920">강과장 &lt;영업2팀&gt;</option>
						<option value="86917">김이사 &lt;생산1팀&gt;</option>
						<option value="86914">대표이사 &lt;하이웍스산업&gt;</option>
						<option value="86916">박상무 &lt;구매총무팀&gt;</option>
						<option value="86922">안주임 &lt;품질관리팀&gt;</option>
						<option value="86921">양대리 &lt;재무회계팀&gt;</option>
						<option value="86918">오부장 &lt;생산2팀&gt;</option>
						<option value="86923">이사원 &lt;고객지원팀&gt;</option>
						<option value="86919">조차장 &lt;영업1팀&gt;</option>
						<option value="86924">주알바 &lt;재무회계팀&gt;</option>
						<option value="86915">최사장 &lt;인사팀&gt;</option></select>
					<div class="add-btn">
						<a href="#" onclick="AddrLayer.select('selTo');"
							class="blind icon btn-to">추가</a> <a href="#"
							onclick="AddrLayer.select('selBcc');" class="blind icon btn-bcc">추가</a>
					</div>
					<div class="choice-area">
						<a href="#" onclick="AddrLayer.is_grabAll(true);"
							class="text_variables">전체</a> <a href="#"
							onclick="AddrLayer.is_grabAll(false);" class="text_variables">선택안함</a>
					</div>
				</div>
				<div class="to-item">
					<h5>
						조회/등록 권한 <span id="selToCnt">2</span>
					</h5>
					<div class="to" style="height: 176px">
						<select multiple="" style="height: 176px" id="selTo"><option
								value="86921">양대리 &lt;재무회계팀&gt;</option>
							<option value="86914" disabled="">대표이사 &lt;하이웍스산업&gt;</option></select>
						<div class="del-btn">
							<a href="javascript:AddrLayer.unSelect('selTo');"
								class="blind icon btn-to">삭제</a>
						</div>
					</div>
					<h5>
						조회 권한 <span id="selBccCnt">2</span>
					</h5>
					<div class="bcc" style="height: 176px">
						<select multiple="" style="height: 176px" id="selBcc"><option
								value="86915">최사장 &lt;인사팀&gt;</option>
							<option value="86924">주알바 &lt;재무회계팀&gt;</option></select>
						<div class="del-btn">
							<a href="javascript:AddrLayer.unSelect('selBcc');"
								class="blind icon btn-bcc">삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables btn_make shared_btn"
				onclick="HiworksSchedule.makeCalendar('S');" style="display: none;">저장</button>
			<button type="button" class="btn_variables btn_mod shared_btn"
				onclick="HiworksSchedule.modifyCalendar('S');"
				style="display: inline-block;">저장</button>
			<button type="button" class="btn_mod shared_btn delete_s_btn"
				onclick="HiworksSchedule.deleteCalendar('S');"
				style="display: inline-block;">삭제</button>
			<button type="button" class="btn_make btn_mod shared_btn"
				onclick="hidePopup();" style="display: inline-block;">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 공유캘린더 추가/수정 모달 끝 -->	
	--%>


	<%-- 
	<!-- 휴지통 모달 시작 -->
	<div class="layer_box mid_large hide popup9" id="del-my-project-layer"
		style="margin-left: -256px; margin-top: -92.5px; display: block;">
		<div class="title_layer text_variables">휴지통(내 캘린더)</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>sd</div></li>
			</ul>
		</div>
		<div class="layer_button">

			<button type="button" class="btn_variables"
				onclick="_deletedProjectLayer.restoreProject(this);">복원</button>
			<button type="button" class=""
				onclick="_deletedProjectLayer.removeProject(this);">완전 삭제</button>
			<button type="button" class=""
				onclick="_deletedProjectLayer.close();"
				style="display: inline-block;">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="_deletedProjectLayer.close();" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- 휴지통 모달 끝 -->
	--%>



	<%--
	<!-- 일정내용 모달 시작 -->
	<div class="layer_box mid_large hide popup9"
		style="margin-left: -256px; margin-top: -173.5px; display: block;"
		id="layer_schedule_confirm">
		<div class="title_layer text_variables">일정 내용</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더</span>
					<div>
						<button type="button" class="label" disabled="">
							<span id="__color_code" class="c4"></span>
						</button>
						<span class="fl" id="__cal_name">재무팀,인사팀</span> <a
							href="javascript:void(0)" id="__shared_member_icon"
							class="boardUse mgl_5"
							onclick="HiworksSchedule.show_shared_member_project();"
							style="display: none;"> <span class="icon boardUser"></span>
							<span class="member_count"></span>
						</a>

					</div></li>
				<li><span>일정 제목</span>
					<div id="__subject">워크샵</div></li>
				<li><span>일정 시간</span>
					<div id="__schedule_time">2023-12-01 오전 12:00~오전 1:00</div></li>
				<!-- 
        <li>
            <span>생성자</span>
            <div id="__schedule_owner">생성자</div>
        </li>
		-->
				<li><span>최초 등록</span>
					<div id="__schedule_regidate">대표이사 (2023-12-01 오후 11:37)</div></li>

				<li style="display: none;"><span>최종 수정</span>
					<div id="__schedule_modify_date">최종 수정</div></li>
				<!-- 반복, 알림 안 하기로 함. 담당자가 나중에 최종적으로 html태그 지우면 될듯. -->
				<!-- 
				<li><span>반복</span>
					<div id="__repaet_date">반복 없음</div></li>
				<li><span>알림</span>
					<div id="__alram_info">알림 없음</div></li>
					 -->
				<li><span>내용</span>
					<div class="scroll" id="__contents" style="word-break: break-all;">내용
						없음</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables btn_editY"
				id="__btn_modify"
				onclick="HiworksSchedule.confirm_modifySchedule('1116863','11262153','0', '0', '2023-12-01');">수정</button>
			<button type="button" class="btn_editY" id="__btn_delete"
				onclick="HiworksSchedule.confirm_deleteSchedule('1116863','11262153', '0', '2023-12-01');">삭제</button>
			<button type="button" class="btn_variables btn_editN" id="__btn_save"
				onclick="HiworksSchedule.setShareAlarmFlag()" style="display: none;">확인</button>
			<!-- <button type="button" class="btn_editN" id="" onclick="hidePopup();">닫기</button> -->
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a> <a href="javascript:void(0)" class="more" onclick="showMenu();"><span
			class="blind">더보기</span></a> <a href="javascript:void(0)" class="more"
			onclick="HiworksSchedule.toggleMiniMenu();"><span class="blind">더보기</span></a>
		<ul id="mini_menu_layer" class="show-menu" style="display: none;">
			<li id="schedule-copy-btn"
				onclick="HiworksSchedule.copySchedule('1116863','11262153','0', '0')">
				복사</li>
		</ul>
	</div>
	<!-- 일정내용 모달 끝 -->
	--%>


	<!-- /////////////////////// 모달 끝 /////////////////////// -->

		
</body>
</html>
