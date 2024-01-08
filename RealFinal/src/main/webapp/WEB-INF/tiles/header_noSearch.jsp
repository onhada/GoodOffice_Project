<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>




<script type="text/javascript">

$(document).ready(function(){
  
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
						<a data-v-87615cf4="" href="https://office.hiworks.com/gabia.biz" class="gt-d-flex">
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
						<span data-v-236a7242="" class="btn-main">수정필</span>
						<svg data-v-236a7242="" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-down" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" class="svg-inline--fa fa-caret-down fa-w-10">
							<path data-v-236a7242="" fill="currentColor" d="M31.3 192h257.3c17.8 0 26.7 21.5 14.1 34.1L174.1 354.8c-7.8 7.8-20.5 7.8-28.3 0L17.2 226.1C4.6 213.5 13.5 192 31.3 192z" class=""></path></svg>
					</div>
				</div>
			</div>
			<div data-v-3a88b4b3="" class="header-item header-item__right">

				<div data-v-3a88b4b3="" class="more-menus" style="">




					<!---->
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
									<p data-v-4ded8394="" class="my-name text-truncate">${sessionScope.loginuser.empName}</p>
									<p data-v-4ded8394="" class="my-email text-truncate">${sessionScope.loginuser.email}</p>
								</div>
							</div>
							<div data-v-4ded8394="" class="bottom-menu">
								<!-- 수정필 설정...? 할 시간 되냐  -->
								<!-- <a data-v-4ded8394="" href="https://office.hiworks.com/gabia.biz/mypage/manager" class="hw-button text">설정</a> -->
								<a data-v-4ded8394="" href="<%= ctxPath%>/common/logout.gw" class="hw-button secondary color-333"> 로그아웃 </a>
							</div>
						</div>
					</div>


				</div>
			</div>
		</header>
	</div>
	<!---->
</div>
