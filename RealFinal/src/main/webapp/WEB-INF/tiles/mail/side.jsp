<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>



<script type="text/javascript">


$(document).ready(function(){

	if('${requestScope.sideType}' != ''){
		$('a#' + '${requestScope.sideType}').addClass('router-link-exact-active');
	}
	
});// end of $(document).ready(function(){})-------


// Function Declaration
function toggleShowHide(id){
	
	if($('div#'+id).find('#toggleIcon').hasClass('fa-chevron-up')){
		$('div#'+id).find('#toggleIcon').removeClass('fa-chevron-up');
		$('div#'+id).find('#toggleIcon').addClass('fa-chevron-down');
		$('div#'+id).parent().find('#'+id+'Toggle').css("display", "none");
	}
	else if($('div#'+id).find('#toggleIcon').hasClass('fa-chevron-down')){
		$('div#'+id).find('#toggleIcon').removeClass('fa-chevron-down');
		$('div#'+id).find('#toggleIcon').addClass('fa-chevron-up');
		$('div#'+id).parent().find('#'+id+'Toggle').css("display", "block");
	}
	
}


</script>





<div id="leftmenu">
	<!-- left -->
	<div class="new-split-item left" style="width: inherit">
		<div class="new-sidebar">
			<a class="main-btn" href="<%= ctxPath%>/mail/mailWrite.gw">
				<i class="gi gi-plus"></i>
				<span>편지쓰기</span>
			</a>
			<nav class="menu-wrap">
				<ul>
				
					<!-- 받은 편지함 -->
					<li class="menu-item only">
						<a href="<%= ctxPath%>/mail/mailList.gw?mailType=1" class="link gt-pl-10" id="mailbox_1">
							<span class="link-prefix-icon">
								<i class="gis gi-inbox"></i>
							</span>
							<span class="flex-truncate with-count-badge">받은 편지함</span>
							<span class="counting mail-badge" id="spLeftb0" style="display: none;"></span>
						</a>
					</li>

					<!-- 개인편지함 -->
					<c:if test="${not empty requestScope.personalMailboxList || fn:length(requestScope.personalMailboxList) > 0}">
					<li class="el-collapse gt-mt-8 gt-mb-8">
						<div class="el-collapse-item ">
							<div class="el-collapse-item__header menu-item" id="PersonalMailboxOption" onclick="toggleShowHide(this.id)" title="개인 편지함">
								<span class="link gt-pl-10">
									<span class="collapse-prefix-icon">
										<i class="fal fa-chevron-up" id="toggleIcon"></i>
									</span>
									<span class="flex-truncate with-count-badge collapse">개인 편지함</span>
								</span>
							</div>
							<!-- 개인편지함 toggle 여부 -->
							<div class="el-collapse-item__wrap" id="PersonalMailboxOptionToggle" style="display: block">
								<ul class="el-collapse-item__content ui-sortable" id="PersonalMailboxSortable">
									
									<c:forEach var="personalMailbox" items="${requestScope.personalMailboxList}">
									<li class="menu-item ui-sortable-handle" title="${personalMailbox.personalMailboxTypeName}" id="${personalMailbox.personalMailboxTypeId}">
										<a href="<%= ctxPath%>/mail/mailList.gw?mailType=6&personalMailboxTypeId=${personalMailbox.personalMailboxTypeId}" class="link" id="mailbox_6_${personalMailbox.personalMailboxTypeId}">
											<span class="link-prefix-icon">
												<!-- 잠긴 메일함 확인 -->
												<i class="gis gi-label"></i>
											</span>
											<span class="flex-truncate with-count-badge">${personalMailbox.personalMailboxTypeName}</span>
											<!-- 안 읽은 메일 갯수 표기-->
											<span class="counting mail-badge" id="spLeftp813" style="display: none;"></span>
										</a>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</li>
					</c:if>
					
					<!-- 보낸 편지함 -->
					<li class="menu-item only">
						<a href="<%= ctxPath%>/mail/mailList.gw?mailType=2" class="link gt-pl-10" id="mailbox_2">
							<span class="link-prefix-icon">
								<i class="gis gi-paper-plane"></i>
							</span>
							<span class="flex-truncate with-count-badge">보낸 편지함</span>
							<span class="counting mail-badge" id="spLeftb1"></span>
						</a>
					</li>
					
					<!-- 임시 보관함 -->
					<li class="menu-item only">
						<a href="<%= ctxPath%>/mail/mailList.gw?mailType=4" class="link gt-pl-10" id="mailbox_4">
							<span class="link-prefix-icon">
								<i class="gis gi-archive"></i>
							</span>
							<span class="flex-truncate with-count-badge">임시 보관함</span>
							<span class="counting mail-badge" id="spLeftb3"></span>
						</a>
					</li>

					<!-- 휴지통 -->
					<li class="menu-item only">
						<a href="<%= ctxPath%>/mail/mailList.gw?mailType=5" class="link gt-pl-10" id="mailbox_5">
							<span class="link-prefix-icon">
								<i class="gis gi-trash-alt"></i>
							</span>
							<span class="flex-truncate">
								휴지통
								<span style="margin: 0px;" class="counting mail-badge" id="spLeftb5"></span>
							</span>
							<button class="collapse-suffix-icon" onclick="javascript:Mail.EmptyMailbox(&#39;b5&#39;);">
								<i class="gi gi-trash-del" data-tooltip="휴지통 비우기" data-tooltip-placement="bottom"></i>
							</button>
						</a>
					</li>

					<!-- 환경설정 -->
					<li class="el-collapse gt-mt-8">
						<div class="el-collapse-item ">
							<div class="el-collapse-item__header menu-item" id="MailOption" onclick="toggleShowHide(this.id)">
								<span class="link gt-pl-10">
									<span class="collapse-prefix-icon">
										<i class="fal fa-chevron-up" id="toggleIcon"></i>
									</span>
									<span class="flex-truncate with-count-badge collapse">환경설정</span>
								</span>
							</div>
							<div class="el-collapse-item__wrap" id="MailOptionToggle" style="display: block">
								<ul class="el-collapse-item__content">
									
									<li class="menu-item">
										<a href="<%= ctxPath%>/mail/mailboxManage.gw" class="link" id="setting_m_mailbox">
											<span class="link-prefix-icon">
												<i class="gis gi-mailbox-check"></i>
											</span>
											<span class="flex-truncate with-count-badge">편지함 관리</span>
										</a>
									</li>
									
								</ul>
							</div>
						</div>
					</li>

				</ul>
			</nav>
		</div>

	</div>


</div>