<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<script type="text/javascript">

$(document).ready(function() {
	
	// 기본이미지 변경을 안 하고 설정값으로 제출할 경우
	if(("<%= request.getAttribute("type")%>" == "category" && <%= request.getParameter("resourceCategoryId") %> == null) // 카테고리 추가의 경우 
	   || ("<%= request.getAttribute("type")%>" == "resource" && <%= request.getParameter("resourceId") %> == null)){  // 자원 추가의 경우 
		const fileNameFull = $("img#resource_default_img").attr("src");
		const fileName = fileNameFull.substring(fileNameFull.lastIndexOf('/')+1);
		$("input:hidden[name='resource_Imgfile']").val(fileName);
	}
	
	
	// 예시 이미지 중 선택한 이미지를 업로드할 이미지에 넣어주기
	$(".resource_default_img_list").click(function(e){
		$("img#resource_default_img").attr("src", $(e.target).attr("src")); 
		
		const fileNameFull = $("img#resource_default_img").attr("src");
		const fileName = fileNameFull.substring(fileNameFull.lastIndexOf('/')+1);
        // console.log(fileName);
  		$("input:hidden[name='resource_Imgfile']").val(fileName);
	});
	
	
	// ~~~~~ 카테고리 수정인 경우 ~~~~~ 
	if("<%= request.getAttribute("type")%>" == "category" && <%= request.getParameter("resourceCategoryId")%> != null ){ 	
		
		// 이미지 미리보기 
		$("img#resource_default_img").attr("src", '<%= ctxPath%><%= request.getAttribute("viewPath") %><%= request.getAttribute("imageFile") %>');
		
		// 사용여부
		if(<%= request.getAttribute("isDelete") %> == 0){
			$("input#is_Delete_Y").attr("checked", "");
		}
		else if(<%= request.getAttribute("isDelete") %> == 1){
			$("input#is_Delete_N").attr("checked", "");
		}
	
	}
	
	// ~~~~~ 자원 수정인 경우 ~~~~~ 
	if("<%= request.getAttribute("type")%>" == "resource" && <%= request.getParameter("resourceId") %> != null){ 

		// 이미지 미리보기
		$("img#resource_default_img").attr("src", '<%= ctxPath%><%= request.getAttribute("viewPath") %><%= request.getAttribute("imageFile") %>');
		console.log(<%= request.getAttribute("isApproval") %>+"dd+"+<%= request.getAttribute("isReturn") %>);
		// 관리자승인필수 여부
		/* $("input#is_Approval_N").removeAttribute();
		$("input#is_Approval_Y").removeAttribute(); */
		if(<%= request.getAttribute("isApproval") %> == 0){
			$("input#is_Approval_N").attr("checked", "");
		}
		else if(<%= request.getAttribute("isApproval") %> == 1){
			$("input#is_Approval_Y").attr("checked", "");
		}

		// 반납필수 여부 
		/* $("input#is_Return_N").removeAttribute();
		$("input#is_Return_Y").removeAttribute(); */
		if(<%= request.getAttribute("isReturn") %> == 0){
			$("input#is_Return_N").attr("checked", "");
		}
		else if(<%= request.getAttribute("isReturn") %> == 1){
			$("input#is_Return_Y").attr("checked", "");
		}
		
		// 사용여부
		if(<%= request.getAttribute("isDelete") %> == 0){
			$("input#is_Delete_Y").attr("checked", "");
		}
		else if(<%= request.getAttribute("isDelete") %> == 1){
			$("input#is_Delete_N").attr("checked", "");
		}
		
	}
	
	
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration
<%-- 업로드 이미지 미리보기 --%>
function setUploadImg(event){
	
	document.querySelector("img#resource_default_img").remove();
	var reader = new FileReader();
	<%-- 
	if(<%= request.getParameter("resourceCategoryId") %> != null){
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", <%= request.getParameter("imageFile") %>);
			img.setAttribute("id", "resource_default_img");
	        document.querySelector("div.large-img").appendChild(img);
		};
	}
	 --%>
	
	
	
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("id", "resource_default_img");
        document.querySelector("div.large-img").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
	
	
	
}


<%-- 제출하기 --%>
function addResource(type){ // 아마 파라미터에 add 또는 mod 들어오게 되는듯>??????
		
	// 이름 유효성 검사
	const name = $("input:text[name='name']").val().trim();
	if(name == "") {
  		alert("이름을 입력하세요!!");
  	 	return; // 종료
  	}
	
  	// 설명 유효성 검사
  	const description = $("textarea[name='description']").val().trim();
  	if(description == "") {
  		alert("설명을 입력하세요!!");
  	 	return; // 종료
  	}
	

	// 폼(form)을 전송(submit)
	const frm = document.add_frm;
	frm.method = "post";
	if('<%= request.getAttribute("type")%>' == "category"){
		frm.action = "<%= ctxPath%>/reservation/categoryManageAddEndAdmin.gw";
	}
	else if('<%= request.getAttribute("type")%>' == "resource"){
		frm.action = "<%= ctxPath%>/reservation/resourceManageAddEndAdmin.gw";
	}
	frm.submit();
	
}
</script>





<!-- 해당 jsp는 카테고리 추가, 카테고리 삭제, 자원 추가, 자원 삭제 4가지 모두 사용할 것임. 담당자가 알아서 수정! -->

<div id="contents" style="left: 276px;">
	<div class="setting_title">
	
		<c:if test="${'category'.equals(requestScope.type) && empty requestScope.resourceCategoryId}">
		<h3>카테고리 추가하기</h3>
		</c:if>
		<c:if test="${'category'.equals(requestScope.type) && not empty requestScope.resourceCategoryId}">
		<h3>카테고리 수정하기</h3>
		</c:if>
		
		<c:if test="${'resource'.equals(requestScope.type) && empty requestScope.resourceId}">
		<h3>자원 추가하기</h3>
		</c:if>
		<c:if test="${'resource'.equals(requestScope.type) && not empty requestScope.resourceId}">
		<h3>자원 추가하기</h3>
		</c:if>
		
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field category-add">
			<form name="add_frm" enctype="multipart/form-data">
				<c:if test="${'category'.equals(requestScope.type)}">
					<input type="hidden" name="resourceCategoryId" value="${requestScope.adminResourceCategoryInfo_map.resourceCategoryId}">
				</c:if>
				<c:if test="${'resource'.equals(requestScope.type)}">
					<input type="hidden" name="fk_resourcecategoryid" value="${requestScope.resourceCategoryId}">
					<input type="hidden" name="resourceId" value="${requestScope.adminResourceInfo_map.resourceId}">
				</c:if>	
				<ul>
					<li>
						<c:if test="${'category'.equals(requestScope.type)}">
							<p>카테고리 이름</p>
							<div>
								<input type="hidden" value="${requestScope.resourceCategoryId}" />
								<input type="text" name="name" class="input_text w200 required" value="${requestScope.adminResourceCategoryInfo_map.resourceCategoryName}" autocomplete="off">
							</div>
						</c:if>
						<c:if test="${'resource'.equals(requestScope.type)}">
							<p>자원 이름</p>
							<div>
								<input type="hidden" value="${requestScope.resourceCategoryId}" />
								<input type="text" name="name" class="input_text w200 required" value="${requestScope.adminResourceInfo_map.resourceName}" autocomplete="off">
							</div>
						</c:if>
						
					</li>
					<li>
						<c:if test="${'category'.equals(requestScope.type)}">
							<p>카테고리 설명</p>
							<div>
								<textarea name="description" id="" cols="30" rows="10" autocomplete="off">${requestScope.adminResourceCategoryInfo_map.description}</textarea>
							</div>
						</c:if>
						<c:if test="${'resource'.equals(requestScope.type)}">
							<p>자원 설명</p>
							<div>
								<textarea name="description" id="" cols="30" rows="10" autocomplete="off">${requestScope.adminResourceInfo_map.description}</textarea>
							</div>
						</c:if>
					</li>
					<li>
						<p>사진</p>
						<div class="category-images">
							<div class="after">
								<div class="fl large-img">
									<img src="<%=ctxPath%>/resources/image/reservation/exampleImage01.jpg" alt="" id="resource_default_img">
									<input type="file" name="imageFile" id="resource_file_btn" onchange="setUploadImg(event);" style="width: 0; height: 0;" accept="image/*">
									<c:if test="${'category'.equals(requestScope.type)}">
										<input type="hidden" name="resource_Imgfile" id="resource_file_hidden" value="${requestScope.adminResourceCategoryInfo_map.imageFile}">
									</c:if>
									<c:if test="${'resource'.equals(requestScope.type)}">
										<input type="hidden" name="resource_Imgfile" id="resource_file_hidden" value="${requestScope.adminResourceInfo_map.imageFile}">
									</c:if>
									<span onclick="$('#resource_file_btn').click();"></span>
								</div>
								<ul class="fl after">
									<li class="select-button">
										<a href="javascript:void(0);" class="weakblue">
											사진<br>선택
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img src="<%=ctxPath%>/resources/image/reservation/exampleImage01.jpg" alt="" class="resource_default_img_list" num="default1">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img src="<%=ctxPath%>/resources/image/reservation/exampleImage02.jpg" alt="" class="resource_default_img_list" num="default2">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img src="<%=ctxPath%>/resources/image/reservation/exampleImage03.jpg" alt="" class="resource_default_img_list" num="default3">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img src="<%=ctxPath%>/resources/image/reservation/exampleImage04.jpg" alt="" class="resource_default_img_list" num="default4">
										</a>
									</li>
									<li>
										<a href="javascript:void(0);">
											<img src="<%=ctxPath%>/resources/image/reservation/exampleImage05.jpg" alt="" class="resource_default_img_list" num="default5">
										</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
					<!-- 카테고리에 해당하는 항목 시작 -->
					<c:if test="${'category'.equals(requestScope.type)}">
					<li>
						<p>자원 종류</p>
						<div>
							<label for="resource_type_T" class="mgr60">
								<input type="radio" name="resourceType" value="1" id="resource_type_T" class="resource_type_radio" checked="">
								시간형
							</label>
							<!-- 수정필 날짜형 안 할 거면 지워  -->
							<!-- <label for="resource_type_D" class="mgr60">
								<input type="radio" name="resourceType" value="2" id="resource_type_D" class="resource_type_radio">
								날짜형
							</label>
							<span class="guide-text">* 해당 설정은 추후 변경할 수 없습니다.</span> -->
						</div>
					</li>
					<!-- 카테고리에 해당하는 항목 끝 -->
					</c:if>
					<!-- 자원에 해당하는 항목 시작 -->
					<c:if test="${'resource'.equals(requestScope.type)}">
						<!-- 
					<li>
						<div class="title">
							<span>이용 불가 시간</span>
							<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative; top: 2px; margin-left: 10px">
								<span class="blind">세부 설명</span>
							</a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 이용 불가 시간</p>
									<p>이용을 제한할 시간, 요일, 날짜를 지정합니다. 사내 행사 등 자원 예약이 불가한 시간, 요일, 날짜를 지정해주세요.</p>
								</div>
							</div>
						</div>
						<div class="text">
							<dl class="after" id="not_available_dl">
								<dt class="disabled-time no_limit_dl" id="no_limit_dt">제한 없음</dt>
								<dd class="no_limit_dl" id="no_limit_dd">
									<a href="javascript:void(0);" class="weakblue" id="set_detail_not_available_btn" onclick="bookingResourceDetail.notAvailableLayer();">상세 설정</a>
								</dd>
							</dl>
						</div>
					</li>
					 -->
						<!-- 수정필) 이거버리기로 했던가? 디비에도 해당컬럼 없긴함 
					<li>
						<div class="title">
							<span>연속 예약 제한</span>
							<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative; top: 2px; margin-left: 10px">
								<span class="blind">세부 설명</span>
							</a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 연속 예약 제한</p>
									<p>한번에 예약할 수 있는 최대 시간을 설정할 수 있습니다. 특정 사용자가 자원을 장기간 이용하는 것을 방지할 수 있습니다.</p>
								</div>
							</div>
						</div>
						<div class="text">
							<label for="continuity_limit_yn_N" class="mgr60"> <input type="radio" name="continuity_limit_yn" value="N" id="continuity_limit_yn_N" checked=""> 제한 없음
							</label> <label for="continuity_limit_yn_Y" class="mgr60"> <input type="radio" name="continuity_limit_yn" value="Y" id="continuity_limit_yn_Y"> 최대 <input type="text" name="continuity_limit" style="width: 50px;" value="" disabled=""> 시간 [D]날짜형은 일
							</label>
						</div>
					</li> -->
						<!-- 수정필) 이거버리기로 했던가? 디비에도 해당컬럼 없긴함
					<li>
						<div class="title">
							<span>신청 기간</span>
							<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative; top: 2px; margin-left: 10px">
								<span class="blind">세부 설명</span>
							</a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 신청 기간</p>
									<p>예약 신청을 할 수 있는 기간을 설정할 수 있습니다. 예) 예약일 기준 1달 전부터 예약 가능</p>
								</div>
							</div>
						</div>
						<div class="text">
							<span class="mgr60" id="period_no_limit_span">제한 없음</span>
							<a href="javascript:void(0);" class="weakblue" onclick="bookingResourceDetail.applicationPeriodLayer();">상세 설정</a>
						</div>
					</li> 
					<li id="is_alarm_li" class="hide">
						<div class="title">
							<span>알림 설정</span>
							<a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative; top: 2px; margin-left: 10px">
								<span class="blind">세부 설명</span>
							</a>
							<div class="tooltip hide" style="left: 120px; top: -22px">
								<div class="tooltip-box" style="width: 400px;">
									<p>* 알림 설정</p>
									<p>- 관리자 승인 요청 시 설정한 대상자에게 알림이 제공되며, 알림 방법을 선택할 수 있습니다.</p>
									<p>- 알림 기본 설정은 카테고리 관리의 기본 자원 설정 내역이 출력됩니다.</p>
								</div>
							</div>
						</div>
						<div class="text">
							<label for="is_web_alarm" class="mgr60"> <input type="checkbox" name="is_web_alarm" id="is_web_alarm" value="Y" checked=""> 웹 알림
							</label> <label for="is_mail_alarm" class="mgr60"> <input type="checkbox" name="is_mail_alarm" id="is_mail_alarm" value="Y"> 메일 알림
							</label>
							<a href="javascript:void(0);" class="weakblue" onclick="bookingResourceDetail.resourceAlarmUserSettingLayer();">대상자 설정</a>
						</div>
					</li>
					<li id="is_alarm_user_li" class="hide">
						<div class="title">
							<span>알림 대상자</span>
						</div>
						<div class="text">
							<span>대상자 없음.</span>
						</div>
					</li>
					<li id="is_overlap_li" class="hide">
						<div class="title">중복 예약</div>
						<div class="text">
							<label for="is_overlap_Y" class="mgr60"> <input type="radio" name="is_overlap" value="Y" id="is_overlap_Y"> 사용함
							</label> <label for="is_overlap_N" class="mgr60"> <input type="radio" name="is_overlap" value="N" id="is_overlap_N" checked=""> 사용 안함
							</label>
						</div>
					</li>-->
					<li>
						<div class="title">승인 여부</div>
						<div class="text">
							<label for="is_Approval_N" class="mgr60">
								<input type="radio" name="isApproval" value="0" id="is_Approval_N" checked="">
								바로 예약
							</label>
							<label for="is_Approval_Y" class="mgr60">
								<input type="radio" name="isApproval" value="1" id="is_Approval_Y">
								관리자 승인
							</label>
						</div>
					</li>
					<li>
						<div class="title">반납 여부</div>
						<div class="text">
							<label for="is_return_N" class="mgr60">
								<input type="radio" name="isReturn" value="0" id="is_Return_N" checked="">
								반납이 필요없는 자원
							</label>
							<label for="is_return_Y" class="mgr60">
								<input type="radio" name="isReturn" value="1" id="is_Return_Y">
								반납 필수 자원
							</label>
						</div>
					</li>
					<!-- 
					<li class="pdb_0">
						<p>사용 여부</p>
						<div>
							<label for="is_Delete_Y" class="mgr60"> <input type="radio" name="is_Delete" value="Y" id="is_Delete_Y" class="is_Delete_radio" checked=""> 사용함
							</label> <label for="is_Delete_N" class="mgr60"> <input type="radio" name="is_Delete" value="N" id="is_Delete_N" class="is_Delete_radio"> 사용 안함
							</label>
						</div>
					</li> -->
					</c:if>
					<!-- 자원에 해당하는 항목 끝 -->
					<li>
						<p>사용 여부</p>
						<div>
							<label for="is_Delete_Y" class="mgr60">
								<input type="radio" name="isDelete" value="0" id="is_Delete_Y" checked="">
								사용함
							</label>
							<label for="is_Delete_N" class="mgr60">
								<input type="radio" name="isDelete" value="1" id="is_Delete_N">
								사용 안함
							</label>
						</div>
					</li>

				</ul>
				<div class="bt_left">
					<button type="button" onclick="addResource('add');">저장</button>
				</div>
			</form>
		</div>
		<!-- Contents End-->
	</div>
</div>