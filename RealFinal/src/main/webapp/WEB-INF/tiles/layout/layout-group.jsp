<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- === #25. tiles 를 사용하는 레이아웃2 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>




<!DOCTYPE html>
<!-- saved from url=(0059)https://groups.office.hiworks.com/group/1012858/debates/all -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">


<!-- 
<link rel="icon" href="https://groups.office.hiworks.com/favicon.ico">
<link href="./그룹_files/main.css" rel="stylesheet" type="text/css">
<link href="./그룹_files/style.css" rel="stylesheet">
 -->





<!-- official css -->
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/common/header_search.css"> --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/common/inHTML.css">

<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/groupMain/chunk-vendors.a0f2ea9c.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/groupMain/index.ffe70fa0.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/groupMain/layout-layouts-main-vue.8d46613d.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/groupMain/layout-Modals-EditGroupOwner-vue.94f97eee.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/groupMain/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/groupMain/style.css">

<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/group/layout-components-LabelSelector-vue.e0f56582.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/group/layout-components-UnitCard-vue.f59faaf4.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/group/layout-components-UnitWrite-vue~layout-views-Debates-SubView-SubjectView-vue.3b110ec3.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/group/layout-layouts-default-vue.859c96f1.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/group/layout-views-Debates-SubView-SubjectView-vue.943849e0.css">







<title>하이웍스 오피스 - 그룹</title>



<!-- 
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-AddFavorite-vue.d52cb1fa.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-AddSubject-vue.d4bff3c3.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-ChangeOwner-vue.ccdbb92e.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-Confirm-vue.6961ba07.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-CreateSchedule-vue.b8d595a8.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-EditGroupImage-vue.5b55523c.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-EditGroupInfo-vue.b9e1aa10.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-EditGroupOrder-vue.7131a06a.css"
	rel="prefetch">
<link href="./그룹_files/layout-Modals-EditGroupOwner-vue.94f97eee.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-EditLabel-vue.66088cdc.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-ErrorNotice-vue.ac5ddcf5.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-GroupDetail-vue.b56e5d53.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-ManageConnection-vue.7af15550.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-ManagePermission-vue.86a7618f.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-ManageSubject-vue.0904124a.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-PasteImage-vue.f44c53fe.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-PlanDetail-vue.a5f02205.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-SelectLabel-vue.eb9dd1b3.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-SelectSubject-vue.0dd58a3f.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-TerminateHistory-vue.b81a9316.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-Modals-UploadGroupImage-vue.acf26e50.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-components-Comment-vue.a8aa3b3e.css"
	rel="prefetch">
<link
	href="./그룹_files/layout-components-LabelSelector-vue.e0f56582.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-components-ManagementCard-vue.ed66be87.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-components-Schedule-vue.7096aea4.css"
	rel="prefetch">
<link href="./그룹_files/layout-components-UnitCard-vue.f59faaf4.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-components-UnitWrite-vue.f44c53fe.css"
	rel="prefetch">
<link
	href="./그룹_files/layout-components-UnitWrite-vue~layout-views-Debates-SubView-SubjectView-vue.3b110ec3.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-layouts-Sidebar-vue.2dd076b6.css"
	rel="prefetch">
<link href="./그룹_files/layout-layouts-default-vue.859c96f1.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-layouts-error-vue.ac5ddcf5.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-layouts-forbidden-vue.91683a76.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-layouts-main-vue.8d46613d.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-layouts-management-vue.9dcff4d7.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-layouts-notfound-vue.f340d684.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-packages-HwDatePicker-TS_extend-vue.0021fd89.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-packages-HwProgressCircle-HwProgressCircle-vue.6371e359.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-packages-HwTextEditor-HwTextEditor_back-vue.d0ccde0f.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-DetailView-vue.511c0c6b.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-EditView-vue.13f82174.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-FilterView-FilterView-vue.b02dbb23.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-FilterView-SearchView-vue.f1517c58.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-FilterView-UserPostView-vue.5327face.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-SubView-DocumentView-vue.60639e1c.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-SubView-EventView-vue.0e433876.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-SubView-ImageView-vue.6adbd9da.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Debates-SubView-LinkView-vue.0e433876.css"
	rel="prefetch">
