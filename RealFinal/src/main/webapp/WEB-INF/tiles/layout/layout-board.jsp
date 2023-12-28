<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>	
<%
	String ctxPath = request.getContextPath();
%>



<%-- 내가 만든 CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/category.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/externalNotice.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/all.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/recentBoard.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/makeBoard.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/writingMain.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/board/writing1.css" />


<html lang="ko" style="">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=1280,user-scalable=yes,minimum-scale=0.25, maximum-scale=1.0">
<meta name="description" content="하이웍스 게시판">
<meta name="next-head-count" content="3">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta property="al:web:should_fallback" content="false">

<title>하이웍스 게시판</title>

</head>
<body data-gnb-mode="">
	<div id="__next">
		<div>

			<div data-ui="skipNavigation" class="sc-9f5ea563-0 dEARgT">
				<a href="#gnb-root">상단 메뉴 바로가기</a><a href="#sidebar">왼쪽 메뉴 바로가기</a><a
					href="#contents">본문 영역 바로가기</a>
			</div>
			<div id="gnb-root">
				<div data-v-3a88b4b3="" class="new_gnb">
					<!---->
					<!---->
					<!-- 헤더시작 -->
					<tiles:insertAttribute name="header" />
					<!-- 헤더끝 -->
				</div>
				<!---->
			</div>
			<main class="sc-9f5ea563-1 lmwuze">
				<!-- 사이드바 시작 -->
				<tiles:insertAttribute name="side" />


				<!-- 사이드바 끝-->

				<!-- 컨텐츠 시작 -->



				<tiles:insertAttribute name="content" />


				<!-- 컨텐츠 끝 -->

			</main>
		</div>
		<div></div>
	</div>
	<div id="modal-root"></div>
	<%--<script id="__NEXT_DATA__" type="application/json">{"props":{"pageProps":{}},"page":"/postlist/recent","query":{},"buildId":"2tMKGPo1wYrPHqjW5vqwi","assetPrefix":"/board","nextExport":true,"autoExport":true,"isFallback":false,"scriptLoader":[]}</script>--%>
	<%--<next-route-announcer> <p aria-live="assertive" id="__next-route-announcer__" role="alert"
		style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; white-space: nowrap; overflow-wrap: normal;">하이웍스
		게시판</p>   </next-route-announcer>--%>
	<script src="https://gnb.office.hiworks.com/main.js?v=g7f6c3b1"
		data-nscript="afterInteractive"></script>
	<%-- 헤더 및 스크롤 부분 --%>
	<%--<script src="/board/_next/static/chunks/805-c99c446f8e1991a8.js"></script>
	<script
		src="/board/_next/static/chunks/pages/postview/%5BboardId%5D/%5BpostId%5D-3a782fe735d39930.js"></script>
	<script
		src="/board/_next/static/chunks/pages/postlist/%5Bboardid%5D-6da10314d0ab973e.js"></script>
	<script
		src="/board/_next/static/chunks/pages/postlist/important-32e252af61e42b9d.js"></script>
	<script src="/board/_next/static/chunks/29107295-66b15d40b4194911.js"></script>
	<script src="/board/_next/static/chunks/957c942f-b4ff2fefb0237376.js"></script>
	<script src="/board/_next/static/chunks/691-e591a61a8ccd198e.js"></script>
	<script
		src="/board/_next/static/chunks/pages/setting-87f65fb9ecdd0ab2.js"></script>
	<script src="/board/_next/static/chunks/103-e24dcdfac9ff51da.js"></script>
	<script
		src="/board/_next/static/chunks/pages/postwrite/normal/%5BboardId%5D/new-db808105e05b7921.js"></script>
	<script src="/board/_next/static/chunks/194-0cfb310b6345ae4e.js"></script>
	<script src="/board/_next/static/chunks/889-dacab7f7da39ca04.js"></script>
	<script src="/board/_next/static/chunks/30-7148ec6c9ce3e0c4.js"></script>
	<script
		src="/board/_next/static/chunks/pages/boardmodify/%5BboardId%5D-c235025818958071.js"></script>
	<script
		src="/board/_next/static/chunks/pages/postwrite/modify/%5BboardId%5D/%5BpostId%5D-f25451fb98b42e55.js"></script>
	<script
		src="/board/_next/static/chunks/pages/boardmanagement-bf535fa85099309e.js"></script>
	<script
		src="/board/_next/static/chunks/pages/boardcreate-da14e248359785db.js"></script>  --%>
</body>
</html>
