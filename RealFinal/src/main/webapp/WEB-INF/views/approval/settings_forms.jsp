<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>


<script>

$(document).ready(function() {
	$("input#textSearchForms").keyup(function(e){
		if($("input#textSearchForms").val().trim() != "" && e.keyCode == 13){
			searchFormName();
		}
	})
	
	
	$("td.tableData").each(function(){
		$(this).click(function(){
			let formId = $(this).parent().find("td.docu-num").text();
			
			console.log(formId)
			
			$(location).attr('href', `<%=ctxPath%>/approval/formDetail.gw?formId=` + formId);
		})
	})
	
})




function searchFormName(){
	
	if($("input#textSearchForms").val().trim() != ""){
		$(location).attr('href', `<%=ctxPath%>/approval/settings/forms.gw?searchWord=` + $("input#textSearchForms").val().trim());
	}
	
}

function resetSearchForm(){
	
	$(location).attr('href', `<%=ctxPath%>/approval/settings/forms.gw`);
	}
</script>


<div id="contents">
	<div class="setting_title">
		<h3>양식함 관리</h3>
	</div>
	<div class="content_inbox approval-admin">
		<div class="cont_box">
			<div class="content_title after">
			</div>

			<div class="allform-wrap wide">
				<div class="after" id="topFncApprovalForm" style="width: 1464px;">

					<div class="fr">

						<c:if test="${not empty requestScope.searchWord}">
							<a href="수정필" class="search_bt fl point_color" style="margin: 6px 10px 0 0;" id="resetSearchForms" onclick="resetSearchForm()">
								<span class="sp_menu searchCancel"></span>
								검색 취소
							</a>

						</c:if>

						<c:if test="${empty requestScope.searchWord}">
							<a href="수정필" class="search_bt fl point_color hide" style="margin: 6px 10px 0 0;" id="resetSearchForms" onclick="resetSearchForm()">
								<span class="sp_menu searchCancel"></span>
								검색 취소
							</a>

						</c:if>


						<div class="data-search fl">
							<div class="search" style="background-position: 0px 0px; border-color: rgb(192, 197, 202);">
								<fieldset>
									<input type="text" id="textSearchForms" placeholder="양식명  검색" autocomplete="off" maxlength="30" value="${requestScope.searchWord}">
									<span class="btn_search" onclick="searchFormName()">
										<span class="icon src">
											<em class="blind">검색</em>
										</span>
									</span>
								</fieldset>
							</div>
						</div>
					</div>
				</div>

				<table class="tableType01 listbox sapceT" id="tableApprovalForm" style="width: 1464px;">
					<caption>결재 등록 양식 리스트</caption>
					<!-- <colgroup>
					<col style="width:38px;">
					<col style="width:100px;">
					<col style="width:120px;">
					<col style="width:110px;">
					<col style="width:260px;">
					<col style="width:100px;">
					<col>
				</colgroup> -->
					<thead>
						<tr>
							<th style="width: 14px; white-space: nowrap;" class="resizable-false"></th>
							<th style="width: 96px; white-space: nowrap;">
								<div class="column-resizer ui-resizable" style="width: 96px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="수정필" class="js-approval-order updown" value="form_id">양식 ID</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 330px; white-space: nowrap;">
								<div class="column-resizer ui-resizable" style="width: 330px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="수정필" class="js-approval-order updown" value="title">양식명</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 359px; white-space: nowrap;">
								<div class="column-resizer ui-resizable" style="width: 359px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="수정필" class="js-approval-order updown" value="comment">설명</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 128px; white-space: nowrap;">
								<div class="column-resizer ui-resizable" style="width: 128px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="수정필" class="js-approval-order updown" value="use_flag">상태</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
						</tr>



						<c:if test="${not empty requestScope.formList}">
							<!-- c:for -->

							<c:forEach var="formVo" items="${requestScope.formList}">
								<tr>
									<td>
										<%-- <label>
											<input title="양식 선택" type="checkbox" class="js-checkbox-approval-form" form_no="${formVo.formId}" disabled="disabled">
										</label> --%>
									</td>
									<td class="tableData docu-num" data-href="수정필">${formVo.formId}</td>
									<td class="sidespace tableData" data-href="수정필">
										<div title="${formVo.formName}">${formVo.formName}</div>
									</td>
									<td class="tableData" data-href="수정필">${formVo.description}</td>

									<td class="tableData" data-href="수정필">
										<c:if test="${formVo.isUse eq 1}">
											사용
										</c:if>

										<c:if test="${formVo.isUse eq 0}">
											미사용
										</c:if>
									</td>
								</tr>

							</c:forEach>
						</c:if>


						<c:if test="${empty requestScope.formList}">
							<tr>
								<td colspan="5" class="approval-no-data">양식이 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="listbottom bt0" id="pageApprovalForm" style="width: 1464px;">
					<p class="number">
						문서 수 :
						<!-- 수정필  -->
						<span>${requestScope.totalCount}</span>
					</p>
					<!-- 수정필  -->
					<div class="documentListPagination">
						<nav>
							<ul class="pagination">${requestScope.pageBar}
							</ul>
						</nav>
					</div>
					<!-- <div class="paginate">
					<span class="icon pagenav4">
								<em class="blind">PREVIOUS PAGE</em>
							</span>
						<strong>1</strong>
						<a href="수정필" onclick="수정필">2</a>
						<a href="수정필" class="space" onclick="수정필">
							<span class="icon pagenav4">
								<em class="blind">NEXT PAGE</em>
							</span>
						</a>
					</div> -->
					<!-- 페이지네이션 수정필 -->
					<!-- <div class="page_select">
						<label class="blind" for="pageCurrent">SELECT CURRENT PAGE</label>
						<select onchange="수정필">
							<option value="1" selected="">1</option>
						</select>
						/ 1
					</div> -->
				</div>
			</div>
		</div>
	</div>


</div>