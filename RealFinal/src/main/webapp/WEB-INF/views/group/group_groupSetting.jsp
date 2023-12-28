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
								aria-current="page"
								class="router-link-exact-active router-link-active"><span
									class="hw-icon"><i class="gis gi-cog"></i></span><span
									class="menu-name">그룹 관리</span></a></li>
						</ul>
						<ul class="extra-menu">
							<li class="setting-item"><a
								href="/group/1012858/setting/userSetting" class=""><span
									class="hw-icon"><i class="gis gi-user"></i></span><span
									class="menu-name">내 설정</span></a></li>
						</ul>
					</div>
				</div>
				<div class="main-contents-setting hw-layout-contents">
					<div id="GroupSetting" exact="">
						<div class="contents-title">그룹 관리</div>
						<div class="contents-menu-wrapper">
							<div class="contents-list base">
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											그룹 이름 및 소개
											<!---->
										</div>
										<!---->
									</div>
									<div class="menu-btn">
										<div class="hw-button primary">
											<span class="label">설정</span>
										</div>
									</div>
								</div>
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											그룹 대표 사진
											<!---->
										</div>
										<!---->
									</div>
									<div class="menu-btn">
										<div class="hw-button primary">
											<span class="label">설정</span>
										</div>
									</div>
								</div>
								<!-- 
											<div class="content-item">
												<div class="menu-title">
													<div class="title">
														권한 관리
														
													</div>
													<div class="description">그룹에서의 활동 항목별로 사용자 권한를 지정할 수
														있습니다.</div>
												</div>
												<div class="menu-btn">
													<div class="hw-button primary">
														<span class="label">설정</span>
													</div>
												</div>
											</div>
											 -->
								<!--  
											<div class="content-item">
												<div class="menu-title">
													<div class="title">
														멤버 관리
														
													</div>
													
												</div>
												<div class="menu-btn">
													<a href="/group/1012858/members" class=""><div
															class="moveBtn hw-button text primary-color">
															<span class="label"> 바로가기</span>
														</div></a>
												</div>
											</div>
											 -->
								<!--  
											<div class="content-item">
												<div class="menu-title">
													<div class="title">
														즐겨찾기 관리
														
													</div>
													<div class="description">그룹 멤버가 자주 찾는 업무용 웹사이트를 그룹 메뉴
														패널에 추가합니다.</div>
												</div>
												<div class="menu-btn">
													<div class="hw-button primary">
														<span class="label">설정</span>
													</div>
												</div>
											</div>
											 -->
							</div>
							<div class="contents-list debate">
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											토론 주제 관리
											<!---->
										</div>
										<div class="description">주제는 토론 메뉴로 사용됩니다. 토론 주제는 여러 개
											만들 수 있습니다.</div>
									</div>
									<div class="menu-btn">
										<div class="hw-button primary">
											<span class="label">설정</span>
										</div>
									</div>
								</div>
							</div>
							<div class="contents-list group">
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											그룹 소유권 변경
											<!---->
										</div>
										<!---->
									</div>
									<div class="menu-btn">
										<div class="hw-button primary">
											<span class="label">변경</span>
										</div>
									</div>
								</div>
								<div class="content-item">
									<div class="menu-title">
										<div class="title">
											그룹 폐쇄
											<!---->
										</div>
										<!---->
									</div>
									<div class="menu-btn">
										<div class="hw-button info">
											<span class="label"> 그룹 폐쇄</span>
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