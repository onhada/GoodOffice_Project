<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>



<style>
.org_map .menu_all .sub {
    display: block;
    position: absolute;
    left: -117px;
} 
</style>


<script type="text/javascript">

$(document).ready(function() {
	
	<%-- 하위조직 생성창 보이게 --%>
	$("a.menu_all").click(function(e){
		if($(e.target).find("span").attr("style")=="display: none;"){ 
			$(e.target).find("span").attr("style","display: block;");
			$(e.target).find("span").css("z-index", "9999"); // 수정필 맨 위로 왜 안 보임 ?
		}
		else if($(e.target).find("span").attr("style")=="display: block;"){ 
			$(e.target).find("span").attr("style","display: none;");
		}
		
	});
	
	<%-- 부서 생성 input 보이기/숨기기 --%>
	$("a#depAdd").click(function(e){
		if($(e.target).parent().find("a#depAddView").hasClass("hide") === true){ 
			$(e.target).parent().find("a#depAddView").removeClass("hide");
		}
		else if($(e.target).parent().find("a#depAddView").hasClass("hide") === false){ 
			$(e.target).parent().find("a#depAddView").addClass("hide");
		}
	});
	$("span#closeDepAddInput").click(function(e){
		$("input#depAddInput").val("");
		$(e.target).parent().addClass("hide");
	});
	
	<%-- 팀 생성 input 보이기/숨기기 --%>
	$("a#teamAdd").click(function(e){
		if($(e.target).parent().find("a#teamAddView").hasClass("hide") === true){ 
			$(e.target).parent().find("a#teamAddView").removeClass("hide");
		}
		else if($(e.target).parent().find("a#teamAddView").hasClass("hide") === false){ 
			$(e.target).parent().find("a#teamAddView").addClass("hide");
		}
	});
	$("span#closeTeamAddInput").click(function(e){
		$("input#TeamAddInput").val("");
		$(e.target).parent().addClass("hide");
	});
	
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration
<%-- 부서 추가하기 --%>
function addNewDep(){
	if($("input#depAddInput").val().trim()==''){
		alert("추가할 부서명을 입력하십시오.");
		return;
	}
	else{
		$.ajax({
	    	url : "<%=ctxPath%>/organization/addNewDep.gw",
			type : "get",
			data : {"depName":$("input#depAddInput").val()},
			dataType : "json",
			async : false,
			success : function(json) {
				if(json.result == 1) {
					alert("부서를 추가했습니다.");
					window.location.reload();
				}
				else if(json.result == 0) {
					alert("동일한 부서명이 존재하므로 추가할 수 없습니다.");
					return;
				}
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});	
	}	
}


<%-- 부서 삭제하기 --%>
function delDep(depId){
	$.ajax({
    	url : "<%=ctxPath%>/organization/delDep.gw",
		type : "get",
		data : {"depId":depId},
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1) {
				alert("부서를 삭제했습니다.");
				window.location.reload();
			}
			else if(json.result == 0) {
				alert("부서 내에 팀이 존재하므로 부서를 삭제할 수 없습니다.");
				return;
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});		
}


<%-- 팀 추가하기 --%>
function addNewTeam(){
	if($("input#teamAddInput").val().trim()==''){
		alert("추가할 팀명을 입력하십시오.");
		return;
	}
	else{
		$.ajax({
	    	url : "<%=ctxPath%>/organization/addNewTeam.gw",
			type : "get",
			data : {"depId":$("select[id=depList] option:selected").val(),
					"teamName":$("input#teamAddInput").val()},
			dataType : "json",
			async : false,
			success : function(json) {
				if(json.result == 1) {
					alert("팀을 추가했습니다.");
					window.location.reload();
				}
				else if(json.result == 0) {
					alert("동일한 팀명이 존재하므로 추가할 수 없습니다.");
					return;
				}
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});	
	}	
}


<%-- 팀 삭제하기 --%>
function delTeam(teamId){
	$.ajax({
    	url : "<%=ctxPath%>/organization/delTeam.gw",
		type : "get",
		data : {"teamId":teamId},
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1) {
				alert("팀을 삭제했습니다.");
				window.location.reload();
			}
			else if(json.result == 0) {
				alert("팀에 소속된 사원이 존재하므로 팀을 삭제할 수 없습니다.");
				return;
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});		
}

</script>




<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 style="font-size: 22px;">조직 관리</h3>
	</div>

	<div class="content_inbox">
		<div class="cont_box">
			<div class="insa_container">

				<div class="btn_insa_top1">
					<a>
						<a class="weakblue" id="depAdd" style="cursor: pointer; margin: 0 2% 0 0;">
							<span class="sms_plus"></span>
							부서 추가
						</a>
						<a class="hide" id="depAddView">
							<input type="text" id="depAddInput" onkeydown='if(event.keyCode==13) addNewDep();'>
							<span class="weakblue" style="cursor: pointer; margin: 0 1% 0 1%;" onclick="addNewDep();"> 확인</span>
							<span class="weakblue" style="cursor: pointer;" id="closeDepAddInput"> 취소</span>
						</a>
					</a>
					<br>
					<a class="weakblue">
						<a class="weakblue" id="teamAdd" style="cursor: pointer; margin: 0 2% 0 0;">
							<span class="sms_plus"></span>
							팀 추가
						</a>
						<a class="hide" id="teamAddView">
							<select id="depList" class="fl mgl_50">
								<c:if test="${not empty requestScope.depList || fn:length(requestScope.depList) > 0}">
									<c:forEach var="dep" items="${requestScope.depList}">
										<option value="${dep.depId}">${dep.depName}</option>
									</c:forEach>
								</c:if>
							</select>
							<input type="text" id="teamAddInput" onkeydown='if(event.keyCode==13) addNewTeam();'>
							<span class="weakblue" style="cursor: pointer; margin: 0 1% 0 1%;" onclick="addNewTeam();"> 확인</span>
							<span class="weakblue" style="cursor: pointer;" id="closeTeamAddInput"> 취소</span>
						</a>
					</a>
				</div>

				<ol id="orgMapHeader" class="org_map_header">
					<li style="display: list-item;">회사</li>
					<li style="display: list-item;">부서</li>
					<li style="display: list-item;">팀</li>
				</ol>

				<ol id="orgMap" class="org_map">
					<li class="1depth">
						<div class="wrap1" style="z-index: 0;">
							<span class="name" title="그룹웨어오피스">그룹웨어오피스</span>
						</div>
						<ol>

							<%-- 부서 목록 가져오기 시작 --%>
							<c:if test="${not empty requestScope.depList || fn:length(requestScope.depList) > 0}">
								<c:forEach var="dep" items="${requestScope.depList}">
									<li>
										<div class="wrap1" style="z-index: 0;">
											<span title="${dep.depName}">${dep.depName}</span>
											<div class="menu">
												<span class="icon file_delete" style="cursor: pointer;" onclick="delDep(${dep.depId})"></span>
												&nbsp;
											</div>
										</div>

										<ol>
											<%-- 팀 목록 가져오기 시작 --%>
											<c:if test="${(not empty requestScope.teamList || fn:length(requestScope.teamList) > 0)}">
												<c:forEach var="team" items="${requestScope.teamList}">
													<c:if test="${dep.depId == team.fk_depId}">
														<li>
															<div class="wrap1" style="z-index: 0;">
																<span class="name" title="${team.teamName}">${team.teamName}</span>
																<div class="menu">
																	<span class="icon file_delete" style="cursor: pointer;" onclick="delTeam(${team.teamId})"></span>
																	&nbsp;
																</div>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</c:if>
											<%-- 팀 목록 가져오기 끝 --%>
										</ol>
									</li>
									<div style="line-height: 250%;">
										<br>
									</div>
								</c:forEach>
							</c:if>
							<%-- 부서 목록 가져오기 끝 --%>

						</ol>
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
