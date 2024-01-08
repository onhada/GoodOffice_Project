<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<script>
$(document).ready(function() {
	
	$("select[name='formId']").change(function(){
		
		if($("select[name='formId'] option:selected").val() != ""){
			const frm = document.selectFormFrm;
			frm.method = "post";
			frm.action = "<%= ctxPath%>/approval/document/write/form.gw";
			frm.submit();
		}else{
			alert("문서 종류를 선택하세요.")
		}
		
	})
	
	
	$("span#btnWriteSaveDocument").click(function(){
		alert("문서 종류를 선택하세요.")
	})
	
})
</script>




<div id="contents">
	<div class="content_title">
		<fieldset style="max-width: 969px;">
			<span class="detail_select" id="btnWriteSaveDocument">
				<button type="button">기안하기</button>
			</span>
		</fieldset>
	</div>
	<div class="content_inbox">
		<div class="cont_box write">
			<div class="approval-wrap write">
				<h4 style="display: inline-block">기본 설정</h4>
				<table class="tableType02">
					<caption>전자결재 기본 설정</caption>
					<colgroup>
						<col style="width: 12.15%;">
						<col style="width: 44.94%">
						<col style="width: 12.15%">
						<col style="width: 30.76%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">문서 종류</th>
							<td>
								<form name="selectFormFrm">
									<select name="formId" class="write-select" autocomplete="off">
										<option value="">선택</option>
										<c:forEach var="formVo" items="${requestScope.formList}">
											<option value="${formVo.formId}">${formVo.formName}</option>
										</c:forEach>
									</select>
								</form>
							</td>
							<th scope="row">작성자</th>
							<td>
								<input type="hidden" name="empId" value="${sessionScope.loginUser.empId}">
								[${sessionScope.loginUser.depName}] ${sessionScope.loginUser.teamName}
								<span>${sessionScope.loginUser.positionName} ${sessionScope.loginUser.empName}</span>
							</td>
						</tr>
						<tr>
							<th scope="row">보존 연한</th>
							<td></td>
							<th scope="row">보안 등급</th>
							<td>
								<select name="security_level" class="fl write-select mgl_10 view">
									<option value="">보안 등급</option>
									<c:forEach var="securityVo" items="${requestScope.securityLevelList}">
										<option value="${securityVo.securityId}">${securityVo.securityLevel}등급</option>
									</c:forEach>
								</select>


								<!-- <span class="fl hide" id="set_security_level_n">등급</span> -->
								<a href="수정필" class="icon question tipsIcon" style="position: relative; top: 4px; margin-left: 10px">
									<span class="blind">세부 설명</span>
								</a>
								<div class="tooltip hide" style="right: 150px; top: 0;">
									<div class="tooltip-box" style="width: 450px;">
										<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할 수 있음.</p>
										<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(부장)등급 이상인 사람이 문서를 볼 수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
										<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(과장)등급 이상인 사람이 문서를 볼 수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
										<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할 수 있음.</p>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>





				<div class="after">
					<h4 class="fl mgr_20">결재선</h4>
				</div>
				<div id="approvalDocumentLine">문서 종류 선택 시 결재선이 노출됩니다.</div>


				<h4 class="mgt_50 js-approval-input-guide">상세 입력</h4>
				<div class="write_input js-approval-input-guide">문서 종류 선택 시 상세 입력이 노출됩니다.</div>
			</div>
		</div>
	</div>
</div>
