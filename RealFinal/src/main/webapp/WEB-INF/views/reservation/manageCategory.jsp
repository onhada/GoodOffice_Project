<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript">

$(document).ready(function() {
	
	// 사이드바의 자원관리를 클릭하여 들어올 경우, 첫번째 옵션에 셀렉티드 속성 추가
	if(<%= request.getParameter("resourceCategoryId")%> == null){
		$("#category_list option:eq(0)").attr("selected", "selected");
	}
	


	/* // 수정필.... 셀렉트 고정이 안 되냐 ....
	
	 */
	 <%-- $("option").attr("val", <%= request.getParameter("resourceCategoryId")%>) --%>
	
})// end of $(document).ready(function(){})-------------------------



// Function Declaration

<%-- 카테고리 수정 페이지로 이동 --%>
function categoryEdit(resourceCategoryId){ 
	location.href="<%= ctxPath%>/reservation/categoryManageAddAdmin.gw?resourceCategoryId="+resourceCategoryId;
}


<%-- 선택한 카테고리에 속하는 자원을 보여준다 --%>
function getResource(e){
	const viewCategory = $("select#category_list").val();
	location.href="<%= ctxPath%>/reservation/resourceManageAdmin.gw?resourceCategoryId="+viewCategory;
}

<%-- 자원 수정 페이지로 이동 --%>
function resourceEdit(resourceId){
	location.href="<%= ctxPath%>/reservation/resourceManageAddAdmin.gw?resourceId="+resourceId;
}

</script>


<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<c:if test="${'category'.equals(requestScope.type)}">
			<h3>카테고리 관리</h3>
		</c:if>
		<c:if test="${'resource'.equals(requestScope.type)}">
			<h3>자원 관리</h3>
			<select name="" id="category_list" class="fl mgl_50" onchange="getResource();">
				<c:if test="${not empty requestScope.resourceCategoryList || fn:length(requestScope.resourceCategoryList) > 0}">
				<c:forEach var="resourceCategory" items="${requestScope.resourceCategoryList}">
					<option value="${resourceCategory.resourceCategoryId}" <c:if test="${resourceCategory.resourceCategoryId eq resourceCategoryId}">selected</c:if>>
						${resourceCategory.resourceCategoryName}
					</option>			
				</c:forEach>
				</c:if>
			</select>
		</c:if>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field">
			<div class="cont_hidden">
				<c:if test="${'category'.equals(requestScope.type)}">
					<h4 class="fl mgr_20">카테고리 목록</h4>
				</c:if>
				<c:if test="${'resource'.equals(requestScope.type)}">
					<h4 class="fl mgr_20">자원 목록</h4>
				</c:if>
				<c:if test="${'category'.equals(requestScope.type)}">
					<a href="<%= ctxPath%>/reservation/categoryManageAddAdmin.gw" class="weakblue mgr_20">
						<span class="sms_plus"></span>
						추가하기
					</a>
				</c:if>
				<c:if test="${'resource'.equals(requestScope.type)}">
					<a href="<%= ctxPath%>/reservation/resourceManageAddAdmin.gw?resourceCategoryId=${requestScope.resourceCategoryId}" class="weakblue mgr_20">
						<span class="sms_plus"></span>
						추가하기
					</a>
				</c:if>
			</div>
			<div class="pdb_50">
				<table class="tableType01 rs-table">
					<colgroup>
						<col width="">
						<%-- <col width=""> --%>
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<c:if test="${'category'.equals(requestScope.type)}">
								<th scope="col">카테고리 이름</th>
								<!-- <th scope="col">자원수</th> -->
								<th scope="col">관리</th>
							</c:if>
							<c:if test="${'resource'.equals(requestScope.type)}">
								<th scope="col">자원 이름</th>
								<!-- <th scope="col">자원수</th> -->
								<th scope="col">관리</th>
							</c:if>
						</tr>
					</thead>
					<tbody id="category_list_tbody">
					
						<%-- 카테고리 목록 가져오기 --%>
						<c:if test="${'category'.equals(requestScope.type)}">
						<c:if test="${not empty requestScope.adminResourceCategoryList || fn:length(requestScope.adminResourceCategoryList) > 0}">
						<c:forEach var="resourceCategory" items="${requestScope.adminResourceCategoryList}">
							<tr>
								<td>
									<a id="${resourceCategory.resourceCategoryId}">${resourceCategory.resourceCategoryName}</a>
								</td>
								<!-- <td>자원수넣어야함수정필</td> -->
								<td>
									<button type="button" name="button" class="weakblue mod_category_btn" onclick="categoryEdit(${resourceCategory.resourceCategoryId})">수정</button>
									<span class="grey_bar">|</span>
									<button type="button" name="button" class="weakblue del_category_btn" onclick="categoryDelModalOpen('${resourceCategory.resourceCategoryId}')">삭제</button>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						</c:if>
						
						<%-- 자원 목록 가져오기 --%>
						<c:if test="${'resource'.equals(requestScope.type)}">
							<c:if test="${not empty requestScope.adminResourceList || fn:length(requestScope.adminResourceList) > 0}">
							<c:forEach var="resource" items="${requestScope.adminResourceList}">
								<tr>
									<td>
										<a href="javascript:void(0);" class="category_detail_view" id="${resource.resourceId}">${resource.resourceName}</a>
									</td>
									<!-- <td>자원수넣어야함수정필</td> -->
									<td>
										<button type="button" name="button" class="weakblue mod_category_btn" onclick="resourceEdit(${resource.resourceId})">수정</button>
										<span class="grey_bar">|</span>
										<button type="button" name="button" class="weakblue del_category_btn" onclick="resourceDelModalOpen('${resource.resourceId}')">삭제</button>
									</td>
								</tr>
							</c:forEach>
							</c:if>
							<c:if test="${empty requestScope.adminResourceList || fn:length(requestScope.adminResourceList) == 0}">
								<tr>
									<td colspan="2" class="center">등록된 자원이 없습니다.</td>
								<tr>
							</c:if>
						</c:if>
						
						
						
					</tbody>
				</table>
			</div>
		</div>
		<!-- Contents End-->
	</div>
</div>