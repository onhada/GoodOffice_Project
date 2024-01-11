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
		
		
		//alert($("div.wrap_menu_first").css("display")); 
		$("div.wrap_menu_first").slideToggle();
		//alert($("div.wrap_menu_first").css("display")); 
		/* if($("div.wrap_menu_first").css("display") != "none"){
			// 상세메뉴가 보여지고 있을 경우엔 화살표가 위를 향해야
			
			alert("true : 화살표 위로")
			//$("div#cookie_approval_menu_first i.fa-chevron-up").css({'transform' : 'scaleY(-1)', 'transition' : '.3s'});

		}else{
			alert("false : 화살표 아래")
			//$("div#cookie_approval_menu_first i.fa-chevron-up").css({'transform' : 'scaleY(-1)', 'transition' : '.3s'});

		} */
		//$("div#cookie_approval_menu_first i.fa-chevron-up").toggleClass('mirror_v');
	})
	
	$("div#cookie_approval_menu_second").click(function(){
		$("div.wrap_menu_second").slideToggle();
		//$("div#cookie_approval_menu_second i.fa-chevron-up").css({'transform' : 'scaleY(-1)', 'transition' : '.3s'});
		//$("div#cookie_approval_menu_second i.fa-chevron-up").toggleClass('mirror_v');
	})


});


</script>



<div id="leftmenu">
	<!-- left -->
	<div class="new-split-item left">
		<div class="new-sidebar">
			<!-- <div class="fixed-area">
				<button type="button" class="hw-button plain" style="display: flex; height: 40px; align-items: center; justify-content: center;">
					<i class="gi gi-info gt-mr-8" style="font-size: 16px;"></i>
					<a href="https://www.hiworks.com/hiworks_beta/" target="_blank">
						<span class="gt-pb-2">전자결재 매뉴얼</span>
					</a>
				</button>
			</div> -->
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
							<div class="el-collapse-item__header menu-item" id="cookie_approval_menu_first" onclick="new_sidebar.toggleParent(this.id)">
								<span class="link gt-pl-10">
									<span class="collapse-prefix-icon open">
										<i class="fal fa-chevron-up"></i>
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
							<div class="el-collapse-item__header menu-item" id="cookie_approval_menu_second" onclick="new_sidebar.toggleParent(this.id)">
								<a class="link gt-pl-10">
									<span class="collapse-prefix-icon open">
										<i class="fal fa-chevron-up"></i>
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

					<%-- <li class="menu-item only">
						<a href="<%= ctxPath %>/approval/person/settings" class="link gt-pl-10 ">
							<span class="link-prefix-icon">
								<i class="gis gi-cog"></i>
							</span>
							<span class="flex-truncate">설정</span>
						</a>
					</li> --%>

					<hr>
					
					<!-- 수정필))))))))))) 관리자인지 아닌지 확인 -->
					<%-- <c:if test="${not empty sessionScope.loginUser && (sessionScope.loginUser.adminType eq 'Approval' || sessionScope.loginUser.adminType eq 'All')}"> --%>
						<li class="el-collapse">
							<div class="el-collapse-item ">
								<div class="el-collapse-item__header menu-item" id="cookie_approval_menu_third" onclick="수정필">
									<span class="link gt-pl-10">
										<span class="collapse-prefix-icon open">
											<i class="fal fa-chevron-up"></i>
										</span>
										<span class="flex-truncate collapse">관리자 설정</span>
									</span>
								</div>
								<div class="el-collapse-item__wrap" style="display: block;">
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
										
										<%-- <c:if test="${not empty sessionScope.loginUser && sessionScope.loginUser.isReadAllDocument eq 1}"> --%>
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
										<%-- </c:if> --%>
										<%-- <li class="menu-item">
											<a href="<%= ctxPath %>/approval/settings/backup.gw" class="link ">
												<span class="link-prefix-icon">
													<i class="gis gi-approval-backup"></i>
												</span>
												<span class="flex-truncate">문서 백업</span>
												<!-- 안 읽은 메일 갯수 표기 -->
												<span class="several counting"></span>
											</a>
										</li> --%>
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
					<%-- </c:if> --%>
					<!-- <li class="menu-item only">
						<a href="/gabia.biz/accounting/basic/criteria" class="link gt-pl-10">
							<span class="link-prefix-icon">
								<i class="gis gi-history"></i>
							</span>
							<span class="flex-truncate">회계지원</span>
						</a>
					</li> -->
				</ul>
				
			</nav>
		</div>

	</div>



	<!-- <script>
		var new_sidebar = {
			toggleParent : function(menuID) {
				var _this = $j("#" + menuID);
				_this.closest('.el-collapse-item').toggleClass('is-active');
				_this.siblings('.el-collapse-item__wrap').slideToggle(50);
				(getCookie(menuID) === "1" || getCookie(menuID) === "") ? setCookie(
						menuID, "0", 365)
						: setCookie(menuID, "1", 365);
			},
		}

		$j(document).ready(function() {
			Approval.getApprvalCount();
		});
	</script> -->


	<!-- left End -->
</div>
