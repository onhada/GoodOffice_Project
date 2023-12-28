<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>하이웍스 오피스</title>
<meta name="viewport"
	content="width=1024, user-scalable=yes,minimum-scale=0.25, maximum-scale=1.0">


<link rel="shortcut icon" type="image/x-icon"
	href="/static/images/favicon/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/approval/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/approval/style_new.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/approval/style_tutorial.css">
<!--add msy@gabia.com 2016-10-28-->
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/approval/style_approval.css">
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/approval/new_lnb.css">

<!-- 예인추가 -->
<link rel="stylesheet" type="text/css"
	href="<%=ctxPath%>/resources/css/approval/approval.css">


<script type="text/javascript">
	var cookie_imagepath = "/static/images/";
</script>

<script language="javascript" type="text/javascript">
	var PATH_INFO = Array();
	PATH_INFO['LANGUAGE'] = 'korean';
	PATH_INFO['URLTYPE'] = 'D';
	PATH_INFO['DOMAIN'] = 'gabia.biz';
	PATH_INFO['GROUPID'] = '';
	PATH_INFO['ROOT'] = '/gabia.biz/';
</script>

<script src="/approval-static/scripts/language.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/Sly.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/common_new.js?v=b7bc77e01"
	type="text/javascript"></script>
<script src="/approval-static/scripts/jquery-1.11.2.min.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/jcommon.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/jvalidateMessage.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/jorgtree.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/jaddressbook.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/scripts/jajaxBasic.js?v=b7bc77e0"
	type="text/javascript"></script>
<script
	src="/approval-static/scripts/jquery/jquery.toastmessage.js?v=b7bc77e0"
	type="text/javascript"></script>
<!-- Frontend devteam -->

<script
	src="/approval-static/scripts/jquery-ui-1.11.4/jquery-ui.min.js?v=b7bc77e0"
	type="text/javascript"></script>
<script src="/approval-static/ui/js/main.js?v=b7bc77e0"></script>
<script src="/approval-static/scripts/common/api_url_list.js?v=b7bc77e0"
	type="text/javascript"></script>


<script
	src="/approval-static/scripts/approval/approval.js?v=2?v=b7bc77e0"
	charset="utf-8" type="text/javascript"></script>
<script
	src="/approval-static/scripts/approval/resizableTableColumns.js?v=b7bc77e0"
	charset="utf-8" type="text/javascript"></script>
<script src="/approval-static/scripts/jquery/history.js?v=b7bc77e0"
	type="text/javascript"></script>
<script
	src="/approval-static/scripts/approval/document.js?v=1?v=b7bc77e0"
	type="text/javascript"></script>
<script
	src="/approval-static/scripts/approval/approval_table.js?v=1?v=b7bc77e0"
	type="text/javascript"></script>
<script type="text/javascript">
	Api.urlList = {
		"menu-api" : "https:\/\/menu-api-v4.office.hiworks.com",
		"gnb" : "https:\/\/gnb.office.hiworks.com",
		"approval" : "https:\/\/approval-api.office.hiworks.com",
		"alarm" : "https:\/\/office-alarm-api.office.hiworks.com",
		"cache-api" : "https:\/\/cache-api.office.hiworks.com",
		"hr-work" : "https:\/\/hr-work.office.hiworks.com",
		"hr-work-api" : "https:\/\/hr-work-api.office.hiworks.com"
	};
	jQuery(document).ready(function() {
		if (window != window.parent) {
			jQuery('#user_info_box').hide();
			jQuery('#topMenuBtnIcon').hide();
			jQuery('#topMenuBtn').unbind("click");
			jQuery('#topMenuBtn').css("cursor", "default");
			jQuery('#logo_anchor').attr("href", "javascript:void(0);");
			jQuery('#logo_anchor').css("cursor", "default");
		}
	});
