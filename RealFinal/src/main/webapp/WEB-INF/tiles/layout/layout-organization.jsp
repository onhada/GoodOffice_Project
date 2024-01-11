<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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




<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js"></script>
<%-- <script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>  --%>

<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<meta name="viewport" content="width=1024">
<link rel="shortcut icon" type="image/x-icon" href="https://hr.office.hiworks.com/static/images/favicon/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/personnel/app.ff1d5947.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/organization/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/organization/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/organization/style_tutorial.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/organization/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/organization/jquery.toastmessage-min.css">



<!-- 예인추가 시작-->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/organization/insa.css">
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

		<!-- Top End-->
		<div id="container">

			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle" style="left: 0px;"></div>
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
		
		<!-- <div id="progressDiv" style="left: 506.5px; top: 456.5px; display: block;">
			<img src="./하이웍스 오피스4_files/progress_big.gif" alt="progress.." title="progress..">
		</div> -->
	</div>
	<div id="main_layer_div"></div>

	

	



	<ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none;"></ul>
	<span role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></span>
</body>
</html>