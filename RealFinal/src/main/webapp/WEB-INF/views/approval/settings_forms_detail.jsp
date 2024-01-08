<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>




<div id="contents">
	<div class="content_inbox approval-admin non-space">
		<div class="cont_box">
			<div class="content_title after">
				<span class="detail_select">
					<a href="<%= ctxPath %>/approval/modifyForm.gw?formId=${requestScope.formDetail.formId}">양식 수정</a>
				</span>
			</div>

			<div class="allform-wrap">
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
							<th scope="row">보존 연한</th>
							<td>${requestScope.formDetail.preservationYear}년</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</div>