</script>




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

		<script type="text/javascript"
			src="https://gnb.office.hiworks.com/main.js?v=b7bc77e0"></script>
		<!-- Top End-->
		<div id="container">

			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle"
					style="left: 0px;"></div>
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

		<iframe id="alphaDiv"
			style="height: 100%; width: 100%; display: none; opacity: 0.6;"></iframe>
		<div id="progressDiv" style="left: 944px; top: 448px; display: none;">
			<img
				src="https://static.hiworks.com/office/static/images/progress_big.gif"
				alt="progress.." title="progress..">
		</div>
	</div>
	<div id="main_layer_div"></div>

	<div class="layer_box small alarm hide popup1 " style="" id="HWA_MAIN">
		<p class="text" id="HWA_MSG"></p>
		<div class="layer_button">
			<button class="btn_variables" type="button" onclick="hidePopup();"
				id="HWA_MAIN_OK">확인</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>

	<div class="layer_box large hide dns_intro_layer" style="width: 550px;">
		<div class="title_layer text_variables">메일 서비스 이용 안내</div>
		<p class="bold body_bold">메일 서비스를 이용하시려면 하이웍스용 DNS 정보 설정이 필요합니다.</p>
		<p class="mgt_15">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			가비아 등록 도메인은 자동 설정을 지원합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('https://domain.gabia.com/api/hiworksdns/domainsetting')">가비아
				도메인 자동 설정하기</button>
		</div>
		<p class="pdt_20">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			타사 등록 도메인은 DNS 정보를 직접 설정해야 합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('https://customer.gabia.com/manuals_pop/manual_set.php?service=webmail_hosting&amp;fact=mailzine&amp;seq_no=2221')">설정
				방법 보기</button>
		</div>
		<p class="bold body_bold mgt_50">
			※ 하이웍스용 DNS 정보 설정을 완료하셨다면 메일 용량을 할당한 후 메일 서비스를<br> 이용할 수 있습니다.
			‘오피스 관리’에서 계정별 메일 용량을 설정해주세요.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open('/gabia.biz/admin/Orgmain')">오피스관리
				페이지 가기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>

	<script type="text/javascript">
		var CHECK_TIME_OUT = window.setInterval(Common.showTimeout,
				6 * 60 * 60 * 1000);
	</script>

	<!-- 문서보기 모달 시작 -->
	<!--
	<div class="layer_box docu-view large hide"
		id="layerSelectApprovalForm"
		style="margin-left: -526px; margin-top: -313px; display: block;">
		<div class="title_layer text_variables">문서 보기</div>
		<div class="after">
			<div class="docu-case-list">
				<dl>
					<dt>
						<span>공통</span>
					</dt>
					<dd class="js-preview-approval-form on" form_no="4597">
						<a href="javascript:void(0);">지출 결의서</a>
					</dd>
					<dd class="js-preview-approval-form" form_no="4598">
						<a href="javascript:void(0);">회람</a>
					</dd>
					<dd class="js-preview-approval-form" form_no="4599">
						<a href="javascript:void(0);">업무연락</a>
					</dd>
					<dd class="js-preview-approval-form" form_no="4600">
						<a href="javascript:void(0);">품의서</a>
					</dd>
				</dl>
				<hr>
			</div>
			<div id="templateApprovalFormComment">지출 결의서</div>
			<div class="docu-detail" id="templateApprovalForm"
				style="height: 425px; margin-top: 10px;">
				<div class="print-wrap">
					<h1>지출 결의서</h1>
					<div class="docu-info">
						<div class="after">
							<div class="list">
								<dl>
									<dt>문서 번호</dt>
									<dd></dd>
									<dt>기안 부서</dt>
									<dd>하이웍스산업</dd>
									<dt>기안자</dt>
									<dd>대표이사</dd>
									<dt>기안 일자</dt>
									<dd>2023-12-03</dd>
									<dt>보존 연한/보안 등급</dt>
									<dd>5년 / A등급</dd>
								</dl>
							</div>
							<div class="approval">
								<h2>신청</h2>
								<table>
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">대표이사</th>
											<th scope="col"></th>
											<th scope="col"></th>
											<th scope="col"></th>
											<th scope="col"></th>
										</tr>
										<tr>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
										</tr>
										<tr>
											<td>대표이사</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="after second-line">
							<div class="confer">
								<h2>처리</h2>
								<table>
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col"></th>
											<th scope="col"></th>
											<th scope="col"></th>
											<th scope="col"></th>
											<th scope="col"></th>
										</tr>
										<tr>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="refer">
							<h2>참조</h2>
							<table>
								<caption>참조</caption>
								<tbody>
									<tr>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="docu-contents">
						<h2>지출 결의서</h2>
						<div class="text"></div>
						<table class="tableType02 mgb_50">
							<caption>지출 결의</caption>
							<colgroup>
								<col style="width: 20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">구분</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">회계 기준월</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">지출자</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">총괄 적요</th>
									<td></td>
								</tr>
							</tbody>
						</table>

						<h4 class="mgt_15">거래 내역</h4>
						<table class="tableType01">
							<colgroup>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">계정 과목</th>
									<th scope="col">지출일자</th>
									<th scope="col">코스트센터</th>
									<th scope="col">증빙</th>
									<th scope="col">금액</th>
									<th scope="col">거래처</th>
									<th scope="col">적요</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="ApprovalDocument.selectApprovalForm();">선택</button>
			<button type="button"
				onclick="$j('#layerSelectApprovalForm').hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0);" class="icon btn_closelayer"
			onclick="$j('#layerSelectApprovalForm').hidePopup();" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	 -->
	<!-- 문서보기 모달 끝 -->


	<!-- 결재선 변경 , 결재선 설정 모달 시작 -->
	<!--
	<div class="layer_box large address line hide"
		id="div_approval_view_four"
		style="margin-left: -400px; margin-top: -311px; display: block;">
		<div class="title_layer text_variables" id="titleApprovalLineSetting">결재선
			변경</div>
		<div class="line-search after" id="searchP" style="display: block;">
			<ul class="after">
				<li><label for="rdo_sch_name"><input type="radio"
						value="name" name="searchField" id="rdo_sch_name"
						onclick="$j('#keyword').focus();" checked="checked"> 이름,
						아이디</label></li>
				<li><label for="rdo_sch_const"><input type="radio"
						value="const" name="searchField" id="rdo_sch_const"
						onclick="$j('#keyword').focus();"> 조직</label></li>
			</ul>
			<div class="fl input-area">
				<input type="text" style="width: 203px" class="text-box vm"
					id="keyword"
					onkeypress="if(event.keyCode == 13){ event.preventDefault(); addressbook.click_searchBtn();}">
				<span class="icon h_detail vm"></span> <span class="refresh vm"
					onclick="addressbook.setTab(addressbook.currentTab);"></span>
			</div>
			<select class="fl hide" style="width: 203px; margin-left: 24px;"
				onchange="ApprovalDocument.selectApprovalLine();"
				id="selectApprovalLine">
				<option value="">자주 쓰는 결재선</option>
			</select>
		</div>

		<div class="after line-list-wrap">
			<div class="fl">
				<div class="after">
					<div class="fl" id="searchMessage" style="display: none;">
						<span id="searchKeyword"></span> 검색결과 : <span id="searchCount"></span>
					</div>
					<div class="fr">
						<a class="icon order" href="javascript:void(0);" title="정렬"
							id="anchorApprovalUserOrder"><span class="blind">정렬</span></a>
						<ul class="dropdown-menu hide" id="orderApprovalDropdown"
							style="width: 70px; top: 124px; left: 314px;">
							<li><a href="javascript:void(0);"
								class="js-approval-node-order"
								onclick="addressbook.click_orderBtn('name', 'ASC');$j('#orderApprovalDropdown').toggleClass('show');">이름순</a></li>
							<li><a href="javascript:void(0);"
								class="js-approval-node-order"
								onclick="addressbook.click_orderBtn('position', 'DESC');$j('#orderApprovalDropdown').toggleClass('show');">직급순</a></li>
							<li><a href="javascript:void(0);"
								class="js-approval-node-order"
								onclick="addressbook.click_orderBtn('priority', '');$j('#orderApprovalDropdown').toggleClass('show');">설정순</a></li>
						</ul>
					</div>
				</div>
				<div class="after">
					<div class="category-list">
						<select id="leftList" size="19" frameborder="0"
							style="display: none;" onclick="addressbook.click_leftList(this)">
						</select>
						<div id="treeDiv" style="white-space: nowrap;"
							class="treeDiv OrgTree">
							<ul>
								<li id="addressTreeNode_2256" class="last"><div
										class="container">
										<img onclick="addressbook.ToggleTree(this);"
											src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_m.gif"
											class="plus"><strong
											onclick="addressbook.selectNode(this);" class="selectedNode">하이웍스산업
											<span
											style="font-weight: normal; color: silver; font-size: 8pt">(11)</span>
										</strong>
									</div>
									<ul style="">
										<li id="addressTreeNode_2258"><div class="container">
												<img onclick="addressbook.ToggleTree(this);"
													src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_p.gif"
													class="plus"><strong
													onclick="addressbook.selectNode(this);">관리부 <span
													style="font-weight: normal; color: silver; font-size: 8pt">(4)</span></strong>
											</div>
											<ul style="display: none;">
												<li id="addressTreeNode_2261"><div class="container">
														<strong onclick="addressbook.selectNode(this);">인사팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
												<li id="addressTreeNode_2262"><div class="container">
														<strong onclick="addressbook.selectNode(this);">구매총무팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
												<li id="addressTreeNode_2263" class="last"><div
														class="container">
														<strong onclick="addressbook.selectNode(this);">재무회계팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(2)</span>
														</strong>
													</div></li>
											</ul></li>
										<li id="addressTreeNode_2259"><div class="container">
												<img onclick="addressbook.ToggleTree(this);"
													src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_p.gif"
													class="plus"><strong
													onclick="addressbook.selectNode(this);">생산부 <span
													style="font-weight: normal; color: silver; font-size: 8pt">(3)</span></strong>
											</div>
											<ul style="display: none;">
												<li id="addressTreeNode_2264"><div class="container">
														<strong onclick="addressbook.selectNode(this);">생산1팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
												<li id="addressTreeNode_2265"><div class="container">
														<strong onclick="addressbook.selectNode(this);">생산2팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
												<li id="addressTreeNode_2266" class="last"><div
														class="container">
														<strong onclick="addressbook.selectNode(this);">품질관리팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
											</ul></li>
										<li id="addressTreeNode_2260" class="last"><div
												class="container">
												<img onclick="addressbook.ToggleTree(this);"
													src="https://approval.office.hiworks.com/assets/images/common/tree_images/tree_p.gif"
													class="plus"><strong
													onclick="addressbook.selectNode(this);">영업부 <span
													style="font-weight: normal; color: silver; font-size: 8pt">(3)</span></strong>
											</div>
											<ul style="display: none;">
												<li id="addressTreeNode_2267"><div class="container">
														<strong onclick="addressbook.selectNode(this);">영업1팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
												<li id="addressTreeNode_2268"><div class="container">
														<strong onclick="addressbook.selectNode(this);">영업2팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
												<li id="addressTreeNode_2269" class="last"><div
														class="container">
														<strong onclick="addressbook.selectNode(this);">고객지원팀
															<span
															style="font-weight: normal; color: silver; font-size: 8pt">(1)</span>
														</strong>
													</div></li>
											</ul></li>
									</ul></li>
							</ul>
						</div>
						<div id="leftProgressDiv" style="display: none;"
							class="progressDiv">
							<img src="/assets/images/common/icon/progress_big.gif">
						</div>
					</div>
					<div class="name-list">
						<select multiple="multiple" id="rightList" style="">
							<option value="2818" title="강과장 (영업2팀:과장)" node_id="2268">강과장
								(영업2팀:과장)</option>
							<option value="2815" title="김이사 (생산1팀:이사)" node_id="2264">김이사
								(생산1팀:이사)</option>
							<option value="2812" title="대표이사 (하이웍스산업:대표이사)" node_id="2256">대표이사
								(하이웍스산업:대표이사)</option>
							<option value="2814" title="박상무 (구매총무팀:상무)" node_id="2262">박상무
								(구매총무팀:상무)</option>
							<option value="2820" title="안주임 (품질관리팀:주임)" node_id="2266">안주임
								(품질관리팀:주임)</option>
							<option value="2819" title="양대리 (재무회계팀:대리)" node_id="2263">양대리
								(재무회계팀:대리)</option>
							<option value="2816" title="오부장 (생산2팀:부장)" node_id="2265">오부장
								(생산2팀:부장)</option>
							<option value="2821" title="이사원 (고객지원팀:사원)" node_id="2269">이사원
								(고객지원팀:사원)</option>
							<option value="2817" title="조차장 (영업1팀:차장)" node_id="2267">조차장
								(영업1팀:차장)</option>
							<option value="2822" title="주알바 (재무회계팀:계약직)" node_id="2263">주알바
								(재무회계팀:계약직)</option>
							<option value="2813" title="최사장 (인사팀:사장)" node_id="2261">최사장
								(인사팀:사장)</option>
						</select>

						<div class="choice-area">
							<a href="javascript:void(0);" class="text_variables fl mgr_20"
								onclick="addressbook.click_rightSelect('select');">전체</a> <a
								href="javascript:void(0);" class="text_variables mgr_20"
								onclick="addressbook.click_rightSelect('deselect');">선택안함</a> <span
								id="pagingP"></span>
						</div>
						<div id="rightProgressDiv" style="display: none;"
							class="progressDiv">
							<img src="/assets/images/common/icon/progress_big.gif">
						</div>
					</div>
				</div>

			</div>
			<div class="add-del-btn with-equal">
				<div class="top">
					<a href="javascript:void(0);"
						class="icon btn-add js-btn-approval-first-line"
						onclick="Approval.addUser('selectApprovalFirstLine');"><span
						class="blind">결재추가</span></a> <a href="javascript:void(0);"
						class="icon btn-del js-btn-approval-first-line"
						onclick="Approval.deleteUser('selectApprovalFirstLine');"><span
						class="blind">결재삭제</span></a>
				</div>
				<div class="middle">
					<a href="javascript:void(0);"
						class="icon btn-add js-btn-approval-second-line"
						onclick="Approval.addUser('selectApprovalSecondLine');"><span
						class="blind">참조추가</span></a> <a href="javascript:void(0);"
						class="icon btn-del js-btn-approval-second-line"
						onclick="Approval.deleteUser('selectApprovalSecondLine');"><span
						class="blind">참조삭제</span></a>
				</div>
				<div class="bottom">
					<a href="javascript:void(0);"
						class="icon btn-add js-btn-approval-third-line"
						onclick="Approval.addUser('selectApprovalThirdLine');"><span
						class="blind">수신추가</span></a> <a href="javascript:void(0);"
						class="icon btn-del js-btn-approval-third-line"
						onclick="Approval.deleteUser('selectApprovalThirdLine');"><span
						class="blind">수신삭제</span></a>
				</div>
				<div class="last">
					<a href="javascript:void(0);"
						class="icon btn-add js-btn-approval-fourth-line"
						onclick="Approval.addUser('selectApprovalFourthLine');"><span
						class="blind">수신참조추가</span></a> <a href="javascript:void(0);"
						class="icon btn-del js-btn-approval-fourth-line"
						onclick="Approval.deleteUser('selectApprovalFourthLine');"><span
						class="blind">수신참조삭제</span></a>
				</div>
			</div>
			<div class="fr mgb20">
				<div class="dropdown hide show" style="top: 60px; right: 0">
					<div class="dropdown-menu multi-team hide" id="layerMultiNode"
						style="width: 290px">
						<p class="pdb_20">선택된 결재자가 여러 조직에 속해 있을 경우, 하나의 조직을 선택하셔야 합니다.</p>
						<p class="pdb_10" id="multiNodeUser"></p>
						<div style="overflow: auto; max-height: 132px; padding: 0;">
							<table class="tableType01" id="tableMultiNode">
								<caption>문서 수정 이력 목록으로 시간, 관리로 구성되어 있습니다.</caption>
								<colgroup>
									<col width="15%">
									<col width="85%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">선택</th>
										<th scope="col">소속 부서</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>

						<div class="layer_button">
							<button type="button" class="btn_variables"
								onclick="Approval.selectMultiNodeUser();">확인</button>
							<button type="button" onclick="$j('#layerMultiNode').hide();">취소</button>
						</div>
					</div>
				</div>
				<div class="first-line three-line after">
					<div class="fl">
						<div class="to-item after">
							<span class="title">결재 <span class="point_color bold"
								id="sp_selectApprovalFirstLine">2</span></span>
							<div class="updown-wrap first js-move-approval-first-line">
								<span class="blind icon down"
									onclick="Approval.downUser('selectApprovalFirstLine');">아래로</span>
								<span class="blind icon up"
									onclick="Approval.upUser('selectApprovalFirstLine');">위로</span>
							</div>
						</div>
						<div class="list">
							<select multiple="multiple" id="selectApprovalFirstLine">
								<option value="2812" node_id="2256" edit="N" disabled=""
									old_new="old" enable_delete="Y">대표이사 대표이사 (하이웍스산업)</option>
								<option value="2819" node_id="2263" title="대리 양대리 (재무회계팀)"
									old_new="old" enable_delete="Y">대리 양대리 (재무회계팀)</option>
							</select>
						</div>

					</div>
					<div class="spr-approval approval-direction">
						결<br> 재<br> 방<br> 향<br>
					</div>
				</div>
				<div class="three-line after">
					<div class="fl">
						<div class="to-item after">
							<span class="title">참조 <span class="point_color bold"
								id="sp_selectApprovalSecondLine">0</span></span>
							<div class="updown-wrap first js-move-approval-second-line">
								<span class="blind icon down"
									onclick="Approval.downUser('selectApprovalSecondLine');">아래로</span>
								<span class="blind icon up"
									onclick="Approval.upUser('selectApprovalSecondLine');">위로</span>
							</div>
						</div>
						<div class="list">
							<select multiple="multiple" id="selectApprovalSecondLine">
							</select>
						</div>
					</div>
				</div>
				<div class="three-line after">
					<div class="fl">
						<div class="to-item after">
							<span class="title">수신 <span class="point_color bold"
								id="sp_selectApprovalThirdLine">0</span></span>
							<div class="updown-wrap first js-move-approval-third-line">
								<span class="blind icon down"
									onclick="Approval.downUser('selectApprovalThirdLine');">아래로</span>
								<span class="blind icon up"
									onclick="Approval.upUser('selectApprovalThirdLine');">위로</span>
							</div>
						</div>
						<div class="list">
							<select multiple="multiple" id="selectApprovalThirdLine">
							</select>
						</div>
					</div>

				</div>
				<div class="last-line three-line after">
					<div class="fl">
						<div class="to-item after">
							<span class="title">(수신)참조 <span class="point_color bold"
								id="sp_selectApprovalFourthLine">0</span></span>
							<div class="updown-wrap first js-move-approval-fourth-line">
								<span class="blind icon down"
									onclick="Approval.downUser('selectApprovalFourthLine');">아래로</span>
								<span class="blind icon up"
									onclick="Approval.upUser('selectApprovalFourthLine');">위로</span>
							</div>
						</div>
						<div class="list">
							<select multiple="multiple" id="selectApprovalFourthLine">
							</select>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="addressbook.btnApply();">확인</button>
			<button type="button" onclick="addressbook.closeAddressbook();">취소</button>
		</div>
		<a href="javascript:void(0);" class="icon btn_closelayer"
			onclick="addressbook.closeAddressbook();" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	
	-->
	<!-- 결재선 변경, 결재선 설정 모달 끝 -->


	<!-- 결재 설정, 신청 설정 , 처리 설정 모달 시작 -->
	<!--
	<div class="layer_box middle hide" id="layerApprovalLineSetting" style="margin-left: -175px; margin-top: -169.5px; display: block;">
	<div class="title_layer text_variables">결재 설정</div>
	<div class="to-item after">
		<!-- <div class="updown-wrap first">
			<span class="blind icon up">위로</span>
			<span class="blind icon down">아래로</span>
		</div>  
	</div>
	<div class="after">
		<div class="approval-list" style="overflow-y: inherit;">
			<label for="autocomplete"><input type="text"
				class="refer-add js-complete ui-autocomplete-input"
				placeholder="클릭 후 입력" id="inputApprovalLineSetting"
				autocomplete="off"></label>
			<ul
				style="height: 132px; overflow-x: hidden; overflow-y: auto; margin-top: 5px;"
				id="sortApprovalLineSetting" class="ui-sortable">
				<li class="js-approval-line-setting unsortable" user_no="2812"
					node_id="2256" old_new="old" style="cursor: auto;"><span>대표이사</span>
				</li>
				<li class="js-approval-line-setting ui-sortable-handle"
					user_no="2819" node_id="2263" old_new="old"><span>양대리</span> <span
					class="icon file_delete js-approval-line-setting-delete"></span> <span
					class="spr-approval updown" title="Move"></span></li>
			</ul>
		</div>
		<div class="spr-approval approval-direction">
			결<br> 재<br>
			<br> 방<br> 향<br>
		</div>
	</div>

	<div class="layer_button">
		<button type="button" class="btn_variables"
			onclick="ApprovalDocument.saveApprovalLineSetting('A');">확인</button>
		<button type="button"
			onclick="$j('#layerApprovalLineSetting').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer"
		onclick="$j('#layerApprovalLineSetting').hidePopup();" title="레이어 닫기"><span
		class="blind">레이어 닫기</span></a>

	<input type="hidden" id="tempApprovalLineType"
		value="approval_first_line">
	<input type="hidden" id="tempApprovalType" value="A">
	</div>


	-->
	<!-- 결재 설정, 신청 설정 , 처리 설정 모달 끝 -->

	<!-- 양식함관리-분류 설정 모달 시작 -->
	<!-- 
	<div class="layer_box middle hide" id="layerCategorySetting" style="margin-left: -175px; margin-top: -183px; display: block;">
	<div class="title_layer text_variables">분류 설정</div>
	<div class="dialog-approval-setting">
		<div class="after">
			<div class="approval-list" style="position:relative;overflow:auto;height:205px">
				<label for="autocomplete"><input type="text" class="refer-add" placeholder="클릭 후 입력" id="inputApprovalCategory" maxlength="10"></label>
				<ul style="maxheight:205px;overflow-x:hidden;overflow-y:auto" id="sortApprovalCategory" class="docu-cate ui-sortable">
										<li class="js-approval-category js-approval-category-input js-approval-category-common ui-sortable-handle" no="605">
						<span>공통</span>
												<span class="spr-approval updown" title="이동"></span>
						<span class="js-approval-category-manage icon plus" style="cursor: pointer;"></span>
					</li>
										<li class="js-approval-category js-approval-category-input js-approval-category-common ui-sortable-handle" no="606">
						<span>시험 사용</span>
												<span class="spr-approval updown" title="이동"></span>
						<span class="js-approval-category-manage icon plus" style="cursor: pointer;"></span>
					</li>
									</ul>
			</div>
		</div>
	</div>

	<div class="layer_button">
		<button type="button" class="btn_variables" onclick="ApprovalSetting.saveCategorySetting();">확인</button>
		<button type="button" onclick="$j('#layerCategorySetting').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="$j('#layerCategorySetting').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
	
	 -->
	<!-- 양식함관리-분류 설정 모달 끝 -->

	<!-- 양식함관리-사내 전자결재 규정 등록 모달 시작 -->
	<!--  
	<div class="layer_box app-dialog large hide" id="layerApprovalRule" style="width: 900px; height: 600px; margin-left: -481px; margin-top: -329.5px; display: block;">
    <div class="title_layer text_variables">사내 전자결재 규정 등록</div>
    <div class="dialog-approval-add">
        <div class="format-choice">
            <div id="dexteditor_holder"></div>
            <textarea style="display:none" id="compose_contents"></textarea>
            <div id="new_compose_contents" class="se se-edit-mode se-classic-editor se-blur" style="width: 100%; height: 500px; visibility: visible;">
                <div class="se-container">
                    <div class="se-dim-layer" style="height: 0px;"><div class="se-loader"><div></div><div></div><div></div><span></span></div></div>
                    <div class="se-balloon-container se-fold"></div>
                    <div class="se-dialog-container"></div>
                    <div class="se-calculate"></div>
                    <input class="se-file-selector" type="file" name="file">
                    <iframe class="se-print se-hide"></iframe>
                <div class="se-clipboard" contenteditable="true" tabindex="-1"></div><div class="se-tooltip-layer"><div class="se-tooltip se-hide" style="opacity: 1; left: 0px; top: 0px;"><div class="se-tooltip-arrow se-hide"></div><span class="se-label"></span></div></div></div>
                <div class="se-header"><div class="se-toolbar"><div class="se-component-row se-use-navi">
            <div class="se-prev se-clickable se-rotate-180 se-shrink"><div class="se-navi-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div></div>
            <div class="se-component-wrapper" style="width: calc(100% - 10px);"><div class="se-dropdown" tabindex="-1" name="fontFamilyWithText" style="width: 85px;"><button type="button" class="se-dropdown-btn-wrapper se-single-btn se-clickable" value="text" aria-label="글꼴" aria-haspopup="true"><div class="se-dropdown-btn" value="main"><span class="se-label">글꼴</span></div><div class="se-dropdown-btn" value="sub"><span class="se-arrow se-rotate-180"></span></div></button><div class="se-dropdown-menu-wrapper"><ul class="se-dropdown-menu" role="menu"><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="기본값"><span class="se-label">기본값</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="맑은 고딕"><span class="se-label" style="font-family: &quot;맑은 고딕&quot;;">맑은 고딕</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="돋움"><span class="se-label" style="font-family: 돋움;">돋움</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="돋움체"><span class="se-label" style="font-family: 돋움체;">돋움체</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="굴림"><span class="se-label" style="font-family: 굴림;">굴림</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="굴림체"><span class="se-label" style="font-family: 굴림체;">굴림체</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="바탕"><span class="se-label" style="font-family: 바탕;">바탕</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="바탕체"><span class="se-label" style="font-family: 바탕체;">바탕체</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Arial"><span class="se-label" style="font-family: Arial;">Arial</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Arial Black"><span class="se-label" style="font-family: &quot;Arial Black&quot;;">Arial Black</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Tahoma"><span class="se-label" style="font-family: Tahoma;">Tahoma</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Verdana"><span class="se-label" style="font-family: Verdana;">Verdana</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Sans-Serif"><span class="se-label" style="font-family: Sans-Serif;">Sans-Serif</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Serif"><span class="se-label" style="font-family: Serif;">Serif</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Monospace"><span class="se-label" style="font-family: Monospace;">Monospace</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Cursive"><span class="se-label" style="font-family: Cursive;">Cursive</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Fantasy"><span class="se-label" style="font-family: Fantasy;">Fantasy</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Times New Roman"><span class="se-label" style="font-family: &quot;Times New Roman&quot;;">Times New Roman</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Century Gothic"><span class="se-label" style="font-family: &quot;Century Gothic&quot;;">Century Gothic</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Courier New"><span class="se-label" style="font-family: &quot;Courier New&quot;;">Courier New</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="Georgia"><span class="se-label" style="font-family: Georgia;">Georgia</span></button></li></ul></div></div><div class="se-dropdown" tabindex="-1" name="fontSizeWithText" style="width: 85px;"><button type="button" class="se-dropdown-btn-wrapper se-single-btn se-clickable" value="text" aria-label="크기" aria-haspopup="true"><div class="se-dropdown-btn" value="main"><span class="se-label">크기</span></div><div class="se-dropdown-btn" value="sub"><span class="se-arrow se-rotate-180"></span></div></button><div class="se-dropdown-menu-wrapper"><ul class="se-dropdown-menu" role="menu"><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="기본값"><span class="se-label">기본값</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="9px"><span class="se-label" style="font-size: 9px;">9px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="10px"><span class="se-label" style="font-size: 10px;">10px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="11px"><span class="se-label" style="font-size: 11px;">11px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="12px"><span class="se-label" style="font-size: 12px;">12px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="13px"><span class="se-label" style="font-size: 13px;">13px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="14px"><span class="se-label" style="font-size: 14px;">14px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="16px"><span class="se-label" style="font-size: 16px;">16px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="18px"><span class="se-label" style="font-size: 18px;">18px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="24px"><span class="se-label" style="font-size: 24px;">24px</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="32px"><span class="se-label" style="font-size: 32px;">32px</span></button></li></ul></div></div><div class="se-dropdown" tabindex="-1" name="lineHeight"><button type="button" class="se-dropdown-btn-wrapper se-single-btn se-clickable" value="icon" aria-label="줄간격" aria-haspopup="true"><div class="se-dropdown-btn" value="main"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpolygon%20points%3D%225.268%2C4.831%205.952%2C4.147%202.979%2C1.171%200%2C4.15%200.685%2C4.833%202.089%2C4.03%202.084%2C12.154%200.685%2C11.291%200%2C11.977%202.976%2C14.951%205.952%2C11.975%205.268%2C11.289%204.036%2C12.137%204.031%2C4.031%20%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%222.092%22%20width%3D%228.053%22%20height%3D%222.035%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%227.019%22%20width%3D%228.053%22%20height%3D%222.036%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%2212.053%22%20width%3D%228.053%22%20height%3D%222.035%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></div><div class="se-dropdown-btn" value="sub"><span class="se-arrow se-rotate-180"></span></div></button><div class="se-dropdown-menu-wrapper"><ul class="se-dropdown-menu" role="menu"><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="기본값"><span class="se-label">기본값</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="1"><span class="se-label">1</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="1.2"><span class="se-label">1.2</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="1.4"><span class="se-label">1.4</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="1.6"><span class="se-label">1.6</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="1.8"><span class="se-label">1.8</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="2"><span class="se-label">2</span></button></li></ul></div></div><button type="button" class="se-button se-clickable" name="bold" aria-label="굵게"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M8.48%2C1.043c3.928%2C0%2C5.341%2C1.469%2C5.341%2C3.476c0%2C1.508-1.004%2C2.419-4.276%2C2.976%20c3.684%2C0.357%2C5.176%2C1.728%2C5.176%2C3.792c0%2C1.945-1.432%2C3.71-6.957%2C3.71H1.016v-0.675l1.997-0.179%20c0.062-2.086%2C0.071-3.81%2C0.071-5.953V7.475c0-2.025-0.01-3.592-0.071-5.597L1.016%2C1.717V1.043H8.48z%20M7.039%2C1.964%20c-0.06%2C1.945-0.06%2C3.062-0.06%2C5.106h0.377c2.107%2C0%2C3.15-0.926%2C3.15-2.892c0-1.808-0.858-2.214-2.925-2.214H7.039z%20M7.662%2C14.047%20c2.21%2C0%2C3.521-0.517%2C3.521-2.701c0-2.302-1.168-3.336-3.644-3.336H6.979c0%2C2.363%2C0%2C3.912%2C0.06%2C6.037H7.662z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="italic" aria-label="기울임꼴"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpath%20d%3D%22M10.912%2C1.992c-0.537%2C1.922-1.058%2C3.502-1.593%2C5.502L9.048%2C8.506c-0.52%2C1.942-1.05%2C3.61-1.551%2C5.551%20l1.985%2C0.22l-0.191%2C0.712H2.796l0.19-0.712l2.081-0.22c0.556-1.921%2C1.08-3.569%2C1.61-5.551l0.271-1.012%20C7.47%2C5.554%2C8%2C3.934%2C8.481%2C1.992L6.517%2C1.774l0.191-0.713h6.369l-0.192%2C0.713L10.912%2C1.992z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="underline" aria-label="밑줄"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%2214.031%22%20width%3D%2216%22%20height%3D%220.946%22%2F%3E%3C%2Fg%3E%3Cpath%20d%3D%22M13.053%2C1.016H10V2h1.017l0.032%2C5.648c0.016%2C3.052-0.488%2C4.212-2.551%2C4.212%20c-1.885%2C0-2.549-1.002-2.549-3.989V6.425c0-1.501%2C0.003-2.969%2C0.032-4.425h1.04V1.016H2.984V2h1.022%20c0.042%2C1.477%2C0.044%2C2.964%2C0.044%2C4.425v1.811c0%2C3.432%2C1.354%2C4.783%2C4.021%2C4.783c2.604%2C0%2C3.895-1.494%2C3.912-5.069L12.015%2C2h1.038%20V1.016z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="strike" aria-label="취소선"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M8.729%2C7.118c2.568%2C1.01%2C3.521%2C2.052%2C3.521%2C3.82c0%2C2.172-1.82%2C4.006-4.632%2C4.006%20c-1.438%2C0-2.846-0.439-3.766-0.992l0.105-2.93H4.91l0.591%2C2.39c0.606%2C0.305%2C1.162%2C0.422%2C1.96%2C0.422%20c1.805%2C0%2C2.969-0.927%2C2.969-2.392c0-1.176-0.644-1.783-2.291-2.406l-0.746-0.32C5.327%2C7.875%2C4.062%2C6.797%2C4.062%2C4.929%20c0-2.188%2C1.856-3.879%2C4.354-3.879c1.301%2C0%2C2.326%2C0.371%2C3.191%2C0.977l-0.104%2C2.966h-0.971L9.941%2C2.604%20c-0.45-0.236-0.901-0.32-1.457-0.32c-1.545%2C0-2.62%2C0.726-2.62%2C2.124c0%2C1.179%2C0.747%2C1.852%2C2.083%2C2.374L8.729%2C7.118z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%220.004%22%20y%3D%228.031%22%20width%3D%2215.992%22%20height%3D%220.946%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-color-button se-clickable" name="fontColor" aria-label="글자색"><div class="se-color-button-wrapper">
                <div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2012%22%3E%3Cg%3E%3Cpath%20d%3D%22M8.985%2C0.991C8.956%2C2.359%2C8.956%2C3.443%2C8.956%2C4.838v0.77c0%2C1.368%2C0%2C3.061%2C0.029%2C4.43l2.004%2C0.17v0.785%20H5.043v-0.785l1.983-0.17c0.029-1.354%2C0.029-3.033%2C0.029-4.43v-0.77c0-1.396%2C0-2.479-0.029-3.847H4.713L4.271%2C2.979H3.463%20l0.134-2.984h8.836l0.104%2C2.983h-0.779l-0.455-1.987H8.985z%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
                <div class="se-color-view">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 12 3" focusable="false">
                        <g>
                            <rect x="0" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="2" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="4" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="6" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="8" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="10" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="0" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="2" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="4" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="6" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="8" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="10" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="1" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="3" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="5" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="7" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="9" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="11" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                        </g>
                    </svg>
                    <div class="se-current-color"></div>
                </div>
            </div>
        </button><button type="button" class="se-color-button se-clickable" name="fontBackgroundColor" aria-label="글자배경색"><div class="se-color-button-wrapper">
                <div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2012%22%3E%3Cg%3E%3Cpath%20d%3D%22M2%2C0.031v11.032h11.969V0.031H2z%20M10.496%2C4.048l-0.381-1.073H8.981c-0.02%2C0.929-0.02%2C1.453-0.02%2C2.408%20v0.455c0%2C0.927%2C0%2C1.617%2C0.02%2C2.55l1.099%2C0.083v0.566H5.943V8.471l1.096-0.083c0.01-0.917%2C0.01-1.604%2C0.01-2.55V5.383%20c0-0.938%2C0-1.47-0.01-2.408H5.915L5.524%2C4.048h-0.52l0.065-1.885h5.892l0.057%2C1.885H10.496z%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
                <div class="se-color-view">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 12 3" focusable="false">
                        <g>
                            <rect x="0" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="2" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="4" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="6" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="8" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="10" y="0" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="0" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="2" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="4" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="6" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="8" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="10" y="2" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="1" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="3" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="5" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="7" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="9" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                            <rect x="11" y="1" fill="#C9C9C9" width="1" height="1"></rect>
                        </g>
                    </svg>
                    <div class="se-current-color"></div>
                </div>
            </div>
        </button><div class="se-separator-vert"></div><div class="se-dropdown" tabindex="-1" name="bulletList"><div class="se-dropdown-btn-wrapper se-dual-btn" value="icon"><button type="button" class="se-dropdown-btn se-clickable" value="main" aria-label="글머리 기호"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%222.035%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%228.021%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%2214.03%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%222.521%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%228.501%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%2214.511%22%20r%3D%221.49%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-dropdown-btn se-clickable" value="sub" aria-label="글머리 기호" aria-haspopup="true"><span class="se-arrow se-rotate-180"></span></button></div><div class="se-dropdown-menu-wrapper"><ul class="se-dropdown-menu" role="menu"><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="검은색 원"><span class="se-label">●</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="흰색 원"><span class="se-label">○</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="검은색 네모"><span class="se-label">■</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="검은색 마름모"><span class="se-label">◆</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="더보기"><span class="se-label">더보기</span></button></li></ul></div></div><div class="se-dropdown" tabindex="-1" name="numberedList"><div class="se-dropdown-btn-wrapper se-dual-btn" value="icon"><button type="button" class="se-dropdown-btn se-clickable" value="main" aria-label="글머리 번호"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%222.016%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%228.001%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%2214.011%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Crect%20width%3D%222.021%22%20height%3D%221.002%22%2F%3E%3Crect%20x%3D%221.042%22%20width%3D%220.979%22%20height%3D%224.002%22%2F%3E%3Crect%20y%3D%223.002%22%20width%3D%223.021%22%20height%3D%221%22%2F%3E%3Cpolygon%20points%3D%220%2C5.003%200%2C6.023%202.021%2C6.023%202.021%2C6.982%200%2C6.982%200%2C7.731%200%2C8.001%200%2C9.045%200%2C9.314%200%2C10.064%203.021%2C10.064%203.021%2C9.045%201%2C9.045%201%2C8.001%203.021%2C8.001%203.021%2C7.419%203.021%2C6.982%203.021%2C6.023%203.021%2C5.835%203.021%2C5.003%20%22%2F%3E%3Cpolygon%20points%3D%220%2C11.043%200%2C12.002%202.063%2C12.002%202.063%2C13.021%200%2C13.021%200%2C13.98%202.063%2C13.98%202.063%2C15.041%200%2C15.041%200%2C16%202.063%2C16%203.021%2C16%203.021%2C15.041%203.021%2C13.98%203.021%2C13.021%203.021%2C12.002%203.021%2C11.314%203.021%2C11.043%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-dropdown-btn se-clickable" value="sub" aria-label="글머리 번호" aria-haspopup="true"><span class="se-arrow se-rotate-180"></span></button></div><div class="se-dropdown-menu-wrapper"><ul class="se-dropdown-menu" role="menu"><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="1."><span class="se-label">1.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="①"><span class="se-label">①</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="(1)"><span class="se-label">(1)</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="A."><span class="se-label">A.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="a."><span class="se-label">a.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="I."><span class="se-label">I.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="i."><span class="se-label">i.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="가."><span class="se-label">가.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="ㄱ."><span class="se-label">ㄱ.</span></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="시작번호 지정"><span class="se-label">시작번호 지정</span></button></li></ul></div></div><button type="button" class="se-button se-clickable" name="decreaseIndent" aria-label="내어쓰기"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%220.041%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%223.093%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%227.099%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%2211.113%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20y%3D%2215.035%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%223.91%2C11.934%20-0.001%2C8.061%203.91%2C4.184%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="increaseIndent" aria-label="들여쓰기"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%220.041%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%223.093%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%227.099%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%2211.113%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20y%3D%2215.035%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%220%2C4.184%203.911%2C8.057%200%2C11.934%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><div class="se-separator-vert"></div><div class="se-dropdown" tabindex="-1" name="align"><button type="button" class="se-dropdown-btn-wrapper se-single-btn se-clickable" value="icon" aria-label="정렬" aria-haspopup="true"><div class="se-dropdown-btn" value="main"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></div><div class="se-dropdown-btn" value="sub"><span class="se-arrow se-rotate-180"></span></div></button><div class="se-dropdown-menu-wrapper"><ul class="se-dropdown-menu" role="menu" value="icon"><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="왼쪽 정렬"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="가운데 정렬"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%223%22%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%223%22%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="오른쪽 정렬"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%226%22%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%226%22%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button></li><li role="none"><button type="button" class="se-clickable" role="menuitem" aria-label="양쪽 정렬"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.03%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.006%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button></li></ul></div></div><div class="se-separator-vert"></div><button type="button" class="se-button se-clickable" name="image" aria-label="이미지"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpath%20d%3D%22M0.021%2C1.001v13.968h16V1.001H0.021z%20M15.064%2C2.055v7.968l-1.959-2.034L10%2C10.252L6.02%2C5.015L1.078%2C9%20V2.055H15.064z%20M1.078%2C14.043v-3.916l4.806-3.894l4.002%2C5.261l3.135-2.285l2.043%2C2.115v2.719H1.078z%22%2F%3E%3Cpath%20d%3D%22M10.982%2C7.017c1.098%2C0%2C1.988-0.892%2C1.988-1.987c0-1.095-0.891-1.987-1.988-1.987%20c-1.094%2C0-1.987%2C0.892-1.987%2C1.987C8.996%2C6.125%2C9.889%2C7.017%2C10.982%2C7.017z%20M10.982%2C3.949c0.598%2C0%2C1.082%2C0.485%2C1.082%2C1.081%20c0%2C0.596-0.484%2C1.08-1.082%2C1.08c-0.596%2C0-1.078-0.484-1.078-1.08C9.904%2C4.434%2C10.387%2C3.949%2C10.982%2C3.949z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="specialCharacter" aria-label="특수문자"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M14.711%2C8.949c-0.248%2C0.689-0.578%2C1.309-0.992%2C1.857c-0.428%2C0.549-0.916%2C1.02-1.465%2C1.416%20c-0.549%2C0.391-1.133%2C0.688-1.75%2C0.885v0.887h3.604v1.982H9.809c-0.359%2C0-0.574-0.106-0.643-0.317%20c-0.07-0.211-0.105-0.442-0.105-0.694v-1.898c0-0.185%2C0.021-0.344%2C0.064-0.476c0.041-0.135%2C0.1-0.243%2C0.166-0.327%20c0.055-0.1%2C0.104-0.168%2C0.156-0.213c0.051-0.039%2C0.086-0.068%2C0.104-0.083c1.252-0.239%2C2.207-0.809%2C2.867-1.71%20c0.66-0.9%2C0.992-2.089%2C0.992-3.566c0-1.617-0.494-2.911-1.479-3.882c-0.988-0.97-2.287-1.457-3.899-1.457%20c-0.789%2C0-1.51%2C0.134-2.162%2C0.4C5.22%2C2.022%2C4.655%2C2.388%2C4.174%2C2.852C3.711%2C3.329%2C3.351%2C3.9%2C3.094%2C4.561%20C2.835%2C5.223%2C2.707%2C5.953%2C2.707%2C6.756c0%2C1.378%2C0.279%2C2.471%2C0.837%2C3.282c0.558%2C0.81%2C1.403%2C1.422%2C2.534%2C1.844%20c0.311%2C0.03%2C0.536%2C0.132%2C0.684%2C0.308c0.146%2C0.179%2C0.242%2C0.361%2C0.295%2C0.563c0.053%2C0.209%2C0.078%2C0.402%2C0.078%2C0.579%20c0%2C0.176%2C0%2C0.271%2C0%2C0.285c0%2C0.026%2C0%2C0.137%2C0%2C0.325c0%2C0.189-0.01%2C0.397-0.025%2C0.621c0%2C0.24-0.01%2C0.459-0.025%2C0.654%20c-0.019%2C0.197-0.035%2C0.311-0.051%2C0.338c-0.053%2C0.129-0.121%2C0.229-0.207%2C0.307c-0.084%2C0.078-0.205%2C0.115-0.361%2C0.115h-4.47%20v-1.98h3.623v-0.822c-1.358-0.406-2.472-1.152-3.348-2.236c-0.873-1.084-1.31-2.462-1.31-4.139%20c0-0.915%2C0.171-1.779%2C0.514-2.594C1.815%2C3.386%2C2.304%2C2.668%2C2.939%2C2.05C3.573%2C1.432%2C4.324%2C0.939%2C5.19%2C0.572%20c0.866-0.364%2C1.813-0.549%2C2.845-0.549c1.028%2C0%2C1.975%2C0.174%2C2.842%2C0.519c0.865%2C0.345%2C1.607%2C0.82%2C2.227%2C1.424%20s1.102%2C1.311%2C1.453%2C2.119c0.354%2C0.811%2C0.527%2C1.686%2C0.527%2C2.628C15.084%2C7.516%2C14.959%2C8.262%2C14.711%2C8.949z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="link" aria-label="링크"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M10.76%2C9.406L6.615%2C5.262l5.256-5.255l4.145%2C4.143L10.76%2C9.406z%20M8.455%2C5.262l2.305%2C2.306l3.418-3.418%20l-2.307-2.305L8.455%2C5.262z%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpath%20d%3D%22M4.171%2C15.993L0.027%2C11.85l5.24-5.24l4.145%2C4.145L4.171%2C15.993z%20M1.866%2C11.85l2.305%2C2.308l3.403-3.4%20L5.267%2C8.449L1.866%2C11.85z%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%227.485%22%20y%3D%224.296%22%20transform%3D%22matrix(0.7007%200.7135%20-0.7135%200.7007%208.1429%20-3.4098)%22%20width%3D%221.3%22%20height%3D%227.409%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="unlink" aria-label="링크 해제"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpolygon%20points%3D%2210.982%2C9.141%2010.063%2C8.22%2014.084%2C4.201%2011.818%2C1.938%207.8%2C5.958%206.88%2C5.039%2011.818%2C0.101%2015.92%2C4.201%20%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%224.221%2C15.898%200.121%2C11.798%205.06%2C6.859%205.979%2C7.778%201.959%2C11.798%204.221%2C14.063%208.242%2C10.041%209.162%2C10.961%20%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.992%22%20y%3D%221.923%22%20width%3D%221%22%20height%3D%222.151%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%222.799%22%20y%3D%223.336%22%20transform%3D%22matrix(0.7071%200.7071%20-0.7071%200.7071%203.8472%20-1.6152)%22%20width%3D%222.149%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%221.868%22%20y%3D%226.039%22%20width%3D%222.151%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%229.068%22%20y%3D%2211.998%22%20width%3D%221%22%20height%3D%222.15%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%2211.107%22%20y%3D%2211.535%22%20transform%3D%22matrix(0.7071%200.7071%20-0.7071%200.7071%2012.0781%20-5.0887)%22%20width%3D%222.149%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%2212.039%22%20y%3D%228.989%22%20width%3D%222.15%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="horizontalLine" aria-label="가로줄"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%220.021%22%20y%3D%226.044%22%20width%3D%2216%22%20height%3D%224.013%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="table" aria-label="표"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cpath%20d%3D%22M10.973%2C0.029h-0.855H5.925H5.069H0.021v5.03v0.856v4.17v0.856v5.029h5.048h0.856h4.192h0.855h5.049%20v-5.029v-0.856v-4.17V5.059v-5.03H10.973z%20M6.026%2C0.985h4.091v3.974H6.026V0.985z%20M10.117%2C9.984H6.026V5.915h4.091V9.984z%20M0.978%2C0.985h4.091v3.974H0.978V0.985z%20M0.978%2C5.915h4.091v4.069H0.978V5.915z%20M5.069%2C15.016H0.978v-4.072h4.091V15.016z%20M10.117%2C15.016H6.026v-4.072h4.091V15.016z%20M15.064%2C15.016h-3.99v-4.072h3.99V15.016z%20M15.064%2C9.984h-3.99V5.915h3.99V9.984z%20M11.074%2C4.959V0.985h3.99v3.974H11.074z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><div class="se-separator-vert"></div><button type="button" class="se-button se-clickable" name="undo" aria-label="실행취소"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M9.903%2C4.253C9.268%2C4.107%2C8.488%2C4.062%2C8.084%2C4.086V1.832L3.063%2C5.368l5.022%2C3.539V6.417%20c2.462%2C0.298%2C2.889%2C2.689%2C1.54%2C5.195c-0.563%2C1.048-1.434%2C1.924-2.441%2C2.556c1.707-0.53%2C4.448-1.602%2C5.315-3.213%20C13.904%2C8.348%2C12.561%2C4.867%2C9.903%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><button type="button" class="se-button se-clickable" name="redo" aria-label="다시 실행"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M6.224%2C4.253c0.636-0.146%2C1.415-0.191%2C1.819-0.167V1.832l5.022%2C3.536L8.042%2C8.906V6.417%20c-2.462%2C0.298-2.889%2C2.689-1.54%2C5.195c0.564%2C1.048%2C1.434%2C1.924%2C2.441%2C2.556c-1.707-0.53-4.447-1.602-5.315-3.213%20C2.223%2C8.348%2C3.566%2C4.867%2C6.224%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><div class="se-separator-vert"></div><button type="button" class="se-button se-clickable se-hidden" name="source" aria-label="소스 보기"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M-0.093%2C8.561v-0.98l5.095-3.459V5.41L1.434%2C8.065l3.568%2C2.667v1.287L-0.093%2C8.561z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M9.51%2C2.037L6.885%2C14.178H5.973L8.588%2C2.037H9.51z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M16%2C8.561l-4.994%2C3.458v-1.285l3.566-2.668L11.006%2C5.41V4.122L16%2C7.581V8.561z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div></button></div>
            <div class="se-next se-clickable"><div class="se-navi-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div></div>
        </div></div><div class="se-ruler se-hide"><div class="se-ruler-container"><div class="se-ruler-background" style="left: 23px; right: 23px; width: calc(100% - 46px);"></div><div class="se-ruler-division-container"></div><div class="se-handler-container"><div class="se-handler se-margin-left" style=" background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC);"><div class="se-handler se-both" style="background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAFCAIAAAAYMVE8AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjYxNjE3NzVDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjYxNjE3NzZDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCNjE2MTc3M0M4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCNjE2MTc3NEM4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsXs/bMAAAAnSURBVHjaYpk2bRoDDsACxHFxcZgSixYtYmLADfDJsUC0Y5UDCDAAPYIGueXq3bYAAAAASUVORK5CYII=);"></div></div><div class="se-handler se-margin-right" style=" background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC);"></div><div class="se-handler se-text-indent" style="background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTA2NDlGQzlDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTA2NDlGQ0FDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5MDY0OUZDN0M4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5MDY0OUZDOEM4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhG6GaUAAACjSURBVHjahJAxDgIhEEWBeBSPoNehsuEKa62FvWzPXdySUJFQaU2yDbGwQZxv2ASSNVIw89+8EIBrrQv7szbYpJQ/BWMME2hKWT9s4ZBm7/2qVPkMae+ce6aUOgEZnNqdUErdc87DNE2dhAxO84eo7BpjvIUQvgEVGXy5EyP7TeVgrX3RkKEiV854+7JxHAfO+YnYkYRz90/NupCwRW3hR4ABAOmdWnwZN/JjAAAAAElFTkSuQmCC);"></div></div></div><div class="se-ruler-guide se-hide"></div></div><div class="se-notification-wrapper"></div></div>
                <div class="se-main se-horz-scroll" style="height: calc(100% - 35px);"><div class="se-contents-edit" style="height: 465px;"><div class="se-contents" style="box-sizing: content-box; font-family: &quot;맑은 고딕&quot;; font-size: 16px; color: rgb(0, 0, 0); line-height: 1.6; padding: 18px 23px; margin: 0px; min-height: calc(100% - 36px);" data-document-padding-top="18" data-document-padding-left="23" data-document-padding-right="23"><div class="se-selection-wrapper"><div class="se-caret" style="left: 23px; top: 20px; height: 21px; border-left-color: rgb(0, 0, 0);"></div><div class="se-selections"></div></div><p id="se_ac4611d0-6cf5-4831-92a1-d119ad7cb9b9" style="margin: 0px; display: block; overflow-wrap: break-word;"><span id="se_d1ce0607-bafe-48d7-89c6-f88b00efd40d">​</span></p></div><div class="se-max-position-guide" style="width: 22px; height: 22px; top: 0px; left: 0px;"></div><div class="se-horizontal-guide" style="display: none;"></div><div class="se-vertical-guide" style="display: none;"></div><div class="se-resizable-selection" data-id=""><div class="se-rotation-handle"><div class="se-rotation-stick"></div><div class="se-rotation"></div></div><div class="se-resize-handle se-middle se-top"></div><div class="se-resize-handle se-middle se-bottom"></div><div class="se-resize-handle se-left se-top"></div><div class="se-resize-handle se-left se-middle" "=""></div><div class="se-resize-handle se-left se-bottom"></div><div class="se-resize-handle se-right se-top"></div><div class="se-resize-handle se-right se-middle"></div><div class="se-resize-handle se-right se-bottom"></div><div class="se-prop-btn"><svg viewBox="0 0 16 12"><path d="M8,9 L4 4 L12 4Z"></path></svg></div><div class="se-shape-adj"></div></div><div class="se-multi-selection"></div><div class="se-table-handler" table-id=""></div><div class="se-quick-insert-handler se-hide"><button type="button" class="se-quick-insert-btn se-clickable" aria-label="바로 삽입" style="min-width: 34px; height: 34px;"><div class="se-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2016%2017%22%3E%3Cpath%20d%3D%22M16%2010.0578H9.14286V16.9149H6.85714V10.0578H0V7.77206H6.85714V0.914917H9.14286V7.77206H16V10.0578Z%22%20%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div></button><div class="se-quick-insert-body se-hide"><div class="se-component-row se-use-navi" name="quickInsertBody">
            <div class="se-prev se-clickable se-rotate-180 se-shrink"><div class="se-navi-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div></div>
            <div class="se-component-wrapper"></div>
            <div class="se-next se-clickable se-shrink"><div class="se-navi-icon" style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div></div>
        </div></div></div><div class="se-ime-container" style="left: 23px; top: 36.8px;"><textarea class="se-ime"></textarea></div><div class="se-draw-board"><div class="se-draw-rect"></div></div></div>
                    <iframe class="se-contents-preview"></iframe>
                    <div class="se-code-viewer"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="layer_button">
        <button type="button" class="btn_variables" onclick="ApprovalSetting.saveApprovalRule();">등록</button>
    </div>
    <a href="javascript:void(0);" class="icon btn_closelayer" onclick="$j('#layerApprovalRule').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
	
	-->
	<!-- 양식함관리-사내 전자결재 규정 등록 모달 끝 -->

	<!-- 참조자 추가 모달 시작 -->
	<!-- 
	<div class="layer_box large hide" id="layerAddApprovalUser" style="margin-left: -351px; margin-top: -108px; display: block;">
	<div class="title_layer text_variables">참조자 추가</div>
	<table class="dialog-tabletype mgt_10">
		<caption></caption>
		<colgroup>
			<col style="width:20%">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th>참조자</th>
				<td id="addApprovalUserPart">
					<span><input type="text" class="txt-input bg js-complete ui-autocomplete-input" id="inputAddApprovalUser" style="width:114px" placeholder="클릭 후 입력" autocomplete="off"></span>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="layer_button">
				<button type="button" class="btn_variables" onclick="ApprovalSetting.batchManage('ADD_APPROVAL_USER', 'F', 'view');">확인</button>
				<button type="button" onclick="$j('#layerAddApprovalUser').hidePopup();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="$j('#layerAddApprovalUser').hidePopup();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
	 -->
	<!-- 참조자 추가 모달 시작 -->

	<!-- 관리자 권한 이력 관리 모달 시작 -->
	<!-- 
	<div class="hw-modal-wrap hide" id="layerApprovalManagerHistory" style="margin-left: -400px; margin-top: -173px; display: block;">
    <div class="hw-modal-header manager-header">관리자 권한 이력 관리</div>

    <div class="hw-modal-body manager-body">
        <table class="setting-table">
            <colgroup>
                <col>
                <col style="width:50%">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th class="th-border-right th-border-bottom">일시</th>
                <th class="th-border-right th-border-bottom">내용</th>
                <th class="th-border-bottom">권한 제공자</th>
            </tr>
            </thead>
            <tbody>
                                                <tr>
                        <td class="gt-text-center"><div class="padding-10">2023-12-03 00:18:03</div></td>
	                                                <td class="text-left"><div class="padding-10">박상무(park)의 전자결재 관리자 권한이 삭제되었습니다.</div></td>
	                    	                                                <td class="text-left"><div class="padding-10">전체 관리자 해제에 따른 권한 삭제</div></td>
	                                        </tr>
	                                <tr>
                        <td class="gt-text-center"><div class="padding-10">2023-12-03 00:17:57</div></td>
	                                                <td class="text-left"><div class="padding-10">박상무(park)의 전자결재 관리자 권한이 부여되었습니다.</div></td>
                        	                                                <td class="text-left"><div class="padding-10">전체 관리자 등록에 따른 권한 부여</div></td>
	                                        </tr>
	                                    </tbody>
        </table>
    </div>

    <div class="hw-modal-footer text-center">
        <button type="button" class="hw-button secondary" onclick="$j('#layerApprovalManagerHistory').hidePopup();">닫기</button>
    </div>
