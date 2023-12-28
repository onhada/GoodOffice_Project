<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="leftmenu">
	<!-- left -->
	<link rel="stylesheet" type="text/css"
		href="./aaaaaaa_files/admin_menu.css">
	<link rel="stylesheet" type="text/css"
		href="./aaaaaaa_files/h_admin.css">
	<script src="./aaaaaaa_files/gtris.1.2.0.js" type="text/javascript"></script>

	<div class="h_admin_global_left">
		<div class="menufield" style="top: 0;">
			<ul id="adminLeftMenu" class="mail_list menu-list">
				<%-- 
							<li><a target="" onclick="adminmenu.redirectCookie()"
								class="depth1-anchor " id=""
								href="https://office.hiworks.com/gabia.biz/h_admin/adminmain">
									<div class="depth1">
										<img src="./aaaaaaa_files/icon-office-manage.png"
											class="menu_icon"> <span class="depth1-menu-title">홈</span>
									</div>
							</a>
							</li>
							--%>
				<li>
					<!-- cookie checking -->

					<div class="depth1">
						<a href="javascript:void(0)"
							class="foldtop depth1-fold depth1-anchor selected"
							id="admin_leftmenu_adminconfig"> <img
							src="./aaaaaaa_files/icon-setting.png" class="menu_icon"> <span
							class="depth1-menu-title fold">환경 설정</span> <span
							class="arrow_down up fold"></span>
						</a>
					</div>

					<ul class="depth2 hide show_cookie" style="display: block">
						<%-- 
									<a target=""
										href="https://office.hiworks.com/gabia.biz/h_admin/Adminconfig/logoskin"
										onclick="adminmenu.redirectCookie()">
										<li style="display: flex; align-items: center;" class="" id="">
											<span>로고 설정</span>
									</li>
									</a>
									--%>
						<a target=""
							href="https://office.hiworks.com/gabia.biz/h_admin/Adminconfig/setmanager"
							onclick="adminmenu.redirectCookie()">
							<li style="display: flex; align-items: center;" class=""
							id="currentPagePointer"><span>관리자 설정</span></li>
						</a>
						<%-- 
									<a target=""
										href="https://office.hiworks.com/gabia.biz/h_admin/menu/manage"
										onclick="adminmenu.redirectCookie()">
										<li style="display: flex; align-items: center;" class="" id="">
											<span>메뉴 설정</span>
									</li>
									</a>
									--%>
					</ul>
				</li>
				<li>
					<!-- cookie checking -->

					<div class="depth1">
						<a href="javascript:void(0)"
							class="foldtop depth1-fold depth1-anchor selected"
							id="admin_leftmenu_insa_manage"> <img
							src="./aaaaaaa_files/icon-user-manage.png" class="menu_icon">
							<span class="depth1-menu-title fold">사용자 관리</span> <span
							class="arrow_down up fold"></span>
						</a>
					</div>

					<ul class="depth2 hide show_cookie" style="display: block">
						<a target="blank"
							href="https://office.hiworks.com/gabia.biz/insa/manage/orgmanage"
							onclick="adminmenu.redirectCookie()">
							<li style="display: flex; align-items: center;" class="external"
							id=""><span>조직 관리</span> <span class="external_img"></span></li>
						</a>
						<a target=""
							href="https://officeadmin.office.hiworks.com/accounts"
							onclick="adminmenu.redirectCookie()">
							<li style="display: flex; align-items: center;" class="" id="">
								<span>사용자 관리</span>
						</li>
						</a>
						<a target="blank"
							href="https://office.hiworks.com/gabia.biz/insa/manage/position"
							onclick="adminmenu.redirectCookie()">
							<li style="display: flex; align-items: center;" class="external"
							id=""><span>직위/직무 관리</span> <span class="external_img"></span></li>
						</a>
						<a target=""
							href="https://officeadmin.office.hiworks.com/deactivation/pause"
							onclick="adminmenu.redirectCookie()">
							<li style="display: flex; align-items: center;" class="" id="">
								<span>비활성 사용자</span>
						</li>
						</a>
					</ul>
				</li>
				<!-- 
					<li>
						cookie checking
						
						<div class="depth1">
							<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor selected" id="admin_leftmenu_manage">
								<img src="./aaaaaaa_files/icon-service-manage.png" class="menu_icon">
								<span class="depth1-menu-title fold">서비스 관리</span>
								<span class="arrow_down up fold"></span>
							</a>
						</div>

						<ul class="depth2 hide show_cookie" style="display:block">
															<a target="blank" href="https://team-mail.office.hiworks.com/admin/accounts" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="external" id="">
										<span>공용메일 관리</span>
										<span class="external_img"></span>									</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/status/groupmail" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>그룹메일 관리</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/status/mail_v3" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>메일 사용 현황</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/status/mbox_lock" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>잠금 편지함 사용 현황</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/status/web" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>오피스 용량 사용 현황</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/point/main" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>포인트 사용 현황</span>
																			</li>
								</a>
													</ul>
					</li>
					 -->
				<%--
					<li>
						<!-- cookie checking -->
						
						<div class="depth1">
							<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor " id="admin_leftmenu_security">
								<img src="./aaaaaaa_files/icon-security.png" class="menu_icon">
								<span class="depth1-menu-title fold">보안</span>
								<span class="arrow_down  fold"></span>
							</a>
						</div>

						<ul class="depth2 hide ">
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/security/password_cycle" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>비밀번호 변경 정책</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/security/second_step" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>2단계 인증</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/ip_config" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>접근 IP 관리</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/login_manage" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>로그인 설정</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/access_manage" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>사용자 접속 내역</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/report_manage" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>리포트 수신 설정</span>
																			</li>
								</a>
													</ul>
					</li>
					<li>
						<!-- cookie checking -->
						
						<div class="depth1">
							<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor " id="admin_leftmenu_apps">
								<img src="./aaaaaaa_files/icon-api.png" class="menu_icon">
								<span class="depth1-menu-title fold">서비스 연동 (API)</span>
								<span class="arrow_down  fold"></span>
							</a>
						</div>

						<ul class="depth2 hide ">
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/apps/console/org" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>오피스 연동</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/apps/console/sso" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>SSO 관리</span>
																			</li>
								</a>
															<a target="" href="https://officeadmin.office.hiworks.com/ldap" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>LDAP 연동</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/apps/console" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>애플리케이션 연동</span>
																			</li>
								</a>
													</ul>
					</li>
					<li>
						<!-- cookie checking -->
						
						<div class="depth1">
							<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor " id="admin_leftmenu_managed_mail">
								<img src="./aaaaaaa_files/icon-security-mail.png" class="menu_icon">
								<span class="depth1-menu-title fold">보안 메일</span>
								<span class="arrow_down  fold"></span>
							</a>
						</div>

						<ul class="depth2 hide ">
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/mail_status" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>메일이용 통계</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/forward_r" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>수신메일 포워딩</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/forward_s" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>발신메일 포워딩</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/security_manage" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>암호/승인메일 설정</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/pop3smtp" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>POP3/SMTP 설정</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/receipt_manage" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>수신허용/차단</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/spam_manage" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>스팸메일 관리</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/h_admin/managed/mail_recover" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>삭제메일 복원</span>
																			</li>
								</a>
													</ul>
					</li>
					<li>
						<!-- cookie checking -->
						
						<div class="depth1">
							<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor " id="admin_leftmenu_archive">
								<img src="./aaaaaaa_files/icon-archive.png" class="menu_icon">
								<span class="depth1-menu-title fold">아카이빙</span>
								<span class="arrow_down  fold"></span>
							</a>
						</div>

						<ul class="depth2 hide ">
															<a target="" href="https://office.hiworks.com/gabia.biz/archive/h_admin/search" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>검색</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/archive/h_admin/policy" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>정책 설정</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/archive/h_admin/download" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>다운로드</span>
																			</li>
								</a>
															<a target="" href="https://office.hiworks.com/gabia.biz/archive/h_admin/audit" onclick="adminmenu.redirectCookie()">
									<li style="display:flex; align-items: center;" class="" id="">
										<span>감사</span>
																			</li>
								</a>
													</ul>
					</li>
					--%>
			</ul>
		</div>
		<div id="menu_footer">
			<a href="https://office.hiworks.com/gabia.biz/manual/main"
				target="_blank"> <!-- 
							<div id="start_help">
								<div id="start_help_content">
									<img src="./aaaaaaa_files/icon-i.png" class="i_icon"> <span>시작하기
										도움말</span>
								</div>
							</div>
							 -->
			</a>
		</div>
	</div>

	<script src="./aaaaaaa_files/adminmenu.js" type="text/javascript"></script>

	<!-- left End -->
</div>