<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- === #25. tiles 를 사용하는 레이아웃2 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>



<!DOCTYPE html>
<!-- saved from url=(0036)https://home.office.hiworks.com/main -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=1280,user-scalable=yes">
<meta name="robots" content="noindex">

<link rel="shortcut icon" type="image/x-icon" href="https://home.office.hiworks.com/favicon.ico">




<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/inHTML.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/header_search.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index/app.8f4ebb57.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index/chunk-vendors.4604cc54.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index/index_official.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index/index.css">
<%-- 필요없음 지워 <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/index/structure.css"> --%>




<title>오피스 홈</title>


<link href="https://home.office.hiworks.com/css/chunk-031b6452.6c4f034b.css" rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-0e0cde0c.7d6234ed.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-1d9ed7cb.f700a059.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-368d99de.7c644af6.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-3de8be95.afce3268.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-42184da1.2383051b.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-4f99f4c0.4a2bcc5a.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-5589be21.eaab12d4.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-834730d8.f3a29398.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-930f7f10.bf180e4b.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-b17dab24.02e0394a.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-e364ecb0.07fe85f7.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-f69473fc.7e223246.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/css/chunk-fe4d8a34.29bfb949.css"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-031b6452.e0686bb6.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-093e0d78.e57682dc.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-0e0cde0c.bc801058.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-1d9ed7cb.1e5cdbf6.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-2d0a38e8.83c9d196.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-2d0c9b2a.8a69e47d.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-2d0cbac1.b3071c1f.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-2d0cfc25.d4dc7d4e.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-2d208a1c.27888269.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-2d228e85.8db92117.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-368d99de.7bd3f41e.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-3de8be95.83ec96ad.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-42184da1.01641120.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-4f99f4c0.7524eb30.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-5589be21.525aa876.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-834730d8.a94c47ab.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-930f7f10.e15ca327.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-b17dab24.ebb97822.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-e364ecb0.5f9f5d87.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-f69473fc.19432ebb.js"
	rel="prefetch">
<link
	href="https://home.office.hiworks.com/js/chunk-fe4d8a34.7a863d37.js"
	rel="prefetch">
<link href="./index_files/app.8f4ebb57.css" rel="preload" as="style">
<link href="./index_files/chunk-vendors.4604cc54.css" rel="preload"
	as="style">
<link href="./index_files/app.5dc26a18.js" rel="preload" as="script">
<link href="./index_files/chunk-vendors.f1530f30.js" rel="preload"
	as="script">
<link href="./index_files/chunk-vendors.4604cc54.css" rel="stylesheet">
<link href="./index_files/app.8f4ebb57.css" rel="stylesheet">