</div>
	
	 -->
	<!-- 관리자 권한 이력 관리 모달 끝 -->

	<!-- 결재 문서 백업 모달 시작 -->
	<!--  
	<div class="layer_box mid_large hide approval-backup-layer" id="approval_backup_layer" style="margin-left: -256px; margin-top: -260px; display: block;">
	<div class="title_layer text_variables">결재 문서 백업</div>
        <dl>
            <dt>기간 선택</dt>
            <dd class="after" style="padding:0 0 20px">
                <ul>
                    <li><label><input type="radio" checked="" name="backupselect" id="backup_all"> '결재 중' 전체 선택</label></li>
                    <li>
                        <label class="fl"><input type="radio" name="backupselect" id="backup_part"></label>
                        <select class="fl mgl_5" id="select_auto_date">
    	                    <option value="1" selected="">1개월</option>
    	                    <option value="6">6개월</option>
    	                    <option value="12">1년</option>
    	                    <option value="self">직접입력</option>
    	                </select>
    	                <div class="fl mgl_5">
    		                <input type="text" style="width:100px" id="self_start_date">
    		                <button type="button" class="icon month" id="self_start_date_icon"><span class="blind">최초일 선택</span></button> ~
    		                <input type="text" style="width:100px" id="self_end_date">
    		                <button type="button" class="icon month" id="self_end_date_icon"><span class="blind">마지막일 선택</span></button>
    		            </div>
    				</li>
                </ul>
            </dd>
            <dt>기안자</dt>
            <dd class="after">
                <ul>
                    <li>
                        <input type="radio" name="registerSelect" id="backupAllRegister" checked=""> 전체                        <input type="radio" name="registerSelect" id="backupSelectedRegister" style="margin-left:25px;"> 선택                        <input type="text" class="js-complete mgl_10 ui-autocomplete-input" placeholder="클릭 후 입력" maxlength="20" id="inputRegisterName" autocomplete="off">
                        <span class="hide" id="textRegisterName"></span>
                        <button class="weakblue mgl_20 vt hide" id="modifyRegisterName" onclick="ApprovalBackup.setRegisterName('', '', true);">변경</button>
                    </li>
                </ul>
            </dd>
            <dd>
                <ul class="backup-txt">
    				<li>파일은 브라우저상에서 바로 확인할 수 있는 Html 형식으로<br>&nbsp;&nbsp;&nbsp; 제공됩니다.</li>
                </ul>
            </dd>
        </dl>
        
        <dl>
            <dt>백업 안내 메일 주소</dt>
            <dd>
                <ul>
                    <li><input type="text" id="user_email_id" value=""> @
                    <input type="text" id="user_email_domain" value=""></li>
                    <li>
                        <label>
                            <input type="checkbox" id="checkbox_user_info_modify">
							인사 정보 동시 수정                        </label>
                    </li>
                </ul>

            </dd>
        </dl>

	<div class="layer_button">
		<button type="button" class="btn_variables" onclick="ApprovalBackup.requestBackup('I');">확인</button> <button type="button" onclick="ApprovalBackup.hideBackupLayer();">취소</button>
	</div>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="ApprovalBackup.hideBackupLayer();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
	
	-->
	<!-- 결재 문서 백업 모달 끝 -->


	<!-- 결재 문서 백업 모달 시작 -->
	<!-- 
	<div class="layer_box large hide approval-backup-layer" id="approval_backup_layer" style="margin-left: -300px; margin-top: -234.5px; display: block;">
    <div class="title_layer text_variables">결재 문서 백업</div>
	<p>백업이 완료되어 파일을 다운로드할 수 있습니다.</p>
    <div class="box">
        <dl>
            <dt>문서 구분: </dt>
            <dd>결재 완료</dd>
        </dl>
        <dl>
            <dt>백업 기간: </dt>
            <dd>전체</dd>
        </dl>
        <dl>
            <dt>기안자: </dt>
            <dd>전체</dd>
        </dl>
        <dl>
            <dt>요청 시각: </dt>
            <dd>2023-12-03 10:36:06</dd>
        </dl>
        <dl>
            <dt>용량: </dt>
            <dd>약 392.40KB</dd>
        </dl>
    </div>
	<div class="layer_button">
		        <button type="button" class="btn_variables" onclick="Common.Download('https://download.office.hiworks.com/gabia.biz/download/approval_backup/53824', this)">다운로드</button>
                <button type="button" onclick="ApprovalBackup.expireBackup('50959', 'DELETE');">삭제</button>
	</div>
    <ul class="backup-comment">
        <li>ㆍ[다운로드] 버튼을 눌러서 백업 파일을 받으세요.</li>
        <li>ㆍ[삭제]를 클릭하면, 다운로드 버튼이 사라지며, 수집된 백업 파일은 삭제됩니다.</li>
        <li>ㆍ문서가 많을 때는 1,000건씩 나누어 다운로드 버튼이 나타납니다.</li>
    </ul>
	<a href="javascript:void(0)" class="icon btn_closelayer" onclick="ApprovalBackup.hideBackupLayer();" title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
