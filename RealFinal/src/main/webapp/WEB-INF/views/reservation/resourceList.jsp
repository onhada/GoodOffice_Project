<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">

$(document).ready(function() {
	
	<%-- 카테고리설명 모달 열기 --%>
	$("span.category_detail_view").click(function() {
		if ($("div#category_detail_layer").hasClass("hide") == true) {
			$("div#category_detail_layer").removeClass("hide");
		}
	});

	
	<%-- 자원설명 모달 열기 --%>
	$("span.resource_detail_view").click(function(e) {
		if ($("div#resource_detail_layer").hasClass("hide") == true) {
			$.ajax({
	        	url : "<%=ctxPath%>/reservation/getResourceInfo.gw",
				type : "get",
				data : {"resourceId" : $(e.target).attr("resourceId")},
				dataType : "json",
				async : false,
				success : function(json) {
					$("div#resource_detail_layer").find(".rs-name").text(json.resourceInfo_map.resourceName);
					$("div#resource_detail_layer").find(".rs-detail-text").text(json.resourceInfo_map.description);
					$("div#resource_detail_layer").find(".rs-imgFile").attr("src", "<%= ctxPath%>/resources/image/reservation/"+json.resourceInfo_map.imageFile);
				},
				error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});
			$("div#resource_detail_layer").removeClass("hide");
		}
	});
	

	$.ajax({
    	url : "<%=ctxPath%>/reservation/getReservationMarkList.gw",
		type : "get",
		data : {"resourceCategoryId":<%= request.getParameter("resourceCategoryId")%>,
				"searchDay":$("input#viewReservationDate").val()},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.length > 0){ // 성공한 경우 
				
				$.each(json, function(index, item){
				
					if(item.rsvDate == $("input.datepicker").val() ){ // 날짜가 일치하는 경우
				
						const table = document.querySelectorAll('#markTable');
						for (var i = 0; i < table.length; i++) {
							
							var tableOne = table.item(i);
						
						  	if(item.fk_resourceId == tableOne.getAttribute("resourceid")){ // 자원id가 일치하는 경우 
					
						  		var endHour = item.endTime.substring(0,2);	
								if(endHour.substring(0,1) == 0){
									endHour = endHour.substring(1,2);
								}
								var startHour = item.startTime.substring(0,2);
								if(startHour.substring(0,1)==0){
									startHour = startHour.substring(1,2);
								}
								var timeValue = endHour - startHour;
								if(timeValue==0 && startHour.substring(0,1)==0){ // 24시간 예약했을 경우
									timeValue = 24;
								}
								
								
								var id1 = "#markTable > tbody#resourceId_"+item.fk_resourceId+" > tr > td.rs_time_before";
								var td1 = document.querySelectorAll(id1);
								for (var j = 0; j < td1.length; j++) {
									var td1One = td1.item(j);
									for(var i = 0; i<timeValue; i++){
										var repeat = Number(startHour) + i;
										if(repeat == td1One.getAttribute("time")){
											td1One.setAttribute("class", "rs-dualmarker rs_time_before BKCP booking_detail_view ui-selectee");
										}
									}
									
								}// end of for (var j = 0; j < td1.length; j++)----------
					
								
								var id2 = "#markTable > tbody#resourceId_"+item.fk_resourceId+" > tr > td.rs_time_after";
								var td2 = document.querySelectorAll(id2);
								for (var l = 0; l < td2.length; l++) {
									var td2One = td2.item(l);
									for(var k = 0; k<timeValue; k++){
										var repeat2 = Number(startHour) + k;
										if(repeat2 == td2One.getAttribute("time")){
											td2One.setAttribute("class", "rs_time_after BKCP booking_detail_view ui-selectee");
										}	
									}
								}// end of for (var l = 0; l < td2.length; l++)---------------
								
						  	}// end of if(item.fk_resourceId == tableOne.getAttribute("resourceid"))----------
								
						}// end of for (var i = 0; i < table.length; i++)---------
						  
					}// end of if(item.rsvDate == $("input.datepicker").val())----------
						
				});// end of $.each(json, function(index, item)---------
				
			}// end of if(json.length > 0)----------------------
			
			else{ 
				
			}
			
		},// end of success-----
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
	
	
})// end of $(document).ready(function(){})-------------------------

