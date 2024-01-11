<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<div id="router_split_item" class="split-item right" style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-3668c186="" class="management-div">
			<h1 data-v-3668c186="" class="title">결재양식</h1>
			<div data-v-3668c186="" class="d-table w-100">
				<table data-v-3668c186="" class="setting-table center">
					<colgroup data-v-3668c186="">
						<col data-v-3668c186="" style="width: 25%;">
						<col data-v-3668c186="" style="width: 25%;">
						<col data-v-3668c186="" style="width: 50%;">
					</colgroup>
					<thead data-v-3668c186="">
						<tr data-v-3668c186="">
							<th data-v-3668c186="">사용여부</th>
							<th data-v-3668c186="">양식</th>
							<th data-v-3668c186="">설명</th>
						</tr>
					</thead>
					<tbody data-v-3668c186="">
						<!---->
						<!---->
						
						<c:forEach var="formVo" items="${requestScope.formList}">
							<tr data-v-3668c186="">
								<c:if test="${formVo.isUse eq 1}">
									<td data-v-3668c186="">사용</td>
								</c:if>
								<c:if test="${formVo.isUse eq 0}">
									<td data-v-3668c186="">미사용</td>
								</c:if>
								
								<td data-v-3668c186="" class="text-left hover-link">
									${formVo.formName}
								</td>
								<td data-v-3668c186="" class="text-left">${formVo.description}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
