<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>





<script type="text/javascript">

$(document).ready(function() {
	
	
	
})// end of $(document).ready(function(){})-------------------------


// Function Declaration
<%-- 직무 추가하는 input태그 보여주기 --%>
function viewJobAddInput(){
	$("span#jobAddInput").removeClass('hide');
	$("a#jobAddCancle").removeClass('hide');
}

<%-- 직무 추가하는 input태그 숨기기 --%>
function closeJobAddInput(){
	$("input#newJob").val("");
	$("span#jobAddInput").addClass('hide');
	$("a#jobAddCancle").addClass('hide');
}

<%-- 직무 추가하기 --%>
function addNewJob(){
	if($("input#newJob").val().trim()==''){
		alert("추가할 직무명을 입력하십시오.");
		return;
	}
	else{
		$.ajax({
        	url : "<%=ctxPath%>/organization/addJob.gw",
			type : "get",
			data : {"jobName":$("input#newJob").val()},
			dataType : "json",
			async : false,
			success : function(json) {
				if(json.result == 1) {
					alert("직무추가에 성공했습니다.");
					window.location.reload();
				}
				else if(json.result == 0) {
					alert("입력한 직무가 이미 존재하므로 추가할 수 없습니다.");
					$("input#newJob").val("");
					return;
				}
				
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});	
	}	
  	
}

<%-- 직무 삭제하기 --%>
function delJob(jobId){
	$.ajax({
    	url : "<%=ctxPath%>/organization/delJob.gw",
		type : "get",
		data : {"jobId":jobId},
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1) {
				alert("직무를 삭제했습니다.");
				window.location.reload();
			}
			else if(json.result == 2) {
				alert("해당 직무의 사원이 존재하므로 삭제할 수 없습니다.");
				return;
			}
			else if(json.result == 0) {
				alert("직무 삭제에 실패했습니다.");
				return;
			}
		},
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}

 
<%-- 직위 추가하는 input태그 보여주기 --%>
function viewPositionAddInput(){
	$("tr#positionAdd").removeClass('hide');
	$("a#positionAddCancle").removeClass('hide');
}

<%-- 직위 추가하는 input태그 숨기기 --%>
function closePositionAddInput(){
	$("input#positionAddInput").val("");
	$("tr#positionAdd").addClass('hide');
	$("a#positionAddCancle").addClass('hide');
}

<%-- 직위 추가하기 --%>
function addNewPosition(){
	if($("input#positionAddInput").val().trim()==''
		|| $("input#positionIdAddInput").val().trim()==''){
		alert("추가할 직위등급과 직위명을 모두 입력하십시오.");
		return;
	}
	else if(isNaN($("input#positionIdAddInput").val())== true){
		alert("추가할 직위등급을 올바르게 입력하십시오.");
		$("input#positionIdAddInput").val("");
		return;
	}
	else{
		$.ajax({
        	url : "<%=ctxPath%>/organization/addPosition.gw",
			type : "get",
			data : {"positionId":$("input#positionIdAddInput").val(),
					"positionName":$("input#positionAddInput").val()},
			dataType : "json",
			async : false,
			success : function(json) {
				if(json.result == 1) {
					alert("직위추가에 성공했습니다.");
					window.location.reload();
				}
				else if(json.result == 0) {
					alert("입력한 직위등급 또는 직위명이 이미 존재하므로 추가할 수 없습니다.");
					$("input#positionIdAddInput").val("");
					$("input#positionAddInput").val("");
					return;
				}
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});	
	}	
} 

<%-- 직위 삭제하기 --%>
function delPosition(positionId){
	$.ajax({
    	url : "<%=ctxPath%>/organization/delPosition.gw",
		type : "get",
		data : {"positionId":positionId},
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1) {
				alert("직위를 삭제했습니다.");
				window.location.reload();
			}
			else if(json.result == 2) {
				alert("해당 직위의 사원이 존재하므로 삭제할 수 없습니다.");
				return;
			}
			else if(json.result == 3) {
				alert("해당 직위보다 낮은 등급의 사원이 존재하므로 삭제할 수 없습니다.");
				return;
			}
			else if(json.result == 4) {
				alert("전자결재 보안등급에 설정된 지위로 삭제할 수 없습니다.");
				return;
			}
			else if(json.result == 0) {
				alert("직위 삭제에 실패했습니다.");
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
		<h3 style="font-size: 22px;">직위/직무 관리</h3>
	</div>

	<div class="content_inbox insa-new">
		<div class="cont_box approve">
			<div class="setting_field">
				<div class="cont_hidden">
					<h4 class="fl mgr_20">직위 관리</h4>
					<a href="javascript:void(0);" class="weakblue" onclick="viewPositionAddInput()">
						<span class="sms_plus"></span>
						등급 추가
					</a>
				</div>
				<table class="tableType02 insa-position gon" id="posTable">
					<caption>직위 관리 표</caption>
					<colgroup>
						<col width="20%">
						<col>
					</colgroup>
					<tbody>
						<%-- 직위 목록 가져오기 --%>
						<c:if test="${not empty requestScope.positionList || fn:length(requestScope.positionList) > 0}">
						<c:forEach var="position" items="${requestScope.positionList}">
							<tr>
								<th scope="row">
									<span class="position-levels">${position.positionId}</span>
									등급
								</th>
								<td class="sortPosition ui-sortable">
									<span class="position ui-sortable-handle">${position.positionName}</span>
									<span class="icon file_delete" style="cursor: pointer;" onclick="delPosition(${position.positionId})"></span>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						<tr class="hide" id="positionAdd">
							<th scope="row">
								<input type="text" class="input" id="positionIdAddInput" size=10>
								등급
							</th>
							<td class="sortPosition ui-sortable">
								<span class="position input ui-sortable-handle">
									<input type="text" class="input" id="positionAddInput" onkeydown='if(event.keyCode==13) addNewPosition();'>
									<a href="javascript:void(0);" class="weakblue hide" onclick="closePositionAddInput()" id="positionAddCancle">
										<span class="sms_minus"></span>
										취소
									</a>
								</span>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="bt_left">
					<button type="button" id="savePosition" onclick="addNewPosition()">저장</button>
				</div>

				<div class="cont_hidden">
					<h4 class="fl mgr_20">직무 관리</h4>
					<a href="javascript:void(0);" class="weakblue" onclick="viewJobAddInput()">
						<span class="sms_plus"></span>
						직무 추가
					</a>
				</div>
				<table class="tableType01 insa-position gon2" style="border-bottom: 0;" id="jobTable">
					<caption>직무 관리 표</caption>
					<tbody width="100%">
						<tr width="100%">
							<td>
								<%-- 직무 목록 가져오기 --%>
								<c:if test="${not empty requestScope.jobList || fn:length(requestScope.jobList) > 0}">
								<c:forEach var="job" items="${requestScope.jobList}">
									<span class="job" no="${job.jobId}">${job.jobName}</span>
									<span class="icon file_delete" style="cursor: pointer;" onclick="delJob(${job.jobId})"></span>
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								</c:if>
								<span class='position modify hide' id="jobAddInput">
									<input type='text' id='newJob' onkeydown='if(event.keyCode==13) addNewJob();'>
									<a href="javascript:void(0);" class="weakblue hide" onclick="closeJobAddInput()" id="jobAddCancle">
										<span class="sms_minus"></span>
										취소
									</a>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="bt_left">
					<button type="button" id="saveJob" onclick="addNewJob()">저장</button>
				</div>
			</div>
		</div>
	</div>
</div>