</div>
	 -->
	<!-- 결재 문서 백업 모달 끝 -->

	<!-- 완전 삭제 이력 모달 시작 -->
	<!-- 
	<div class="hw-modal-wrap delete-document hide" id="layerDeletedApprovalDocumentHistory" style="margin-left: -600px; margin-top: -139.5px; display: block;">
    <div class="hw-modal-header delete-document-header">
	    완전 삭제 이력        <a href="javascript:void(0)" class="icon question tipsIcon" style="float: none; position: relative;top:3px;;margin-left:10px"><span class="blind">세부 설명</span></a>
        <div class="tooltip hide" style="left:50px;top:-13px;">
            <div class="tooltip-box color-set-6" style="width:400px;">
                <p>[삭제 문서 목록]에서 문서를 완전 삭제하면 이곳에 이력이 남습니다. <br>최근 3개월 간의 완전 삭제 이력만 확인 가능합니다. <br>• 삭제한 사용자: 문서를 완전 삭제한 사용자의 이름과 ID입니다. <br>• 사용자 IP: 문서를 완전 삭제한 사용자가 삭제 시점에 접속했던 IP입니다.</p>
            </div>
        </div>
    </div>
    
    <div class="hw-modal-body delete-document-body">
        <table class="setting-table">
            <colgroup>
                <col style="width:18%">
                <col style="width:22%">
                <col style="width:10%">
                <col style="width:14%">
                <col style="width:10%">
                <col style="width:12%">
                <col style="width:14%">
            </colgroup>
            <thead>
            <tr>
                <th class="th-border-right th-border-bottom">문서 번호</th>
                <th class="th-border-right th-border-bottom">제목</th>
                <th class="th-border-right th-border-bottom">기안자</th>
                <th class="th-border-right th-border-bottom">기안일시</th>
                <th class="th-border-right th-border-bottom">삭제한 사용자</th>
                <th class="th-border-right th-border-bottom">사용자 IP</th>
                <th class="th-border-bottom">완전 삭제일시</th>
            </tr>
            </thead>
            <tbody>
            	            <tr>
                    <td colspan="7" class="gt-text-center color-999">완전 삭제 이력이 없습니다.</td>
                </tr>
                        </tbody>
        </table>
    </div>

    <div class="hw-modal-footer text-center">
        <button type="button" class="hw-button secondary" onclick="$j('#layerDeletedApprovalDocumentHistory').hidePopup();">닫기</button>
    </div>
</div>
	 -->
	<!-- 완전 삭제 이력 모달 시작 -->
</body>
</html>