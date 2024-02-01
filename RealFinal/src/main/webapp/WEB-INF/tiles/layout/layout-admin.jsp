<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<!-- saved from url=(0054)https://office.hiworks.com/gabia.biz/h_admin/adminmain -->
<html lang="ko">
<head>
<title>GoodOffice</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<!-- 예진 추가 -->
<link rel="stylesheet" href="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">


<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/admin_menu.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/adminconfig.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/adminhome.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/button.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/common.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/h_admin.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/treelibrary.css">
<!-- 아래 css 넣으니까 헤더 예쁘게 나옴. -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/index/index_official.css">
<!-- 아래는 admin_userManager.jsp 를 위한 css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/6628.bb5f75df.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/app.2469e51b.css">
<!-- 아래는 deactiveUser_pause.jsp 를 위한 css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/2120.0a59daed.css">

<!-- 예진 추가 -->
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/admin/chunk-vendors.2b35c01c.css">  --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/test/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/test/1410.e778014e.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/test/app.f8b39ec1.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/test/chunk-vendors.2b35c01c.css">



<!-- <!DOCTYPE html>
saved from url=(0067)https://office.hiworks.com/gabia.biz/h_admin/Adminconfig/setmanager
<html lang="ko"> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->



<!-- <meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<title>굿오피스</title>
<meta name="viewport" content="width=1024">


<!-- 예진 추가 -->
<!-- JavaScript -->
<script src="<%=ctxPath%>/resources/jquery/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<script>
function closeModal(id) {
	$(id).hide();
}

</script>
</head>