</head>
<body class="vsc-initialized">
	<noscript>
		<strong>We're sorry but hiworks-admin doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
	
	
	
	
	<!-- 헤더자리 -->
	<!-- 헤더 시작  -->
	<tiles:insertAttribute name="header" />
	<!-- 헤더 끝  -->
	
	
	
	
	
	
	<div id="app">
		<!---->
		
		
		<%-- 
		<!-- ////////////////// 모달 시작 ////////////////// -->
		<div data-v-42b974ea="" class="hw-modal-container">
			<div data-v-42b974ea="" class="hw-modal-background" style=""></div>
			<div data-v-8ca9082c="" data-v-42b974ea="" class="hw-modal-wrapper"
				style="">
				<div data-v-8ca9082c="" class="hw-modal-content-wrapper">
				
					
					<!-- 일정추가 모달 시작 -->
					<div data-v-6db368a0="" data-v-8ca9082c="" id="ScheduleAdd"
						class="modal-wrapper">
						<div data-v-6db368a0="" class="modal-header">
							<span data-v-6db368a0="" class="dialog-title">일정 추가</span>
						</div>
						<div data-v-6db368a0="" class="modal-body">
							<div data-v-6db368a0="" class="d-table">
								<div data-v-6db368a0="" class="d-table-row">
									<div data-v-6db368a0=""
										class="d-table-cell align-middle label-cell">캘린더</div>
									<div data-v-6db368a0="" class="d-table-cell align-middle">
										<div data-v-6db368a0="" class="el-select w-400px">
											<!---->
											<div class="el-input el-input--suffix">
												<!---->
												<input type="text" readonly="readonly" autocomplete="off"
													placeholder="캘린더를 선택하세요." class="el-input__inner">
												<!---->
												<span class="el-input__suffix"><span
													class="el-input__suffix-inner"><i
														class="el-select__caret el-input__icon el-icon-arrow-up"></i>
													<!---->
														<!---->
														<!---->
														<!---->
														<!----></span>
												<!----></span>
												<!---->
												<!---->
											</div>
											<div class="el-select-dropdown el-popper"
												style="display: none; min-width: 400px;">
												<div class="el-scrollbar" style="">
													<div class="el-select-dropdown__wrap el-scrollbar__wrap"
														style="margin-bottom: -8px; margin-right: -8px;">
														<ul class="el-scrollbar__view el-select-dropdown__list">
															<!---->
															<li data-v-6db368a0="" class="el-select-dropdown__item"><span>나의
																	프로젝트</span></li>
															<li data-v-6db368a0="" class="el-select-dropdown__item"><span>재무팀,인사팀</span></li>
														</ul>
													</div>
													<div class="el-scrollbar__bar is-horizontal">
														<div class="el-scrollbar__thumb"
															style="transform: translateX(0%);"></div>
													</div>
													<div class="el-scrollbar__bar is-vertical">
														<div class="el-scrollbar__thumb"
															style="transform: translateY(0%);"></div>
													</div>
												</div>
												<!---->
											</div>
										</div>
									</div>
								</div>
								<div data-v-6db368a0="" class="d-table-row">
									<div data-v-6db368a0=""
										class="d-table-cell align-middle label-cell">일정 제목</div>
									<div data-v-6db368a0="" class="d-table-cell align-middle">
										<div data-v-6db368a0="" class="hw-input-wrap">
											<input data-v-6db368a0="" type="text" maxlength="101"
												placeholder="일정 제목을 입력하세요." class="hw-input w-400px">
										</div>
									</div>
								</div>
								<div data-v-6db368a0="" class="d-table-row">
									<div data-v-6db368a0=""
										class="d-table-cell align-middle label-cell">시작</div>
									<div data-v-6db368a0="" class="d-table-cell align-middle">
										<div data-v-6db368a0=""
											class="el-date-editor d-date-picker el-input el-input--prefix el-input--suffix el-date-editor--date">
											<!---->
											<input type="text" autocomplete="off" name=""
												class="el-input__inner"><span
												class="el-input__prefix"><i
												class="el-input__icon el-icon-date"></i>
											<!----></span><span class="el-input__suffix"><span
												class="el-input__suffix-inner"><i
													class="el-input__icon"></i>
												<!---->
													<!---->
													<!---->
													<!----></span>
											<!----></span>
											<!---->
											<!---->
										</div>
										<div data-v-6db368a0=""
											class="el-date-editor d-time-picker el-input el-input--prefix el-input--suffix el-date-editor--time-select">
											<!---->
											<input type="text" autocomplete="off" name=""
												class="el-input__inner"><span
												class="el-input__prefix"><i
												class="el-input__icon el-icon-time"></i>
											<!----></span><span class="el-input__suffix"><span
												class="el-input__suffix-inner"><i
													class="el-input__icon"></i>
												<!---->
													<!---->
													<!---->
													<!----></span>
											<!----></span>
											<!---->
											<!---->
										</div>
									</div>
								</div>
								<div data-v-6db368a0="" class="d-table-row">
									<div data-v-6db368a0=""
										class="d-table-cell align-middle label-cell">종료</div>
									<div data-v-6db368a0="" class="d-table-cell align-middle">
										<div data-v-6db368a0=""
											class="el-date-editor d-date-picker el-input el-input--prefix el-input--suffix el-date-editor--date">
											<!---->
											<input type="text" autocomplete="off" name=""
												class="el-input__inner"><span
												class="el-input__prefix"><i
												class="el-input__icon el-icon-date"></i>
											<!----></span><span class="el-input__suffix"><span
												class="el-input__suffix-inner"><i
													class="el-input__icon"></i>
												<!---->
													<!---->
													<!---->
													<!----></span>
											<!----></span>
											<!---->
											<!---->
										</div>
										<div data-v-6db368a0=""
											class="el-date-editor d-time-picker el-input el-input--prefix el-input--suffix el-date-editor--time-select">
											<!---->
											<input type="text" autocomplete="off" name=""
												class="el-input__inner"><span
												class="el-input__prefix"><i
												class="el-input__icon el-icon-time"></i>
											<!----></span><span class="el-input__suffix"><span
												class="el-input__suffix-inner"><i
													class="el-input__icon"></i>
												<!---->
													<!---->
													<!---->
													<!----></span>
											<!----></span>
											<!---->
											<!---->
										</div>
									</div>
								</div>
								<div data-v-6db368a0="" class="d-table-row">
									<div data-v-6db368a0=""
										class="d-table-cell align-middle label-cell">종일</div>
									<div data-v-6db368a0="" class="d-table-cell align-middle">
										<div data-v-6db368a0="" role="switch" class="el-switch">
											<input type="checkbox" name="" true-value="true"
												class="el-switch__input">
											<!---->
											<span class="el-switch__core" style="width: 40px;"></span>
											<!---->
										</div>
									</div>
								</div>
								<div data-v-6db368a0="" class="d-table-row">
									<div data-v-6db368a0=""
										class="d-table-cell align-middle label-cell">내용</div>
									<div data-v-6db368a0="" class="d-table-cell align-middle">
										<textarea data-v-6db368a0="" maxlength="1001" rows="5"
											class="custom-textarea"></textarea>
									</div>
								</div>
							</div>
							<div data-v-6db368a0="" class="add-input"></div>
						</div>
						<div data-v-6db368a0="" class="modal-footer">
							<button data-v-f8d3258e="" data-v-6db368a0="" type="button"
								class="hw-button hw-button secondary left">
								<!---->
								<span data-v-f8d3258e="" class="label">취소</span>
								<!---->
							</button>
							<div data-v-6db368a0="">
								<button data-v-f8d3258e="" data-v-6db368a0="" type="button"
									disabled="disabled" class="hw-button hw-button primary">
									<!---->
									<span data-v-f8d3258e="" class="label">저장 후 계속 추가</span>
									<!---->
								</button>
								<button data-v-f8d3258e="" data-v-6db368a0="" type="button"
									disabled="disabled" class="hw-button hw-button primary">
									<!---->
									<span data-v-f8d3258e="" class="label">저장</span>
									<!---->
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 일정추가 모달 끝 -->
				
				
				
				
				
				<!-- 메뉴 즐겨찾기 모달 시작 -->
				<div data-v-68596525="" data-v-8ca9082c=""
					class="modal-content-wrapper">
					<section data-v-68596525="" class="modal-content__header">
						메뉴 즐겨찾기</section>
					<section data-v-68596525="" class="modal-content__body">
						<div data-v-68596525="" class="menu-left">
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="14" viewBox="0 0 18 14">
											<g>
											<path class="svg-hover-color" fill="#5b6164"
												d="M58.012 54.462H41.3a.639.639 0 0 1-.643-.637V41.1a.639.639 0 0 1 .641-.637h16.714a.64.64 0 0 1 .643.637v12.726a.64.64 0 0 1-.643.636zm-16.071-1.271h15.428V41.734H41.94z"
												transform="translate(-171 -133) translate(130.345 92.538)"></path>
											<path fill="#4e9bd4"
												d="M49.589 48.7a1.49 1.49 0 0 1-.818-.244l-4.911-3.627a.612.612 0 0 1-.16-.863.642.642 0 0 1 .882-.155l.04.029 4.883 3.6a.221.221 0 0 0 .218-.02l4.851-3.584a.641.641 0 0 1 .885.122.609.609 0 0 1-.124.867l-4.881 3.606a1.578 1.578 0 0 1-.865.269z"
												transform="translate(-171 -133) translate(130.235 92.425)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">메일 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="14.897" height="18" viewBox="0 0 14.897 18">
											<g transform="translate(-253.062 -271)">
											<g transform="translate(253.062 271)">
											<g transform="translate(0 2.483)">
											<path class="svg-hover-color"
												d="M118.655,667.241v13.035H106.241V667.241h12.414m0-1.241H106.241A1.241,1.241,0,0,0,105,667.241v13.035a1.241,1.241,0,0,0,1.241,1.241h12.414a1.241,1.241,0,0,0,1.241-1.241V667.241A1.241,1.241,0,0,0,118.655,666Z"
												transform="translate(-105 -666)" fill="#5b6164"></path>
											<rect width="8.69" height="1.241" rx="0.621"
												transform="translate(3.103 3.103)" fill="#4e9bd4"></rect>
											<rect width="4.966" height="1.241" rx="0.621"
												transform="translate(3.103 6.207)" fill="#4e9bd4"></rect></g>
											<g transform="translate(3.38)">
											<path class="svg-hover-color"
												d="M117.893,665.62l-3.38-2.253-3.38,2.253-.689-1.033,3.724-2.483a.621.621,0,0,1,.689,0l3.724,2.483Z"
												transform="translate(-110.445 -662)" fill="#5b6164"></path></g></g></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">게시판 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g id="그룹_58141" transform="translate(-187.087 -110.473)">
											<path class="svg-hover-color" fill="#5b6164"
												d="M203.4 128.473h-7.309a9 9 0 0 1-.04-18h.05a9 9 0 0 1 8.983 9v7.311a1.694 1.694 0 0 1-1.684 1.689zm-7.308-1.284h7.308a.405.405 0 0 0 .4-.4v-7.311a7.718 7.718 0 0 0-7.7-7.714 7.714 7.714 0 0 0 0 15.428z"></path>
											<circle class="svg-hover-color" cx="1" cy="1" r="1"
												fill="#4e9bd4" transform="translate(197.787 118.746)"></circle>
											<circle class="svg-hover-color" cx="1" cy="1" r="1"
												fill="#4e9bd4" transform="translate(194.787 118.746)"></circle>
											<circle class="svg-hover-color" cx="1" cy="1" r="1"
												fill="#4e9bd4" transform="translate(191.787 118.746)"></circle></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">메시징 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g transform="translate(-1081.986 -778.727)">
											<path class="svg-hover-color"
												d="M905.206 589.269h-16.714a.643.643 0 0 1-.643-.643v-16.714a.643.643 0 0 1 .643-.643h16.714a.643.643 0 0 1 .643.643v16.714a.643.643 0 0 1-.643.643zm-16.071-1.286h15.429v-15.428h-15.429z"
												fill="#5b6164" transform="translate(194.137 207.458)"></path>
											<path class="svg-hover-color"
												d="M893.454 587.662a.643.643 0 0 1-.455-1.1l10.286-10.286a.643.643 0 0 1 .924.894l-.016.015-10.286 10.286a.636.636 0 0 1-.453.191z"
												fill="#5b6164" transform="translate(192.365 205.739)"></path>
											<path class="svg-hover-color"
												d="M907.348 589.555h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z"
												fill="#4e9bd4" transform="translate(188.78 201.387)"></path>
											<path class="svg-hover-color"
												d="M907.348 593.56h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z"
												fill="#4e9bd4" transform="translate(188.78 199.956)"></path>
											<path class="svg-hover-color"
												d="M897.348 580.768h-3.857a.643.643 0 0 1 0-1.286h3.857a.643.643 0 0 1 0 1.286z"
												fill="#4e9bd4" transform="translate(192.351 204.525)"></path>
											<path class="svg-hover-color"
												d="M896.491 581.417a.643.643 0 0 1-.643-.643v-3.857a.643.643 0 1 1 1.286 0v3.857a.643.643 0 0 1-.643.643z"
												fill="#4e9bd4" transform="translate(191.28 205.671)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">전자세금계산서
										<!---->
								</span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="17" viewBox="0 0 18 17">
											<g transform="translate(-467.343 -271)">
											<path class="svg-hover-color"
												d="M359.714,665.308H356.5V664h-1.286v1.308h-6.429V664H347.5v1.308h-3.214A1.3,1.3,0,0,0,343,666.615v13.077A1.3,1.3,0,0,0,344.286,681h15.429A1.3,1.3,0,0,0,361,679.692V666.615A1.3,1.3,0,0,0,359.714,665.308Zm0,14.385H344.286V666.615h15.429Z"
												transform="translate(124.343 -393)" fill="#5b6164"></path>
											<g transform="translate(471.843 278.192)">
											<path class="svg-hover-color"
												d="M351.414,677.71h.662a.92.92,0,0,0,.7-.241.889.889,0,0,0,.228-.638.783.783,0,0,0-.226-.6.865.865,0,0,0-.62-.214.911.911,0,0,0-.6.2.641.641,0,0,0-.24.518h-1.242a1.566,1.566,0,0,1,.265-.893,1.759,1.759,0,0,1,.739-.618,2.424,2.424,0,0,1,1.047-.223,2.315,2.315,0,0,1,1.556.483,1.664,1.664,0,0,1,.563,1.332,1.355,1.355,0,0,1-.262.8,1.709,1.709,0,0,1-.688.563,1.558,1.558,0,0,1,.788.577,1.58,1.58,0,0,1,.26.909,1.687,1.687,0,0,1-.608,1.359,2.418,2.418,0,0,1-1.609.511,2.292,2.292,0,0,1-1.532-.5,1.652,1.652,0,0,1-.6-1.329h1.242a.737.737,0,0,0,.264.586,1.086,1.086,0,0,0,1.345-.011.829.829,0,0,0,.251-.632q0-.953-1.031-.953h-.658Z"
												transform="translate(-350 -675)" fill="#4e9bd4"></path>
											<path class="svg-hover-color"
												d="M361.471,681.539H360.2v-5l-1.521.48v-1.054l2.659-.968h.136Z"
												transform="translate(-353.099 -675)" fill="#4e9bd4"></path></g>
											<rect width="15.429" class="svg-hover-color" height="1.308"
												transform="translate(468.628 275.577)" fill="#5b6164"></rect></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">일정 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="14" viewBox="0 0 18 14">
											<g>
											<path class="svg-hover-color" fill="#4e9bd4"
												d="M397.838 582.64a1.3 1.3 0 0 1-.725-.221l-4.016-3.028a.626.626 0 1 1 .753-1l3.986 3.006s.029 0 .054-.021l3.955-2.986a.626.626 0 0 1 .753 1l-3.985 3.007a1.384 1.384 0 0 1-.775.243z"
												transform="translate(-754.684 -780) translate(367.037 204.734)"></path>
											<path class="svg-hover-color" fill="#5b6164"
												d="M397.346 155.822H383.2a.64.64 0 0 0-.643.637v1.909h-1.928a.639.639 0 0 0-.642.636v10.183a.638.638 0 0 0 .642.635h14.146a.638.638 0 0 0 .639-.638v-1.907h1.93a.64.64 0 0 0 .642-.637v-10.181a.64.64 0 0 0-.64-.637zm-3.213 12.725h-12.858v-8.909h1.285v7a.64.64 0 0 0 .643.637h10.93zm2.57-2.542h-12.857V157.1H396.7z"
												transform="translate(-754.684 -780) translate(374.695 624.178)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">공용메일
										<!---->
								</span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											xmlns="http://www.w3.org/2000/svg" class="service-menu-icon"
											width="17" height="18" viewBox="0 0 17 18">
											<g id="service-menu-icon03_s"
												transform="translate(-360 -271)">
											<path class="svg-hover-color" d="M0,0H2V2.955H0Z"
												transform="translate(360 275)" fill="#5b6164"></path>
											<path class="svg-hover-color" d="M0,0H2V2.955H0Z"
												transform="translate(360 281.895)" fill="#5b6164"></path>
											<path class="svg-hover-color"
												d="M250.942,110.908v15.4h-13.4v-15.4h13.4m.8-1.3h-15a.5.5,0,0,0-.5.5v17a.5.5,0,0,0,.5.5h15a.5.5,0,0,0,.5-.5v-17a.5.5,0,0,0-.5-.5Z"
												transform="translate(124.758 161.392)" fill="#5b6164"></path>
											<g transform="translate(132 -396)">
											<path class="svg-hover-color"
												d="M240,677.33v.544a.635.635,0,0,1-.643.627h-4.715a.635.635,0,0,1-.643-.627v-.544a1.778,1.778,0,0,1,1.8-1.755h.223a2.39,2.39,0,0,0,1.953,0h.223A1.778,1.778,0,0,1,240,677.33Zm-4.667-3.7A1.667,1.667,0,1,1,237,675.25,1.646,1.646,0,0,1,235.333,673.625Z"
												fill="#4e9bd4"></path></g></g></svg></span><span data-v-c3c5f32c=""
									class="menu-name text-truncate">주소록 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g transform="translate(-796 -271)">
											<path class="svg-hover-color"
												d="M711,663.2a7.8,7.8,0,1,1-7.8,7.8,7.809,7.809,0,0,1,7.8-7.8m0-1.2a9,9,0,1,0,9,9,9,9,0,0,0-9-9Z"
												transform="translate(94 -391)" fill="#5b6164"></path>
											<path class="svg-hover-color"
												d="M720.792,680.792a.574.574,0,0,1-.809.039l-3.854-3.854a.6.6,0,0,1,.848-.848l3.854,3.854A.574.574,0,0,1,720.792,680.792Z"
												transform="translate(88.408 -396.592)" fill="#4e9bd4"></path>
											<path class="svg-hover-color"
												d="M716.6,669a.6.6,0,0,1,.6.6v4.2a.6.6,0,0,1-1.2,0v-4.2A.6.6,0,0,1,716.6,669Z"
												transform="translate(88.4 -393.8)" fill="#4e9bd4"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">예약 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g transform="translate(-149.978 -60.062)">
											<path fill="#4e9bd4" d="M0 0H1.3V7.991H0z" opacity="0.9"
												transform="translate(158.328 65.508)"></path>
											<path class="svg-hover-color"
												d="M154.353 78.009H150.6a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.622.625zm-3.125-1.25h2.5v-2.5h-2.5z"
												fill="#5b6164" transform="translate(0 .053)"></path>
											<path class="svg-hover-color"
												d="M161.794 66.062h-5.6a.727.727 0 0 1-.7-.75v-4.5a.726.726 0 0 1 .7-.75h5.6a.726.726 0 0 1 .7.75v4.5a.727.727 0 0 1-.7.75zm-4.9-1.5h4.2v-3h-4.2z"
												fill="#5b6164" transform="translate(-.016)"></path>
											<path class="svg-hover-color"
												d="M166.117 73.47h-1.3v-3.264h-11.669v3.264h-1.3v-4.482h14.266z"
												fill="#5b6164" transform="translate(0 .035)"></path>
											<path class="svg-hover-color"
												d="M160.869 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z"
												fill="#5b6164" transform="translate(-.016 .053)"></path>
											<path class="svg-hover-color"
												d="M167.385 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z"
												fill="#5b6164" transform="translate(-.032 .053)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">인사 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g id="service-menu-icon02_s" transform="translate(-363 -75)">
											<rect width="18" height="18" transform="translate(363 75)"
												fill="none"></rect>
											<g transform="translate(363 75)">
											<path class="svg-hover-color"
												d="M181.928,683.857a.641.641,0,0,1-.454-.188l-1.286-1.286a.643.643,0,0,1,.909-.909l.831.831,2.117-2.117a.643.643,0,0,1,.909.909l-2.571,2.571A.641.641,0,0,1,181.928,683.857Z"
												transform="translate(-169.714 -668.428)" fill="#4e9bd4"></path>
											<g transform="translate(0)">
											<g>
											<path class="svg-hover-color"
												d="M178.786,670.092v-5.52a1.285,1.285,0,0,0-1.286-1.286h-2.571A1.285,1.285,0,0,0,173.643,662h-4.5a1.285,1.285,0,0,0-1.286,1.286h-2.571A1.285,1.285,0,0,0,164,664.571v14.143A1.285,1.285,0,0,0,165.286,680h11.571a5.142,5.142,0,0,0,1.929-9.908Zm-5.143-6.806v1.286h-4.5v-1.286Zm-8.357,15.429V664.571h2.571a1.285,1.285,0,0,0,1.286,1.286h4.5a1.285,1.285,0,0,0,1.286-1.286H177.5v5.187a5.113,5.113,0,0,0-5.786,5.1,5.125,5.125,0,0,0,1.749,3.857Zm11.571,0a3.857,3.857,0,1,1,3.857-3.857A3.862,3.862,0,0,1,176.857,678.714Z"
												transform="translate(-164 -662)" fill="#5b6164"></path></g></g></g></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">전자결재
										<!---->
								</span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g>
											<path fill="none" d="M0 0H17.782V17.731H0z"
												transform="translate(-864 -778.727) translate(864 778.996)"></path>
											<path class="svg-hover-color" fill="#4e9bd4"
												d="M568.2 576.4a.642.642 0 0 1-.643-.641 3.214 3.214 0 0 0-6.428 0 .643.643 0 0 1-1.286 0 4.5 4.5 0 0 1 9 0 .642.642 0 0 1-.643.641z"
												transform="translate(-864 -778.727) translate(308.653 207.458)"></path>
											<path class="svg-hover-color" fill="#5b6164"
												d="M570.2 591.269h-16.709a.639.639 0 0 1-.643-.636v-12.728a.64.64 0 0 1 .643-.636H570.2a.64.64 0 0 1 .643.636v12.727a.639.639 0 0 1-.643.637zM554.134 590h15.427v-11.458h-15.427z"
												transform="translate(-864 -778.727) translate(311.153 205.304)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">플러스앱
										<!---->
								</span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="15" viewBox="0 0 18 15">
											<g transform="translate(-149.342 -24.601)">
											<g>
											<path class="svg-hover-color"
												d="M153.787 28.578a1.41 1.41 0 1 1 .827-2.588 4.593 4.593 0 0 1 .779-.857 2.565 2.565 0 1 0-1.548 4.605c.028 0 .054-.008.082-.008a4.521 4.521 0 0 1-.141-1.122c-.001-.008.001-.02.001-.03z"
												fill="#5b6164"></path>
											<path class="svg-hover-color"
												d="M150.5 33.718v-.642a1.543 1.543 0 0 1 1.543-1.54 1.134 1.134 0 0 1 .32.077 4.466 4.466 0 0 0 1.481.243 4.289 4.289 0 0 0 1.165-.152 4.6 4.6 0 0 1-.728-1.032 3.392 3.392 0 0 1-.438.029c-.947 0-1.222-.32-1.8-.32a2.7 2.7 0 0 0-2.7 2.695v.834a.964.964 0 0 0 .964.963h1.135a4.641 4.641 0 0 1 .819-1.155z"
												fill="#5b6164"></path>
											<path class="svg-hover-color"
												d="M162.108 25.977a1.407 1.407 0 1 1 .84 2.6v.036a4.6 4.6 0 0 1-.142 1.126h.038a2.567 2.567 0 1 0-1.527-4.626 4.6 4.6 0 0 1 .791.864z"
												fill="#4e9bd4"></path>
											<path class="svg-hover-color"
												d="M164.646 30.381c-.576 0-.854.32-1.8.32a3.58 3.58 0 0 1-.4-.023 4.533 4.533 0 0 1-.733 1.036 4.266 4.266 0 0 0 1.13.143 4.476 4.476 0 0 0 1.482-.243 1.129 1.129 0 0 1 .318-.077 1.542 1.542 0 0 1 1.543 1.54v.642H164.3a4.645 4.645 0 0 1 .82 1.155h1.257a.964.964 0 0 0 .965-.962v-.835a2.7 2.7 0 0 0-2.696-2.696z"
												fill="#4e9bd4"></path>
											<g>
											<path class="svg-hover-color"
												d="M158.377 26.088a2.511 2.511 0 1 1-2.517 2.512 2.516 2.516 0 0 1 2.517-2.511m0-1.156a3.667 3.667 0 1 0 3.673 3.667 3.668 3.668 0 0 0-3.672-3.667z"
												fill="#5b6164"></path>
											<path class="svg-hover-color"
												d="M160.949 34.338a2.7 2.7 0 0 1 2.7 2.695v1.192a.22.22 0 0 1-.22.219h-10.106a.22.22 0 0 1-.22-.219v-1.192a2.7 2.7 0 0 1 2.7-2.695 1.964 1.964 0 0 1 .606.133 6.1 6.1 0 0 0 3.933 0 1.962 1.962 0 0 1 .6-.132m0-1.155c-.823 0-1.22.458-2.571.458s-1.746-.458-2.572-.458a3.855 3.855 0 0 0-3.858 3.85v1.192a1.377 1.377 0 0 0 1.379 1.375h10.1a1.377 1.377 0 0 0 1.378-1.375v-1.192a3.855 3.855 0 0 0-3.858-3.85z"
												fill="#5b6164"></path></g></g></g></svg></span><span data-v-c3c5f32c=""
									class="menu-name text-truncate">그룹 <!----></span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18" viewBox="0 0 18 18">
											<g transform="translate(-843.804 -361.04)">
											<path
												d="M857.835 366.463l-.31-.262a5.887 5.887 0 0 0-1.9-1.081l-.39-.134v-1.932a8.089 8.089 0 0 0-3.224 0v1.933l-.388.136a6.053 6.053 0 0 0-1.9 1.084l-.309.26-1.69-.967a7.825 7.825 0 0 0-1.61 2.75l1.7.969-.076.4a5.785 5.785 0 0 0 0 2.16l.077.406-1.7.968a7.865 7.865 0 0 0 1.612 2.746l1.7-.971.309.264a5.886 5.886 0 0 0 1.891 1.085l.39.135v1.934a8.09 8.09 0 0 0 3.224 0v-1.932l.386-.137a6.1 6.1 0 0 0 1.9-1.088l.31-.261 1.693.974a7.819 7.819 0 0 0 1.608-2.755l-1.7-.967.076-.406a5.81 5.81 0 0 0 0-2.16l-.076-.405 1.7-.969a7.872 7.872 0 0 0-1.612-2.749zm-4.19 7.519h-.028a3.284 3.284 0 1 1 0-6.569h.03a3.284 3.284 0 1 1 0 6.568z"
												fill="none" transform="translate(-.827 -.661)"></path>
											<path
												d="M856.6 375.979h.014a2.127 2.127 0 1 0 0-4.254h-.014a2.127 2.127 0 1 0-.007 4.254h.012z"
												fill="none" transform="translate(-3.801 -3.816)"></path>
											<path
												d="M843.8 361.04v18h18v-18zm16.093 9.879l1.121.639a1 1 0 0 1 .447 1.136 9 9 0 0 1-2 3.437.991.991 0 0 1-1.219.183l-1.116-.642a7.219 7.219 0 0 1-1.553.89v1.268a.993.993 0 0 1-.78.961 9.223 9.223 0 0 1-3.983 0 .992.992 0 0 1-.777-.957v-1.27a7.027 7.027 0 0 1-1.553-.892l-1.119.64a1 1 0 0 1-1.211-.179 9.042 9.042 0 0 1-2.006-3.422.994.994 0 0 1 .458-1.154l1.107-.632a6.907 6.907 0 0 1 0-1.766l-1.112-.634a.984.984 0 0 1-.454-1.151 8.983 8.983 0 0 1 2-3.423.982.982 0 0 1 1.218-.183l1.113.637a7.185 7.185 0 0 1 1.555-.888v-1.267a.991.991 0 0 1 .779-.96 9.21 9.21 0 0 1 3.983 0 .99.99 0 0 1 .777.957v1.266a6.97 6.97 0 0 1 1.557.889l1.117-.638a1 1 0 0 1 1.211.181 9.044 9.044 0 0 1 2.006 3.425.991.991 0 0 1-.456 1.153l-1.109.633a6.987 6.987 0 0 1 .006 1.763z"
												fill="none"></path>
											<path class="svg-hover-color"
												d="M859.956 373.848a2.149 2.149 0 0 0-2.148-2.123 2.127 2.127 0 1 1 0 4.254 2.15 2.15 0 0 0 2.148-2.131z"
												fill="#5b6164" transform="translate(-4.993 -3.816)"></path>
											<path class="svg-hover-color"
												d="M861.626 367.387a9.044 9.044 0 0 0-2.006-3.425 1 1 0 0 0-1.211-.181l-1.117.638a6.97 6.97 0 0 0-1.557-.889v-1.266a.99.99 0 0 0-.777-.957 9.209 9.209 0 0 0-3.983 0 .991.991 0 0 0-.779.96v1.267a7.186 7.186 0 0 0-1.555.888l-1.113-.637a.982.982 0 0 0-1.218.183 8.983 8.983 0 0 0-2 3.423.984.984 0 0 0 .454 1.151l1.112.635a6.907 6.907 0 0 0 0 1.766l-1.107.632a.994.994 0 0 0-.458 1.154 9.042 9.042 0 0 0 2.006 3.422 1 1 0 0 0 1.211.179l1.119-.64a7.027 7.027 0 0 0 1.553.892v1.27a.992.992 0 0 0 .777.957 9.223 9.223 0 0 0 3.983 0 .993.993 0 0 0 .78-.961v-1.268a7.219 7.219 0 0 0 1.553-.89l1.116.642a.991.991 0 0 0 1.219-.183 9 9 0 0 0 2-3.437 1 1 0 0 0-.447-1.136l-1.121-.639a6.986 6.986 0 0 0 0-1.765l1.109-.633a.991.991 0 0 0 .457-1.152zm-6.91-4.948zm0 0zm-3.489 0zm0 0zm-4.063 2.318zm0 0zm-.206.034zm0 0zm-1.62 2.744zm0 0zm0 5.045zm0 0zm5.883 5.1zm0 0zm3.489 0zm0 0zm4.067-2.316zm0 0zm.206-.033zm0 0zm-.205-6.759l.076.405a5.81 5.81 0 0 1 0 2.16l-.076.406 1.7.967a7.82 7.82 0 0 1-1.608 2.755l-1.693-.974-.31.261a6.1 6.1 0 0 1-1.9 1.088l-.386.137v1.932a8.09 8.09 0 0 1-3.224 0v-1.934l-.39-.135a5.886 5.886 0 0 1-1.891-1.085l-.309-.264-1.7.971a7.865 7.865 0 0 1-1.612-2.746l1.7-.968-.076-.406a5.782 5.782 0 0 1 0-2.16l.076-.4-1.7-.969a7.826 7.826 0 0 1 1.61-2.75l1.69.967.309-.26a6.053 6.053 0 0 1 1.9-1.084l.388-.136v-1.94a8.089 8.089 0 0 1 3.224 0v1.932l.39.134a5.887 5.887 0 0 1 1.9 1.081l.31.262 1.695-.968a7.873 7.873 0 0 1 1.612 2.749zm1.815-1.036zm0 0z"
												fill="#5b6164" transform="translate(-.164 -.018)"></path>
											<path class="svg-hover-color"
												d="M852.645 373.214a3.312 3.312 0 0 1 3.3-3.289 3.284 3.284 0 1 0 0 6.569 3.311 3.311 0 0 1-3.3-3.28z"
												fill="#5b6164" transform="translate(-3.157 -3.173)"></path>
											<path class="svg-hover-color"
												d="M857.813 369.926a3.284 3.284 0 1 1-.005 6.568 3.284 3.284 0 1 0 0-6.568z"
												fill="#4e9bd4" transform="translate(-4.993 -3.174)"></path>
											<path class="svg-hover-color"
												d="M854.446 373.857a2.151 2.151 0 0 1 2.152-2.132 2.127 2.127 0 1 0 0 4.254 2.15 2.15 0 0 1-2.152-2.122z"
												fill="#4e9bd4" transform="translate(-3.8 -3.816)"></path>
											<path class="svg-hover-color"
												d="M859.277 373.206a3.309 3.309 0 0 0-3.3-3.28h-.028a3.284 3.284 0 1 0 0 6.568h.025a3.312 3.312 0 0 0 3.303-3.288zm-3.315 2.13h-.014a2.127 2.127 0 1 1 0-4.254h.021a2.127 2.127 0 1 1 0 4.254h-.013z"
												fill="#4e9bd4" transform="translate(-3.158 -3.173)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">오피스
										관리 <!---->
								</span></a>
							</div>
							<div data-v-c3c5f32c="" data-v-68596525=""
								class="menu-item-wrap menu-item-wrap--type-menu">
								<a data-v-c3c5f32c="" class="menu-item menu-item--type-menu"><button
										data-v-c3c5f32c="" class="menu-button">
										<i data-v-c3c5f32c="" class="gi-star gis"></i>
									</button>
									<span data-v-c3c5f32c="" class="menu-icon"><svg
											class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
											width="18" height="18.273" viewBox="0 0 18 18.273">
											<g transform="translate(-591 -778.727)">
											<rect fill="none" width="18" height="18"
												transform="translate(591 779)"></rect>
											<path class="svg-hover-color" fill="#5b6164"
												d="M149.749,589.489H135.444a.625.625,0,0,1-.6-.651V571.92a.625.625,0,0,1,.6-.651h14.305a.625.625,0,0,1,.6.651v16.918A.625.625,0,0,1,149.749,589.489Zm-13.709-1.3h13.113V572.57H136.04Z"
												transform="translate(458.582 207.458)"></path>
											<path fill="#4e9bd4"
												d="M142.334,582.358h-2.083c-.221,0-.4-.291-.4-.651s.179-.651.4-.651h2.083c.221,0,.4.292.4.651S142.555,582.358,142.334,582.358Z"
												transform="translate(1181.972 642.897) rotate(90)"></path>
											<path fill="#4e9bd4"
												d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z"
												transform="translate(457.415 205.711)"></path>
											<path fill="#4e9bd4"
												d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z"
												transform="translate(457.415 208.711)"></path></g></svg></span><span
									data-v-c3c5f32c="" class="menu-name text-truncate">회계지원
										<!---->
								</span></a>
							</div>
						</div>
						<div data-v-68596525="" class="menu-right">
							<div data-v-68596525="" class="category-wrap">
								<div data-v-68596525="" class="category-group">
									<span data-v-68596525="" class="category-title">하이웍스</span>
									<div data-v-c3c5f32c="" data-v-68596525=""
										class="menu-item-wrap menu-item-wrap--type-category">
										<a data-v-c3c5f32c=""
											class="menu-item menu-item--type-category"><button
												data-v-c3c5f32c="" class="menu-button">
												<i data-v-c3c5f32c="" class="gi-star gis"></i>
											</button>
											<!---->
											<span data-v-c3c5f32c="" class="menu-name text-truncate">메신저
												다운로드 <!---->
										</span></a>
									</div>
									<div data-v-c3c5f32c="" data-v-68596525=""
										class="menu-item-wrap menu-item-wrap--type-category">
										<a data-v-c3c5f32c=""
											class="menu-item menu-item--type-category"><button
												data-v-c3c5f32c="" class="menu-button">
												<i data-v-c3c5f32c="" class="gi-star gis"></i>
											</button>
											<!---->
											<span data-v-c3c5f32c="" class="menu-name text-truncate">매뉴얼
												<!---->
										</span></a>
									</div>
									<div data-v-c3c5f32c="" data-v-68596525=""
										class="menu-item-wrap menu-item-wrap--type-category">
										<a data-v-c3c5f32c=""
											class="menu-item menu-item--type-category"><button
												data-v-c3c5f32c="" class="menu-button">
												<i data-v-c3c5f32c="" class="gi-star gis"></i>
											</button>
											<!---->
											<span data-v-c3c5f32c="" class="menu-name text-truncate">동영상
												매뉴얼 <!---->
										</span></a>
									</div>
									<div data-v-c3c5f32c="" data-v-68596525=""
										class="menu-item-wrap menu-item-wrap--type-category">
										<a data-v-c3c5f32c=""
											class="menu-item menu-item--type-category"><button
												data-v-c3c5f32c="" class="menu-button">
												<i data-v-c3c5f32c="" class="gi-star gis"></i>
											</button>
											<!---->
											<span data-v-c3c5f32c="" class="menu-name text-truncate">FAQ
												<!---->
										</span></a>
									</div>
									<div data-v-c3c5f32c="" data-v-68596525=""
										class="menu-item-wrap menu-item-wrap--type-category">
										<a data-v-c3c5f32c=""
											class="menu-item menu-item--type-category"><button
												data-v-c3c5f32c="" class="menu-button">
												<i data-v-c3c5f32c="" class="gi-star gis"></i>
											</button>
											<!---->
											<span data-v-c3c5f32c="" class="menu-name text-truncate">도입/이전
												상담 <!---->
										</span></a>
									</div>
								</div>
							</div>
							<!---->
							<div data-v-68596525="" class="category-wrap">
								<span data-v-68596525="" class="category-title">그룹</span>
								<div data-v-c3c5f32c="" data-v-68596525=""
									class="menu-item-wrap menu-item-wrap--type-group">
									<a data-v-c3c5f32c="" class="menu-item menu-item--type-group"><button
											data-v-c3c5f32c="" class="menu-button">
											<i data-v-c3c5f32c="" class="gi-star gis"></i>
										</button>
										<!---->
										<span data-v-c3c5f32c="" class="menu-name text-truncate">test1
											<!---->
									</span></a>
								</div>
								<div data-v-c3c5f32c="" data-v-68596525=""
									class="menu-item-wrap menu-item-wrap--type-group">
									<a data-v-c3c5f32c="" class="menu-item menu-item--type-group"><button
											data-v-c3c5f32c="" class="menu-button">
											<i data-v-c3c5f32c="" class="gi-star gis"></i>
										</button>
										<!---->
										<span data-v-c3c5f32c="" class="menu-name text-truncate">test2
											<!---->
									</span></a>
								</div>
							</div>
							<div data-v-68596525="" class="category-wrap">
								<span data-v-68596525="" class="category-title">내 즐겨찾기</span>
							</div>
						</div>
					</section>
					<section data-v-68596525="" class="modal-content__footer">
						<button data-v-f8d3258e="" data-v-68596525="" type="button"
							class="hw-button secondary">
							<!---->
							<span data-v-f8d3258e="" class="label">닫기</span>
							<!---->
						</button>
					</section>
				</div>
				<!-- 메뉴 즐겨찾기 모달 끝 -->
				
				
				
				
			</div>
		</div>
		
		
		<div data-v-42b974ea="" class="hw-modal-container">
			<div data-v-42b974ea="" class="hw-modal-background"
				style="display: none;"></div>
		</div>
		
	</div>
	<!-- ////////////////// 모달 끝 ////////////////// -->
	--%>
	
	
	
	
		
		<div>
			<div data-ui="skipNavigation" class="skip_navigation">
				<a href="https://home.office.hiworks.com/main#header">상단 메뉴로
					바로가기</a><a href="https://home.office.hiworks.com/main#sidebar">왼쪽
					메뉴로 바로가기</a><a href="https://home.office.hiworks.com/main#contents">본문
					영역으로 바로가기</a>
			</div>
			<div data-v-aaa54904="" class="summary-wrap" style="display: none;">
				<div data-v-aaa54904="" class="summary-inner">
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://mail.office.hiworks.com/gabia.biz/mail/webmail"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 14">
										<g>
										<path class="svg-hover-color" fill="#5b6164"
											d="M58.012 54.462H41.3a.639.639 0 0 1-.643-.637V41.1a.639.639 0 0 1 .641-.637h16.714a.64.64 0 0 1 .643.637v12.726a.64.64 0 0 1-.643.636zm-16.071-1.271h15.428V41.734H41.94z"
											transform="translate(-171 -133) translate(130.345 92.538)"></path>
										<path fill="#4e9bd4"
											d="M49.589 48.7a1.49 1.49 0 0 1-.818-.244l-4.911-3.627a.612.612 0 0 1-.16-.863.642.642 0 0 1 .882-.155l.04.029 4.883 3.6a.221.221 0 0 0 .218-.02l4.851-3.584a.641.641 0 0 1 .885.122.609.609 0 0 1-.124.867l-4.881 3.606a1.578 1.578 0 0 1-.865.269z"
											transform="translate(-171 -133) translate(130.235 92.425)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://board.office.hiworks.com/gabia.biz/bbs/board/board_list"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" 897"="" height="28" viewBox="0 0 14.897 18">
										<g transform="translate(-253.062 -271)">
										<g transform="translate(253.062 271)">
										<g transform="translate(0 2.483)">
										<path class="svg-hover-color"
											d="M118.655,667.241v13.035H106.241V667.241h12.414m0-1.241H106.241A1.241,1.241,0,0,0,105,667.241v13.035a1.241,1.241,0,0,0,1.241,1.241h12.414a1.241,1.241,0,0,0,1.241-1.241V667.241A1.241,1.241,0,0,0,118.655,666Z"
											transform="translate(-105 -666)" fill="#5b6164"></path>
										<rect width="8.69" height="1.241" rx="0.621"
											transform="translate(3.103 3.103)" fill="#4e9bd4"></rect>
										<rect width="4.966" height="1.241" rx="0.621"
											transform="translate(3.103 6.207)" fill="#4e9bd4"></rect></g>
										<g transform="translate(3.38)">
										<path class="svg-hover-color"
											d="M117.893,665.62l-3.38-2.253-3.38,2.253-.689-1.033,3.724-2.483a.621.621,0,0,1,.689,0l3.724,2.483Z"
											transform="translate(-110.445 -662)" fill="#5b6164"></path></g></g></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://sms.office.hiworks.com/gabia.biz/sms/sms_main"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g id="그룹_58141" transform="translate(-187.087 -110.473)">
										<path class="svg-hover-color" fill="#5b6164"
											d="M203.4 128.473h-7.309a9 9 0 0 1-.04-18h.05a9 9 0 0 1 8.983 9v7.311a1.694 1.694 0 0 1-1.684 1.689zm-7.308-1.284h7.308a.405.405 0 0 0 .4-.4v-7.311a7.718 7.718 0 0 0-7.7-7.714 7.714 7.714 0 0 0 0 15.428z"></path>
										<circle class="svg-hover-color" cx="1" cy="1" r="1"
											fill="#4e9bd4" transform="translate(197.787 118.746)"></circle>
										<circle class="svg-hover-color" cx="1" cy="1" r="1"
											fill="#4e9bd4" transform="translate(194.787 118.746)"></circle>
										<circle class="svg-hover-color" cx="1" cy="1" r="1"
											fill="#4e9bd4" transform="translate(191.787 118.746)"></circle></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://bill.office.hiworks.com/gabia.biz/bill/manage/main"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g transform="translate(-1081.986 -778.727)">
										<path class="svg-hover-color"
											d="M905.206 589.269h-16.714a.643.643 0 0 1-.643-.643v-16.714a.643.643 0 0 1 .643-.643h16.714a.643.643 0 0 1 .643.643v16.714a.643.643 0 0 1-.643.643zm-16.071-1.286h15.429v-15.428h-15.429z"
											fill="#5b6164" transform="translate(194.137 207.458)"></path>
										<path class="svg-hover-color"
											d="M893.454 587.662a.643.643 0 0 1-.455-1.1l10.286-10.286a.643.643 0 0 1 .924.894l-.016.015-10.286 10.286a.636.636 0 0 1-.453.191z"
											fill="#5b6164" transform="translate(192.365 205.739)"></path>
										<path class="svg-hover-color"
											d="M907.348 589.555h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z"
											fill="#4e9bd4" transform="translate(188.78 201.387)"></path>
										<path class="svg-hover-color"
											d="M907.348 593.56h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z"
											fill="#4e9bd4" transform="translate(188.78 199.956)"></path>
										<path class="svg-hover-color"
											d="M897.348 580.768h-3.857a.643.643 0 0 1 0-1.286h3.857a.643.643 0 0 1 0 1.286z"
											fill="#4e9bd4" transform="translate(192.351 204.525)"></path>
										<path class="svg-hover-color"
											d="M896.491 581.417a.643.643 0 0 1-.643-.643v-3.857a.643.643 0 1 1 1.286 0v3.857a.643.643 0 0 1-.643.643z"
											fill="#4e9bd4" transform="translate(191.28 205.671)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://calendar.office.hiworks.com/gabia.biz/schedule/schedulemain"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 17">
										<g transform="translate(-467.343 -271)">
										<path class="svg-hover-color"
											d="M359.714,665.308H356.5V664h-1.286v1.308h-6.429V664H347.5v1.308h-3.214A1.3,1.3,0,0,0,343,666.615v13.077A1.3,1.3,0,0,0,344.286,681h15.429A1.3,1.3,0,0,0,361,679.692V666.615A1.3,1.3,0,0,0,359.714,665.308Zm0,14.385H344.286V666.615h15.429Z"
											transform="translate(124.343 -393)" fill="#5b6164"></path>
										<g transform="translate(471.843 278.192)">
										<path class="svg-hover-color"
											d="M351.414,677.71h.662a.92.92,0,0,0,.7-.241.889.889,0,0,0,.228-.638.783.783,0,0,0-.226-.6.865.865,0,0,0-.62-.214.911.911,0,0,0-.6.2.641.641,0,0,0-.24.518h-1.242a1.566,1.566,0,0,1,.265-.893,1.759,1.759,0,0,1,.739-.618,2.424,2.424,0,0,1,1.047-.223,2.315,2.315,0,0,1,1.556.483,1.664,1.664,0,0,1,.563,1.332,1.355,1.355,0,0,1-.262.8,1.709,1.709,0,0,1-.688.563,1.558,1.558,0,0,1,.788.577,1.58,1.58,0,0,1,.26.909,1.687,1.687,0,0,1-.608,1.359,2.418,2.418,0,0,1-1.609.511,2.292,2.292,0,0,1-1.532-.5,1.652,1.652,0,0,1-.6-1.329h1.242a.737.737,0,0,0,.264.586,1.086,1.086,0,0,0,1.345-.011.829.829,0,0,0,.251-.632q0-.953-1.031-.953h-.658Z"
											transform="translate(-350 -675)" fill="#4e9bd4"></path>
										<path class="svg-hover-color"
											d="M361.471,681.539H360.2v-5l-1.521.48v-1.054l2.659-.968h.136Z"
											transform="translate(-353.099 -675)" fill="#4e9bd4"></path></g>
										<rect width="15.429" class="svg-hover-color" height="1.308"
											transform="translate(468.628 275.577)" fill="#5b6164"></rect></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://teammail.office.hiworks.com/gabia.biz/shared/main/sList"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 14">
										<g>
										<path class="svg-hover-color" fill="#4e9bd4"
											d="M397.838 582.64a1.3 1.3 0 0 1-.725-.221l-4.016-3.028a.626.626 0 1 1 .753-1l3.986 3.006s.029 0 .054-.021l3.955-2.986a.626.626 0 0 1 .753 1l-3.985 3.007a1.384 1.384 0 0 1-.775.243z"
											transform="translate(-754.684 -780) translate(367.037 204.734)"></path>
										<path class="svg-hover-color" fill="#5b6164"
											d="M397.346 155.822H383.2a.64.64 0 0 0-.643.637v1.909h-1.928a.639.639 0 0 0-.642.636v10.183a.638.638 0 0 0 .642.635h14.146a.638.638 0 0 0 .639-.638v-1.907h1.93a.64.64 0 0 0 .642-.637v-10.181a.64.64 0 0 0-.64-.637zm-3.213 12.725h-12.858v-8.909h1.285v7a.64.64 0 0 0 .643.637h10.93zm2.57-2.542h-12.857V157.1H396.7z"
											transform="translate(-754.684 -780) translate(374.695 624.178)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://contacts.office.hiworks.com/gabia.biz/addr/main"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										xmlns="http://www.w3.org/2000/svg" class="service-menu-icon"
										width="28" height="28" viewBox="0 0 17 18">
										<g id="service-menu-icon03_s" transform="translate(-360 -271)">
										<path class="svg-hover-color" d="M0,0H2V2.955H0Z"
											transform="translate(360 275)" fill="#5b6164"></path>
										<path class="svg-hover-color" d="M0,0H2V2.955H0Z"
											transform="translate(360 281.895)" fill="#5b6164"></path>
										<path class="svg-hover-color"
											d="M250.942,110.908v15.4h-13.4v-15.4h13.4m.8-1.3h-15a.5.5,0,0,0-.5.5v17a.5.5,0,0,0,.5.5h15a.5.5,0,0,0,.5-.5v-17a.5.5,0,0,0-.5-.5Z"
											transform="translate(124.758 161.392)" fill="#5b6164"></path>
										<g transform="translate(132 -396)">
										<path class="svg-hover-color"
											d="M240,677.33v.544a.635.635,0,0,1-.643.627h-4.715a.635.635,0,0,1-.643-.627v-.544a1.778,1.778,0,0,1,1.8-1.755h.223a2.39,2.39,0,0,0,1.953,0h.223A1.778,1.778,0,0,1,240,677.33Zm-4.667-3.7A1.667,1.667,0,1,1,237,675.25,1.646,1.646,0,0,1,235.333,673.625Z"
											fill="#4e9bd4"></path></g></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://booking.office.hiworks.com/gabia.biz/booking/bookingMain"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g transform="translate(-796 -271)">
										<path class="svg-hover-color"
											d="M711,663.2a7.8,7.8,0,1,1-7.8,7.8,7.809,7.809,0,0,1,7.8-7.8m0-1.2a9,9,0,1,0,9,9,9,9,0,0,0-9-9Z"
											transform="translate(94 -391)" fill="#5b6164"></path>
										<path class="svg-hover-color"
											d="M720.792,680.792a.574.574,0,0,1-.809.039l-3.854-3.854a.6.6,0,0,1,.848-.848l3.854,3.854A.574.574,0,0,1,720.792,680.792Z"
											transform="translate(88.408 -396.592)" fill="#4e9bd4"></path>
										<path class="svg-hover-color"
											d="M716.6,669a.6.6,0,0,1,.6.6v4.2a.6.6,0,0,1-1.2,0v-4.2A.6.6,0,0,1,716.6,669Z"
											transform="translate(88.4 -393.8)" fill="#4e9bd4"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://office.hiworks.com/gabia.biz/insa/info/member"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g transform="translate(-149.978 -60.062)">
										<path fill="#4e9bd4" d="M0 0H1.3V7.991H0z" opacity="0.9"
											transform="translate(158.328 65.508)"></path>
										<path class="svg-hover-color"
											d="M154.353 78.009H150.6a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.622.625zm-3.125-1.25h2.5v-2.5h-2.5z"
											fill="#5b6164" transform="translate(0 .053)"></path>
										<path class="svg-hover-color"
											d="M161.794 66.062h-5.6a.727.727 0 0 1-.7-.75v-4.5a.726.726 0 0 1 .7-.75h5.6a.726.726 0 0 1 .7.75v4.5a.727.727 0 0 1-.7.75zm-4.9-1.5h4.2v-3h-4.2z"
											fill="#5b6164" transform="translate(-.016)"></path>
										<path class="svg-hover-color"
											d="M166.117 73.47h-1.3v-3.264h-11.669v3.264h-1.3v-4.482h14.266z"
											fill="#5b6164" transform="translate(0 .035)"></path>
										<path class="svg-hover-color"
											d="M160.869 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z"
											fill="#5b6164" transform="translate(-.016 .053)"></path>
										<path class="svg-hover-color"
											d="M167.385 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z"
											fill="#5b6164" transform="translate(-.032 .053)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://approval.office.hiworks.com/gabia.biz/approval/document"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g id="service-menu-icon02_s" transform="translate(-363 -75)">
										<rect width="18" height="18" transform="translate(363 75)"
											fill="none"></rect>
										<g transform="translate(363 75)">
										<path class="svg-hover-color"
											d="M181.928,683.857a.641.641,0,0,1-.454-.188l-1.286-1.286a.643.643,0,0,1,.909-.909l.831.831,2.117-2.117a.643.643,0,0,1,.909.909l-2.571,2.571A.641.641,0,0,1,181.928,683.857Z"
											transform="translate(-169.714 -668.428)" fill="#4e9bd4"></path>
										<g transform="translate(0)">
										<g>
										<path class="svg-hover-color"
											d="M178.786,670.092v-5.52a1.285,1.285,0,0,0-1.286-1.286h-2.571A1.285,1.285,0,0,0,173.643,662h-4.5a1.285,1.285,0,0,0-1.286,1.286h-2.571A1.285,1.285,0,0,0,164,664.571v14.143A1.285,1.285,0,0,0,165.286,680h11.571a5.142,5.142,0,0,0,1.929-9.908Zm-5.143-6.806v1.286h-4.5v-1.286Zm-8.357,15.429V664.571h2.571a1.285,1.285,0,0,0,1.286,1.286h4.5a1.285,1.285,0,0,0,1.286-1.286H177.5v5.187a5.113,5.113,0,0,0-5.786,5.1,5.125,5.125,0,0,0,1.749,3.857Zm11.571,0a3.857,3.857,0,1,1,3.857-3.857A3.862,3.862,0,0,1,176.857,678.714Z"
											transform="translate(-164 -662)" fill="#5b6164"></path></g></g></g></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904="" href="https://plus.office.hiworks.com/"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g>
										<path fill="none" d="M0 0H17.782V17.731H0z"
											transform="translate(-864 -778.727) translate(864 778.996)"></path>
										<path class="svg-hover-color" fill="#4e9bd4"
											d="M568.2 576.4a.642.642 0 0 1-.643-.641 3.214 3.214 0 0 0-6.428 0 .643.643 0 0 1-1.286 0 4.5 4.5 0 0 1 9 0 .642.642 0 0 1-.643.641z"
											transform="translate(-864 -778.727) translate(308.653 207.458)"></path>
										<path class="svg-hover-color" fill="#5b6164"
											d="M570.2 591.269h-16.709a.639.639 0 0 1-.643-.636v-12.728a.64.64 0 0 1 .643-.636H570.2a.64.64 0 0 1 .643.636v12.727a.639.639 0 0 1-.643.637zM554.134 590h15.427v-11.458h-15.427z"
											transform="translate(-864 -778.727) translate(311.153 205.304)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://groups.office.hiworks.com/group/main"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 15">
										<g transform="translate(-149.342 -24.601)">
										<g>
										<path class="svg-hover-color"
											d="M153.787 28.578a1.41 1.41 0 1 1 .827-2.588 4.593 4.593 0 0 1 .779-.857 2.565 2.565 0 1 0-1.548 4.605c.028 0 .054-.008.082-.008a4.521 4.521 0 0 1-.141-1.122c-.001-.008.001-.02.001-.03z"
											fill="#5b6164"></path>
										<path class="svg-hover-color"
											d="M150.5 33.718v-.642a1.543 1.543 0 0 1 1.543-1.54 1.134 1.134 0 0 1 .32.077 4.466 4.466 0 0 0 1.481.243 4.289 4.289 0 0 0 1.165-.152 4.6 4.6 0 0 1-.728-1.032 3.392 3.392 0 0 1-.438.029c-.947 0-1.222-.32-1.8-.32a2.7 2.7 0 0 0-2.7 2.695v.834a.964.964 0 0 0 .964.963h1.135a4.641 4.641 0 0 1 .819-1.155z"
											fill="#5b6164"></path>
										<path class="svg-hover-color"
											d="M162.108 25.977a1.407 1.407 0 1 1 .84 2.6v.036a4.6 4.6 0 0 1-.142 1.126h.038a2.567 2.567 0 1 0-1.527-4.626 4.6 4.6 0 0 1 .791.864z"
											fill="#4e9bd4"></path>
										<path class="svg-hover-color"
											d="M164.646 30.381c-.576 0-.854.32-1.8.32a3.58 3.58 0 0 1-.4-.023 4.533 4.533 0 0 1-.733 1.036 4.266 4.266 0 0 0 1.13.143 4.476 4.476 0 0 0 1.482-.243 1.129 1.129 0 0 1 .318-.077 1.542 1.542 0 0 1 1.543 1.54v.642H164.3a4.645 4.645 0 0 1 .82 1.155h1.257a.964.964 0 0 0 .965-.962v-.835a2.7 2.7 0 0 0-2.696-2.696z"
											fill="#4e9bd4"></path>
										<g>
										<path class="svg-hover-color"
											d="M158.377 26.088a2.511 2.511 0 1 1-2.517 2.512 2.516 2.516 0 0 1 2.517-2.511m0-1.156a3.667 3.667 0 1 0 3.673 3.667 3.668 3.668 0 0 0-3.672-3.667z"
											fill="#5b6164"></path>
										<path class="svg-hover-color"
											d="M160.949 34.338a2.7 2.7 0 0 1 2.7 2.695v1.192a.22.22 0 0 1-.22.219h-10.106a.22.22 0 0 1-.22-.219v-1.192a2.7 2.7 0 0 1 2.7-2.695 1.964 1.964 0 0 1 .606.133 6.1 6.1 0 0 0 3.933 0 1.962 1.962 0 0 1 .6-.132m0-1.155c-.823 0-1.22.458-2.571.458s-1.746-.458-2.572-.458a3.855 3.855 0 0 0-3.858 3.85v1.192a1.377 1.377 0 0 0 1.379 1.375h10.1a1.377 1.377 0 0 0 1.378-1.375v-1.192a3.855 3.855 0 0 0-3.858-3.85z"
											fill="#5b6164"></path></g></g></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://office.hiworks.com/gabia.biz/h_admin/adminhome"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" viewBox="0 0 18 18">
										<g transform="translate(-843.804 -361.04)">
										<path
											d="M857.835 366.463l-.31-.262a5.887 5.887 0 0 0-1.9-1.081l-.39-.134v-1.932a8.089 8.089 0 0 0-3.224 0v1.933l-.388.136a6.053 6.053 0 0 0-1.9 1.084l-.309.26-1.69-.967a7.825 7.825 0 0 0-1.61 2.75l1.7.969-.076.4a5.785 5.785 0 0 0 0 2.16l.077.406-1.7.968a7.865 7.865 0 0 0 1.612 2.746l1.7-.971.309.264a5.886 5.886 0 0 0 1.891 1.085l.39.135v1.934a8.09 8.09 0 0 0 3.224 0v-1.932l.386-.137a6.1 6.1 0 0 0 1.9-1.088l.31-.261 1.693.974a7.819 7.819 0 0 0 1.608-2.755l-1.7-.967.076-.406a5.81 5.81 0 0 0 0-2.16l-.076-.405 1.7-.969a7.872 7.872 0 0 0-1.612-2.749zm-4.19 7.519h-.028a3.284 3.284 0 1 1 0-6.569h.03a3.284 3.284 0 1 1 0 6.568z"
											fill="none" transform="translate(-.827 -.661)"></path>
										<path
											d="M856.6 375.979h.014a2.127 2.127 0 1 0 0-4.254h-.014a2.127 2.127 0 1 0-.007 4.254h.012z"
											fill="none" transform="translate(-3.801 -3.816)"></path>
										<path
											d="M843.8 361.04v18h18v-18zm16.093 9.879l1.121.639a1 1 0 0 1 .447 1.136 9 9 0 0 1-2 3.437.991.991 0 0 1-1.219.183l-1.116-.642a7.219 7.219 0 0 1-1.553.89v1.268a.993.993 0 0 1-.78.961 9.223 9.223 0 0 1-3.983 0 .992.992 0 0 1-.777-.957v-1.27a7.027 7.027 0 0 1-1.553-.892l-1.119.64a1 1 0 0 1-1.211-.179 9.042 9.042 0 0 1-2.006-3.422.994.994 0 0 1 .458-1.154l1.107-.632a6.907 6.907 0 0 1 0-1.766l-1.112-.634a.984.984 0 0 1-.454-1.151 8.983 8.983 0 0 1 2-3.423.982.982 0 0 1 1.218-.183l1.113.637a7.185 7.185 0 0 1 1.555-.888v-1.267a.991.991 0 0 1 .779-.96 9.21 9.21 0 0 1 3.983 0 .99.99 0 0 1 .777.957v1.266a6.97 6.97 0 0 1 1.557.889l1.117-.638a1 1 0 0 1 1.211.181 9.044 9.044 0 0 1 2.006 3.425.991.991 0 0 1-.456 1.153l-1.109.633a6.987 6.987 0 0 1 .006 1.763z"
											fill="none"></path>
										<path class="svg-hover-color"
											d="M859.956 373.848a2.149 2.149 0 0 0-2.148-2.123 2.127 2.127 0 1 1 0 4.254 2.15 2.15 0 0 0 2.148-2.131z"
											fill="#5b6164" transform="translate(-4.993 -3.816)"></path>
										<path class="svg-hover-color"
											d="M861.626 367.387a9.044 9.044 0 0 0-2.006-3.425 1 1 0 0 0-1.211-.181l-1.117.638a6.97 6.97 0 0 0-1.557-.889v-1.266a.99.99 0 0 0-.777-.957 9.209 9.209 0 0 0-3.983 0 .991.991 0 0 0-.779.96v1.267a7.186 7.186 0 0 0-1.555.888l-1.113-.637a.982.982 0 0 0-1.218.183 8.983 8.983 0 0 0-2 3.423.984.984 0 0 0 .454 1.151l1.112.635a6.907 6.907 0 0 0 0 1.766l-1.107.632a.994.994 0 0 0-.458 1.154 9.042 9.042 0 0 0 2.006 3.422 1 1 0 0 0 1.211.179l1.119-.64a7.027 7.027 0 0 0 1.553.892v1.27a.992.992 0 0 0 .777.957 9.223 9.223 0 0 0 3.983 0 .993.993 0 0 0 .78-.961v-1.268a7.219 7.219 0 0 0 1.553-.89l1.116.642a.991.991 0 0 0 1.219-.183 9 9 0 0 0 2-3.437 1 1 0 0 0-.447-1.136l-1.121-.639a6.986 6.986 0 0 0 0-1.765l1.109-.633a.991.991 0 0 0 .457-1.152zm-6.91-4.948zm0 0zm-3.489 0zm0 0zm-4.063 2.318zm0 0zm-.206.034zm0 0zm-1.62 2.744zm0 0zm0 5.045zm0 0zm5.883 5.1zm0 0zm3.489 0zm0 0zm4.067-2.316zm0 0zm.206-.033zm0 0zm-.205-6.759l.076.405a5.81 5.81 0 0 1 0 2.16l-.076.406 1.7.967a7.82 7.82 0 0 1-1.608 2.755l-1.693-.974-.31.261a6.1 6.1 0 0 1-1.9 1.088l-.386.137v1.932a8.09 8.09 0 0 1-3.224 0v-1.934l-.39-.135a5.886 5.886 0 0 1-1.891-1.085l-.309-.264-1.7.971a7.865 7.865 0 0 1-1.612-2.746l1.7-.968-.076-.406a5.782 5.782 0 0 1 0-2.16l.076-.4-1.7-.969a7.826 7.826 0 0 1 1.61-2.75l1.69.967.309-.26a6.053 6.053 0 0 1 1.9-1.084l.388-.136v-1.94a8.089 8.089 0 0 1 3.224 0v1.932l.39.134a5.887 5.887 0 0 1 1.9 1.081l.31.262 1.695-.968a7.873 7.873 0 0 1 1.612 2.749zm1.815-1.036zm0 0z"
											fill="#5b6164" transform="translate(-.164 -.018)"></path>
										<path class="svg-hover-color"
											d="M852.645 373.214a3.312 3.312 0 0 1 3.3-3.289 3.284 3.284 0 1 0 0 6.569 3.311 3.311 0 0 1-3.3-3.28z"
											fill="#5b6164" transform="translate(-3.157 -3.173)"></path>
										<path class="svg-hover-color"
											d="M857.813 369.926a3.284 3.284 0 1 1-.005 6.568 3.284 3.284 0 1 0 0-6.568z"
											fill="#4e9bd4" transform="translate(-4.993 -3.174)"></path>
										<path class="svg-hover-color"
											d="M854.446 373.857a2.151 2.151 0 0 1 2.152-2.132 2.127 2.127 0 1 0 0 4.254 2.15 2.15 0 0 1-2.152-2.122z"
											fill="#4e9bd4" transform="translate(-3.8 -3.816)"></path>
										<path class="svg-hover-color"
											d="M859.277 373.206a3.309 3.309 0 0 0-3.3-3.28h-.028a3.284 3.284 0 1 0 0 6.568h.025a3.312 3.312 0 0 0 3.303-3.288zm-3.315 2.13h-.014a2.127 2.127 0 1 1 0-4.254h.021a2.127 2.127 0 1 1 0 4.254h-.013z"
											fill="#4e9bd4" transform="translate(-3.158 -3.173)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904=""
							href="https://office.hiworks.com/gabia.biz/accounting/basic/criteria"
							target="_self" class="menu"><span data-v-aaa54904=""
							class="inner">
								<!---->
								<span data-v-aaa54904="" class="icon"><svg
										class="service-menu-icon" xmlns="http://www.w3.org/2000/svg"
										width="28" height="28" 273"="" viewBox="0 0 18 18.273">
										<g transform="translate(-591 -778.727)">
										<rect fill="none" width="18" height="18"
											transform="translate(591 779)"></rect>
										<path class="svg-hover-color" fill="#5b6164"
											d="M149.749,589.489H135.444a.625.625,0,0,1-.6-.651V571.92a.625.625,0,0,1,.6-.651h14.305a.625.625,0,0,1,.6.651v16.918A.625.625,0,0,1,149.749,589.489Zm-13.709-1.3h13.113V572.57H136.04Z"
											transform="translate(458.582 207.458)"></path>
										<path fill="#4e9bd4"
											d="M142.334,582.358h-2.083c-.221,0-.4-.291-.4-.651s.179-.651.4-.651h2.083c.221,0,.4.292.4.651S142.555,582.358,142.334,582.358Z"
											transform="translate(1181.972 642.897) rotate(90)"></path>
										<path fill="#4e9bd4"
											d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z"
											transform="translate(457.415 205.711)"></path>
										<path fill="#4e9bd4"
											d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z"
											transform="translate(457.415 208.711)"></path></g></svg></span>
						</span></a>
					</div>
					<div data-v-aaa54904="" class="inner-wrap">
						<a data-v-aaa54904="" class="top-button"><span
							data-v-aaa54904="" class="inner"><i data-v-aaa54904=""
								class="fal fa-chevron-double-up"></i></span></a>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			<div class="split-wrap">
				<div>
				
				
				
					<!-- 컨텐츠 자리 -->
					<!-- 컨텐츠 시작 -->
					<tiles:insertAttribute name="content" /> 
					<!-- 컨텐츠 끝 -->
					
					
					
					
				</div>
			</div>
		</div>
	</div>
	<script src="./index_files/chunk-vendors.f1530f30.js"></script>
	<script src="./index_files/app.5dc26a18.js"></script>
	<script src="./index_files/main.js"></script>
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
	
	
	<%--
	<!-- 달력? 시작 -->
	<div class="el-picker-panel el-date-picker el-popper"
		style="z-index: 2013; position: fixed; top: 324px; left: 109px;"
		x-placement="bottom-start">
		<div class="el-picker-panel__body-wrapper">
			<!---->
			<div class="el-picker-panel__body">
				<!---->
				<div class="el-date-picker__header">
					<button type="button" aria-label="Previous Year"
						class="el-picker-panel__icon-btn el-date-picker__prev-btn el-icon-d-arrow-left"></button>
					<button type="button" aria-label="Previous Month"
						class="el-picker-panel__icon-btn el-date-picker__prev-btn el-icon-arrow-left"></button>
					<span role="button" class="el-date-picker__header-label">2023
					</span><span role="button" class="el-date-picker__header-label">December</span>
					<button type="button" aria-label="Next Year"
						class="el-picker-panel__icon-btn el-date-picker__next-btn el-icon-d-arrow-right"></button>
					<button type="button" aria-label="Next Month"
						class="el-picker-panel__icon-btn el-date-picker__next-btn el-icon-arrow-right"></button>
				</div>
				<div class="el-picker-panel__content">
					<table cellspacing="0" cellpadding="0" class="el-date-table">
						<tbody>
							<tr>
								<!---->
								<th>Sun</th>
								<th>Mon</th>
								<th>Tue</th>
								<th>Wed</th>
								<th>Thu</th>
								<th>Fri</th>
								<th>Sat</th>
							</tr>
							<tr class="el-date-table__row">
								<td class="prev-month"><div>
										<span> 26 </span>
									</div></td>
								<td class="prev-month"><div>
										<span> 27 </span>
									</div></td>
								<td class="prev-month"><div>
										<span> 28 </span>
									</div></td>
								<td class="prev-month"><div>
										<span> 29 </span>
									</div></td>
								<td class="prev-month"><div>
										<span> 30 </span>
									</div></td>
								<td class="available"><div>
										<span> 1 </span>
									</div></td>
								<td class="available today"><div>
										<span> 2 </span>
									</div></td>
							</tr>
							<tr class="el-date-table__row">
								<td class="available"><div>
										<span> 3 </span>
									</div></td>
								<td class="available"><div>
										<span> 4 </span>
									</div></td>
								<td class="available"><div>
										<span> 5 </span>
									</div></td>
								<td class="available"><div>
										<span> 6 </span>
									</div></td>
								<td class="available"><div>
										<span> 7 </span>
									</div></td>
								<td class="available"><div>
										<span> 8 </span>
									</div></td>
								<td class="available"><div>
										<span> 9 </span>
									</div></td>
							</tr>
							<tr class="el-date-table__row">
								<td class="available"><div>
										<span> 10 </span>
									</div></td>
								<td class="available"><div>
										<span> 11 </span>
									</div></td>
								<td class="available"><div>
										<span> 12 </span>
									</div></td>
								<td class="available"><div>
										<span> 13 </span>
									</div></td>
								<td class="available"><div>
										<span> 14 </span>
									</div></td>
								<td class="available"><div>
										<span> 15 </span>
									</div></td>
								<td class="available"><div>
										<span> 16 </span>
									</div></td>
							</tr>
							<tr class="el-date-table__row">
								<td class="available"><div>
										<span> 17 </span>
									</div></td>
								<td class="available"><div>
										<span> 18 </span>
									</div></td>
								<td class="available"><div>
										<span> 19 </span>
									</div></td>
								<td class="available"><div>
										<span> 20 </span>
									</div></td>
								<td class="available"><div>
										<span> 21 </span>
									</div></td>
								<td class="available"><div>
										<span> 22 </span>
									</div></td>
								<td class="available"><div>
										<span> 23 </span>
									</div></td>
							</tr>
							<tr class="el-date-table__row">
								<td class="available"><div>
										<span> 24 </span>
									</div></td>
								<td class="available"><div>
										<span> 25 </span>
									</div></td>
								<td class="available"><div>
										<span> 26 </span>
									</div></td>
								<td class="available"><div>
										<span> 27 </span>
									</div></td>
								<td class="available"><div>
										<span> 28 </span>
									</div></td>
								<td class="available"><div>
										<span> 29 </span>
									</div></td>
								<td class="available"><div>
										<span> 30 </span>
									</div></td>
							</tr>
							<tr class="el-date-table__row">
								<td class="available"><div>
										<span> 31 </span>
									</div></td>
								<td class="next-month"><div>
										<span> 1 </span>
									</div></td>
								<td class="next-month"><div>
										<span> 2 </span>
									</div></td>
								<td class="next-month"><div>
										<span> 3 </span>
									</div></td>
								<td class="next-month"><div>
										<span> 4 </span>
									</div></td>
								<td class="next-month"><div>
										<span> 5 </span>
									</div></td>
								<td class="next-month"><div>
										<span> 6 </span>
									</div></td>
							</tr>
						</tbody>
					</table>
					<table class="el-year-table" style="display: none;">
						<tbody>
							<tr>
								<td class="available"><a class="cell">2020</a></td>
								<td class="available"><a class="cell">2021</a></td>
								<td class="available"><a class="cell">2022</a></td>
								<td class="available today"><a class="cell">2023</a></td>
							</tr>
							<tr>
								<td class="available"><a class="cell">2024</a></td>
								<td class="available"><a class="cell">2025</a></td>
								<td class="available"><a class="cell">2026</a></td>
								<td class="available"><a class="cell">2027</a></td>
							</tr>
							<tr>
								<td class="available"><a class="cell">2028</a></td>
								<td class="available"><a class="cell">2029</a></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<table class="el-month-table" style="display: none;">
						<tbody>
							<tr>
								<td class=""><div>
										<a class="cell">Jan</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Feb</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Mar</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Apr</a>
									</div></td>
							</tr>
							<tr>
								<td class=""><div>
										<a class="cell">May</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Jun</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Jul</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Aug</a>
									</div></td>
							</tr>
							<tr>
								<td class=""><div>
										<a class="cell">Sep</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Oct</a>
									</div></td>
								<td class=""><div>
										<a class="cell">Nov</a>
									</div></td>
								<td class="today"><div>
										<a class="cell">Dec</a>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="el-picker-panel__footer" style="display: none;">
			<button type="button"
				class="el-button el-picker-panel__link-btn el-button--text el-button--mini">
				<!---->
				<!---->
				<span> Now </span>
			</button>
			<button type="button"
				class="el-button el-picker-panel__link-btn el-button--default el-button--mini is-plain">
				<!---->
				<!---->
				<span> OK </span>
			</button>
		</div>
		<div x-arrow="" class="popper__arrow" style="left: 35px;"></div>
	</div>
	<!-- 달력? 끝 -->
	--%>



</body>
</html>
