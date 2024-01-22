<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<style>
.org-list {
	width: 1200px;
}
.org-members {
	width: 70%;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	<%-- 카테고리 접기/펼치기 --%>
	$("i.fa-minus").click(function(e){
		if($(e.target).attr("class")=="far fa-minus"){ 
			$(e.target).attr("class","far fa-plus");
			$(e.target).parent().parent().find("ul").css("display", "none");
		}
		else if($(e.target).attr("class")=="far fa-plus" && $(e.target).attr("id") == "officeCategory"){
			$(e.target).attr("class","far fa-minus");
			$("i").attr("class","far fa-minus");
			$(e.target).parent().parent().find("ul").css("display", "block");
		}
		else if($(e.target).attr("class")=="far fa-plus"){
			$(e.target).attr("class","far fa-minus");
			$(e.target).parent().parent().find("ul").css("display", "block");
		}
	});
	
	
	<%-- 내 정보 보기 페이지로 이동 --%>
	$("button#btn_myinfo").click(function(){
		location.href="<%= ctxPath%>/organization/myInfoViewPage.gw";
	});
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration



</script>


<div id="contents" style="left: 276px;">

	<div class="setting_title after gt-pv-10">
		<div class="fr gt-mt-3">
			<button type="button" class="gt-align-middle gt-mr-20 hw-button outline-gray2 rounded font-size-13" id="btn_myinfo">내 정보 보기</button>
		</div>
	</div>
	<div class="content_inbox">
		<div class="org-list after" id="type_of_org">
			<section class="org-tree">
				<div class="org-tree-wrap" id="org-tree">
					<h4 class="active" onclick="OrgMember.getNodeTypeData(null, event)">
						<i class="far fa-minus" id="officeCategory" onclick="OrgMember.selectPluseMinus(2816, event);"></i>
						<span class="title">GoodOffice</span>
					</h4>
					
							<input type="hidden" id="dep">
							<input type="hidden" id="depName" value="">
							<input type="hidden" id="team">
							<input type="hidden" id="teamName" value="">
					
						<ul id="node_2816" class="is-first-node">
							<%-- 부서 목록 가져오기 --%>
							<c:if test="${not empty requestScope.depList || fn:length(requestScope.depList) > 0}">
							<c:forEach var="dep" items="${requestScope.depList}">
								<li id="node_3112" class="">
									<div class="container" id="dep" onclick="clickOrganization(${dep.depId}, '${dep.depName}', event);">
										<i class="far fa-minus" ></i>
										<span class="title" id="depId" depId="${dep.depId}">${dep.depName} </span>
									</div>
									<ul style="display: block;">
										<%-- 팀 목록 가져오기 --%>
										<c:if test="${(not empty requestScope.teamList || fn:length(requestScope.teamList) > 0)}">
										<c:forEach var="team" items="${requestScope.teamList}">
										<c:if test="${dep.depId == team.fk_depId}">
										<li id="node_3113" class="">
											<div class="container selected_node" id="team" onclick="clickOrganization(${team.teamId}, '${team.teamName}', event);">
												<i class="far org-end"></i>
												<span class="title" id="teamId" teamId="${team.teamId}">${team.teamName} </span>
											</div>
										</li>
										</c:if>
										</c:forEach>
										</c:if>
									</ul>
								</li>
							</c:forEach>
							</c:if>	
						</ul>					
					
				</div>
			</section>

			<section class="org-members" id="org-members">
				<h4>
					GoodOffice
				</h4>
				<div class="org-members-unit after">
					
				</div>
				
				
				<%-- 부서 목록 가져오기 --%>
				<c:if test="${not empty requestScope.depList || fn:length(requestScope.depList) > 0}">
				<c:forEach var="dep" items="${requestScope.depList}">
				<h5>
					${dep.depName}
				</h5>
				<div class="org-members-unit-small after"></div>
					
					<%-- 팀 목록 가져오기 --%>
					<c:if test="${(not empty requestScope.teamList || fn:length(requestScope.teamList) > 0)}">
					<c:forEach var="team" items="${requestScope.teamList}">
					<c:if test="${dep.depId == team.fk_depId}">
					<p>${team.teamName}</p>
					<div class="org-members-unit-zero after">
						<div class="org-members-unit-small after">
						
							<%-- 팀에 속한 임직원 정보 목록 가져오기 --%>
							<c:if test="${(not empty requestScope.empInfoList || fn:length(requestScope.empInfoList) > 0)}">
							<c:forEach var="empInfo" items="${requestScope.empInfoList}">
							<c:if test="${empInfo.fk_teamId == team.teamId}">
							<dl title="${empInfo.empName} ${empInfo.positionName} 부서1&gt;${empInfo.teamName}" onclick="OrgMember.getOrgMemberInfo(3848)">
								<dt class="name">${empInfo.empName}</dt>
								<dd class="picture">
									<img class="lazy_img" alt="" width="70px" height="70px" src="<%= ctxPath%>/resources/image/profileImg.png" style="display: inline-block;">
								</dd>
								<dd class="teams">${empInfo.teamName}</dd>
								<dd class="position">${empInfo.positionName}</dd>
							</dl>
							</c:if>
							</c:forEach>
							</c:if>
						</div>
					</div>
					</c:if>
					</c:forEach>
					</c:if>
					
				</c:forEach>
				</c:if>
				
				
				
				<div class="org-members-unit-zero after">
					<div class="org-members-unit after"></div>
				</div>
				<div class="org-members-unit after"></div>
			</section>
		</div>
	</div>




</div>