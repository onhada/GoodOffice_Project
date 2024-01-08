<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>


<script>
$(document).ready(function() {
	$("select[name='preserved_term'] option").each(function(){
		// 보존연한 선택 시키기
		
		if($(this).val() == ${requestScope.formDetail.preservationYear}){
			$(this).prop("selected", true)
		}
	})
	
	
	/* ? 박스 hover 시*/
	$("button.tipsIcon").hover(function(){
		$("div.tooltip").show();
	},
	function(){
		$("div.tooltip").hide();
	}
	);
	
	
	
})



function updateApprovalForm(){
	const frm = document.updatePreservationYearFrm;
	frm.method = "post";
	frm.action = "<%=ctxPath%>/approval/updateForm.gw";
	frm.submit();
}
</script>





<div id="contents">
	<div class="content_inbox approval-admin non-space">
		<div class="cont_box">
			<div class="content_title after">
				<span class="detail_select">
					<a onclick="updateApprovalForm()">확인</a>
				</span>
			</div>

			<div class="allform-wrap">
				<form name="updatePreservationYearFrm">
					<input type="hidden" name="formId" value="${requestScope.formDetail.formId}"/>
					<fieldset>
						<div class="after">
							<h4 class="fl">양식 ID</h4>
							<span class="gt-mh-20">${requestScope.formDetail.formId}</span>
							<c:if test="${requestScope.formDetail.isUse eq 1}">
								<span class="gt-mh-20">사용</span>
							</c:if>
							<c:if test="${requestScope.formDetail.isUse eq 0}">
								<span class="gt-mh-20">미사용</span>
							</c:if>
						</div>
					</fieldset>

					<div class="after">
						<h4 class="fl">기본 설정</h4>
					</div>

					<fieldset>
						<table class="tableType02 mgb_50">
							<caption>기본 설정 입력 양식</caption>
							<colgroup>
								<col style="width: 20%">
								<col style="width: 30%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">양식명</th>
									<td>${requestScope.formDetail.formName}</td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td>${requestScope.formDetail.description}</td>
								</tr>
								<tr>
									<th scope="row">
										보존 연한
										<button type="button"  class="icon question tipsIcon" style="float: none; position: relative; top: 3px;; margin-left: 10px">
											<span class="blind">세부 설명</span>
										</button>
										<div class="tooltip hide" style="left: 50px; top: -13px;">
											<div class="tooltip-box color-set-6" style="width: 400px;">
												<p>문서 작성 페이지에서 노출할 보존 연한을 설정하고, 기안자와 결재자가 이를 변경하지 못하도록 하려면 변경 금지를 선택합니다. 보존 연한이 만료되면 삭제 문서 목록으로 이동합니다.</p>
											</div>
										</div>
									</th>
									<td>
										<label>
											<select title="보존 연한 선택" style="width: 190px" name="preserved_term" id="preserved_term">
												<option value="1" selected>1년</option>
												<option value="3">3년</option>
												<option value="5">5년</option>
												<option value="10">10년</option>
											</select>
										</label>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>