<link
	href="./그룹_files/layout-views-Debates-SubView-SubjectView-vue.943849e0.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Schedules-Schedules-vue.8e5febab.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Setting-SubView-GroupManage-vue.d997abbf.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Setting-SubView-SyncService-vue.4acc2d4d.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Setting-SubView-UserSetting-vue.9d92070d.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/css/layout-views-Setting-SubView-WebHookManage-vue.2e298e6d.css"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-AddFavorite-vue.91c8d20c.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-AddSubject-vue.38ec5d75.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-ChangeOwner-vue.fccc2a1a.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-Confirm-vue.81164b79.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-CreateSchedule-vue.5d8f4981.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-EditGroupImage-vue.03965e10.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-EditGroupInfo-vue.6d1730bd.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-EditGroupOrder-vue.582fbe42.js"
	rel="prefetch">
<link
	href="./그룹_files/layout-Modals-EditGroupOrder-vue~layout-Modals-EditGroupOwner-vue~layout-Modals-ManageSubject-vue~la~07588ab7.fd48ec30.js"
	rel="prefetch">
<link href="./그룹_files/layout-Modals-EditGroupOwner-vue.cce9535d.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-EditLabel-vue.646c70c4.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-ErrorNotice-vue.262b97c7.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-GroupDetail-vue.a7a636ac.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-ManageConnection-vue.f476647f.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-ManagePermission-vue.eb765e2f.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-ManageSubject-vue.b9714e14.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-PasteImage-vue.9f8e42e0.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-PlanDetail-vue.c6556874.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-SelectLabel-vue.24d6f379.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-SelectSubject-vue.5b664415.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-TerminateHistory-vue.eab8cfc3.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-Modals-UploadGroupImage-vue.8a46bde9.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-components-Comment-vue.5aed9d00.js"
	rel="prefetch">
<link
	href="./그룹_files/layout-components-LabelSelector-vue.3ae82bec.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-components-ManagementCard-vue.8a9a2a52.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-components-Schedule-vue.42c2838c.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-components-TreeItem-vue.30ab119d.js"
	rel="prefetch">
<link href="./그룹_files/layout-components-UnitCard-vue.bda0d907.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-components-UnitWrite-vue.3e9e2a17.js"
	rel="prefetch">
<link
	href="./그룹_files/layout-components-UnitWrite-vue~layout-views-Debates-SubView-SubjectView-vue.48dd304e.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-Sidebar-vue.7ce6b630.js"
	rel="prefetch">
<link href="./그룹_files/layout-layouts-default-vue.5c8e45c5.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-error-vue.5b5e4779.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-forbidden-vue.7da9a9f3.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-githubAuth-vue.d8e0dd27.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-main-vue.503066d0.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-management-vue.40ef0af2.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-layouts-notfound-vue.807c632c.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-packages-HwDatePicker-TS_extend-vue.569ffda8.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-packages-HwFileViewer-ViewModes-DocumentView-vue.c76bd35e.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-packages-HwFileViewer-ViewModes-ErrorView-vue.29d0e222.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-packages-HwFileViewer-ViewModes-ImageView-vue.0a13ee5f.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-packages-HwProgressCircle-HwProgressCircle-vue.4161651e.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-packages-HwTextEditor-HwTextEditor_back-vue.9d1927e4.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-DetailView-vue.22c2dd62.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-EditView-vue.adfeea50.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-FilterView-FilterView-vue.ccca0758.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-FilterView-SearchView-vue.29bb8ca4.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-FilterView-UserPostView-vue.32839628.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-SubView-DocumentView-vue.476f1665.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-SubView-EventView-vue.0db97ddd.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-SubView-ImageView-vue.4dd6d61c.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Debates-SubView-LinkView-vue.38d8eb73.js"
	rel="prefetch">
<link
	href="./그룹_files/layout-views-Debates-SubView-SubjectView-vue.c5272587.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Favorites-Favorites-vue.1a471271.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Home-vue.ffd272f7.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Schedules-Schedules-vue.7d1dd6ec.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Setting-SubView-GroupManage-vue.1066b40a.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Setting-SubView-SyncService-vue.0b1d2159.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Setting-SubView-UserSetting-vue.44cae216.js"
	rel="prefetch">
<link
	href="https://groups.office.hiworks.com/js/layout-views-Setting-SubView-WebHookManage-vue.8716a75b.js"
	rel="prefetch">
<link href="./그룹_files/chunk-vendors.a0f2ea9c.css" rel="preload"
	as="style">
<link href="./그룹_files/index.ffe70fa0.css" rel="preload" as="style">
<link href="./그룹_files/chunk-vendors.5f4835f6.js" rel="preload"
	as="script">
