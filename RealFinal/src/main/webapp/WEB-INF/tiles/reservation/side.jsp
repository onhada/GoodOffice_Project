<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<script type="text/javascript">

$(document).ready(function(){

	
});// end of $(document).ready(function(){})-------


// Function Declaration
function toggleShowHide(id){
	
	if($('div#'+id).find('#toggleIcon').hasClass('fa-chevron-up')){
		$('div#'+id).find('#toggleIcon').removeClass('fa-chevron-up');
		$('div#'+id).find('#toggleIcon').addClass('fa-chevron-down');
		$('div#'+id).parent().find('#'+id+'Toggle').css("display", "block");
	}
	else if($('div#'+id).find('#toggleIcon').hasClass('fa-chevron-down')){
		$('div#'+id).find('#toggleIcon').removeClass('fa-chevron-down');
		$('div#'+id).find('#toggleIcon').addClass('fa-chevron-up');
		$('div#'+id).parent().find('#'+id+'Toggle').css("display", "none");
	}
	
}

</script>


<div id="leftmenu" style="width: 276px;">
	<!-- left -->
	<div class="new-split-item left" style="width: inherit">
		<div class="new-sidebar">
			<button type="button" href="javascript:void(0);" class="main-btn" onclick="resourceReserve();">
				<i class="gi gi-plus"></i>
				<span>예약하기</span>
			</button>
			<nav class="menu-wrap">
				<ul class="menu-list">
					<li class="menu-item only">
						<a href="<%= ctxPath%>/reservation/myReservationList.gw" class="link gt-pl-10 bold router-link-exact-active" title="나의 예약 목록">
							<span class="link-prefix-icon">
								<i class="gis gi-tasks"></i>
							</span>
							<span class="flex-truncate">나의 예약 목록</span>
						</a>
					</li>
					
					<%-- 자원카테고리 목록 가져오기 --%>
					<c:if test="${not empty requestScope.resourceCategoryList || fn:length(requestScope.resourceCategoryList) > 0}">
					<c:forEach var="resourceCategory" items="${requestScope.resourceCategoryList}">
						<li class="menu-item only">
							<a class="link gt-pl-10" href="<%= ctxPath%>/reservation/reservationResource.gw?resourceCategoryId=${resourceCategory.resourceCategoryId}" title="${resourceCategory.resourceCategoryName}">
								<span class="link-prefix-icon">
									<i class="gis gi-category"></i>
								</span>
								<span class="flex-truncate">${resourceCategory.resourceCategoryName}</span>
							</a>
						</li>
					</c:forEach>
					</c:if>
					
					<!--  관리자 카테고리 : 예약 관리자인 경우에만 보여주기 -->
					<c:if test="${sessionScope.loginUser.empId == requestScope.rsvAdminEmpId}">
						<li class="el-collapse gt-mt-8">
							<div class="el-collapse-item is-active">
								<div class="el-collapse-item__header menu-item" id="reserveManage" onclick="toggleShowHide(this.id)">
									<span class="link gt-pl-10">
										<span class="collapse-prefix-icon">
											<i class="fal fa-chevron-down" id="toggleIcon"></i>
										</span>
										<span class="flex-truncate collapse show">예약 관리</span>
									</span>
								</div>
								<div class="el-collapse-item__wrap" id="reserveManageToggle" style="display: block;">
									<ul class="depth2 show">
										<!-- <ul class="depth2 hide show"> 였는데 안 보여서 hide 지움  -->
										<li class="menu-item">
											<a href="<%= ctxPath%>/reservation/approvalManageAdmin.gw" title="승인 관리" class="link" >
												<span class="link-prefix-icon">
													<i class="gis gi-signature"></i>
												</span>
												<span class="flex-truncate">승인 관리</span>
											</a>
										</li>
										<li class="menu-item">
											<a href="<%= ctxPath%>/reservation/returnManageAdmin.gw" title="반납 관리" class="link">
												<span class="link-prefix-icon">
													<i class="gis gi-return"></i>
												</span>
												<span class="flex-truncate">반납 관리</span>
											</a>
										</li>
										<li class="menu-item">
											<a href="<%= ctxPath%>/reservation/categoryManageAdmin.gw" title="카테고리 관리" class="link">
												<span class="link-prefix-icon">
													<i class="gis gi-category-setting"></i>
												</span>
												<span class="flex-truncate">카테고리 관리</span>
											</a>
										</li>
										<li class="menu-item">
											<a href="<%= ctxPath%>/reservation/resourceManageAdmin.gw" title="자원 관리" class="link">
												<span class="link-prefix-icon">
													<i class="gis gi-wrench"></i>
												</span>
												<span class="flex-truncate">자원 관리</span>
											</a>
										</li>
										<li class="menu-item">
											<a href="<%= ctxPath%>/reservation/rsvAdminManageAdmin.gw" title="예약 관리자" class="link">
												<span class="link-prefix-icon">
													<i class="gis gi-user-cog"></i>
												</span>
												<span class="flex-truncate">예약 관리자</span>
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