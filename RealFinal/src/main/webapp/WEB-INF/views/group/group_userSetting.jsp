<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div class="split-item right">
	<div class="contents-wrap">
		<div id="SettingView">
			<div class="setting-contents-wrapper hw-layout-wrapper">
				<div class="main-nav hw-layout-side-nav">
					<div class="section-wrapper">
						<div class="nav-title">그룹 설정</div>
						<ul class="setting-menu">
							<li class="setting-item"><a href="/group/1012858/setting/"
								class="router-link-active"><span class="hw-icon"><i
										class="gis gi-cog"></i></span><span class="menu-name">그룹 관리</span></a></li>
						</ul>
						<ul class="extra-menu">
							<li class="setting-item"><a
								href="/group/1012858/setting/userSetting"
								class="router-link-exact-active router-link-active"
								aria-current="page"><span class="hw-icon"><i
										class="gis gi-user"></i></span><span class="menu-name">내 설정</span></a></li>
						</ul>
					</div>
				</div>
				<div class="main-contents-setting hw-layout-contents">
					<div id="UserSetting" exact="">
						<div class="contents-title">내 설정</div>
						<div class="contents-menu-wrapper">
							<div class="contents-list my-setting-list">
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											알림 설정
											<!---->
										</div>
										<div class="description">토론의 새 글 또는 댓글에 대한 알림 여부를 설정합니다.</div>
									</div>
									<div class="menu-btn">
										<span class="check-label">사용 중</span>
										<div class="hw-button primary">
											<span class="label">변경</span>
										</div>
									</div>
								</div>
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											그룹 탈퇴
											<!---->
										</div>
										<!---->
									</div>
									<div class="menu-btn">
										<div class="hw-button info">
											<span class="label">그룹 탈퇴</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>