<link href="./그룹_files/index.cffda4af.js" rel="preload" as="script">
<link href="./그룹_files/chunk-vendors.a0f2ea9c.css" rel="stylesheet">
<link href="./그룹_files/index.ffe70fa0.css" rel="stylesheet">
 -->





<!-- 
<script charset="utf-8"
	src="./그룹_files/layout-Modals-EditGroupOrder-vue~layout-Modals-EditGroupOwner-vue~layout-Modals-ManageSubject-vue~la~07588ab7.fd48ec30.js"></script>
<link rel="stylesheet" type="text/css"
	href="./그룹_files/layout-Modals-EditGroupOwner-vue.94f97eee.css">
<script charset="utf-8"
	src="./그룹_files/layout-Modals-EditGroupOwner-vue.cce9535d.js"></script>
<link rel="stylesheet" type="text/css"
	href="./그룹_files/layout-layouts-default-vue.859c96f1.css">
<script charset="utf-8"
	src="./그룹_files/layout-layouts-default-vue.5c8e45c5.js"></script>
 -->





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
					<!-- 멤버추가 모달 시작 -->
					<div data-v-f84369aa="" data-v-d50946c4="" id="AddMember"
						class="modal-wrapper" update="function () { [native code] }">
						<div data-v-f84369aa="" class="modal-header">멤버추가</div>
						<div data-v-f84369aa="" class="modal-body">
							<div data-v-f84369aa="" class="modal-contents">
								<div data-v-f84369aa="" class="contents-title">사용자 이름</div>
								<div data-v-f84369aa="" class="contents">
									<div data-v-2b3d9bb6="" data-v-f84369aa="" tabindex="-1"
										class="hw-dropdown search multiple fluid left down">
										<span data-v-2b3d9bb6="" class="dropdown-icon"><i
											data-v-2b3d9bb6="" class="gi gi-short-arrow-down-alt"></i></span>
										<div data-v-2b3d9bb6="" class="dropdown-search">
											<!---->
											<input data-v-2b3d9bb6="" type="text" class="searching">
											<!---->
										</div>
										<div data-v-2b3d9bb6="" class="default text">추가할 사용자를
											검색해주세요</div>
										<!-- 	
										<div data-v-2b3d9bb6="" tabindex="0" class="dropdown-menu member-item search-menu" style="max-height: 292.5px;"><div data-v-2b3d9bb6="" class="dropdown-item hover ghost image"><div class="dropdown-img thumb"><img src="https://office.hiworks.com/gabia.biz/common/office_main_ajax/showProfile/L/7870920" alt=""></div><div data-v-2b3d9bb6="" class="ellipsis">강과장</div></div><div data-v-2b3d9bb6="" class="dropdown-item ghost image"><div class="dropdown-img thumb"><img src="https://office.hiworks.com/gabia.biz/common/office_main_ajax/showProfile/L/7870911" alt=""></div><div data-v-2b3d9bb6="" class="ellipsis">김이사</div></div><div data-v-2b3d9bb6="" class="dropdown-item ghost image"><div class="dropdown-img thumb"><img src="https://office.hiworks.com/gabia.biz/common/office_main_ajax/showProfile/L/7870908" alt=""></div><div data-v-2b3d9bb6="" class="ellipsis">박상무</div></div><div data-v-2b3d9bb6="" class="dropdown-item ghost image"><div class="dropdown-img thumb"><img src="https://office.hiworks.com/gabia.biz/common/office_main_ajax/showProfile/L/7870923" alt=""></div><div data-v-2b3d9bb6="" class="ellipsis">양대리</div></div><div data-v-2b3d9bb6="" class="dropdown-item ghost image"><div class="dropdown-img thumb"><img src="https://office.hiworks.com/gabia.biz/common/office_main_ajax/showProfile/L/7870929" alt=""></div><div data-v-2b3d9bb6="" class="ellipsis">이사원</div></div><div data-v-2b3d9bb6="" class="dropdown-item ghost image"><div class="dropdown-img thumb"><img src="https://office.hiworks.com/gabia.biz/common/office_main_ajax/showProfile/L/7870905" alt=""></div><div data-v-2b3d9bb6="" class="ellipsis">최사장</div></div></div>
										
										<div data-v-2b3d9bb6="" class="multi-selected-list"><div data-v-2b3d9bb6="" class="btn-apply"><div data-v-2b3d9bb6="" class="hw-button icon circle small"><i data-v-2b3d9bb6="" class="gis gi-cancel"></i></div></div></div>
										 -->	
										<!---->
										<!---->
										<div data-v-2b3d9bb6="" class="multi-selected-list">
											<!---->
										</div>
									</div>
								</div>
							</div>
						</div>
						<div data-v-f84369aa="" class="modal-footer">
							<button data-v-f84369aa="" class="hw-button secondary">취소</button>
							<button data-v-f84369aa="" disabled="disabled"
								class="hw-button primary">저장</button>
						</div>
					</div>
					<!-- 멤버추가 모달 끝 -->
					--%>


					<%-- 
					<!-- 그룹정보변경 모달 시작 -->
					<div data-v-d3682366="" data-v-d50946c4="" id="EditGroupInfo"
						class="modal-wrapper" groupuser="[object Object]">
						<div data-v-d3682366="" class="modal-header">그룹 정보 변경</div>
						<div data-v-d3682366="" class="modal-body hw-group">
							<div data-v-d3682366="" class="modal-contents">
								<div data-v-d3682366="" class="contents-title">그룹 이름</div>
								<div data-v-d3682366="" class="hw-input-wrap">
									<div data-v-d3682366="" class="hw-input-wrap counter fluid">
										<!---->
										<input type="text" placeholder="그룹 이름을 입력하세요"
											class="hw-input underline">
										<div class="count">
											<span>15</span>
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
											<span>145</span>
										</div>
										<!---->
									</div>
								</div>
							</div>
						</div>
						<div data-v-d3682366="" class="modal-footer">
							<button data-v-d3682366="" class="hw-button secondary">취소</button>
							<button data-v-d3682366="" class="hw-button primary">저장</button>
						</div>
					</div>
					<!-- 그룹정보변경 모달 끝 -->
					--%>


					<%-- 
					<!-- 그룹대표사진변경 모달 시작 -->
					<div data-v-d0e81dd2="" data-v-d50946c4="" id="EditGroupImage"
						class="modal-wrapper" groupid="1012858"
						groupuser="[object Object]">
						<div data-v-d0e81dd2="" class="modal-header">그룹 대표 사진 변경</div>
						<div data-v-d0e81dd2="" class="modal-body hw-group">
							<div data-v-d0e81dd2="" class="modal-contents">
								<div data-v-d0e81dd2="" class="group-image-preview">
									<img data-v-d0e81dd2=""
										src="https://group.hiworks.com/static/images/group/group-default-001.jpg"
										alt="group-image" class="edit-image">
								</div>
								<div data-v-d0e81dd2="" class="group-image-list">
									<div data-v-d0e81dd2="" class="group-image add-image">
										<div data-v-d0e81dd2="" class="add-image-item add-image-icon">
											<i data-v-d0e81dd2="" class="gis gi-upload"></i>
										</div>
										<div data-v-d0e81dd2="" class="add-image-item add-image-text">
											사진 선택 <input data-v-d0e81dd2="" type="file" accept="image/*"
												style="display: none;">
										</div>
									</div>
									<div data-v-d0e81dd2=""
										class="group-image default-image image-selected">
										<div data-v-d0e81dd2="" class="check-icon">
											<i data-v-d0e81dd2="" class="gis gi-check"></i>
										</div>
										<img data-v-d0e81dd2=""
											src="https://group.hiworks.com/static/images/group/group-default-001.jpg"
											alt="group-image" class="edit-image">
									</div>
									<div data-v-d0e81dd2="" class="group-image default-image">
										<div data-v-d0e81dd2="" class="check-icon">
											<i data-v-d0e81dd2="" class="gis gi-check"></i>
										</div>
										<img data-v-d0e81dd2=""
											src="https://group.hiworks.com/static/images/group/group-default-002.jpg"
											alt="group-image" class="edit-image">
									</div>
									<div data-v-d0e81dd2="" class="group-image default-image">
										<div data-v-d0e81dd2="" class="check-icon">
											<i data-v-d0e81dd2="" class="gis gi-check"></i>
										</div>
										<img data-v-d0e81dd2=""
											src="https://group.hiworks.com/static/images/group/group-default-003.jpg"
											alt="group-image" class="edit-image">
									</div>
									<div data-v-d0e81dd2="" class="group-image default-image">
										<div data-v-d0e81dd2="" class="check-icon">
											<i data-v-d0e81dd2="" class="gis gi-check"></i>
										</div>
										<img data-v-d0e81dd2=""
											src="https://group.hiworks.com/static/images/group/group-default-004.jpg"
											alt="group-image" class="edit-image">
									</div>
									<div data-v-d0e81dd2="" class="group-image default-image">
										<div data-v-d0e81dd2="" class="check-icon">
											<i data-v-d0e81dd2="" class="gis gi-check"></i>
										</div>
										<img data-v-d0e81dd2=""
											src="https://group.hiworks.com/static/images/group/group-default-005.jpg"
											alt="group-image" class="edit-image">
									</div>
								</div>
							</div>
						</div>
						<div data-v-d0e81dd2="" class="modal-footer">
							<button data-v-d0e81dd2="" class="hw-button secondary">취소</button>
							<button data-v-d0e81dd2="" class="hw-button primary">저장</button>
						</div>
					</div>
					<!-- 그룹대표사진변경 모달 끝 -->
					--%>


					<%-- 
					<!-- 토론주제관리 모달 시작 -->
					<div data-v-07d1d3ef="" data-v-d50946c4="" id="ManageSubject"
						class="modal-wrapper" groupdata="[object Object]"
						update="function () { [native code] }">
						<div data-v-07d1d3ef="" class="modal-header">토론 주제 관리</div>
						<div data-v-07d1d3ef="" class="modal-body hw-group">
							<div data-v-07d1d3ef="" class="modal-contents">
								<div data-v-07d1d3ef="" class="create-section">
									<div data-v-07d1d3ef=""
										class="hw hw-button text add-btn primary-color">추가하기</div>
									<!-- 
									<div data-v-07d1d3ef="" class="create-item"><div data-v-07d1d3ef="" class="hw-item new-item"><div data-v-07d1d3ef="" class="item-text"><div data-v-07d1d3ef="" class="hw-input-wrap counter"><input type="text" placeholder="주제 제목을 입력하세요" class="hw-input underline"><div class="count"><span>20</span></div></div></div><div data-v-07d1d3ef="" class="item-btns"><div data-v-07d1d3ef="" class="btn cancel-btn rotate-45"><div data-v-07d1d3ef="" class="hw-button icon circle"><i data-v-07d1d3ef="" class="gi gi-plus"></i></div></div></div></div></div>
									 -->
								</div>
								<div data-v-07d1d3ef="" class="edit-list-section">
									<div data-v-07d1d3ef="" class="hw-list">
										<span data-v-07d1d3ef=""><div data-v-07d1d3ef=""
												class="hw-item">
												<span data-v-07d1d3ef="" class="item-handle"><i
													data-v-07d1d3ef="" class="gis gi-grab"></i></span>
												<div data-v-07d1d3ef="" class="item-text ellipsis">
													<div data-v-07d1d3ef="" class="hw-input-wrap editMode">
														<!---->
														<input type="text" placeholder="Insert Data"
															class="hw-input">
														<!---->
														<!---->
													</div>
												</div>
												<div data-v-07d1d3ef="" class="item-btns">
													<div data-v-07d1d3ef="" class="btn edit-btn">
														<div data-v-07d1d3ef="" class="hw-button icon circle">
															<i data-v-07d1d3ef="" class="gi gi-pencil"></i>
														</div>
													</div>
													<div data-v-07d1d3ef="" class="btn remove-btn">
														<div data-v-07d1d3ef="" class="hw-button icon circle">
															<i data-v-07d1d3ef="" class="gi gi-trash"></i>
														</div>
													</div>
												</div>
												<div data-v-07d1d3ef="" class="hw-toggle">
													<label data-v-07d1d3ef="" class="hw-switch"><input
														type="checkbox"><span class="slide round"></span></label>
												</div>
											</div>
											<div data-v-07d1d3ef="" class="hw-item">
												<span data-v-07d1d3ef="" class="item-handle"><i
													data-v-07d1d3ef="" class="gis gi-grab"></i></span>
												<div data-v-07d1d3ef="" class="item-text ellipsis">
													<div data-v-07d1d3ef="" class="hw-input-wrap editMode">
														<!---->
														<input type="text" placeholder="Insert Data"
															class="hw-input">
														<!---->
														<!---->
													</div>
												</div>
												<div data-v-07d1d3ef="" class="item-btns">
													<div data-v-07d1d3ef="" class="btn edit-btn">
														<div data-v-07d1d3ef="" class="hw-button icon circle">
															<i data-v-07d1d3ef="" class="gi gi-pencil"></i>
														</div>
													</div>
													<div data-v-07d1d3ef="" class="btn remove-btn">
														<div data-v-07d1d3ef="" class="hw-button icon circle">
															<i data-v-07d1d3ef="" class="gi gi-trash"></i>
														</div>
													</div>
												</div>
												<div data-v-07d1d3ef="" class="hw-toggle">
													<label data-v-07d1d3ef="" class="hw-switch"><input
														type="checkbox"><span class="slide round"></span></label>
												</div>
											</div>
											<div data-v-07d1d3ef="" class="hw-item">
												<span data-v-07d1d3ef="" class="item-handle"><i
													data-v-07d1d3ef="" class="gis gi-grab"></i></span>
												<div data-v-07d1d3ef="" class="item-text ellipsis">
													<div data-v-07d1d3ef="" class="hw-input-wrap editMode">
														<!---->
														<input type="text" placeholder="Insert Data"
															class="hw-input">
														<!---->
														<!---->
													</div>
												</div>
												<div data-v-07d1d3ef="" class="item-btns">
													<div data-v-07d1d3ef="" class="btn edit-btn">
														<div data-v-07d1d3ef="" class="hw-button icon circle">
															<i data-v-07d1d3ef="" class="gi gi-pencil"></i>
														</div>
													</div>
													<div data-v-07d1d3ef="" class="btn remove-btn">
														<div data-v-07d1d3ef="" class="hw-button icon circle">
															<i data-v-07d1d3ef="" class="gi gi-trash"></i>
														</div>
													</div>
												</div>
												<div data-v-07d1d3ef="" class="hw-toggle">
													<label data-v-07d1d3ef="" class="hw-switch"><input
														type="checkbox"><span class="slide round"></span></label>
												</div>
											</div></span>
									</div>
									<!---->
								</div>
							</div>
						</div>
						<div data-v-07d1d3ef="" class="modal-footer">
							<button data-v-07d1d3ef="" class="hw-button secondary">닫기</button>
						</div>
					</div>
					<!-- 토론주제관리 모달 끝 -->
					--%>


					<%-- 
					<!-- 그룹소유권변경 모달 시작 -->
					<div data-v-dc8beec6="" data-v-d50946c4="" id="AddMember"
						class="modal-wrapper" groupuser="[object Object]">
						<div data-v-dc8beec6="" class="modal-header">그룹 소유권 변경</div>
						<div data-v-dc8beec6="" class="modal-body">
							<div data-v-dc8beec6="" class="modal-contents">
								<div data-v-dc8beec6="" class="contents-title"></div>
								<div data-v-dc8beec6="" class="contents">
									<div data-v-2b3d9bb6="" data-v-dc8beec6="" tabindex="-1"
										class="hw-dropdown search open fluid left down">
										<span data-v-2b3d9bb6="" class="dropdown-icon"><i
											data-v-2b3d9bb6="" class="gi gi-short-arrow-up-alt"></i></span>
										
										<div data-v-2b3d9bb6="" class="dropdown-search">
											<!-- 
											<div data-v-2b3d9bb6="" class="selected-item avatar">
												<div data-v-2b3d9bb6="" class="profile">
													<img data-v-2b3d9bb6=""
														src="https://account-api.office.hiworks.com/profile-image/users/7870917">
												</div>
												조차장 <i data-v-2b3d9bb6="" class="gi gi-cancel"></i>
											</div>
											-->
											<input data-v-2b3d9bb6="" type="text" class="searching">
											
										</div>
										
										<div data-v-2b3d9bb6="" class="default text">소유권을 위임할 멤버를 검색해주세요.</div>
										
										<!--
										<div data-v-2b3d9bb6="" tabindex="0"
											class="dropdown-menu member-item search-menu"
											style="max-height: 247.5px;">
											<div data-v-2b3d9bb6="" class="dropdown-item ghost image">
												<div class="dropdown-img thumb">
													<img
														src="https://account-api.office.hiworks.com/profile-image/users/7870926"
														alt="">
												</div>
												<div data-v-2b3d9bb6="" class="ellipsis">안주임</div>
											</div>
											<div data-v-2b3d9bb6="" class="dropdown-item ghost image">
												<div class="dropdown-img thumb">
													<img
														src="https://account-api.office.hiworks.com/profile-image/users/7870914"
														alt="">
												</div>
												<div data-v-2b3d9bb6="" class="ellipsis">오부장</div>
											</div>
											<div data-v-2b3d9bb6=""
												class="dropdown-item hover check ghost image">
												<div class="dropdown-img thumb">
													<img
														src="https://account-api.office.hiworks.com/profile-image/users/7870917"
														alt="">
												</div>
												<div data-v-2b3d9bb6="" class="ellipsis">조차장</div>
											</div>
											<div data-v-2b3d9bb6="" class="dropdown-item ghost image">
												<div class="dropdown-img thumb">
													<img
														src="https://account-api.office.hiworks.com/profile-image/users/7870932"
														alt="">
												</div>
												<div data-v-2b3d9bb6="" class="ellipsis">주알바</div>
											</div>
										</div>
										-->
										<!---->
										<!---->
									</div>
								</div>
							</div>
						</div>
						<div data-v-dc8beec6="" class="modal-footer">
							<button data-v-dc8beec6="" class="hw-button secondary">취소</button>
							<button data-v-dc8beec6="" class="hw-button primary">저장</button>
						</div>
					</div>
					<!-- 그룹소유권변경 모달 시작 -->
					--%>

					<%-- 
					<!-- 그룹폐쇄 모달 시작 -->
					<div data-v-db38d57a="" data-v-d50946c4="" id="ConfirmModal"
						class="modal-wrapper" update="function () { [native code] }">
						<div data-v-db38d57a="" class="modal-body">
							<div data-v-db38d57a="" class="modal-title">
								<strong>test2</strong> 을(를) 폐쇄하시겠습니까?
							</div>
							<div data-v-db38d57a="" class="modal-description">그룹 및 포함하는
								데이터를 사용할 수 없도록 삭제합니다. 폐쇄된 그룹은 30일 경과 후 영구히 삭제되며, 오피스 관리자가 30일
								이내에 복원 또는 영구 삭제 할 수 있습니다.</div>
						</div>
						<!---->
						<div data-v-db38d57a="" class="modal-footer">
							<button data-v-db38d57a="" class="hw-button secondary">취소</button>
							<button data-v-db38d57a="" class="hw-button danger">그룹
								폐쇄</button>
						</div>
					</div>
					<!-- 그룹폐쇄 모달 끝 -->
					--%>


					<%-- 
					<!-- 알림설정 모달 시작 -->
					<div data-v-db38d57a="" data-v-d50946c4="" id="ConfirmModal"
						class="modal-wrapper" update="function () { [native code] }">
						<div data-v-db38d57a="" class="modal-body">
							<div data-v-db38d57a="" class="modal-title">
								<strong>test1</strong> 그룹의 알림을 '사용 안 함'으로 설정하시겠습니까?
							</div>
							<div data-v-db38d57a="" class="modal-description">해당 그룹에서 새
								토론 글, 나와 관련된 글과 댓글이 작성되어도 알림을 받지 않습니다.</div>
						</div>
						<!---->
						<div data-v-db38d57a="" class="modal-footer">
							<button data-v-db38d57a="" class="hw-button secondary">취소</button>
							<button data-v-db38d57a="" class="hw-button primary">확인</button>
						</div>
					</div>
					<!-- 알림설정 모달 끝 -->
					--%>
					
					
					<%-- 
					<!-- 그룹탈퇴 모달 시작 -->
					<div data-v-db38d57a="" data-v-d50946c4="" id="ConfirmModal"
						class="modal-wrapper" update="function () { [native code] }">
						<div data-v-db38d57a="" class="modal-body">
							<div data-v-db38d57a="" class="modal-title">그룹 소유자는 소유권 양도
								후 탈퇴할 수 있습니다. 소유권 변경 페이지로 이동하시겠습니까?</div>
							<div data-v-db38d57a="" class="modal-description"></div>
						</div>
						<!---->
						<div data-v-db38d57a="" class="modal-footer">
							<button data-v-db38d57a="" class="hw-button secondary">취소</button>
							<button data-v-db38d57a="" class="hw-button info">소유권 변경</button>
						</div>
					</div>
					<!-- 그룹탈퇴 모달 끝 -->
					--%>


				</div>
			</div>
		</div>




		<div class="split-wrap">



			<!-- 사이드바 시작  -->
			<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝  -->


			<!-- 컨텐츠 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->


		</div>
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