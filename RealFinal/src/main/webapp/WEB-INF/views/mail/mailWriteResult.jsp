<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();
%>


<div id="contents">

	<div class="setting_title send-title">
		<h3>
			
			<c:if test='${requestScope.isTemporary eq 0}'>
			<p>메일이 정상적으로 발송되었습니다.</p>
			</c:if>
			<c:if test='${requestScope.isTemporary eq 1}'>
			<p>메일이 임시보관함에 저장되었습니다.</p>
			</c:if>
			
		</h3>
	</div>

	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box">
			<div class="setting_field appr_write">
				
				<c:if test='${requestScope.isTemporary eq 0}'>
					<table class="tableType02 mgt_25">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th>받는 사람</th>
								<td>${requestScope.incomeEmp_str}${requestScope.incomeMail}</td>
							</tr>
							
							<c:if test='${not empty requestScope.referenceMail}'>
							<tr>
								<th>참조</th>
								<td>${referenceMail}</td>
							</tr>
							</c:if>
							
							<c:if test='${not empty requestScope.hiddenReferenceMail}'>
							<tr>
								<th>숨은 참조</th>
								<td>${hiddenReferenceMail}</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</c:if>
				
			</div>
		</div>
	</div>

</div>