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
		location.href="<%= ctxPath%>/reservation/approvalManageAdmin.gw?type="+type;
	});
	
	// 상단 탭메뉴의 카테고리 선택 표시 
	var type = <%= request.getAttribute("type")%>;
	$(`li#${type}`).addClass("on");
 
	
	
	<%--
	// 수정필) 일단 예약 체크박스 html 주석해둠 나중에 해 
	// 체크박스 선택할 경우
	$('input[id="rsvResourceId_check"], input#chkAll').change(function(){

		if( $('input:checkbox[id="rsvResourceId_check"]:checked').length > 0 || $("input[id='chkAll']").is(':checked') ){ // 체크박스 하나 이상 선택되었을 경우 
		console.log("gsg");	
			/* 
			$("a#m_list_view_option").css("display", "none"); 
	    	$("span#m_list_checked_action, div#m_list_checked_menu").css("display", "inline"); 
	    	$("label#m_list_checked_cnt").text( $('input:checkbox[name="mailId"]:checked').length );
	    	
	    	if( $('input:checkbox[name="mailId"]:checked').length == $('input:checkbox[name="mailId"]').length ){
	    		$("input[id='chkAll']").prop('checked',true);
	    	}
	    	else{
	    		$("input[id='chkAll']").prop('checked',false);
	    	}
	    	 */
		}
		else{ // 메일이 하나도 선택되지 않았을 경우
			/* 
			$("a#m_list_view_option").css("display", "inline"); 
	    	$("span#m_list_checked_action, div#m_list_checked_menu").css("display", "none");
	    	 */
		}
		
	}); 
	--%>
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration

</script>





<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>승인 관리</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field">
		
			<ul class="tabType1">
				<li class="tab_menu" id="approvalWait">
					<a href="javascript:void(0);" class="type">승인대기</a>
				</li>
				<li class="tab_menu" id="approved">
					<a href="javascript:void(0);" class="type">승인</a>
				</li>
				<li class="tab_menu" id="approvalReject">
					<a href="javascript:void(0);" class="type">반려</a>
				</li>
			</ul>
			
			<div>
				<div class="pdt_20">
					<table class="tableType01 rs-table">
						<colgroup>
							<col width="35">
							<col width="">
							<col width="">
							<col width="">
							<col width="30%">
							<c:if test='${requestScope.type != "approvalWait"}'>
							<col width="">
							</c:if>
							<col width="">
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
								<th scope="col" width="15%">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="resource">
										자원
									</a>
								</th>
								<th scope="col" width="25%">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="booking_date">
										예약 시간
									</a>
								</th>
								<c:if test='${requestScope.type != "approvalWait"}'>
								<th scope="col" id="updateTime" type="hidden" class="">
									<a href="javascript:void(0);" class="sort booking_sort" sort_type="approval_date">
										결재 시간
									</a>
								</th>
								</c:if>
								<th scope="col">설정</th>
							</tr>
						</thead>
						<tbody id="booking_list_tbody">
						
							<c:if test="${not empty requestScope.reservationList || fn:length(requestScope.reservationList) > 0}">
							<c:forEach var="reservationvo" items="${requestScope.reservationList}">
							<tr>
								<td>
								</td>
								<td>${reservationvo.rsvEmpName} (${reservationvo.rsvEmpEmail})</td>
								<td>${reservationvo.resourceCategoryName}</td>
								<td>${reservationvo.resourceName}</td>
								<td>${reservationvo.rsvStartDayTime} ~ ${reservationvo.rsvEndDayTime}</td>
								<c:if test='${requestScope.type != "approvalWait"}'>
								<td>${reservationvo.approvalDay}</td>
								</c:if>
								<td>
									<c:if test='${requestScope.type == "approvalWait"}'>
									<button type="button" name="button" class="weakblue booking_acknowledge_btn" onclick="rsvApproveModalOpen()">승인</button>
									<span class="grey_bar">|</span>
									<button type="button" name="button" class="weakblue booking_reject_btn" onclick="rsvRejectModalOpen(${reservationvo.rsvResourceId})">반려</button>
									<span class="grey_bar">|</span>
									</c:if>
									<button type="button" name="button" class="weakblue rsv_detail_view_btn" id="${reservationvo.rsvResourceId}" onclick="reservation_info_detail_open(this.id)">상세보기</button>
								</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${empty requestScope.reservationList || fn:length(requestScope.reservationList) == 0}">
								<tr>
									<td colspan="6" class="center">등록된 예약이 없습니다.</td>
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
	<!-- 예약 리스트 생성 -->

</div>