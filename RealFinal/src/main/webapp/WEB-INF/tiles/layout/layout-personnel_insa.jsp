<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>  

<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<!-- saved from url=(0065)https://hr.office.hiworks.com/gabia.biz/insa/info/member/hr_lists -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>하이웍스 오피스</title>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<meta name="viewport" content="width=1024">
<link rel="shortcut icon" type="image/x-icon"	href="https://hr.office.hiworks.com/static/images/favicon/favicon.ico">
<link rel="stylesheet" type="text/css"	href="<%=ctxPath%>/resources/css/personnel_insa/style.css">
<link rel="stylesheet" type="text/css"	href="<%=ctxPath%>/resources/css/personnel_insa/style_new.css">
<link rel="stylesheet" type="text/css"	href="<%=ctxPath%>/resources/css/personnel_insa/style_tutorial.css">
<link rel="stylesheet" type="text/css"	href="<%=ctxPath%>/resources/css/personnel_insa/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"	href="<%=ctxPath%>/resources/css/personnel_insa/jquery.toastmessage-min.css">

 
 

<!-- 예인추가 시작-->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel_insa/insa.css">
<!-- 예인추가 끝-->


 

 
		
		


 
</head>

<body cz-shortcut-listen="true">
	<div id="wrap">
		<!-- Top -->
		<div id="gnb-root">
			<div data-v-3a88b4b3="" class="new_gnb">
				<!---->
				<!---->
				<!-- 	헤더시작 -->
					<tiles:insertAttribute name="header" />
				<!-- 	헤더끝 -->
			</div>
			<!---->
		</div>

		<script type="text/javascript" src="./하이웍스 오피스4_files/main(1).js.다운로드"></script>
		<!-- Top End-->
		<div id="container">

			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle"
					style="left: 0px;"></div>
			</div>

			<!-- 사이드바 시작 -->
				<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝-->

			<!-- 컨텐츠 시작 -->
				<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->
			
		</div>
		<div id="dimmed"></div>
		<div id="dimmed2"></div>
		<style>
#dimmed2 {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 2000;
	background-color: #000;
	opacity: .3;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
}

.layer_box.mid_large.auto-logout {
	width: 480px;
	z-index: 2010;
}
</style>
		<iframe id="alphaDiv"
			style="height: 100%; width: 100%; display: none; opacity: 0.6;"
			src="./하이웍스 오피스4_files/saved_resource.html"></iframe>
		<div id="progressDiv"
			style="left: 506.5px; top: 456.5px; display: none;">
			<img src="./하이웍스 오피스4_files/progress_big.gif" alt="progress.."
				title="progress..">
		</div>
	</div>
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
				onclick="location:href=window.open(&#39;https://domain.gabia.com/api/hiworksdns/domainsetting&#39;)">가비아
				도메인 자동 설정하기</button>
		</div>
		<p class="pdt_20">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			타사 등록 도메인은 DNS 정보를 직접 설정해야 합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open(&#39;https://customer.gabia.com/manuals_pop/manual_set.php?service=webmail_hosting&amp;fact=mailzine&amp;seq_no=2221&#39;)">설정
				방법 보기</button>
		</div>
		<p class="bold body_bold mgt_50">
			※ 하이웍스용 DNS 정보 설정을 완료하셨다면 메일 용량을 할당한 후 메일 서비스를<br> 이용할 수 있습니다.
			‘오피스 관리’에서 계정별 메일 용량을 설정해주세요.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open(&#39;/gabia.biz/admin/Orgmain&#39;)">오피스관리
				페이지 가기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>

 

	<ul
		class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content"
		id="ui-id-1" tabindex="0" style="display: none;"></ul>
	<span role="status" aria-live="assertive" aria-relevant="additions"
		class="ui-helper-hidden-accessible"></span>
</body>
</html>