<body class="vsc-initialized">
	<div id="wrap">
		<!-- Top -->


		<!-- 헤더 시작  -->
		<tiles:insertAttribute name="header" />
		<!-- 헤더 끝  -->



		<!-- <script type="text/javascript" src="./aaaaaaa_files/main(1).js"></script> -->
		<!-- Top End-->
		<div id="container">

			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle" style="left: 0px;"></div>
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
			<p class="text" id="HWA_MSG" style="padding-top: 10px; padding-left: 30px; padding-right: 30px;"></p>
			<div class="layer_button">
				<button class="btn_variables" type="button" onclick="hidePopup();" id="HWA_MAIN_OK">확인</button>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer" onclick="hidePopup();" title="레이어 닫기">
				<span class="blind">레이어 닫기</span>
			</a>
		</div>

		<div class="layer_box large hide dns_intro_layer" style="width: 550px;">
			<div class="title_layer text_variables">메일 서비스 이용 안내</div>
			<p class="bold body_bold">메일 서비스를 이용하시려면 하이웍스용 DNS 정보 설정이 필요합니다.</p>
			<p class="mgt_15">
				<span style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
				가비아 등록 도메인은 자동 설정을 지원합니다.
			</p>
			<div class="layer_button mgt_10 ta_l">
				<button type="button" class="btn_variables" onclick="location:href=window.open(&#39;https://domain.gabia.com/api/hiworksdns/domainsetting?domain=gabia.biz&#39;)">가비아 도메인 자동 설정하기</button>
			</div>
			<p class="pdt_20">
				<span style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
				타사 등록 도메인은 DNS 정보를 직접 설정해야 합니다.
			</p>
			<div class="layer_button mgt_10 ta_l">
				<button type="button" class="btn_variables" onclick="location:href=window.open(&#39;https://customer.gabia.com/manuals_pop/manual_set.php?service=webmail_hosting&amp;fact=mailzine&amp;seq_no=2221&#39;)">설정 방법 보기</button>
			</div>
			<p class="bold body_bold mgt_50">
				※ 하이웍스용 DNS 정보 설정을 완료하셨다면 메일 용량을 할당한 후 메일 서비스를<br> 이용할 수 있습니다. ‘오피스 관리’에서 계정별 메일 용량을 설정해주세요.
			</p>
			<div class="layer_button mgt_10 ta_l">
				<button type="button" class="btn_variables" onclick="location:href=window.open(&#39;/gabia.biz/admin/Orgmain&#39;)">오피스관리 페이지 가기</button>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer" onclick="hidePopup();" title="레이어 닫기">
				<span class="blind">레이어 닫기</span>
			</a>
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









	<!-- 근로 형태 드롭다운리스트 시작 -->
	<div class="el-select-dropdown el-popper workingTypeList" style="display: none; min-width: 200px; transform-origin: center top; z-index: 2013; position: absolute; top: 340px; left: 870px;" x-placement="bottom-start">
		<div class="el-scrollbar" style="">
			<div class="el-select-dropdown__wrap el-scrollbar__wrap" style="margin-bottom: -8px; margin-right: -8px;">
				<ul class="el-scrollbar__view el-select-dropdown__list workTypeUl">
					<!---->
					<li data-v-0bda246c="" class="el-select-dropdown__item selected">
						<span id="1">일반직</span>
					</li>
					<li data-v-0bda246c="" class="el-select-dropdown__item">
						<span id="2">임원,촉탁</span>
					</li>
					<li data-v-0bda246c="" class="el-select-dropdown__item">
						<span id="3">연구직</span>
					</li>
					<li data-v-0bda246c="" class="el-select-dropdown__item">
						<span id="4">생산직</span>
					</li>
				</ul>
			</div>
			<div class="el-scrollbar__bar is-horizontal">
				<div class="el-scrollbar__thumb" style="transform: translateX(0%);"></div>
			</div>
			<div class="el-scrollbar__bar is-vertical">
				<div class="el-scrollbar__thumb" style="transform: translateY(0%);"></div>
			</div>
		</div>
		<!---->
		<div x-arrow="" class="popper__arrow" style="left: 35px;"></div>
	</div>
	<!-- 근로 형태 드롭다운리스트 끝 -->


	<!-- 조직 선택 드롭다운리스트 시작 -->
	<div data-v-206790f8="" class="hu-popover-container teamDropDown" style="z-index: 2000; display: none;">
		<div data-v-068c5c92="" data-v-206790f8="" class="hu-popover-layer layer-fade-in" style="top: 345px; left: 1137px; visibility: visible; animation-duration: 0.25s;">
			<div data-v-38d3eddf="" data-v-068c5c92="" class="organization-popover-wrapper" style="width: 280px; height: auto;">
				<!---->
				<div data-v-38d3eddf="">
					<div data-v-b381f924="" data-v-38d3eddf="" class="organization-frame depth depth-0 is-root">
						<ul data-v-b381f924="" class="organizations">
							<li data-v-b381f924="" class="organization">
								<div data-v-08bc81b3="" data-v-b381f924="" class="wrapper is-root-name is-has-children-organization">
									<img data-v-08bc81b3=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAIAAADZF8uwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkRDOUQ1NTBBRjI3MDExRTY5QjZFOTI1QURDNEIxM0VDIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkRDOUQ1NTBCRjI3MDExRTY5QjZFOTI1QURDNEIxM0VDIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6REM5RDU1MDhGMjcwMTFFNjlCNkU5MjVBREM0QjEzRUMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6REM5RDU1MDlGMjcwMTFFNjlCNkU5MjVBREM0QjEzRUMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6cjPm+AAAAPElEQVR42mK8cuUKAyHAAsTa2tp4VFy9epWJgQhAPUUscBZH+kE0uR8z7ckyCa6Plg4n2k3AMMWvCCDAACbODOtBj2UVAAAAAElFTkSuQmCC"
										alt="minus" class="minus"
									>
									<span data-v-08bc81b3="" class="name" style="margin-left: 0px;"> 굿오피스 </span>
								</div>



								<c:if test="${not empty requestScope.teamList}">
									<c:forEach var="depVo" items="${requestScope.teamList}">
										<div data-v-b381f924="" class="organization-frame depth depth-1">
											<ul data-v-b381f924="" class="organizations ">
												<li data-v-b381f924="" class="organization">
													<div data-v-08bc81b3="" data-v-b381f924="" class="wrapper is-has-children-organization">
														<img data-v-08bc81b3=""
															src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAIAAADZF8uwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkRDOUQ1NTBBRjI3MDExRTY5QjZFOTI1QURDNEIxM0VDIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkRDOUQ1NTBCRjI3MDExRTY5QjZFOTI1QURDNEIxM0VDIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6REM5RDU1MDhGMjcwMTFFNjlCNkU5MjVBREM0QjEzRUMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6REM5RDU1MDlGMjcwMTFFNjlCNkU5MjVBREM0QjEzRUMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6cjPm+AAAAPElEQVR42mK8cuUKAyHAAsTa2tp4VFy9epWJgQhAPUUscBZH+kE0uR8z7ckyCa6Plg4n2k3AMMWvCCDAACbODOtBj2UVAAAAAElFTkSuQmCC"
															alt="minus" class="minus"
														>
														<span data-v-08bc81b3="" class="name" style="margin-left: 0px;">${depVo.depName}</span>
													</div>


													<c:forEach var="teamVo" items="${depVo.teamList}">

														<div data-v-b381f924="" class="organization-frame depth depth-2 teamName">
															<ul data-v-b381f924="" class="organizations">
																<li data-v-b381f924="" class="organization">
																	<div data-v-08bc81b3="" data-v-b381f924="" class="wrapper">
																		<!---->
																		<span data-v-08bc81b3="" class="name" style="margin-left: 20px;" id="${teamVo.teamId}">${teamVo.teamName}</span>
																	</div>
																	<!---->
																</li>
															</ul>
														</div>

													</c:forEach>


												</li>
											</ul>
										</div>
									</c:forEach>
								</c:if>


							</li>
						</ul>
					</div>
				</div>
				<!---->
			</div>
		</div>
	</div>
	<!-- 조직 선택 드롭다운리스트 끝 -->



	<!-- 직위 선택 드롭다운리스트 시작 -->
	<div class="el-select-dropdown el-popper positionDropDown" style="display: none; min-width: 200px; position: absolute; top: 340px; left: 1440px; transform-origin: center top; z-index: 2001;" x-placement="bottom-start">
		<div class="el-scrollbar" style="">
			<div class="el-select-dropdown__wrap el-scrollbar__wrap" style="margin-bottom: -8px; margin-right: -8px;">
				<ul class="el-scrollbar__view el-select-dropdown__list positionUl">
					<!---->

					<c:if test="${not empty requestScope.positionList}">
						<c:forEach var="positionVo" items="${requestScope.positionList}">
							<li data-v-0bda246c="" class="el-select-dropdown__item">
								<span id="${positionVo.positionId}">${positionVo.positionName}</span>
							</li>
						</c:forEach>
					</c:if>


				</ul>
			</div>
			<div class="el-scrollbar__bar is-horizontal">
				<div class="el-scrollbar__thumb" style="transform: translateX(0%);"></div>
			</div>
			<div class="el-scrollbar__bar is-vertical">
				<div class="el-scrollbar__thumb" style="transform: translateY(0%); height: 93.662%;"></div>
			</div>
		</div>
		<!---->
		<div x-arrow="" class="popper__arrow" style="left: 35px;"></div>
	</div>
	<!-- 직위 선택 드롭다운리스트 끝 -->



	<!-- 근로형태 수정 모달 시작 -->
	<div data-v-a4c11cac="" class="hu-modal-container showModifyWorkType" id="showModifyWorkType" style="z-index: 2000; display: none;">
		<div data-v-a4c11cac="" class="hu-modal-background" style=""></div>
		<div data-v-13ac45d2="" data-v-a4c11cac="" tabindex="-1" class="hu-modal-wrapper" style="">
			<div data-v-13ac45d2="" class="hu-modal-content-wrapper">
				<div data-v-1125202a="" data-v-13ac45d2="" class="modal-content-wrapper type-default">
					<section data-v-1125202a="" class="modal-content__header">
						<span data-v-1125202a="">근로형태 수정</span>
					</section>
					<section data-v-1125202a="" class="modal-content__body">
						<div data-v-1125202a="" class="el-select ">
							<!---->
							<div class="el-input el-input--suffix modifyInputWorkTypeSetting">
								<!---->
								<input type="text" readonly="readonly" autocomplete="off" placeholder="선택" class="el-input__inner modifyInputWorkType">
								<!---->
								<span class="el-input__suffix">
									<span class="el-input__suffix-inner">
										<i class="el-select__caret el-input__icon el-icon-arrow-up"></i>
										<!---->
										<!---->
										<!---->
										<!---->
										<!---->
									</span>
									<!---->
								</span>
								<!---->
								<!---->
							</div>
							<div class="el-select-dropdown el-popper modifyInputWorkTypeDropDown" style="display: none; min-width: 298px;">
								<div class="el-scrollbar" style="">
									<div class="el-select-dropdown__wrap el-scrollbar__wrap" style="margin-bottom: -8px; margin-right: -8px;">
										<ul class="el-scrollbar__view el-select-dropdown__list modifyInputWorkTypeDropDownUl">
											<!---->
											<li data-v-1125202a="" class="el-select-dropdown__item selected">
												<span id="1">일반직</span>
											</li>
											<li data-v-1125202a="" class="el-select-dropdown__item">
												<span id="2">임원,촉탁</span>
											</li>
											<li data-v-1125202a="" class="el-select-dropdown__item">
												<span id="3">연구직</span>
											</li>
											<li data-v-1125202a="" class="el-select-dropdown__item">
												<span id="4">생산직</span>
											</li>
										</ul>
									</div>
									<div class="el-scrollbar__bar is-horizontal">
										<div class="el-scrollbar__thumb" style="transform: translateX(0%);"></div>
									</div>
									<div class="el-scrollbar__bar is-vertical">
										<div class="el-scrollbar__thumb" style="transform: translateY(0%);"></div>
									</div>
								</div>
								<!---->
							</div>
						</div>
					</section>
					<section data-v-1125202a="" class="modal-content__footer">
						<button data-v-1434033c="" data-v-1125202a="" type="button" class="hu-button secondary" onclick="closeModal(showModifyWorkType);">
							<!---->
							<span data-v-1434033c="" class="label">취소</span>
							<!---->
						</button>
						<button data-v-1434033c="" data-v-1125202a="" type="button" class="hu-button primary" onclick="batchModifyWorkType()">
							<!---->
							<span data-v-1434033c="" class="label">확인</span>
							<!---->
						</button>
					</section>
				</div>
			</div>
		</div>
	</div>

	<!-- 근로 형태 수정 모달 끝 -->




	<!-- 직위 수정 모달 시작 -->
	<div data-v-a4c11cac="" class="hu-modal-container showModifyPosition" id="showModifyPosition" style="display: none; z-index: 2000;">
		<div data-v-a4c11cac="" class="hu-modal-background" style=""></div>
		<div data-v-13ac45d2="" data-v-a4c11cac="" tabindex="-1" class="hu-modal-wrapper" style="">
			<div data-v-13ac45d2="" class="hu-modal-content-wrapper">
				<div data-v-f89f5192="" data-v-13ac45d2="" class="modal-content-wrapper type-default">
					<section data-v-f89f5192="" class="modal-content__header">
						<span data-v-f89f5192="">직위 수정</span>
					</section>
					<section data-v-f89f5192="" class="modal-content__body">
						<div data-v-f89f5192="" class="el-select">
							<!---->
							<div class="el-input el-input--suffix modifyInputPositionSetting">
								<!---->
								<input type="text" readonly="readonly" autocomplete="off" placeholder="선택" class="el-input__inner modifyInputPosition">
								<!---->
								<span class="el-input__suffix">
									<span class="el-input__suffix-inner">
										<i class="el-select__caret el-input__icon el-icon-arrow-up"></i>
										<!---->
										<!---->
										<!---->
										<!---->
										<!---->
									</span>
									<!---->
								</span>
								<!---->
								<!---->
							</div>
							<div class="el-select-dropdown el-popper modifyInputPositionDropDown" style="display: none; min-width: 298px;">
								<div class="el-scrollbar" style="">
									<div class="el-select-dropdown__wrap el-scrollbar__wrap" style="margin-bottom: -8px; margin-right: -8px;">
										<ul class="el-scrollbar__view el-select-dropdown__list modifyInputPositionDropDownUl">
											<!---->


											<c:if test="${not empty requestScope.positionList}">
												<c:forEach var="positionVo" items="${requestScope.positionList}">
													<li data-v-f89f5192="" class="el-select-dropdown__item">
														<span id="${positionVo.positionId}">${positionVo.positionName}</span>
													</li>
												</c:forEach>
											</c:if>

										</ul>
									</div>
									<div class="el-scrollbar__bar is-horizontal">
										<div class="el-scrollbar__thumb" style="transform: translateX(0%);"></div>
									</div>
									<div class="el-scrollbar__bar is-vertical">
										<div class="el-scrollbar__thumb" style="transform: translateY(0%);"></div>
									</div>
								</div>
								<!---->
							</div>
						</div>
					</section>
					<section data-v-f89f5192="" class="modal-content__footer">
						<button data-v-1434033c="" data-v-f89f5192="" type="button" class="hu-button secondary" onclick="closeModal(showModifyPosition);">
							<!---->
							<span data-v-1434033c="" class="label">취소</span>
							<!---->
						</button>
						<button data-v-1434033c="" data-v-f89f5192="" type="button" class="hu-button primary" onclick="batchModifyPosition()">
							<!---->
							<span data-v-1434033c="" class="label">확인</span>
							<!---->
						</button>
					</section>
				</div>
			</div>
		</div>
	</div>
	<!-- 직위 수정 모달 끝 -->







	<!-- 상태 수정 모달 시작 -->
	<div data-v-a4c11cac="" class="hu-modal-container showModifyStatus"  id="showModifyStatus" style="display:none; z-index: 2000;">
		<div data-v-a4c11cac="" class="hu-modal-background" style=""></div>
		<div data-v-13ac45d2="" data-v-a4c11cac="" tabindex="-1" class="hu-modal-wrapper" style="">
			<div data-v-13ac45d2="" class="hu-modal-content-wrapper">
				<div data-v-983ec938="" data-v-13ac45d2="" class="modal-content-wrapper type-default">
					<section data-v-983ec938="" class="modal-content__header">
						<span data-v-983ec938="">상태 수정</span>
					</section>
					<section data-v-983ec938="" class="modal-content__body">
						<div data-v-983ec938="" class="selectRadio">
							<label data-v-4edc6b75="" data-v-983ec938="" class="hu-radio-wrapper">
								<div data-v-4edc6b75="" class="hu-radio">
									<span data-v-4edc6b75="" class="radio-input"></span>
									<input data-v-4edc6b75="" type="radio" name="modifyStatus" value="1" class="radio-original">
									<span data-v-4edc6b75="" class="title">정상</span>
								</div>
							</label>
						</div>
						<div data-v-983ec938="" class="selectRadio" style="margin-bottom:12px">
							<label data-v-4edc6b75="" data-v-983ec938="" class="hu-radio-wrapper">
								<div data-v-4edc6b75="" class="hu-radio">
									<span data-v-4edc6b75="" class="radio-input"></span>
									<input data-v-4edc6b75="" type="radio" name="modifyStatus" value="2" class="radio-original">
									<span data-v-4edc6b75="" class="title">퇴직</span>
								</div>
							</label>
						</div>
						<div data-v-983ec938="" class="selectRadio" style="margin-bottom:12px">
							<label data-v-4edc6b75="" data-v-983ec938="" class="hu-radio-wrapper">
								<div data-v-4edc6b75="" class="hu-radio">
									<span data-v-4edc6b75="" class="radio-input"></span>
									<input data-v-4edc6b75="" type="radio" name="modifyStatus" value="3" class="radio-original">
									<span data-v-4edc6b75="" class="title">휴직</span>
								</div>
							</label>
						</div>
					</section>
					<section data-v-983ec938="" class="modal-content__footer">
						<button data-v-1434033c="" data-v-983ec938="" type="button" class="hu-button secondary" onclick="closeModal(showModifyStatus);">
							<!---->
							<span data-v-1434033c="" class="label">취소</span>
							<!---->
						</button>
						<button data-v-1434033c="" data-v-983ec938="" type="button" class="hu-button primary" onclick="batchModifyStatus()">
							<!---->
							<span data-v-1434033c="" class="label">저장</span>
							<!---->
						</button>
					</section>
				</div>
			</div>
		</div>
	</div>
	<!-- 상태 수정 모달 끝 -->
</body>
</html>