<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<script>

$(document).ready(function() {
	if('${requestScope.type}' != ''){
		$('a#' + '${requestScope.type}').addClass('router-link-exact-active');
	}
	
	
	
	$("div#cookie_approval_menu_first").click(function(){
		
		$("div.wrap_menu_first").slideToggle();
		
		if($("i.ing").hasClass("fa-chevron-up")){
			$("i.ing").removeClass("fa-chevron-up");
			$("i.ing").addClass("fa-chevron-down");
		}else{
			$("i.ing").removeClass("fa-chevron-down");
			$("i.ing").addClass("fa-chevron-up");
		}

	})
	
	$("div#cookie_approval_menu_second").click(function(){
		$("div.wrap_menu_second").slideToggle();
		
		if($("i.docBox").hasClass("fa-chevron-up")){
			$("i.docBox").removeClass("fa-chevron-up");
			$("i.docBox").addClass("fa-chevron-down");
		}else{
			$("i.docBox").removeClass("fa-chevron-down");
			$("i.docBox").addClass("fa-chevron-up");
		}
	})
	
	$("div#cookie_approval_menu_third").click(function(){
		$("div.wrap_menu_third").slideToggle();
		
		if($("i.adminToggle").hasClass("fa-chevron-up")){
			$("i.adminToggle").removeClass("fa-chevron-up");
			$("i.adminToggle").addClass("fa-chevron-down");
		}else{
			$("i.adminToggle").removeClass("fa-chevron-down");
			$("i.adminToggle").addClass("fa-chevron-up");
		}
	})


});


</script>