// Function Declaration
function changeDate(){
	
	// 이전 예약된 기록이 색칠된 부분으로 남아있는 것 지우기 
	var id1 = "#markTable > tbody > tr > td.rs_time_before";
	var td1 = document.querySelectorAll(id1);
	for (var j = 0; j < td1.length; j++) {
		var td1One = td1.item(j);
		td1One.setAttribute("class", "rs-dualmarker rs_time_before ui-selectee");
	}
	
	var id2 = "#markTable > tbody > tr > td.rs_time_after";
	var td2 = document.querySelectorAll(id2);
	for (var l = 0; l < td2.length; l++) {
		var td2One = td2.item(l);
		td2One.setAttribute("class", "rs_time_after ui-selectee");	
	}
	
	
	$.ajax({
    	url : "<%=ctxPath%>/reservation/getReservationMarkList.gw",
		type : "get",
		data : {"resourceCategoryId":<%= request.getParameter("resourceCategoryId")%>,
				"searchDay":$("input#viewReservationDate").val()},	
		dataType : "json",
		async : false,
		success : function(json) {
			if(json.length > 0){ // 성공한 경우 
				
				$.each(json, function(index, item){
					
					if(item.rsvDate == $("input.datepicker").val() ){ // 날짜가 일치하는 경우
						const table = document.querySelectorAll('#markTable');
						
						for (var i = 0; i < table.length; i++) {
							var tableOne = table.item(i);
							if(item.fk_resourceId == tableOne.getAttribute("resourceid")){ // 자원id가 일치하는 경우 
						
						  		var endHour = item.endTime.substring(0,2);	
								if(endHour.substring(0,1) == 0){
									endHour = endHour.substring(1,2);
								}
								var startHour = item.startTime.substring(0,2);
								if(startHour.substring(0,1)==0){
									startHour = startHour.substring(1,2);
								}
								var timeValue = endHour - startHour;
								if(timeValue==0 && startHour.substring(0,1)==0){ // 24시간 예약했을 경우
									timeValue = 24;
								}
								
								
								var id1 = "#markTable > tbody#resourceId_"+item.fk_resourceId+" > tr > td.rs_time_before";
								var td1 = document.querySelectorAll(id1);
								for (var j = 0; j < td1.length; j++) {
									var td1One = td1.item(j);
									for(var i = 0; i<timeValue; i++){
										var repeat = Number(startHour) + i;
										if(repeat == td1One.getAttribute("time")){
											td1One.setAttribute("class", "rs-dualmarker rs_time_before BKCP booking_detail_view ui-selectee");
										}
									}
								}
									
								
								var id2 = "#markTable > tbody#resourceId_"+item.fk_resourceId+" > tr > td.rs_time_after";
								var td2 = document.querySelectorAll(id2);
								for (var l = 0; l < td2.length; l++) {
									var td2One = td2.item(l);
									for(var k = 0; k<timeValue; k++){
										var repeat2 = Number(startHour) + k;
										if(repeat2 == td2One.getAttribute("time")){
											td2One.setAttribute("class", "rs_time_after BKCP booking_detail_view ui-selectee");
										}	
									}
								}
								
						  	}
								
						}
						  
						  
					}// end of if(item.rsvDate == $("input.datepicker").val())----------
						
				});// end of $.each(json, function(index, item)---------
					
			}// end of if(json.length > 0)----------------------
			
			else{ // 자원 반납 실패한 경우
				alert("승인에ddd 실패했습니다.");
			}
			
		},// end of success-----
		error : function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});	
}

</script>





