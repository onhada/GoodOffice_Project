<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>



<!DOCTYPE html>
<!-- saved from url=(0044)https://groups.office.hiworks.com/group/main -->
<html lang="ko">
<head>




<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">



<!-- official css -->
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/header_search.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/groupMain/chunk-vendors.a0f2ea9c.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/groupMain/index.ffe70fa0.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/groupMain/layout-layouts-main-vue.8d46613d.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/groupMain/layout-Modals-EditGroupOwner-vue.94f97eee.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/groupMain/main.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/groupMain/style.css">





<title>하이웍스 오피스 - 그룹</title>




</head>
<body class="vsc-initialized">
	<noscript>
		<strong>We're sorry but 하이웍스 오피스 - 그룹 doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>




	<!-- 헤더 시작  -->
	<tiles:insertAttribute name="header" />
	<!-- 헤더 끝  -->


	<div id="app" class="group-app">
		<div data-v-87ce9ae0="" class="hw-modal-container">
			<div data-v-87ce9ae0="" class="hw-modal-background"
				style="display: none;"></div>



			<div data-v-d50946c4="" data-v-87ce9ae0="" class="hw-modal-wrapper"
				style="">
				<div data-v-d50946c4="" class="hw-modal-content-wrapper">

					<%-- 
					<!-- 그룹만들기 모달 시작 -->
					<div data-v-d3682366="" data-v-d50946c4="" id="EditGroupInfo"
						class="modal-wrapper">
						<div data-v-d3682366="" class="modal-header">그룹 만들기</div>
						<div data-v-d3682366="" class="modal-body hw-group">
							<div data-v-d3682366="" class="modal-contents">
								<div data-v-d3682366="" class="contents-title">그룹 이름</div>
								<div data-v-d3682366="" class="hw-input-wrap">
									<div data-v-d3682366="" class="hw-input-wrap counter fluid">
										<!---->
										<input type="text" placeholder="그룹 이름을 입력하세요"
											class="hw-input underline">
										<div class="count">
											<span>20</span>
										</div>
										<!---->
									</div>
								</div>
							</div>
							<div data-v-d3682366="" class="modal-contents">
								<div data-v-d3682366="" class="contents-title">그룹 소개</div>
								<div data-v-d3682366="" class="hw-input-wrap">
									<div data-v-d3682366="" class="hw-input-wrap counter fluid">
										<textarea placeholder="그룹 소개를 입력하세요" class="hw-textarea"></textarea>
										<div class="count">
											<span>150</span>
										</div>
										<!---->
									</div>
								</div>
							</div>
						</div>
						<div data-v-d3682366="" class="modal-footer">
							<button data-v-d3682366="" class="hw-button secondary">취소</button>
							<button data-v-d3682366="" disabled="disabled"
								class="hw-button primary">만들기</button>
						</div>
					</div>
					<!-- 그룹만들기 모달 끝 -->
					--%>

					<%--
					<!-- 그룹순서편집 모달 시작 -->
					<div data-v-4f79217f="" data-v-d50946c4="" id="EditGroupOrder"
						class="modal-wrapper">
						<div data-v-4f79217f="" class="modal-header">순서 편집</div>
						<div data-v-4f79217f="" class="modal-body hw-group">
							<div data-v-4f79217f="" class="modal-contents">
								<div data-v-4f79217f="" class="edit-list-section">
									<div data-v-4f79217f="" class="hw-list">
										<span data-v-4f79217f=""><div data-v-4f79217f=""
												class="hw-item">
												<span data-v-4f79217f="" class="item-handle"><i
													data-v-4f79217f="" class="gis gi-grab"></i></span>
												<div data-v-4f79217f="" class="item-text ellipsis">
													test1</div>
											</div>
											<div data-v-4f79217f="" class="hw-item">
												<span data-v-4f79217f="" class="item-handle"><i
													data-v-4f79217f="" class="gis gi-grab"></i></span>
												<div data-v-4f79217f="" class="item-text ellipsis">
													test2</div>
											</div>
											<div data-v-4f79217f="" class="hw-item">
												<span data-v-4f79217f="" class="item-handle"><i
													data-v-4f79217f="" class="gis gi-grab"></i></span>
												<div data-v-4f79217f="" class="item-text ellipsis">
													그룹만들기</div>
											</div></span>
									</div>
								</div>
							</div>
						</div>
						<div data-v-4f79217f="" class="modal-footer">
							<button data-v-4f79217f="" class="hw-button secondary">취소</button>
							<button data-v-4f79217f="" class="hw-button primary">저장</button>
						</div>
					</div>
					<!-- 그룹순서편집 모달 끝 -->
					--%>


				</div>
			</div>



		</div>


		<!-- 컨텐츠 시작 -->
		<tiles:insertAttribute name="content" />
		<!-- 컨텐츠 끝 -->







	</div>
	<script src="./그룹_files/chunk-vendors.5f4835f6.js"></script>
	<script src="./그룹_files/index.cffda4af.js"></script>
	<script src="./그룹_files/main.js"></script>
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
</body>
</html>