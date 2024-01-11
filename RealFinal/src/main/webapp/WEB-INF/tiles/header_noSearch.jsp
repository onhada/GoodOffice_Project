<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

$(document).ready(function(){
  
	<%-- 카테고리 항목 보여주기 --%> 	
	$(".menu-btns").click(function(){
		if($("div#categoryList").attr("style") == "display: none;"){
			$("div#categoryList").attr("style", "display: block;");
		}
		else if($("div#categoryList").attr("style") == "display: block;"){
			$("div#categoryList").attr("style", "display: none;");
		}
		
	});
	
	
});// end of $(document).ready(function(){})--------------



// Function Declaration
<%-- 나의 프로필 보여주기 --%> 
function myProfileView() {
	if($("div#profileDetail").attr("style")=='display: none;'){
		$("div#profileDetail").css("display", "block");  
	}
	else if($("div#profileDetail").attr("style")=='display: block;'){
		$("div#profileDetail").css("display", "none");  
	}
 }// end of function myProfileView()--------------------------
  
</script>





<div id="gnb-root">
	<div data-v-3a88b4b3="" class="new_gnb">

		<header data-v-3a88b4b3="" class="new_header">
			<div data-v-3a88b4b3="" class="header-item header-item__left">
				<div data-v-87615cf4="" data-v-3a88b4b3="" class="logo hiworks_logo">
					<h1 data-v-87615cf4="">
						<a data-v-87615cf4="" href="<%= ctxPath%>/index/index.gw" class="gt-d-flex">
							<svg data-v-87615cf4="" xmlns="http://www.w3.org/2000/svg" width="74.402" height="16" viewBox="0 0 74.402 16">
								<g data-v-87615cf4="" id="그룹_58223" data-name="그룹 58223" transform="translate(-90.202 -332.509)">
								<path data-v-87615cf4="" id="패스_5437" data-name="패스 5437" d="M90.2,332.509h2.4v7.121a5.781,5.781,0,0,1,.559-.7,3.631,3.631,0,0,1,1.589-.993,3.684,3.684,0,0,1,1.089-.149,3.458,3.458,0,0,1,2.728,1.083,4.228,4.228,0,0,1,.961,2.912v6.613h-2.4V342.5a2.759,2.759,0,0,0-.575-1.875,2.048,2.048,0,0,0-1.629-.658,2.209,2.209,0,0,0-1.678.678,2.639,2.639,0,0,0-.644,1.894v5.851H90.2Z" transform="translate(0 0)" fill="#0080dd"></path>
								<path data-v-87615cf4="" id="패스_5438" data-name="패스 5438" d="M109.657,341.166h2.4v10.391h-2.4Z" transform="translate(-7.116 -3.166)" fill="#0080dd"></path>
								<path data-v-87615cf4="" id="패스_5439" data-name="패스 5439" d="M116.95,341.019h2.44l2.086,7.124,2.3-7.164h2.027l2.322,7.164,2.126-7.124h2.381l-3.4,10.47H127.1l-2.323-7.1-2.342,7.1h-2.125Z" transform="translate(-9.784 -3.098)" fill="#0080dd"></path>
								<path data-v-87615cf4="" id="패스_5440" data-name="패스 5440" d="M177.755,332.509h2.4v10.1l4.31-4.605h2.893l-4.133,4.232,4.271,6.16h-2.756l-3.129-4.487-1.456,1.516v2.971h-2.4Z" transform="translate(-32.024 0)" fill="#0080dd"></path>
								<path data-v-87615cf4="" id="패스_5441" data-name="패스 5441"
									d="M196.172,348.7a5.528,5.528,0,0,0,1.214.594,4.823,4.823,0,0,0,1.683.325,2.016,2.016,0,0,0,1.191-.3.955.955,0,0,0,.423-.814v-.039a.756.756,0,0,0-.187-.511,1.565,1.565,0,0,0-.512-.373,5.97,5.97,0,0,0-.748-.295q-.423-.137-.876-.275-.571-.157-1.151-.373a4.18,4.18,0,0,1-1.043-.56,2.786,2.786,0,0,1-.757-.854,2.469,2.469,0,0,1-.3-1.256v-.039a2.976,2.976,0,0,1,.285-1.315,2.944,2.944,0,0,1,.787-1,3.522,3.522,0,0,1,1.181-.628,4.747,4.747,0,0,1,1.447-.216,6.541,6.541,0,0,1,1.988.318,9.074,9.074,0,0,1,2.066,1.006L201.5,343.55a6.06,6.06,0,0,0-1.334-.612,4.361,4.361,0,0,0-1.417-.266,1.728,1.728,0,0,0-1.072.294.9.9,0,0,0-.384.746v.039a.676.676,0,0,0,.2.481,1.95,1.95,0,0,0,.521.373,5.833,5.833,0,0,0,.748.314q.423.147.876.285.571.177,1.142.412a4.772,4.772,0,0,1,1.033.58,2.886,2.886,0,0,1,.758.835,2.283,2.283,0,0,1,.295,1.2v.039a3.254,3.254,0,0,1-.295,1.433,2.809,2.809,0,0,1-.817,1.012,3.66,3.66,0,0,1-1.23.608,5.4,5.4,0,0,1-1.516.206,6.932,6.932,0,0,1-2.273-.4,8.148,8.148,0,0,1-1.924-.958Z"
									transform="translate(-38.263 -3.019)" fill="#0080dd"
								></path>
								<path data-v-87615cf4="" id="패스_5442" data-name="패스 5442" d="M148.234,343.133a2.992,2.992,0,1,1-2.992,2.992,3,3,0,0,1,2.992-2.992m0-2.4a5.392,5.392,0,1,0,5.392,5.392,5.392,5.392,0,0,0-5.392-5.392Z" transform="translate(-19.254 -3.008)" fill="#0080dd"></path>
								<path data-v-87615cf4="" id="패스_5443" data-name="패스 5443" d="M168.975,343.668a2.048,2.048,0,0,0-1.629-.658,2.21,2.21,0,0,0-1.678.678,2.64,2.64,0,0,0-.644,1.894v5.851h-2.4V341.045h2.4v1.627a5.783,5.783,0,0,1,.559-.7,3.662,3.662,0,0,1,.706-.586,3.623,3.623,0,0,1,.883-.407,3.687,3.687,0,0,1,1.089-.149,3.456,3.456,0,0,1,2.728,1.083l-1.855,1.965Z" transform="translate(-26.489 -3.042)" fill="#0080dd"></path>
								<path data-v-87615cf4="" id="패스_5444" data-name="패스 5444" d="M109,334.13a1.618,1.618,0,1,1,1.617,1.62A1.618,1.618,0,0,1,109,334.13Z" transform="translate(-6.876 0)" fill="#0080dd" fill-rule="evenodd"></path></g></svg>
						</a>
					</h1>
				</div>

				<div data-v-236a7242="" data-v-3a88b4b3="" class="menu-btns">
					
					<div data-v-236a7242="" class="menu-btns-toggle">
						<c:if test="${requestScope.headerManage eq 'Index'}">
							<span data-v-236a7242="" class="btn-main">홈</span>
						</c:if>
						<c:if test="${requestScope.headerManage eq 'Mail'}">
							<span data-v-236a7242="" class="btn-main">사내메일</span>
						</c:if>
						<c:if test="${requestScope.headerManage eq 'Reservation'}">
							<span data-v-236a7242="" class="btn-main">예약</span>
						</c:if>
						<c:if test="${requestScope.headerManage eq 'Organization'}">
							<span data-v-236a7242="" class="btn-main">조직</span>
						</c:if>
						<c:if test="${requestScope.headerManage eq 'Personnel'}">
							<span data-v-236a7242="" class="btn-main">인사</span>
						</c:if>
						<c:if test="${requestScope.headerManage eq 'Admin'}">
							<span data-v-236a7242="" class="btn-main">오피스 관리</span>
						</c:if>

						<svg data-v-236a7242="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-down" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" class="svg-inline--fa fa-caret-down fa-w-10">
							<path data-v-236a7242="" fill="currentColor" d="M31.3 192h257.3c17.8 0 26.7 21.5 14.1 34.1L174.1 354.8c-7.8 7.8-20.5 7.8-28.3 0L17.2 226.1C4.6 213.5 13.5 192 31.3 192z" class=""></path>
						</svg>
					</div>

					<div data-v-5663e23e="">
						<div data-v-76121c5a="" data-v-5663e23e="" class="newmenu_ly newmenu-layer" id="categoryList" style="display: none;">
							<div data-v-76121c5a="" class="newmenu-head">
								<button data-v-76121c5a="" type="button" class="show-totalmenu">
									전체메뉴 <i data-v-76121c5a="" class="gi gi-short-arrow-right-alt gt-ml-5"></i>
								</button>
							</div>
							<div data-v-76121c5a="" class="newmenu-body gt-clearfix">
								<div data-v-76121c5a="" class="service-menu gt-clearfix">
									<ul data-v-76121c5a="" class="service-menu-list">
										<li data-v-76121c5a="" class="service-menu-link-wrap">
											<a data-v-76121c5a="" href="<%= ctxPath%>/mail/mailList.gw" target="_self" class="service-menu-link">
												<span data-v-76121c5a="" class="svg-span">
													<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="14" viewBox="0 0 18 14">
														<g>
														<path class="svg-hover-color" fill="#5b6164" d="M58.012 54.462H41.3a.639.639 0 0 1-.643-.637V41.1a.639.639 0 0 1 .641-.637h16.714a.64.64 0 0 1 .643.637v12.726a.64.64 0 0 1-.643.636zm-16.071-1.271h15.428V41.734H41.94z" transform="translate(-171 -133) translate(130.345 92.538)"></path>
														<path fill="#4e9bd4" d="M49.589 48.7a1.49 1.49 0 0 1-.818-.244l-4.911-3.627a.612.612 0 0 1-.16-.863.642.642 0 0 1 .882-.155l.04.029 4.883 3.6a.221.221 0 0 0 .218-.02l4.851-3.584a.641.641 0 0 1 .885.122.609.609 0 0 1-.124.867l-4.881 3.606a1.578 1.578 0 0 1-.865.269z" transform="translate(-171 -133) translate(130.235 92.425)"></path></g></svg>
												</span>
												<span data-v-76121c5a="" class="link-name">사내메일</span>
											</a>
										</li>
										<li data-v-76121c5a="" class="service-menu-link-wrap">
											<a data-v-76121c5a="" href="<%= ctxPath%>/reservation/myReservationList.gw" target="_self" class="service-menu-link">
												<span data-v-76121c5a="" class="svg-span">
													<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
														<g transform="translate(-796 -271)">
														<path class="svg-hover-color" d="M711,663.2a7.8,7.8,0,1,1-7.8,7.8,7.809,7.809,0,0,1,7.8-7.8m0-1.2a9,9,0,1,0,9,9,9,9,0,0,0-9-9Z" transform="translate(94 -391)" fill="#5b6164"></path>
														<path class="svg-hover-color" d="M720.792,680.792a.574.574,0,0,1-.809.039l-3.854-3.854a.6.6,0,0,1,.848-.848l3.854,3.854A.574.574,0,0,1,720.792,680.792Z" transform="translate(88.408 -396.592)" fill="#4e9bd4"></path>
														<path class="svg-hover-color" d="M716.6,669a.6.6,0,0,1,.6.6v4.2a.6.6,0,0,1-1.2,0v-4.2A.6.6,0,0,1,716.6,669Z" transform="translate(88.4 -393.8)" fill="#4e9bd4"></path></g></svg>
												</span>
												<span data-v-76121c5a="" class="link-name">예약</span>
											</a>
										</li>
										<li data-v-76121c5a="" class="service-menu-link-wrap">
											<a data-v-76121c5a="" href="<%= ctxPath%>/personnel/personal_index.gw" target="_self" class="service-menu-link">
												<span data-v-76121c5a="" class="svg-span">
													<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18.273" viewBox="0 0 18 18.273">
														<g transform="translate(-591 -778.727)">
														<rect fill="none" width="18" height="18" transform="translate(591 779)"></rect>
														<path class="svg-hover-color" fill="#5b6164" d="M149.749,589.489H135.444a.625.625,0,0,1-.6-.651V571.92a.625.625,0,0,1,.6-.651h14.305a.625.625,0,0,1,.6.651v16.918A.625.625,0,0,1,149.749,589.489Zm-13.709-1.3h13.113V572.57H136.04Z" transform="translate(458.582 207.458)"></path>
														<path fill="#4e9bd4" d="M142.334,582.358h-2.083c-.221,0-.4-.291-.4-.651s.179-.651.4-.651h2.083c.221,0,.4.292.4.651S142.555,582.358,142.334,582.358Z" transform="translate(1181.972 642.897) rotate(90)"></path>
														<path fill="#4e9bd4" d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z" transform="translate(457.415 205.711)"></path>
														<path fill="#4e9bd4" d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z" transform="translate(457.415 208.711)"></path></g></svg>
												</span>
												<span data-v-76121c5a="" class="link-name">근태관리</span>
											</a>
										</li>
										<li data-v-76121c5a="" class="service-menu-link-wrap">
											<a data-v-76121c5a="" href="<%=ctxPath %>/personnel/payAnnualList.gw" target="_self" class="service-menu-link">
												<span data-v-76121c5a="" class="svg-span">
													<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
														<g transform="translate(-1081.986 -778.727)">
														<path class="svg-hover-color" d="M905.206 589.269h-16.714a.643.643 0 0 1-.643-.643v-16.714a.643.643 0 0 1 .643-.643h16.714a.643.643 0 0 1 .643.643v16.714a.643.643 0 0 1-.643.643zm-16.071-1.286h15.429v-15.428h-15.429z" fill="#5b6164" transform="translate(194.137 207.458)"></path>
														<path class="svg-hover-color" d="M893.454 587.662a.643.643 0 0 1-.455-1.1l10.286-10.286a.643.643 0 0 1 .924.894l-.016.015-10.286 10.286a.636.636 0 0 1-.453.191z" fill="#5b6164" transform="translate(192.365 205.739)"></path>
														<path class="svg-hover-color" d="M907.348 589.555h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z" fill="#4e9bd4" transform="translate(188.78 201.387)"></path>
														<path class="svg-hover-color" d="M907.348 593.56h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z" fill="#4e9bd4" transform="translate(188.78 199.956)"></path>
														<path class="svg-hover-color" d="M897.348 580.768h-3.857a.643.643 0 0 1 0-1.286h3.857a.643.643 0 0 1 0 1.286z" fill="#4e9bd4" transform="translate(192.351 204.525)"></path>
														<path class="svg-hover-color" d="M896.491 581.417a.643.643 0 0 1-.643-.643v-3.857a.643.643 0 1 1 1.286 0v3.857a.643.643 0 0 1-.643.643z" fill="#4e9bd4" transform="translate(191.28 205.671)"></path></g></svg>
												</span>
												<span data-v-76121c5a="" class="link-name">급여</span>
												<span data-v-76121c5a="" class="gt-badge" style="display: none;"> </span>
											</a>
										</li>
										<li data-v-76121c5a="" class="service-menu-link-wrap">
											<a data-v-76121c5a="" href="<%=ctxPath %>/organization/empInfoViewPage.gw" target="_self" class="service-menu-link">
												<span data-v-76121c5a="" class="svg-span">
													<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
														<g transform="translate(-149.978 -60.062)">
														<path fill="#4e9bd4" d="M0 0H1.3V7.991H0z" opacity="0.9" transform="translate(158.328 65.508)"></path>
														<path class="svg-hover-color" d="M154.353 78.009H150.6a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.622.625zm-3.125-1.25h2.5v-2.5h-2.5z" fill="#5b6164" transform="translate(0 .053)"></path>
														<path class="svg-hover-color" d="M161.794 66.062h-5.6a.727.727 0 0 1-.7-.75v-4.5a.726.726 0 0 1 .7-.75h5.6a.726.726 0 0 1 .7.75v4.5a.727.727 0 0 1-.7.75zm-4.9-1.5h4.2v-3h-4.2z" fill="#5b6164" transform="translate(-.016)"></path>
														<path class="svg-hover-color" d="M166.117 73.47h-1.3v-3.264h-11.669v3.264h-1.3v-4.482h14.266z" fill="#5b6164" transform="translate(0 .035)"></path>
														<path class="svg-hover-color" d="M160.869 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z" fill="#5b6164" transform="translate(-.016 .053)"></path>
														<path class="svg-hover-color" d="M167.385 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z" fill="#5b6164" transform="translate(-.032 .053)"></path></g></svg>
												</span>
												<span data-v-76121c5a="" class="link-name">조직</span>
											</a>
										</li>
										<li data-v-76121c5a="" class="service-menu-link-wrap">
											<a data-v-76121c5a="" href="<%=ctxPath %>/approval/document/list/A.gw" target="_self" class="service-menu-link">
												<span data-v-76121c5a="" class="svg-span">
													<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
														<g id="service-menu-icon02_s" transform="translate(-363 -75)">
														<rect width="18" height="18" transform="translate(363 75)" fill="none"></rect>
														<g transform="translate(363 75)">
														<path class="svg-hover-color" d="M181.928,683.857a.641.641,0,0,1-.454-.188l-1.286-1.286a.643.643,0,0,1,.909-.909l.831.831,2.117-2.117a.643.643,0,0,1,.909.909l-2.571,2.571A.641.641,0,0,1,181.928,683.857Z" transform="translate(-169.714 -668.428)" fill="#4e9bd4"></path>
														<g transform="translate(0)">
														<g>
														<path class="svg-hover-color" d="M178.786,670.092v-5.52a1.285,1.285,0,0,0-1.286-1.286h-2.571A1.285,1.285,0,0,0,173.643,662h-4.5a1.285,1.285,0,0,0-1.286,1.286h-2.571A1.285,1.285,0,0,0,164,664.571v14.143A1.285,1.285,0,0,0,165.286,680h11.571a5.142,5.142,0,0,0,1.929-9.908Zm-5.143-6.806v1.286h-4.5v-1.286Zm-8.357,15.429V664.571h2.571a1.285,1.285,0,0,0,1.286,1.286h4.5a1.285,1.285,0,0,0,1.286-1.286H177.5v5.187a5.113,5.113,0,0,0-5.786,5.1,5.125,5.125,0,0,0,1.749,3.857Zm11.571,0a3.857,3.857,0,1,1,3.857-3.857A3.862,3.862,0,0,1,176.857,678.714Z" transform="translate(-164 -662)" fill="#5b6164"></path></g></g></g></g></svg>
												</span>
												<span data-v-76121c5a="" class="link-name">전자결재</span>
											</a>
										</li>
										<c:if test="${not empty sessionScope.loginUser && sessionScope.loginUser.adminType eq 'All'}">
											<li data-v-76121c5a="" class="service-menu-link-wrap">
												<a data-v-76121c5a="" href="<%= ctxPath%>/admin/managerSet.gw" target="_self" class="service-menu-link">
													<span data-v-76121c5a="" class="svg-span">
														<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
															<g transform="translate(-843.804 -361.04)">
															<path d="M857.835 366.463l-.31-.262a5.887 5.887 0 0 0-1.9-1.081l-.39-.134v-1.932a8.089 8.089 0 0 0-3.224 0v1.933l-.388.136a6.053 6.053 0 0 0-1.9 1.084l-.309.26-1.69-.967a7.825 7.825 0 0 0-1.61 2.75l1.7.969-.076.4a5.785 5.785 0 0 0 0 2.16l.077.406-1.7.968a7.865 7.865 0 0 0 1.612 2.746l1.7-.971.309.264a5.886 5.886 0 0 0 1.891 1.085l.39.135v1.934a8.09 8.09 0 0 0 3.224 0v-1.932l.386-.137a6.1 6.1 0 0 0 1.9-1.088l.31-.261 1.693.974a7.819 7.819 0 0 0 1.608-2.755l-1.7-.967.076-.406a5.81 5.81 0 0 0 0-2.16l-.076-.405 1.7-.969a7.872 7.872 0 0 0-1.612-2.749zm-4.19 7.519h-.028a3.284 3.284 0 1 1 0-6.569h.03a3.284 3.284 0 1 1 0 6.568z" fill="none" transform="translate(-.827 -.661)"></path>
															<path d="M856.6 375.979h.014a2.127 2.127 0 1 0 0-4.254h-.014a2.127 2.127 0 1 0-.007 4.254h.012z" fill="none" transform="translate(-3.801 -3.816)"></path>
															<path d="M843.8 361.04v18h18v-18zm16.093 9.879l1.121.639a1 1 0 0 1 .447 1.136 9 9 0 0 1-2 3.437.991.991 0 0 1-1.219.183l-1.116-.642a7.219 7.219 0 0 1-1.553.89v1.268a.993.993 0 0 1-.78.961 9.223 9.223 0 0 1-3.983 0 .992.992 0 0 1-.777-.957v-1.27a7.027 7.027 0 0 1-1.553-.892l-1.119.64a1 1 0 0 1-1.211-.179 9.042 9.042 0 0 1-2.006-3.422.994.994 0 0 1 .458-1.154l1.107-.632a6.907 6.907 0 0 1 0-1.766l-1.112-.634a.984.984 0 0 1-.454-1.151 8.983 8.983 0 0 1 2-3.423.982.982 0 0 1 1.218-.183l1.113.637a7.185 7.185 0 0 1 1.555-.888v-1.267a.991.991 0 0 1 .779-.96 9.21 9.21 0 0 1 3.983 0 .99.99 0 0 1 .777.957v1.266a6.97 6.97 0 0 1 1.557.889l1.117-.638a1 1 0 0 1 1.211.181 9.044 9.044 0 0 1 2.006 3.425.991.991 0 0 1-.456 1.153l-1.109.633a6.987 6.987 0 0 1 .006 1.763z" fill="none"></path>
															<path class="svg-hover-color" d="M859.956 373.848a2.149 2.149 0 0 0-2.148-2.123 2.127 2.127 0 1 1 0 4.254 2.15 2.15 0 0 0 2.148-2.131z" fill="#5b6164" transform="translate(-4.993 -3.816)"></path>
															<path class="svg-hover-color"
																d="M861.626 367.387a9.044 9.044 0 0 0-2.006-3.425 1 1 0 0 0-1.211-.181l-1.117.638a6.97 6.97 0 0 0-1.557-.889v-1.266a.99.99 0 0 0-.777-.957 9.209 9.209 0 0 0-3.983 0 .991.991 0 0 0-.779.96v1.267a7.186 7.186 0 0 0-1.555.888l-1.113-.637a.982.982 0 0 0-1.218.183 8.983 8.983 0 0 0-2 3.423.984.984 0 0 0 .454 1.151l1.112.635a6.907 6.907 0 0 0 0 1.766l-1.107.632a.994.994 0 0 0-.458 1.154 9.042 9.042 0 0 0 2.006 3.422 1 1 0 0 0 1.211.179l1.119-.64a7.027 7.027 0 0 0 1.553.892v1.27a.992.992 0 0 0 .777.957 9.223 9.223 0 0 0 3.983 0 .993.993 0 0 0 .78-.961v-1.268a7.219 7.219 0 0 0 1.553-.89l1.116.642a.991.991 0 0 0 1.219-.183 9 9 0 0 0 2-3.437 1 1 0 0 0-.447-1.136l-1.121-.639a6.986 6.986 0 0 0 0-1.765l1.109-.633a.991.991 0 0 0 .457-1.152zm-6.91-4.948zm0 0zm-3.489 0zm0 0zm-4.063 2.318zm0 0zm-.206.034zm0 0zm-1.62 2.744zm0 0zm0 5.045zm0 0zm5.883 5.1zm0 0zm3.489 0zm0 0zm4.067-2.316zm0 0zm.206-.033zm0 0zm-.205-6.759l.076.405a5.81 5.81 0 0 1 0 2.16l-.076.406 1.7.967a7.82 7.82 0 0 1-1.608 2.755l-1.693-.974-.31.261a6.1 6.1 0 0 1-1.9 1.088l-.386.137v1.932a8.09 8.09 0 0 1-3.224 0v-1.934l-.39-.135a5.886 5.886 0 0 1-1.891-1.085l-.309-.264-1.7.971a7.865 7.865 0 0 1-1.612-2.746l1.7-.968-.076-.406a5.782 5.782 0 0 1 0-2.16l.076-.4-1.7-.969a7.826 7.826 0 0 1 1.61-2.75l1.69.967.309-.26a6.053 6.053 0 0 1 1.9-1.084l.388-.136v-1.94a8.089 8.089 0 0 1 3.224 0v1.932l.39.134a5.887 5.887 0 0 1 1.9 1.081l.31.262 1.695-.968a7.873 7.873 0 0 1 1.612 2.749zm1.815-1.036zm0 0z"
																fill="#5b6164" transform="translate(-.164 -.018)"
															></path>
															<path class="svg-hover-color" d="M852.645 373.214a3.312 3.312 0 0 1 3.3-3.289 3.284 3.284 0 1 0 0 6.569 3.311 3.311 0 0 1-3.3-3.28z" fill="#5b6164" transform="translate(-3.157 -3.173)"></path>
															<path class="svg-hover-color" d="M857.813 369.926a3.284 3.284 0 1 1-.005 6.568 3.284 3.284 0 1 0 0-6.568z" fill="#4e9bd4" transform="translate(-4.993 -3.174)"></path>
															<path class="svg-hover-color" d="M854.446 373.857a2.151 2.151 0 0 1 2.152-2.132 2.127 2.127 0 1 0 0 4.254 2.15 2.15 0 0 1-2.152-2.122z" fill="#4e9bd4" transform="translate(-3.8 -3.816)"></path>
															<path class="svg-hover-color" d="M859.277 373.206a3.309 3.309 0 0 0-3.3-3.28h-.028a3.284 3.284 0 1 0 0 6.568h.025a3.312 3.312 0 0 0 3.303-3.288zm-3.315 2.13h-.014a2.127 2.127 0 1 1 0-4.254h.021a2.127 2.127 0 1 1 0 4.254h-.013z" fill="#4e9bd4" transform="translate(-3.158 -3.173)"></path></g></svg>
													</span>
													<span data-v-76121c5a="" class="link-name">오피스관리</span>
													<span data-v-76121c5a="" class="gt-badge" style="display: none;"> </span>
												</a>
											</li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			
			<div data-v-3a88b4b3="" class="header-item header-item__right">

				<div data-v-5f00f128="" data-v-3a88b4b3="" class="user-info">
					<button data-v-5f00f128="" type="button" class="user-profile-button" onclick="myProfileView();">
						<img data-v-5f00f128="" src="<%= ctxPath%>/resources/image/profileImg.png" alt="" class="photo-36">
					</button>
					<div data-v-4ded8394="" data-v-5f00f128="" class="user-info-detail" id="profileDetail" tabindex="0" style="display: none;">
						<div data-v-4ded8394="" class="my-info">
							<div data-v-4ded8394="" class="gt-float-left">
								<img data-v-4ded8394="" src="<%= ctxPath%>/resources/image/profileImg.png" alt="" class="photo-75">
							</div>
							<div data-v-4ded8394="" class="info-wrap">
								<p data-v-4ded8394="" class="my-name text-truncate">${sessionScope.loginUser.empName}</p>
								<p data-v-4ded8394="" class="my-email text-truncate">${sessionScope.loginUser.email}</p>
							</div>
						</div>
						<div data-v-4ded8394="" class="bottom-menu">
							<a data-v-4ded8394="" href="<%= ctxPath%>/common/logout.gw" class="hw-button secondary color-333"> 로그아웃 </a>
						</div>
					</div>
				</div>

			</div>
	</div>
	</header>
</div>

</div>
