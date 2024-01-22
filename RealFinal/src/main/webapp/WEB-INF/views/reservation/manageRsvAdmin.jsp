<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">

$(document).ready(function() {
	
})// end of $(document).ready(function(){})-------------------------


// Function Declaration
<%-- 예약관리자 삭제하기 --%>
function delRsvAdmin(adminId){
	$.ajax({
    	url : "<%=ctxPath%>/reservation/delRsvAdmin.gw",
		type : "get",
		data : {"adminId":adminId},
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.result == 1){
				alert("삭제되었습니다.");
				window.location.reload();
			}
			else{
				alert("삭제에 실패했습니다.")
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
		<h3>예약 관리자</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field">
			<div class="pdt_20">
				<table class="tableType01 rs-table">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">이름</th>
							<th scope="col">아이디</th>
							<th scope="col">소속</th>
							<th scope="col">등록일</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody id="booking_admin_list">
						<c:if test="${not empty requestScope.rsvAdminList || fn:length(requestScope.rsvAdminList) > 0}">
						<c:forEach var="rsvAdmin" items="${requestScope.rsvAdminList}">
							<tr no="${rsvAdmin.empId}">
								<td>${rsvAdmin.empName}</td>
								<td>${rsvAdmin.email}</td>
								<td>[${rsvAdmin.depName}] ${rsvAdmin.teamName}</td>
								<td>${rsvAdmin.registerDay}</td>
								<td>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="pdt_20">
				<p>
					총
					<span id="total_cnt">${requestScope.rsvAdmintotalCount}</span>
					명
				</p>
			</div>
		</div>
		<!-- Contents End-->
	</div>
</div>