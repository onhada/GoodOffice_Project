<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>


<div id="contents">
	<div class="setting_title">
		<h3 class="fl">전자결재 관리자</h3>
		<a href="수정필" class="icon question tipsIcon" style="position: relative; top: 0; margin-left: 10px">
			<span class="blind">세부 설명</span>
		</a>
		<div class="tooltip hide" style="left: 25px; top: 0;">
			<div class="tooltip-box color-set-6" style="width: 400px;">
				<p>전체 오피스 관리자 외에도 전자결재를 관리할 사람을 지정합니다. 또한 관리자들에게 열람 권한이 없는 문서를 포함한 전체 결재 문서에 대한 열람 허용 여부를 설정합니다. 허용하지 않으면 전체 문서 목록에서 문서 내용을 볼 수 없으며, 설정 변경 기록과 문서의 열람 기록은 모두 보관됩니다.</p>
			</div>
		</div>
	</div>
	<div class="content_inbox approval-admin">
		<div class="cont_box">
			<div class="setting_field approval">
				<p>
					<button class="weakblue mgb_10" onclick="수정필">+ 관리자추가</button>
					<button type="button" onclick="수정필" class="approval-manager-button ml-16 xs">설정이력</button>
				</p>
				<table class="tableType01 listbox mgb_10" id="tableApprovalManager">
					<caption>관리자 리스트</caption>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: 150px;">
						<col>
						<col style="width: 150px;">
						<col style="width: 180px;">
						<col style="width: 120px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">이름</th>
							<th scope="col">아이디</th>
							<th scope="col">소속</th>
							<th scope="col">등록일</th>
							<th scope="col">전체 문서 열람</th>
							<th scope="col"></th>
						</tr>




						<c:if test="${not empty requestScope.adminList}">
							<!-- c:for -->

							<c:forEach var="adminVo" items="${requestScope.adminList}">



								<tr>
									<td>${adminVo.empName}</td>
									<td>${adminVo.id}</td>
									<td class="title">
										<div title="${adminVo.team}">${adminVo.team}</div>
									</td>
									<td class="center">${adminVo.registerDay}</td>

									<c:if test="${adminVo.isReadAllDocument eq '1'}">
										<td>
											<label>
												<input type="checkbox" onclick="수정필" checked>
												허용
											</label>
										</td>
									</c:if>
									
									<c:if test="${adminVo.isReadAllDocument eq '0'}">
										<td>
											<label>
												<input type="checkbox" onclick="수정필">
												허용
											</label>
										</td>
									</c:if>





									<c:if test="${adminVo.isFullAdmin eq '1'}">
										<td class="center">전체 관리자</td>
									</c:if>

									<c:if test="${adminVo.isFullAdmin eq '0'}">
										<td class="center">
											<button type="button" class="cursor weakblue" onclick="수정필">삭제</button>
										</td>
									</c:if>
								</tr>

							</c:forEach>
						</c:if>

					</thead>
					<tbody>
					</tbody>
				</table>

				<p style="margin-bottom: 30px">
					관리자 수 :
					<span id="countApprovalManager">${fn:length(adminList)}</span>
				</p>
			</div>
		</div>

	</div>

	<!-- <script>
		$j(document).ready(function() {
			ApprovalSetting.getManagers();
		});
		var approvalManagerTable = new approvalTableClass({
			table : "tableApprovalManager",
			row : [ [ "user_name", "" ], [ "user_id", "" ],
					[ "node_name", "title" ], [ "regdate", "center" ],
					[ "perm_read", "" ], [ "action", "center" ] ]
		});
	</script> -->
</div>