<div id="leftmenu">
	<!-- left -->
	<div class="new-split-item left">
		<div class="new-sidebar">
			<a href="<%=ctxPath%>/approval/document/write/index.gw">
				<button type="button" class="main-btn">
					<i class="gi gi-plus"></i>
					<span>작성하기</span>
				</button>
			</a>
			<nav class="menu-wrap">
				<ul>
					<li class="el-collapse">
						<div class="el-collapse-item ">
							<div class="el-collapse-item__header menu-item" id="cookie_approval_menu_first">
								<span class="link gt-pl-10">
									<span class="collapse-prefix-icon open">
										<i class="fal fa-chevron-up ing"></i>
									</span>
									<span class="flex-truncate collapse">진행 중인 문서</span>
								</span>
							</div>
							<div class="el-collapse-item__wrap wrap_menu_first" style="display: block;">
								<ul class="el-collapse-item__content">
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/list/A.gw" id ="A" class="link">
											<span class="link-prefix-icon">
												<i class="gis gi-documents"></i>
											</span>
											<span class="flex-truncate">
												전체
												<c:if test="${requestScope.aSize ne 0}">
													<span class="counting type-text" id="js-approval-lists-all" style="">${requestScope.aSize}</span>
												</c:if>
												
											</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/list/W.gw" id ="W" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-hourglass"></i>
											</span>
											<span class="flex-truncate">
												대기
												<c:if test="${requestScope.wSize ne 0}">
													<span class="counting" id="js-approval-lists-wait" style="">${requestScope.wSize}</span>
												</c:if>
											</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/list/V.gw" id ="V" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-check"></i>
											</span>
											<span class="flex-truncate">
												확인
												<c:if test="${requestScope.vSize ne 0}">
													<span class="counting" id="js-approval-lists-view-check" style="">${requestScope.vSize}</span>
												</c:if>
											</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/list/E.gw" id ="E" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-clock"></i>
											</span>
											<span class="flex-truncate">
												예정
												<c:if test="${requestScope.eSize ne 0}">
													<span class="counting type-text" id="js-approval-lists-expect" style="">${requestScope.eSize}</span>
												</c:if>
											</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/list/P.gw" id ="P" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-spinner"></i>
											</span>
											<span class="flex-truncate">
												진행
												<c:if test="${requestScope.pSize ne 0}">
													<span class="counting type-text" id="js-approval-lists-progress" style="">${requestScope.pSize}</span>
												</c:if>
											</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</li>

					<li class="el-collapse">
						<div class="el-collapse-item ">
							<div class="el-collapse-item__header menu-item" id="cookie_approval_menu_second">
								<a class="link gt-pl-10">
									<span class="collapse-prefix-icon open">
										<i class="fal fa-chevron-up docBox"></i>
									</span>
									<span class="flex-truncate collapse">문서함</span>
								</a>
							</div>
							<div class="el-collapse-item__wrap wrap_menu_second" style="display: block;">
								<ul class="el-collapse-item__content">
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/box/all.gw" id="all" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-documents"></i>
											</span>
											<span class="flex-truncate">전체</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/box/writer.gw" id="writer" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-pencil"></i>
											</span>
											<span class="flex-truncate">기안</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/box/approval.gw" id="approval" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-signature"></i>
											</span>
											<span class="flex-truncate">결재</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/box/refer.gw" id="refer" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-user"></i>
											</span>
											<span class="flex-truncate">수신</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/box/read.gw" id="read" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-user-plus"></i>
											</span>
											<span class="flex-truncate">참조</span>
										</a>
									</li>
									<li class="menu-item">
										<a href="<%= ctxPath %>/approval/document/box/return.gw" id="return" class="link ">
											<span class="link-prefix-icon">
												<i class="gis gi-ban"></i>
											</span>
											<span class="flex-truncate">반려</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</li>


					<li class="menu-item only">
						<a href="<%= ctxPath %>/approval/document/box/temp.gw" id = "temp" class="link gt-pl-10 ">
							<span class="link-prefix-icon">
								<i class="gis gi-archive"></i>
							</span>
							<span class="flex-truncate">임시저장</span>
						</a>
					</li>


					<hr>
					
					<c:if test="${not empty sessionScope.loginUser && (sessionScope.loginUser.adminType eq 'Approval' || sessionScope.loginUser.adminType eq 'All')}">
						<li class="el-collapse">
							<div class="el-collapse-item ">
								<div class="el-collapse-item__header menu-item" id="cookie_approval_menu_third">
									<span class="link gt-pl-10">
										<span class="collapse-prefix-icon open">
											<i class="fal fa-chevron-up adminToggle"></i>
										</span>
										<span class="flex-truncate collapse">관리자 설정</span>
									</span>
								</div>
								<div class="el-collapse-item__wrap wrap_menu_third" style="display: block;">
									<ul class="el-collapse-item__content">
										<li class="menu-item">
											<a href="<%= ctxPath %>/approval/settings/basic.gw" id="settings_basic" class="link ">
												<span class="link-prefix-icon">
													<i class="gis gi-cog"></i>
												</span>
												<span class="flex-truncate">기본 설정</span>
											</a>
										</li>
										<li class="menu-item">
											<a href="<%= ctxPath %>/approval/settings/forms.gw" id="settings_forms" class="link ">
												<span class="link-prefix-icon">
													<i class="gis gi-paper"></i>
												</span>
												<span class="flex-truncate">양식함 관리</span>
											</a>
										</li>
										
										<c:if test="${not empty sessionScope.loginUser && sessionScope.loginUser.isReadAllDocument eq 1}">
											<li class="menu-item">
												<a href="<%= ctxPath %>/approval/settings/document.gw" id="settings_document" class="link ">
													<span class="link-prefix-icon">
														<i class="gis gi-list"></i>
													</span>
													<span class="flex-truncate">전체 문서 목록</span>
												</a>
											</li>
											<li class="menu-item">
												<a href="<%= ctxPath %>/approval/settings/deleted_document.gw" id="settings_deleted_document" class="link ">
													<span class="link-prefix-icon">
														<i class="gis gi-trash-alt"></i>
													</span>
													<span class="flex-truncate">삭제 문서 목록</span>
												</a>
											</li>
										</c:if>
										<li class="menu-item">
											<a href="<%= ctxPath %>/approval/settings/admin.gw" id="settings_admin" class="link ">
												<span class="link-prefix-icon">
													<i class="gis gi-user-cog"></i>
												</span>
												<span class="flex-truncate">전자결재 관리자</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</li>
					</c:if>
				</ul>
				
			</nav>
		</div>

	</div>


	<!-- left End -->
</div>