<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>
			${requestScope.resourceCategoryInfo_map.resourceCategoryName}
			<span class="show-rs-info category_detail_view">i</span>
		</h3>
	</div>
	<div class="content_inbox" style="overflow-y: hidden;">
		<!-- Contents -->
		<c:if test="${not empty requestScope.resourceList || fn:length(requestScope.resourceList) > 0}">
								
		<div class="rs-wrap" style="margin: 0;">
			
			<div class="cal_head" id="cal_head_fixed_div" style="padding-right: 28px; padding-left: 20px;">
				
				<div id="cal_head_fixed_div_area">
					<input type="text" id="viewReservationDate" class="num datepicker" onchange="changeDate();" style="width: 110px; border: none; margin-right: 5px;" readonly="">
					
					<label for="viewReservationDate"> 
						<img class="ui-datepicker-trigger icon month" src="<%=ctxPath%>/resources/image/icon/sp_icon.png" alt="예약 날짜 선택" title="예약 날짜 선택">
					</label>
					
				</div>
				
				<div id="tbl_head_fixed_div_area">
					<table class="rs-cal-table" id="booking_clone_tbl">
						<colgroup id="resource_list_colgroup">
							<col width="80">
							<c:forEach var="item" varStatus="i" begin="1" end="${fn:length(requestScope.resourceList)}" step="1">
								<col width="">
							</c:forEach>
							<col width="80">
						</colgroup>
						<tbody>
							<tr>
								<td style="border-bottom: none;">
									<table>
										<thead class="booking_resource_img_top">
											<tr>
												<th scope="col" style="padding: 7px 0;"></th>
											</tr>
											<tr class="rs-bg">
												<td class="rs-btn left cpointer" style="cursor: default;" id="booking_prev_page"></td>
											</tr>
											<tr>
												<td class="rs-divider-td">
													<hr class="rs-divider">
												</td>
											</tr>
										</thead>
									</table>
								</td>


								<%-- 자원 목록 가져오기 --%>
								<c:if test="${not empty requestScope.resourceList || fn:length(requestScope.resourceList) > 0}">
									<c:forEach var="resource" items="${requestScope.resourceList}">
										<td style="border-bottom: none;">
											<table class="rs-resource-tbl" resourceId="${resource.resourceId}">
												<thead class="rs-view booking_resource_img_top">
													<tr>
														<th scope="col">
															<span class="resource_name_span" title="${resource.resourceName}">${resource.resourceName}</span>
															<span class="show-rs-info resource_detail_view" r_type="R" resourceId="${resource.resourceId}">i</span>
														</th>
													</tr>
													<tr class="rs-bg">
														<td class="">
															<img src="<%= ctxPath%>/resources/image/reservation/${resource.imageFile}" alt="">
														</td>
													</tr>
													<tr>
														<td class="rs-divider-td">
															<hr class="rs-divider">
														</td>
													</tr>
												</thead>
											</table>
										</td>
									</c:forEach>
								</c:if>
								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="rs-view" id="tbl_body_div" style="height: 435px;">
				<div class="dropdown hide" id="showMoreResource">
					<ul class="dropdown-menu" id="page_list_ul">
					</ul>
				</div>
				<table class="rs-cal-table" id="booking_main_tbl">
					<colgroup id="resource_list_colgroup">
						<col width="80">
						<c:forEach var="item" varStatus="i" begin="1" end="${fn:length(requestScope.resourceList)}" step="1">
							<col width="">
						</c:forEach>
						<col width="80">
					</colgroup>
					<tbody>
						<tr id="resource_list_tr">
							<td style="border-bottom: none;">
								<table>
									<tbody class="time-div rs-time-title h1032 time_table_tbody_area">
										<c:forEach var="item" varStatus="i" begin="0" end="23" step="1">
											<tr>
												<th class="rs-time-pri">${item}시</th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</td>
							
							<%-- 자원 목록 수만큼 테이블 만들기 --%>
							<c:if test="${not empty requestScope.resourceList || fn:length(requestScope.resourceList) > 0}">
								<c:forEach var="resource" items="${requestScope.resourceList}">
									<td style="border-bottom: none;">
										<table class="rs-resource-tbl" id="markTable" resourceId="${resource.resourceId}">
											<tbody id="resourceId_${resource.resourceId}" class="marker-wrapper resource_selectable_area h1032 time_table_tbody_area ui-selectable">
												
												<c:forEach var="item" varStatus="i" begin="0" end="9" step="1">
													<tr>
														<td class="rs-dualmarker rs_time_before ui-selectee" time="${item}"></td>
													</tr>
													<tr class="rs-dualmarker-21">
														<td class="rs_time_after ui-selectee" time="${item}"></td>
													</tr>
												</c:forEach>
												<c:forEach var="item" varStatus="i" begin="10" end="23" step="1">
													<tr>
														<td class="rs-dualmarker rs_time_before ui-selectee" time="${item}"></td>
													</tr>
													<tr class="rs-dualmarker-21">
														<td class="rs_time_after ui-selectee" time="${item}"></td>
													</tr>
												</c:forEach>
												
											</tbody>
										</table>
									</td>
								</c:forEach>
							</c:if>	
							
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</c:if>
		<c:if test="${empty requestScope.resourceList || fn:length(requestScope.resourceList) == 0}">
			<div style="font-size: 20px; padding-left: 20px;">
				해당 카테고리 내 존재하는 자원이 없습니다. 
			</div>
		</c:if>
		<!-- Contents End-->
	</div>

</div>




