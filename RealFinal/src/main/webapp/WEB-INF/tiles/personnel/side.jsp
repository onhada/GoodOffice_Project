<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<script>
	$(document).ready(
			function() {
				if ('${requestScope.type}' != '') {
					$('a#' + '${requestScope.type}').addClass(
							'router-link-exact-active router-link-active');
				}

				$("div.cookie_personnel_menu_first").click(function() {

					$("div.wrap_menu_first").slideToggle();

					if ($("i.myWork").hasClass("fa-chevron-up")) {
						$("i.myWork").removeClass("fa-chevron-up");
						$("i.myWork").addClass("fa-chevron-down");
					} else {
						$("i.myWork").removeClass("fa-chevron-down");
						$("i.myWork").addClass("fa-chevron-up");
					}

				})

				$("div.cookie_personnel_menu_second").click(function() {
					$("div.wrap_menu_second").slideToggle();

					if ($("i.personnelSet").hasClass("fa-chevron-up")) {
						$("i.personnelSet").removeClass("fa-chevron-up");
						$("i.personnelSet").addClass("fa-chevron-down");
					} else {
						$("i.personnelSet").removeClass("fa-chevron-down");
						$("i.personnelSet").addClass("fa-chevron-up");
					}
				})

			});
</script>


<div class="split-item left" style="width: 276px;">
	<div data-v-3c987196="" class="sidebar" style="f616: #f7faff; --3 fa7187a: rgba(41, 133, 219, 0.1); - -be93eab8: #056ac9;">
		<div data-v-3c987196="" class="fixed-area top">
			<a data-v-3c987196="" id="vactionside" href="<%=ctxPath%>/personnel/personal_vaction_application.gw" class="main-button mb-20">
				<i data-v-3c987196="" class="far fa-plus mr-8"></i>
				<span data-v-3c987196="" class="flex-truncate">휴가 신청</span>
			</a>
		</div>
		<hr data-v-3c987196="">
		<div data-v-3c987196="" class="vb vb-visible" style="width: auto; height: calc(100% - 135px); position: relative; overflow: hidden;">
			<div class="vb-content" style="display: block; overflow: hidden scroll; height: 100%; width: calc(100% + 8px);">
				<nav data-v-3c987196="" class="menu-container">
					<div data-v-3c987196="" role="tablist" aria-multiselectable="true" class="el-collapse mt-8">
						<div data-v-318760de="" data-v-3c987196="" class="el-collapse-item is-active">
							<div role="tab" aria-expanded="true" aria-controls="el-collapse-content-6849" aria-describedby="el-collapse-content-6849">
								<div role="button" id="el-collapse-head-6849" tabindex="0" class="el-collapse-item__header is-active cookie_personnel_menu_first">
									<span data-v-318760de="" class="collapse-title-wrapper menu-item">
										<i data-v-318760de="" class="fal fa-chevron-down collapse-prefix-icon myWork"></i>
										<span data-v-318760de="" class="collapse-title">내 근무</span>
									</span>
									<i class="el-collapse-item__arrow el-icon-arrow-right is-active"></i>
								</div>
							</div>
							<div role="tabpanel" aria-labelledby="el-collapse-head-6849" id="el-collapse-content-6849" class="el-collapse-item__wrap wrap_menu_first">
								<div class="el-collapse-item__content">
									<a data-v-318760de="" id="workside" href="<%=ctxPath%>/personnel/personal_index.gw" class="menu-item sub">
										<i data-v-318760de="" class="gis gi-calendar link-prefix-icon"></i>
										<span data-v-318760de="">휴가/근무</span>
									</a>
									<!-- <a data-v-318760de="" href="https://hr-work.office.hiworks.com/personal/statistics" class="menu-item sub">
										<i data-v-318760de="" class="gis gi-calendar-6dot link-prefix-icon"></i>
										<span data-v-318760de="">근무 현황</span>
									</a>
									<a data-v-318760de="" href="https://hr-work.office.hiworks.com/personal/department-status" class="menu-item sub">
										<i data-v-318760de="" class="gis gi-chart-bar link-prefix-icon"></i>
										<span data-v-318760de="">부서 근무 현황</span>
									</a> -->
								</div>
							</div>
						</div>
					</div>
					<a data-v-3c987196="" id="payAnnualList" href="<%=ctxPath%>/personnel/payAnnualList.gw" class="menu-item mt-8">
						<span data-v-3492dd16="" data-v-3c987196="" class="link-prefix-icon" style="e9135: #909090;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
						      <path data-name="제외 6" d="M11367.189 23493h-9.375a2.816 2.816 0 0 1-2.812-2.812 8.333 8.333 0 0 1 2-5.508 13.765 13.765 0 0 1 3.245-2.682c.13-.086.246-.16.358-.23l.024-.016h3.75a3.656 3.656 0 0 1 .354.246 13.518 13.518 0 0 1 3.269 2.682 8.311 8.311 0 0 1 2 5.508 2.816 2.816 0 0 1-2.813 2.812zm-4.687-5.389 1.037 2.51a.493.493 0 0 0 .459.313h.03a.507.507 0 0 0 .454-.371l.4-1.451a.859.859 0 0 0 .118.012h.5a.5.5 0 1 0 0-1h-.348l.33-1.191a.5.5 0 0 0-.354-.611.466.466 0 0 0-.13-.02.5.5 0 0 0-.483.367l-.613 2.229-.943-2.289a.5.5 0 0 0-.926 0l-.943 2.289-.613-2.229a.491.491 0 0 0-.474-.367.507.507 0 0 0-.14.02.491.491 0 0 0-.348.611l.33 1.191h-.348a.5.5 0 1 0 0 1h.5a.6.6 0 0 0 .1-.01h.015l.395 1.451a.521.521 0 0 0 .454.371h.029a.511.511 0 0 0 .466-.312l1.037-2.51zm1.875-6.8h-3.75l-1.392-2.088a.454.454 0 0 1-.022-.475.459.459 0 0 1 .412-.25h5.748a.462.462 0 0 1 .418.252.449.449 0 0 1-.028.473l-1.386 2.086z" transform="translate(-11354.502 -23477.5)" style="fill:#909090;"></path>
						    </svg>
						</span>
						<span data-v-3c987196="" class="collapse-title">급여</span>
					</a>

					<!---->
					<!---->
					<hr data-v-3c987196="" class="mt-18 mb-18">
					
					
					<c:if test="${not empty sessionScope.loginUser && (sessionScope.loginUser.adminType eq 'Personnel' || sessionScope.loginUser.adminType eq 'All')}">
						<div data-v-3c987196="" role="tablist" aria-multiselectable="true" class="el-collapse">
							<div data-v-318760de="" data-v-3c987196="" class="el-collapse-item mt-8 is-active">
								<div role="tab" aria-expanded="true" aria-controls="el-collapse-content-1636" aria-describedby="el-collapse-content-1636">
									<div role="button" id="el-collapse-head-1636" tabindex="0" class="el-collapse-item__header is-active cookie_personnel_menu_second">
										<span data-v-318760de="" class="collapse-title-wrapper menu-item">
											<i data-v-318760de="" class="fal fa-chevron-down collapse-prefix-icon personnelSet"></i>
											<span data-v-318760de="" class="collapse-title">인사설정</span>
										</span>
										<i class="el-collapse-item__arrow el-icon-arrow-right is-active"></i>
									</div>
								</div>
								<div role="tabpanel" aria-labelledby="el-collapse-head-1636" id="el-collapse-content-1636" class="el-collapse-item__wrap wrap_menu_second">
									<div class="el-collapse-item__content">
										<a data-v-318760de="" id="approvalForms" href="<%=ctxPath%>/personnel/approvalForms.gw" class="menu-item sub">
											<i data-v-318760de="" class="gis gi-approval-setting link-prefix-icon"></i>
											<span data-v-318760de="">결재양식</span>
										</a>
										<a data-v-318760de="" id="insaManager" href="<%=ctxPath%>/personnel/insaManager.gw" class="menu-item sub">
											<i data-v-318760de="" class="gis gi-user-cog link-prefix-icon"></i>
											<span data-v-318760de="">인사관리자</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.loginUser && (sessionScope.loginUser.adminType eq 'Personnel' || sessionScope.loginUser.adminType eq 'All')}">

						<a data-v-3c987196="" id="payrollSetting" href="<%=ctxPath%>/personnel/payrollSetting.gw" class="menu-item mt-8">
							<span data-v-3492dd16="" data-v-3c987196="" class="link-prefix-icon" style="e9135: #909090;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
					    <path data-name="제외 3" d="M11369 23490h-13a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h13a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1zm-11.8-3a.2.2 0 0 0-.2.2v.6a.2.2 0 0 0 .2.2h10.594a.2.2 0 0 0 .2-.2v-.6a.2.2 0 0 0-.2-.2H11361v-2h6.792a.2.2 0 0 0 .2-.2v-.6a.2.2 0 0 0-.2-.2H11361v-2h6.792a.2.2 0 0 0 .2-.2v-.6a.2.2 0 0 0-.2-.2h-10.592a.2.2 0 0 0-.2.2v.6a.2.2 0 0 0 .2.2h2.8v2h-2.8a.2.2 0 0 0-.2.2v.6a.2.2 0 0 0 .2.2h2.8v2zm0-10a.2.2 0 0 0-.2.2v.6a.2.2 0 0 0 .2.2h3.6a.2.2 0 0 0 .2-.2v-.6a.2.2 0 0 0-.2-.2z" transform="translate(-11354.502 -23474.504)" style="fill:#909090"></path>
					  </svg>
							</span>
							<span data-v-3c987196="" class="collapse-title">급여대장</span>
						</a>
					</c:if>


					<!---->
					<!---->
				</nav>
			</div>
			<div class="vb-dragger" style="position: absolute; height: 716px; top: 0px;">
				<div class="vb-dragger-styler"></div>
			</div>
		</div>
	</div>
</div>