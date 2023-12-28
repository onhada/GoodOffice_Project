<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<!DOCTYPE html>
<!-- saved from url=(0037)https://office.hiworks.com/gabia.biz/ -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scaleable=no">
<title>하이웍스 오피스</title>
<meta property="og:title" content="">
<meta property="og:image" content="">
<meta property="og:site_name" content="">
<meta property="og:description" content="">
<meta name="apple-mobile-web-app-title" content="hiworks">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="msapplication-config" content="none">

<!-- 
<link rel="shortcut icon" type="image/x-icon" href="https://office.hiworks.com/static/images/favicon/favicon.ico">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_57.png" sizes="57x57">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_72.png" sizes="72x72">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_76.png" sizes="76x76">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_114.png" sizes="114x114">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_120.png" sizes="120x120">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_144.png" sizes="144x144">
<link rel="apple-touch-icon" href="https://office.hiworks.com/static/images/favicon/home_152.png" sizes="152x152"> 
-->
<!-- 
<link rel="stylesheet" type="text/css"
	href="./하이웍스 오피스_files/common.css">
<link rel="stylesheet" type="text/css"
	href="./하이웍스 오피스_files/style_new.css">
<link rel="stylesheet" type="text/css"
	href="./하이웍스 오피스_files/style.css">
<link rel="stylesheet" type="text/css"
	href="./하이웍스 오피스_files/jquery-ui.css">

 -->





<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/login/style_new.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/login/style.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/login/login.css">





