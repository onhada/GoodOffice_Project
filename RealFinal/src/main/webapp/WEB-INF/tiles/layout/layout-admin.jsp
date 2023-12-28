<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- === #25. tiles 를 사용하는 레이아웃2 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>



<!DOCTYPE html>
<!-- saved from url=(0054)https://office.hiworks.com/gabia.biz/h_admin/adminmain -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/admin_menu.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/adminconfig.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/adminhome.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/button.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/h_admin.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/style_new.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/style.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/treelibrary.css">
<!-- 아래 css 넣으니까 헤더 예쁘게 나옴. -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index/index_official.css">
<!-- 아래는 admin_userManager.jsp 를 위한 css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/6628.bb5f75df.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/app.2469e51b.css">
<!-- 아래는 deactiveUser_pause.jsp 를 위한 css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/2120.0a59daed.css"> 





<!DOCTYPE html>
<!-- saved from url=(0067)https://office.hiworks.com/gabia.biz/h_admin/Adminconfig/setmanager -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>하이웍스 오피스</title>
<meta name="viewport" content="width=1024">


</head>

<body class="vsc-initialized">
	<div id="wrap">
		<!-- Top -->


		<!-- 헤더 시작  -->
		<tiles:insertAttribute name="header" /> 
		<!-- 헤더 끝  -->



		<script type="text/javascript" src="./aaaaaaa_files/main(1).js"></script>
		<!-- Top End-->
		<div id="container">

			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle"
					style="left: 0px;"></div>
			</div>


			
			<!-- 사이드바 시작  -->
			<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝  -->
			
			
			
			<!-- 컨텐츠 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->
			
			
			
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

		<div class="layer_box large hide dns_intro_layer"
			style="width: 550px;">
			<div class="title_layer text_variables">메일 서비스 이용 안내</div>
			<p class="bold body_bold">메일 서비스를 이용하시려면 하이웍스용 DNS 정보 설정이 필요합니다.</p>
			<p class="mgt_15">
				<span
					style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
				가비아 등록 도메인은 자동 설정을 지원합니다.
			</p>
			<div class="layer_button mgt_10 ta_l">
				<button type="button" class="btn_variables"
					onclick="location:href=window.open(&#39;https://domain.gabia.com/api/hiworksdns/domainsetting?domain=gabia.biz&#39;)">가비아
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

		


	</div>
	<deepl-input-controller>
	<template shadowrootmode="open">
		
		<div>
			<div class="dl-input-translation-container svelte-ju4595">
				<div></div>
			</div>
		</div>
	</template>
	</deepl-input-controller>
</body>
</html>