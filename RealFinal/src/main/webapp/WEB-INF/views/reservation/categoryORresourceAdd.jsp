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
	
	
	// ~~~~~ 카테고리 수정인 경우 ~~~~~ //
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
	
	// ~~~~~ 자원 수정인 경우 ~~~~~ //
	if("<%= request.getAttribute("type")%>" == "resource" && <%= request.getParameter("resourceId") %> != null){ 

		// 이미지 미리보기
		$("img#resource_default_img").attr("src", '<%= ctxPath%><%= request.getAttribute("viewPath") %><%= request.getAttribute("imageFile") %>');
		console.log(<%= request.getAttribute("isApproval") %>+"dd+"+<%= request.getAttribute("isReturn") %>);
		// 관리자승인필수 여부
		if(<%= request.getAttribute("isApproval") %> == 0){
			$("input#is_Approval_N").attr("checked", "");
		}
		else if(<%= request.getAttribute("isApproval") %> == 1){
			$("input#is_Approval_Y").attr("checked", "");
		}

		// 반납필수 여부 
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
						</div>
					</li>
					<!-- 카테고리에 해당하는 항목 끝 -->
					</c:if>
					<!-- 자원에 해당하는 항목 시작 -->
					<c:if test="${'resource'.equals(requestScope.type)}">
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