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
	
	
	<%-- 검색 자동완성 수정필  --%>
	
	<%-- 내 정보 보기 페이지로 이동 --%>
	$("button#btn_myinfo").click(function(){
		location.href="<%= ctxPath%>/organization/myInfoViewPage.gw";
	});
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration
<%-- 
function clickOrganization(id, name, event){
	if($(event.target).attr("id")=="dep"){ // 부서를 클릭했을 경우
		$("input#dep").val("");
		$("input#team").val("");
		$("input#depName").val("");
		$("input#teamName").val("");
		
		$("input#dep").val(id);
		$("input#depName").val(name);
	}
	else if($(event.target).attr("id")=="team"){ // 팀을 클릭했을 경우
		$("input#dep").val("");
		$("input#team").val("");
		$("input#depName").val("");
		$("input#teamName").val("");
		
		$("input#team").val(id);
		$("input#teamName").val(name);
	}

	
	// 이거 펑션으로 옮겨야겟다 
	// 에이작스로 부서번호, 팀번호넘겨서
	// 컨트롤러에서 부서,팀 값 받아 
	$.ajax({
    	url : "<%=ctxPath%>/organization/selectEmpInfo.gw",
		type : "get",
		data : {"depId" : $("input#dep").val(),
				"teamId" : $("input#team").val() },
		dataType : "json",
		async : false,
		success : function(json) {
			
			if(json.length > 0){ // 성공한 경우 
				$("section#org-members").remove();
			
				let html = "";
			
				html += "<section class='org-members' id='org-members'>"
					  + "<h4>"
					  +		"<a href='javascript:void(0);'>하이웍스오피스</a>"
					  +		"&gt;" + $("input#depName").val()
					  +		"<span class='count'>(5)</span>"
					  +	"</h4>"
					  
					  
					  
				
				if($("input#team").val().trim().length == '0'){ // 부서를 클릭했을 경우		
					  
					$.each(json, function(index, item){
						
						$.each(item.teamName, function(index, item){
							
							html += "<div class='org-members-unit-small after'></div>"
								  + "<p>"+ item +"</p>"
								  + "<div class='org-members-unit-small after'>";
							
						/*   html += 
								<dl title="김이사
									이사
									부서1>팀1" onclick="OrgMember.getOrgMemberInfo(3848)">
												<dt class="name">김이사</dt>
												<dd class="picture">
													<img class="lazy_img" alt="" width="70px" height="70px" src="/tempfinal.onhiworks.com/common/profile/image/3848/80/main" style="display: inline-block;">
												</dd>
												<dd class="teams">팀1</dd>
												<dd class="position">이사</dd>
											</dl>	  */ 
						});// end of $.each(item.fk_teamId, function(index, item) ------------
					
					});
				}		
					
							
							
							
						/*
						<section class="org-members" id="org-members">
	<h4>
		<a href="javascript:void(0);" onclick="OrgMember.getNodeTypeData();">하이웍스오피스</a>
		&gt; 부서1
		<span class="count">(5)</span>
	</h4>
	<div class="org-members-unit-small after"></div>
	<p>팀1</p>
	<div class="org-members-unit-small after">
		<dl title="김이사
이사
부서1>팀1" onclick="OrgMember.getOrgMemberInfo(3848)">
			<dt class="name">김이사</dt>
			<dd class="picture">
				<img class="lazy_img" alt="" width="70px" height="70px" src="/tempfinal.onhiworks.com/common/profile/image/3848/80/main" style="display: inline-block;">
			</dd>
			<dd class="teams">팀1</dd>
			<dd class="position">이사</dd>
		</dl>
		<dl title="이사장
이사
부서1>팀1" onclick="OrgMember.getOrgMemberInfo(3855)">
			<dt class="name">이사장</dt>
			<dd class="picture">
				<img class="lazy_img" alt="" width="70px" height="70px" src="/tempfinal.onhiworks.com/common/profile/image/3855/80/main" style="display: inline-block;">
			</dd>
			<dd class="teams">팀1</dd>
			<dd class="position">이사</dd>
		</dl>
	</div>
	<p>팀2</p>
	<div class="org-members-unit after">
		<dl title="박상무
부장
부서1>팀2" onclick="OrgMember.getOrgMemberInfo(3879)">
			<dt class="name">박상무</dt>
			<dd class="picture">
				<img class="lazy_img" alt="" width="70px" height="70px" src="/tempfinal.onhiworks.com/common/profile/image/3879/80/main" style="display: inline-block;">
			</dd>
			<dd class="teams">팀2</dd>
			<dd class="position">부장</dd>
		</dl>
		<dl title="양대리
대리
부서1>팀2" onclick="OrgMember.getOrgMemberInfo(3878)">
			<dt class="name">양대리</dt>
			<dd class="picture">
				<img class="lazy_img" alt="" width="70px" height="70px" src="/tempfinal.onhiworks.com/common/profile/image/3878/80/main" style="display: inline-block;">
			</dd>
			<dd class="teams">팀2</dd>
			<dd class="position">대리</dd>
		</dl>
		<dl title="차은우
이사
부서1>팀2" onclick="OrgMember.getOrgMemberInfo(3880)">
			<dt class="name">차은우</dt>
			<dd class="picture">
				<img class="lazy_img" alt="" width="70px" height="70px" src="/tempfinal.onhiworks.com/common/profile/image/3880/80/main" style="display: inline-block;">
			</dd>
			<dd class="teams">팀2</dd>
			<dd class="position">이사</dd>
		</dl>
	</div>
</section>
						*/
						
						
					
					
					
					
					
					
					팀에 속한 임직원 정보 목록 가져오기
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
				/* 	if() */
					
					
					
			}
			
			
			/* console.log(json.fk_depId);
			if(json.fk_depId == null){
				console.log("dd");
			} */
			/* if(json.fk_depId)
		 */
		
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
	
}
 --%>


</script>


<div id="contents" style="left: 276px;">

	<div class="setting_title after gt-pv-10">
		<!-- <h3 class="fl" style="font-size: 22px;">
			<div class="gt-align-middle hw-searching" style="width: 360px">
				<input type="text" class="hw-input ui-autocomplete-input" placeholder="임직원 검색" id="memberName" autocomplete="off">
				<i class="far fa-search / icon-suffix"></i>
			</div>
		</h3> -->
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
						<span class="title">하이웍스오피스</span>
						<!-- <span class="num"></span> -->
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
									<%-- 	<span class="num">(${dep.count})</span> --%>
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
											<!-- 	<span class="num">(2)</span> -->
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
					하이웍스오피스
					<!-- <span class="count">(6)</span> -->
				</h4>
				<div class="org-members-unit after">
					
				</div>
				
				
				<%-- 부서 목록 가져오기 --%>
				<c:if test="${not empty requestScope.depList || fn:length(requestScope.depList) > 0}">
				<c:forEach var="dep" items="${requestScope.depList}">
				<h5>
					${dep.depName}
					<!-- <span class="count">(2)</span> -->
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
		<div class="org-list after hide" id="type_of_other">
			<section class="org-tree">
				<div class="org-tree-wrap" id="other-tree">
					<ul class="search-result"></ul>
				</div>
			</section>

			<section class="org-members" id="other-members"></section>
		</div>
		<div class="org-list after" id="type_of_search" style="display: none;">
			<section class="org-tree">
				<div class="org-tree-wrap" id="search-tree">
					<ul class="search-result">
						<li>
							<div class="container">
								<h3>검색 결과</h3>
							</div>
						</li>
					</ul>
				</div>
			</section>

			<section class="org-members" id="search-members"></section>
		</div>
	</div>




</div>