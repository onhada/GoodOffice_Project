<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>







<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>나의 예약 목록</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		
		<div class="setting_field" style="margin-bottom: 50px;">
			
			<h4>예약 목록</h4>
			<div class="pdb_50">
				<table class="tableType01 rs-table">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">분류</th>
							<th scope="col">자원명</th>
							<th scope="col">예약 시간</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody id="booking_list_tbody">
						<c:if test="${not empty requestScope.reservedList || fn:length(requestScope.reservedList) > 0}">
						<c:forEach var="reservedResource" items="${requestScope.reservedList}">
							<tr>
								<td>${reservedResource.resourceCategoryName}</td>
								<td>${reservedResource.resourceName}</td>
								<td>${reservedResource.rsvStartDayTime} ~ ${reservedResource.rsvEndDayTime}</td>
								<td>
									<button type="button" name="button" class="weakblue rsv_detail_view" rsvResourceId="${reservedResource.rsvResourceId}" onclick="reservation_info_detail_open(${reservedResource.rsvResourceId});">상세보기</button>
									<span class="grey_bar">|</span>
									<c:if test='${reservedResource.returnStatus != "0"}'>
									<button type="button" name="button" class="weakblue booking_return_layer_btn" onclick="returnRsourceModalOpen(${reservedResource.rsvResourceId})">반납</button>
									<span class="grey_bar">|</span>
									</c:if>
									<button type="button" name="button" class="weakblue del_booking_layer_btn" onclick="delRsvModalOpen(${reservedResource.rsvResourceId})">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty requestScope.reservedList || fn:length(requestScope.reservedList) == 0}">
							<tr>
								<td colspan="4" class="center">리스트가 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<div class="">
				<h4>대기 목록</h4>
				<table class="tableType01 rs-table">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">분류</th>
							<th scope="col">자원명</th>
							<th scope="col">예약 시간</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody id="booking_ready_list_tbody">
						<c:if test="${not empty requestScope.waitingForApprovalList || fn:length(requestScope.waitingForApprovalList) > 0}">
						<c:forEach var="waitingResource" items="${requestScope.waitingForApprovalList}">
							<tr>
								<td>${waitingResource.resourceCategoryName}</td>
								<td>${waitingResource.resourceName}</td>
								<td>${waitingResource.rsvStartDayTime} ~ ${waitingResource.rsvEndDayTime}</td>
								<td>
									<c:if test='${waitingResource.approvalStatus == "1"}'>
									<span class="point_color rsv_detail_view cpointer" onclick="reservation_info_detail_open(${waitingResource.rsvResourceId});">승인 대기 중</span>
									</c:if>
									<c:if test='${waitingResource.approvalStatus == "3"}'>
									<span class="point_color booking_detail_view cpointer" onclick="reservation_info_detail_open(${waitingResource.rsvResourceId});">예약 반려</span>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty requestScope.waitingForApprovalList || fn:length(requestScope.waitingForApprovalList) == 0}">
							<tr>
								<td colspan="4" class="center">리스트가 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<!-- <p class="pdt_20">* 대기 목록은 7일 후 자동 삭제됩니다.</p> -->
		</div>
	</div>
</div>

















