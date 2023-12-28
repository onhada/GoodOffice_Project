<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="leftmenu" style="width: 276px;">
	<!-- left -->
	<div class="new-split-item left" style="width: inherit">
		<div class="new-sidebar">
			<button type="button" href="javascript:void(0);" class="main-btn"
				onclick="resourceReserve();">
				<i class="gi gi-plus"></i><span>예약하기</span>
			</button>
			<nav class="menu-wrap">
				<ul class="menu-list">
					<li class="menu-item only"><a
						href="/gabia.biz/booking/bookingMain/"
						class="link gt-pl-10 bold router-link-exact-active"
						title="나의 예약 목록"> <span class="link-prefix-icon"><i
								class="gis gi-tasks"></i></span><span class="flex-truncate">나의
								예약 목록</span>
					</a></li>
					<li class="menu-item only"><a class="link gt-pl-10"
						href="/gabia.biz/booking/bookingResource/resourceList/1982"
						title="회의실"><span class="link-prefix-icon"><i
								class="gis gi-category"></i></span><span class="flex-truncate">회의실</span></a></li>
					<li class="menu-item only"><a class="link gt-pl-10"
						href="/gabia.biz/booking/bookingResource/resourceList/1983"
						title="법인 차량"><span class="link-prefix-icon"><i
								class="gis gi-category"></i></span><span class="flex-truncate">법인
								차량</span></a></li>
					<li class="menu-item only"><a class="link gt-pl-10"
						href="/gabia.biz/booking/bookingResource/resourceList/1985"
						title="사내 콘도"><span class="link-prefix-icon"><i
								class="gis gi-category"></i></span><span class="flex-truncate">사내
								콘도</span></a></li>
					<li class="el-collapse gt-mt-8">
						<div class="el-collapse-item is-active">
							<div class="el-collapse-item__header menu-item" id="bookManage"
								onclick="new_sidebar.toggleParent(this.id)">
								<span class="link gt-pl-10"> <span
									class="collapse-prefix-icon"><i
										class="fal fa-chevron-down"></i></span> <span
									class="flex-truncate collapse">예약 관리</span>
								</span>
							</div>
							<div class="el-collapse-item__wrap" style="display: block;">
								<ul class="depth2 show">	<!-- <ul class="depth2 hide show"> 였는데 안 보여서 hide 지움  -->
									<li class="menu-item"><a class="link"
										href="/gabia.biz/booking/bookingManage/acknowledgeManage"
										title="승인 관리"> <span class="link-prefix-icon"><i
												class="gis gi-signature"></i></span> <span class="flex-truncate">승인
												관리</span>
									</a></li>
									<li class="menu-item"><a
										href="/gabia.biz/booking/bookingManage/returnManage"
										title="반납 관리" class="link"> <span class="link-prefix-icon"><i
												class="gis gi-return"></i></span> <span class="flex-truncate">반납
												관리</span>
									</a></li>
									<li class="menu-item"><a
										href="/gabia.biz/booking/bookingManage/categoryManage"
										title="카테고리 관리" class="link"> <span
											class="link-prefix-icon"><i
												class="gis gi-category-setting"></i></span> <span
											class="flex-truncate">카테고리 관리</span>
									</a></li>
									<li class="menu-item"><a
										href="/gabia.biz/booking/bookingManage/resourceManage"
										title="자원 관리" class="link"> <span class="link-prefix-icon"><i
												class="gis gi-wrench"></i></span> <span class="flex-truncate">자원
												관리</span>
									</a></li>
									<li class="menu-item"><a
										href="/gabia.biz/booking/bookingManage/bookingAdmin"
										title="예약 관리자" class="link"> <span
											class="link-prefix-icon"><i class="gis gi-user-cog"></i></span>
											<span class="flex-truncate">예약 관리자</span>
									</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- left End -->
</div>