<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<% String ctxPath = request.getContextPath(); %>
	
	
	
	
	
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
 
 
 
 
</head>
<body cz-shortcut-listen="true">

	<noscript>
		<strong>We're sorry but hiworks-board doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	<div id="gnb-root">
		<div data-v-3a88b4b3="" class="new_gnb">
			
			<!-- 헤더시작 -->
			<tiles:insertAttribute name="header" />
			<!-- 헤더끝 -->
			
		</div>
	</div>
	
	<div id="app">
		<div data-v-a4c11cac="" class="hu-modal-container"
			style="z-index: 2000;">
			<div data-v-a4c11cac="" class="hu-modal-background"
				style="display: none;"></div>
		</div>
		<div data-v-206790f8="" class="hu-popover-container"
			style="z-index: 2000;"></div>
		<!---->
		<!---->
		<div>
			<!---->
			<div data-ui="skipNavigation" class="skip_navigation">
				<a
					href="https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics#header">상단
					메뉴로 바로가기</a><a
					href="https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics#sidebar">왼쪽
					메뉴로 바로가기</a><a
					href="https://hr-work.office.hiworks.com/personal/statistics?tab=Statistics#contents">본문
					영역으로 바로가기</a>
			</div>
			<div class="split-wrap">
				
				
				<!-- 사이드바 시작 -->
				<tiles:insertAttribute name="side" />
				<!-- 사이드바 끝-->
				
				
				
				<div class="split-gutter" draggable="true"
					draggable-state="{&quot;initialPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65},&quot;startDragPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65},&quot;currentDragPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65}}"
					style="left: 276px; touch-action: none; position: fixed; top: 65px;">
					&nbsp;</div>
				<div class="split-gutter-pop"
					style="left: 296px; top: 495.5px; display: none;">
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
	
	
</body>
</html>