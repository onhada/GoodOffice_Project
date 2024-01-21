<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<script>
	$(document).ready(function() {

		if ('${requestScope.type}' != null) {
			$("li.menuDropDownList").each(function() {
				$(this).attr('id', '');
			})

			$("li." + '${requestScope.type}').attr('id', 'currentPagePointer');
		}

	})
</script>



<div id="leftmenu">
	<!-- left -->
	<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/admin_menu.css">
	<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/h_admin.css">

	<div class="h_admin_global_left">
		<div class="menufield" style="top: 0;">
			<ul id="adminLeftMenu" class="mail_list menu-list">
				<li>
					<div class="depth1">
						<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor selected" id="admin_leftmenu_adminconfig">
							<img src="<%= ctxPath %>/resources/image/icon/app.svg" class="menu_icon">
							<span class="depth1-menu-title fold">환경 설정</span>
							<span class="arrow_down up fold"></span>
						</a>
					</div>

					<ul class="depth2 hide show_cookie" style="display: block">
						<a target="" href="<%=ctxPath%>/admin/managerSet.gw">
							<li style="display: flex; align-items: center;" class="menuDropDownList managerSet" id="">
								<span>관리자 설정</span>
							</li>
						</a>
					</ul>
				</li>
				<li>
					<!-- cookie checking -->

					<div class="depth1">
						<a href="javascript:void(0)" class="foldtop depth1-fold depth1-anchor selected" id="admin_leftmenu_insa_manage">
							<img src="<%= ctxPath %>/resources/image/icon/user.svg" class="menu_icon">
							<span class="depth1-menu-title fold">사용자 관리</span>
							<span class="arrow_down up fold"></span>
						</a>
					</div>

					<ul class="depth2 hide show_cookie" style="display: block">
						<a target="blank" href="<%=ctxPath%>/organization/organizationManage.gw">
							<li style="display: flex; align-items: center;" class="menuDropDownList external" id="">
								<span>조직 관리</span>
								<span class="external_img"></span>
							</li>
						</a>
						<a target="" href="<%=ctxPath%>/admin/userManage.gw">
							<li style="display: flex; align-items: center;" class="menuDropDownList userManage" id="">
								<span>사용자 관리</span>
							</li>
						</a>
						<a target="blank" href="<%=ctxPath%>/organization/positionManage.gw">
							<li style="display: flex; align-items: center;" class="menuDropDownList external" id="">
								<span>직위/직무 관리</span>
								<span class="external_img"></span>
							</li>
						</a>
					</ul>
				</li>
			</ul>
		</div>
		<div id="menu_footer">
		</div>
	</div>

</div>