</head>
<body class="vsc-initialized">

	<div id="wrap">
		<!-- skip navigation -->
		<div class="skip_navigation" data-ui="skipNavigation">
			<a href="https://office.hiworks.com/gabia.biz/#contents">본문 영역으로
				바로가기</a>
		</div>
		<form onsubmit="return false;" method="post" id="beta_form">
			<input type="hidden" name="ssl_login" id="ssl_login" value="Y">
			<input type="hidden" name="link_url" id="link_url" value="">
			<input type="hidden" name="ip_security" id="ip_security" value="">
			<div class="loginWrap-ofc" id="contents">
				<!-- loginBox-ofc -->
				<div class="loginBox-ofc">
					<h1 class="head-ofc">
						<img src="<%= ctxPath%>/resources/image/login/loginLog.svg"
							style="width: 280px; height: 61px;" alt="hiworks">
					</h1>
					<div class="body-ofc">
						<ul class="save-ofc">
							<li><input type="checkbox" name="office_remember"
								id="office_remember" checked=""> <label
								for="office_remember">아이디 저장</label></li>
							<!-- 	
							<li class="cont-ip" onclick="checkIpSecurity();">IP보안<span
								class="is-state on" id="ip_security_state">ON</span></li>
							 -->	
						</ul>
						<section>
							<input type="text" class="type-J" title="아이디" name="office_id"
								id="office_id" value="ceo" placeholder="아이디"> <input
								type="password" class="type-J" title="비밀번호" name="office_passwd"
								id="office_passwd" value="" placeholder="비밀번호"
								onkeydown="if(event.keyCode==13) officeLogin();">
							<p class="err">
								<span class="wr-txt" id="login_error_msg"></span>
							</p>
							<p class="btn-login">
								<label><input type="submit" title="로그인" value="로그인"
									class="int_jogin" onclick="officeLogin();"></label>
							</p>
						</section>
						<!-- 
						<article class="box-notice noline">
							<div class="inner">
								<p>공지사항</p>
								<a href="javascript:void(0)"
									onclick="jQuery(&#39;#phishingLayer&#39;).showPopup();"><span
									class="phising"><span class="warning">!</span> 로그인 피싱 예방
										안내</span></a>
								<ul id="hiworks_notice">
									<li><a href="https://www.hiworks.com/cs/notice/29586"
										target="_blank"><span class="spr"></span>[공지] 하이웍스
											개인정보처리방침 변경 안내</a><span class="date">2023.11.29</span></li>
									<li><a href="https://www.hiworks.com/cs/notice/29461"
										target="_blank"><span class="spr"></span>경영 메뉴 오픈 관련 변경 사항
											안내 </a><span class="date">2023.11.20</span></li>
								</ul>
								<a href="https://www.hiworks.com/cs/notice" target="_blank"
									class="spr" title="공지사항 더보기"></a>
							</div>
						</article>
						 -->
					</div>
				</div>
				<!-- // loginBox-ofc -->
				<!-- foot-ofc -->
			<!-- 
				<footer>
					<div class="foot-ofc">
						<a href="https://www.hiworks.com/" title="새창" target="_blank">Powered
							by hiworks.com</a>
					</div>
				</footer>
			 -->
				<!-- // foot-ofc -->
			</div>
		</form>
	<!-- 
		<div class="layer_box mid_large hide" id="ipSecurity">
			<div class="title_layer text_variables">IP 보안 설정</div>
			<div>
				<p>로그인 후 IP주소가 변경되는 경우, 현재 IP와 최근 로그인한 IP 정보를 확인해서 타인이 로그인 정보를
					부정하게 사용하는 것을 방지하는 로그인 보안 서비스입니다.</p>
				<p class="mgt_10">
					<a href="https://customer.gabia.com/manuals/detail.php?seq_no=2802"
						class="weakblue" target="_blank">자세히보기</a>
				</p>
				<ul class="pdt_30">
					<li><label><input type="radio"
							name="office_ip_security" value="-1"> 사용 안 함</label></li>
					<li><label><input type="radio"
							name="office_ip_security" value="1"> 1단계 - 로그인한 IP대역과 동일한
							경우(C클래스)만 로그인 유지</label></li>
					<li><label><input type="radio"
							name="office_ip_security" value="2"> 2단계 - 로그인 후 IP 주소가
							변경되지 않는 경우에만 로그인 유지</label></li>
				</ul>
			</div>
			<div class="layer_button">
				<button type="button" class="btn_variables"
					onclick="saveIpSecurity();">저장</button>
				<button type="button"
					onclick="jQuery(&#39;#ipSecurity&#39;).hidePopup(false);">취소</button>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer"
				onclick="jQuery(&#39;#ipSecurity&#39;).hidePopup(false);"
				title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
		</div>
	-->
	<!-- 
		<div class="layer_box phishing hide" id="phishingLayer">
			<div class="header">
				<span class="warning">!</span> 로그인 전, 주소표시줄의 내 도메인을 꼭 확인하세요.
			</div>
			<div class="body">
				<p>
					하이웍스 로그인 페이지로 위장한 피싱 사이트에 속아 계정 정보가 유출되는 실수를 하지 않으려면 로그인 전에 <b
						class="underline">브라우저 주소표시줄의 내 도메인을 확인</b>하는 습관이 필요합니다.
				</p>
				<p>
					[올바른 주소]<br> <b>office.hiworks.com/gabia.biz (O)</b><br>
					<b>https://office.hiworks.com/gabia.biz(O)</b>
				</p>
				<ul>
					<li>· 내가 아는 글자나 도메인이 주소표시줄에 있다고 안전한 것이 아닙니다. 내 도메인으로 작동하는
						페이지이어야만 합니다.<br>예) http://gabia.biz.phishing_site.com (X)<br>&nbsp;&nbsp;&nbsp;&nbsp;data.text/html
						gabia.biz (X)
					</li>
				</ul>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer"
				onclick="jQuery(&#39;#phishingLayer&#39;).hidePopup(false);"
				title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
		</div>
	-->
		<div id="dimmed"></div>
	</div>


<!-- 
	<deepl-input-controller>
	<template shadowrootmode="open">
		<link rel="stylesheet"
			href="chrome-extension://cofdbpoegempjloogbagkncekinflcnj/build/content.css">
		<div>
			<div class="dl-input-translation-container svelte-ju4595">
				<div></div>
			</div>
		</div>
	</template>
	</deepl-input-controller>
	 -->
</body>
</html>