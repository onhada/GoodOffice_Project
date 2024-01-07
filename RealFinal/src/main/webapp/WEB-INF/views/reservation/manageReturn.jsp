<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<script type="text/javascript">

$(document).ready(function() {
	
	// 상단 탭메뉴에서 선택한 승인상태 카테고리의 목록 보여주기
	$(".type").click(function(e){
		var type = $(e.target).parent().attr("id");		
		location.href="<%= ctxPath%>/reservation/returnManageAdmin.gw?type="+type;
	});
	
	// 상단 탭메뉴의 카테고리 선택 표시 
	var type = <%= request.getAttribute("type")%>;
	$(`li#${type}`).addClass("on");
 
	
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration

</script>





<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>반납 관리</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field">
			<ul class="tabType1">
				<li class="tab_menu" id="returnWait">
					<a href="javascript:void(0)" class="type">반납대기(<span id="return_cnt">4</span>)</a>
				</li>
				<li class="tab_menu" id="returned">
					<a href="javascript:void(0)" class="type">반납완료</a>
				</li>
			</ul>
			<div class="tab_page">
				<div class="pdt_20">
					<table class="tableType01 rs-table" id="return_list_table">
						<colgroup>
							<col width="35">
							<col width="">
							<col width="">
							<col width="">
							<col width="30%">
							<c:if test='${requestScope.type == "returnWait"}'>
							<col width="">
							</c:if>
						</colgroup>
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="name">
										요청자
									</a>
								</th>
								<th scope="col">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="category">
										카테고리
									</a>
								</th>
								<th scope="col">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="resource">
										자원
									</a>	
								</th>
								<th scope="col">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="booking_date">
										예약 시간
									</a>
								</th>
								<c:if test='${requestScope.type == "returnWait"}'>
								<th scope="col">설정</th>
								</c:if>
							</tr>
						</thead>
						<tbody id="return_list_tbody">
						
							<c:if test="${not empty requestScope.reservationList || fn:length(requestScope.reservationList) > 0}">
							<c:forEach var="reservationvo" items="${requestScope.reservationList}">
								<tr>
									<td>
									</td>
									<td>${reservationvo.rsvEmpName} (${reservationvo.rsvEmpEmail})</td>
									<td>${reservationvo.resourceCategoryName}</td>
									<td>${reservationvo.resourceName}</td>
									<td>${reservationvo.rsvStartDayTime} ~ ${reservationvo.rsvEndDayTime}</td>
									<c:if test='${requestScope.type == "returnWait"}'>
									<td>
										<button type="button" name="button" class="weakblue booking_return_layer_btn" onclick="returnRsourceModalOpen(${reservationvo.rsvResourceId})">반납</button>
										<span class="grey_bar">|</span>
										<button type="button" name="button" class="weakblue rsv_detail_view_btn" id="${reservationvo.rsvResourceId}" onclick="reservation_info_detail_open(this.id)">상세보기</button>
									</td>
									</c:if>
								</tr>
							</c:forEach>
							</c:if>
							<c:if test="${empty requestScope.reservationList || fn:length(requestScope.reservationList) == 0}">
								<tr>
									<td colspan="6" class="center">반납 대기 리스트가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="pdt_20">
					<p>
						총
						<span id="total_cnt">${requestScope.totalCount}</span>
						개
					</p>
				</div>
			</div>
		</div>
		<!-- Contents End-->
	</div>
</div>