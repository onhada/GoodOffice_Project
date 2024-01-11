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
function editMyinfo(){

	if(! ($("input[name='birthYear']").val().trim()!="" && $("input[name='birthMonth']").val().trim()!="" && $("input[name='birthDay']").val().trim()!="") ){
		alert("생년월일을 모두 입력하세요.");
		return;
	}
	
	// 폼(form)을 전송(submit)
	const frm = document.frmMyinfo;
	frm.method = "post";
	frm.action = "<%= ctxPath%>/organization/editMyinfo.gw";
	frm.submit();
	
}



</script>


<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 style="font-size: 22px;">내 정보 관리</h3>
	</div>
	<div class="content_inbox insa-new">
		<div class="cont_box">
			<form name="frmMyinfo">
				<div class="resourcesInfo_setting">
					<table class="table_insa_gon1">
						<caption>인사정보 설정</caption>
						<colgroup>
							<col style="width: 20px;">
							<col style="width: 180px;">
							<col>
						</colgroup>
						<tbody>
							<input type="hidden" name="empId" value="${loginEmp.empId}">
							<tr>
								<th></th>
								<th>이름</th>
								<td>
									<p>${loginEmp.empName}</p>
								</td>
							</tr>
							<tr>
								<th></th>
								<th>소속</th>
								<td>
									<p>[${loginEmp.depName}]&nbsp;${loginEmp.teamName}</p>
								</td>
							</tr>
							<tr>
								<th></th>
								<th>근로형태</th>
								<td>
								${loginEmp.empType}
								<br>(1:일반직, 2:임원,촉탁, 3:연구직, 4:생산직)
								</td>
							</tr>
							<tr>
								<th></th>
								<th>직위</th>
								<td>${loginEmp.positionName}</td>
							</tr>
							<tr>
								<th></th>
								<th>
									<label for="job">직무</label>
								</th>
								<td>
									<select id="job" name="jobId">
										<%-- 직무 목록 가져오기 --%>
										<c:if test="${not empty requestScope.jobList || fn:length(requestScope.jobList) > 0}">
										<c:forEach var="job" items="${requestScope.jobList}">
											<option value="${job.jobId}" <c:if test="${job.jobId eq jobId}">selected</c:if>>${job.jobName}</option>
										</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<th></th>
								<th>이메일</th>
								<td>
									<p>${loginEmp.email}</p>
								</td>
							</tr>
							<tr>
								<th></th>
								<th>
									<label for="companyTel">사내 전화</label>
								</th>
								<td>
									<input autocomplete='off' name="companyTel" type="text" value="${loginEmp.companyTel}">
								</td>
							</tr>
							<tr>
								<th></th>
								<th>
									<label for="tel">휴대전화</label>
								</th>
								<td>
									<input autocomplete='off' name="tel" type="text" value="${loginEmp.tel}">
								</td>
							</tr>
							<tr>
								<th>
								</th>
								<th>입사일</th>
								<td>
									<p class="fl">${loginEmp.startworkday}</p>
								</td>
							</tr>
							<tr>
								<th>
								</th>
								<th>생년월일</th>
								<td class="birthday">
									<label>
										<input autocomplete='off' style="width: 70px" type="text" name="birthYear" title="년도 입력" value="${birthYear}">
										년
									</label>
									<label>
										<input autocomplete='off' style="width: 50px" type="text" name="birthMonth" title="월 입력" value="${birthMonth}">
										월
									</label>
									<label>
										<input autocomplete='off' style="width: 50px" type="text" name="birthDay" title="일 입력" value="${birthDay}">
										일
									</label>
								</td>
							</tr>
							<tr>
								<th>
								</th>
								<th>자택 주소</th>
								<td class="address">
									<label>
										우편번호
										<input type="text" autocomplete='off' style="width: 70px" name="postcode" title="우편번호" value="${loginEmp.postcode}">
									</label>
									<p>
										<label>
											주소 <input type="text" autocomplete='off' name="address" style="width: 480px; background: #fff;" title="주소" value="${loginEmp.address}">
											<br>
											상세주소 <input type="text" autocomplete='off' name="detailAddress" style="width: 480px; background: #fff;" title="상세주소" value="${loginEmp.detailAddress}">
										</label>
									</p>
								</td>
							</tr>
							
						</tbody>
					</table>
					<!-- submit button -->
					<div class="bt_left submit_button">
						<button type="button" onclick="editMyinfo()">저장</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
</div>
