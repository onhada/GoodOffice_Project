<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String ctxPath = request.getContextPath();
%>

<%-- 내가 만든 CSS --%>
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/addressBook/category.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/common/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/addressBook/important.css" />
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/addressBook/trash.css" />

<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=1280,user-scalable=yes">

</head>
<body class="">
	<noscript>
		<strong>We're sorry but hiworks-address doesn't work properly
			without JavaScript enabled. Please enable it to continue.</strong>
	</noscript>
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
	<div id="app">
		<!---->
		<div>
			<div data-ui="skipNavigation" class="skip_navigation">
				<a href="#header">상단 메뉴로 바로가기</a><a href="#sidebar">왼쪽 메뉴로 바로가기</a><a
					href="#contents">본문 영역으로 바로가기</a>
			</div>
			<div class="split-wrap">
				<div class="split-item left" style="width: 276px;">
					<!-- 사이드바 시작 -->
					<tiles:insertAttribute name="side" />


					<!-- 사이드바 끝-->
				</div>
				<div class="split-gutter" draggable="true"
					draggable-state="{&quot;initialPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65},&quot;startDragPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65},&quot;currentDragPosition&quot;:{&quot;left&quot;:276,&quot;top&quot;:65}}"
					style="left: 276px; touch-action: none; position: fixed; top: 65px;">&nbsp;</div>
				<div class="split-gutter-pop"
					style="left: 296px; top: 501px; display: none;">
					드래그하여 메뉴 영역 확대/축소 <br> 더블클릭으로 숨김 가능
				</div>
				<div class="re-open-sidebar" style="display: none;">
					<i class="far fa-ellipsis-v"></i>
				</div>
				<div class="split-item right" style="width: calc(100% - 276px);">
					<!-- 컨텐츠 시작 -->



					<tiles:insertAttribute name="content" />


					<!-- 컨텐츠 끝 -->
				</div>
			</div>
		</div>
	</div>
	<%--여기까지 휴지통 script 시작 --%>
	<script src="/js/chunk-vendors.430d7f9a.js"></script>
	<script src="/js/app.86a398ab.js"></script>
	<script
		src="https://gnb.office.hiworks.com/main.js?v=v1.230912.1-0-g8dad6aa-dirty"></script>

	<%--여기까지 휴지통 script 끝 --%>


	<script src="/js/chunk-vendors.430d7f9a.js"></script>
	<script src="/js/app.86a398ab.js"></script>
	<script
		src="https://gnb.office.hiworks.com/main.js?v=v1.230912.1-0-g8dad6aa-dirty"></script>
	<div data-v-3c90b7b0="" class="el-dialog__wrapper"
		style="z-index: 2072; display: none;">
		<div role="dialog" aria-modal="true" aria-label="dialog"
			class="el-dialog lg add-address new-dark-layer"
			style="margin-top: 15vh;">
			<div class="el-dialog__header">
				<div data-v-3c90b7b0="">
					<span data-v-3c90b7b0="" class="modal-title">주소 추가</span>
					<!---->
					<!---->
				</div>
				<button type="button" aria-label="Close"
					class="el-dialog__headerbtn">
					<i class="el-dialog__close el-icon el-icon-close"></i>
				</button>
			</div>
			<div class="el-dialog__body">
				<div data-v-3c90b7b0="" class="address-type mb-15" style="">
					<div data-v-3c90b7b0="" role="radiogroup"
						class="el-radio-group w-50 clearfix">
						<label data-v-3c90b7b0="" role="radio" aria-checked="true"
							tabindex="0" class="el-radio-button w-50 is-active"><input
							type="radio" tabindex="-1" class="el-radio-button__orig-radio"
							value="private"><span class="el-radio-button__inner">개인
								주소록<!---->
						</span></label><label data-v-3c90b7b0="" role="radio" tabindex="-1"
							class="el-radio-button w-50"><input type="radio"
							tabindex="-1" class="el-radio-button__orig-radio" value="shared"><span
							class="el-radio-button__inner">공유 주소록<!----></span></label>
					</div>
				</div>
				<div data-v-3c90b7b0="" class="d-table address-form">
					<div data-v-3c90b7b0="" class="d-table-row">
						<div data-v-3c90b7b0=""
							class="d-table-cell align-middle label-cell">이름 *</div>
						<div data-v-3c90b7b0="" class="d-table-cell align-middle">
							<div data-v-3c90b7b0="" class="hw-input-wrap">
								<input data-v-3c90b7b0="" type="text" placeholder="이름을 입력하세요"
									maxlength="50" class="hw-input w-338px">
							</div>
						</div>
					</div>
					<div data-v-3c90b7b0="" class="d-table-row">
						<div data-v-3c90b7b0=""
							class="d-table-cell align-middle label-cell">
							<label data-v-3c90b7b0="">이메일</label>
						</div>
						<div data-v-3c90b7b0="" class="d-table-cell align-middle">
							<div data-v-3c90b7b0="" class="hw-input-wrap">
								<input data-v-3c90b7b0="" type="text" placeholder="이메일을 입력하세요"
									maxlength="250" class="hw-input w-338px mr-10">
								<button data-v-21506c5c="" data-v-3c90b7b0="" tabindex="-1"
									class="el-tooltip hw-icon" aria-describedby="el-tooltip-7678">
									<i data-v-21506c5c=""
										class="fal fa-plus-circle font-size-18 add-plus"
										style="color: rgb(41, 133, 219);"></i>
								</button>
							</div>
						</div>
					</div>
					<div data-v-3c90b7b0="" class="d-table-row">
						<div data-v-3c90b7b0=""
							class="d-table-cell align-middle label-cell">
							<label data-v-3c90b7b0="">전화</label>
						</div>
						<div data-v-3c90b7b0="" class="d-table-cell align-middle">
							<div data-v-3c90b7b0="" class="d-inline-block">
								<div data-v-3c90b7b0="" class="el-select w-100px">
									<!---->
									<div class="el-input el-input--suffix">
										<!---->
										<input type="text" readonly="readonly" autocomplete="off"
											placeholder="선택" class="el-input__inner">
										<!---->
										<span class="el-input__suffix"><span
											class="el-input__suffix-inner"><i
												class="el-select__caret el-input__icon el-icon-arrow-up"></i>
												<!----> <!----> <!----> <!----> <!----></span> <!----></span>
										<!---->
										<!---->
									</div>
									<div class="el-select-dropdown el-popper"
										style="display: none; min-width: 0px;">
										<div class="el-scrollbar" style="">
											<div class="el-select-dropdown__wrap el-scrollbar__wrap"
												style="margin-bottom: -8px; margin-right: -8px;">
												<ul class="el-scrollbar__view el-select-dropdown__list">
													<!---->
													<li data-v-3c90b7b0=""
														class="el-select-dropdown__item selected"><span>휴대폰</span></li>
													<li data-v-3c90b7b0="" class="el-select-dropdown__item"><span>집</span></li>
													<li data-v-3c90b7b0="" class="el-select-dropdown__item"><span>회사</span></li>
													<li data-v-3c90b7b0="" class="el-select-dropdown__item"><span>Fax</span></li>
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
							<div data-v-3c90b7b0=""
								class="hw-input-wrap d-inline-block ml-10 mr-10 w-228px">
								<input data-v-3c90b7b0="" type="text" placeholder=""
									maxlength="50" class="hw-input ">
							</div>
							<button data-v-21506c5c="" data-v-3c90b7b0="" tabindex="-1"
								class="el-tooltip hw-icon" aria-describedby="el-tooltip-7127">
								<i data-v-21506c5c=""
									class="fal fa-plus-circle font-size-18 add-plus"
									style="color: rgb(41, 133, 219);"></i>
							</button>
						</div>
					</div>
					<div data-v-3c90b7b0="" class="d-table-row">
						<div data-v-3c90b7b0=""
							class="d-table-cell align-top label-cell pt-12">태그</div>
						<div data-v-3c90b7b0="" class="d-table-cell align-middle">
							<div data-v-3c90b7b0="" class="el-select w-338px">
								<!---->
								<div class="el-input el-input--suffix">
									<!---->
									<input type="text" readonly="readonly" autocomplete="off"
										placeholder="선택" class="el-input__inner">
									<!---->
									<span class="el-input__suffix"><span
										class="el-input__suffix-inner"><i
											class="el-select__caret el-input__icon el-icon-arrow-up"></i>
											<!----> <!----> <!----> <!----> <!----></span> <!----></span>
									<!---->
									<!---->
								</div>
							</div>
							<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
								class="hw-button ml-15 text">
								<!---->
								<span data-v-f8d3258e="" class="label">새 태그 만들기</span>
								<!---->
							</button>
							<div data-v-3c90b7b0="" class="tag-wrap"></div>
						</div>
					</div>
					<!---->
					<!---->
					<!---->
					<!---->
					<!---->
				</div>
				<div data-v-3c90b7b0="" class="add-input">
					<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
						class="hw-button add-btn ml-5 text">
						<!---->
						<span data-v-f8d3258e="" class="label"><div
								data-v-3c90b7b0="" data-v-f8d3258e="">
								<i data-v-3c90b7b0="" data-v-f8d3258e="" class="far fa-plus"></i>
								입력항목 추가
							</div></span>
						<!---->
					</button>
				</div>
				<!---->
				<div data-v-5897dea4="" data-v-3c90b7b0=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog lg allow-editing-description new-dark-layer"
						style="margin-top: 15vh;">
						<div class="el-dialog__header">
							<div data-v-5897dea4="" class="modal-title">편집 허용 여부에 따른 공유
								주소 기능의 변화는?</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<div data-v-5897dea4="" class="dialog-footer">
								<button data-v-f8d3258e="" data-v-5897dea4="" type="button"
									class="hw-button cancel-button secondary">
									<!---->
									<span data-v-f8d3258e="" class="label">닫기</span>
									<!---->
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="el-dialog__footer">
				<div data-v-3c90b7b0="" class="dialog-footer clearfix">
					<div data-v-3c90b7b0="" style="">
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-left cancel-button secondary">
							<!---->
							<span data-v-f8d3258e="" class="label">취소</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-right filled-button primary"
							disabled="disabled">
							<!---->
							<span data-v-f8d3258e="" class="label">저장 후 계속 추가</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-right filled-button primary"
							disabled="disabled">
							<!---->
							<span data-v-f8d3258e="" class="label">저장</span>
							<!---->
						</button>
					</div>
					<div data-v-3c90b7b0="" style="display: none;">
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-left destructive-button info">
							<!---->
							<span data-v-f8d3258e="" class="label">삭제</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-right ml-10 filled-button primary"
							disabled="disabled">
							<!---->
							<span data-v-f8d3258e="" class="label">수정</span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-3c90b7b0="" type="button"
							class="hw-button float-right cancel-button secondary">
							<!---->
							<span data-v-f8d3258e="" class="label">취소</span>
							<!---->
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="el-select-dropdown el-popper"
		style="min-width: 0px; transform-origin: center top; z-index: 2074; display: none;">
		<div class="el-scrollbar" style="">
			<div class="el-select-dropdown__wrap el-scrollbar__wrap"
				style="margin-bottom: -8px; margin-right: -8px;">
				<ul class="el-scrollbar__view el-select-dropdown__list">
					<!---->
					<li data-v-3c90b7b0="" class="el-select-dropdown__item hover"><span>CEO</span></li>
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
	<ul class="el-dropdown-menu el-popper" id="dropdown-menu-2317"
		style="transform-origin: center top; z-index: 2096; display: none;">
		<li tabindex="-1" class="el-dropdown-menu__item">
			<!---->삭제
		</li>
		<li tabindex="-1" class="el-dropdown-menu__item">
			<!---->이름 변경
		</li>
		<div x-arrow="" class="popper__arrow" style="left: 15.5px;"></div>
	</ul>
</body>
</html>
