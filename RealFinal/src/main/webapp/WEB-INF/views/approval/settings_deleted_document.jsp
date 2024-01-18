<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>











<script type="text/javascript">
$(document).ready(function() {
	
	$("button.tag-refresh").click(function(){
		// 검색시 초기화를 눌렀을 경우
		
		$(location).attr('href', window.location.origin + window.location.pathname);
	})
	
	$("a.file_delete").click(function(){
	// 검색시 검색어 지우기 버튼 눌렀을 경우
		
		$(location).attr('href', window.location.origin + window.location.pathname);
	})
	
	$("td.tableData").each(function(){
		$(this).click(function(){
			let formId = $(this).parent().find("td.title").attr('id');
			
			$(location).attr('href', '<%=ctxPath%>/approval/documentDetail/box/all/view.gw?formId=' + formId + '&approvalId=' + $(this).parent().find("td.docu-num div").html());
		})
	})
	
	
	
	$("button.updown").click(function(){
		// 기안일 부분 클릭했을 경우
		
		let searchParam = decodeURI(window.location.search);
		searchParam = searchParam.substring(1, searchParam.length);
		
		let searchParamArr = searchParam.split("&");
		
		if($(this).find('span').hasClass("up")){
			// 현재 오름차순일 경우 내림차순이 되도록 한다
			orderType = 'desc';
			
		}else{
			// 현재 내림차순일 경우 오름차순이 되도록 한다
			orderType = 'asc';
		}
		
		let hasOrderType = false;
		
		for(let i = 0 ; i < searchParamArr.length ; i++){
			if(searchParamArr[i].indexOf('orderType') != -1){
				// orderType값이 존재할 경우 확인용 플래그
				searchParamArr[i] = 'orderType=' + orderType;
				hasOrderType = true;
				break;
			}
		}
		
		if(hasOrderType){
			$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&'));
		}else{
			if(searchParam.length == 0){
				$(location).attr('href',  origin + window.location.pathname + '?orderType=' + orderType);
			}else{
				$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&') + '&orderType=' + orderType);
			}
			
		}
	}) 
	
	
	
	 $("input.js-approval-all-checkbox").change(function(){
        if($("input.js-approval-all-checkbox").is(":checked")){
        	// 전체 선택
        	
        	$("input.js-checkbox-document-list").each(function(){
        		$(this).prop("checked", true);
        		
   				$("span#countCheckApprovalDocumentList").html($("input:checkbox[name='checkApproval']:checked").length);
   				$("span.js-approval-check-after").show();
        		
        	})
        	
        }else{
        	// 전체 선택 해제
        	
        	$("input.js-checkbox-document-list").each(function(){
        		$(this).prop("checked", false);
        		
        		$("span.js-approval-check-after").hide();
				$("span.js-approval-check-before").show();
        		
        	})
        }
	 });
	
	
	
	$("input.js-checkbox-document-list").each(function(){
		$(this).change(function(){
			
			var total = $("input[name='checkApproval']").length;
			var checked = $("input[name='checkApproval']:checked").length;

			if(total != checked){
				$("input.js-approval-all-checkbox").prop("checked", false);
				
			}else {
				$("input.js-approval-all-checkbox").prop("checked", true); 
			}
						
			// 체크된 갯수
			
			if($("input:checkbox[name='checkApproval']:checked").length > 0){
				
				$("span#countCheckApprovalDocumentList").html($("input:checkbox[name='checkApproval']:checked").length);
				$("span.js-approval-check-after").show();
				
			}else{
				$("span.js-approval-check-after").hide();
				$("span.js-approval-check-before").show();
			}
			
			
		})
		
		
	})
	
	
		
		
	
	
	
	
	
})


function batchRestore(){
	// 일괄 결재 처리
	
	// 폼(form)을 전송(submit)
	  const frm = document.checkFrm;
	  frm.method = "post";
	  frm.action = "<%= ctxPath%>/approval/batch/restore.gw";
	  frm.submit();
}


</script>




<div id="contents">
	<div class="setting_title">
		<h3 class="fl">삭제 문서 목록</h3>
		<!-- <a href="수정필" class="icon question tipsIcon" style="position: relative; top: 0; margin-left: 10px">
			<span class="blind">세부 설명</span>
		</a>
		<div class="tooltip hide" style="left: 25px; top: 0;">
			<div class="tooltip-box color-set-6" style="width: 400px;">
				<p>전체 문서 목록에서 삭제했거나 보존 연한이 만료된 문서들을 확인하는 곳입니다. 선택 후 복원하거나 완전 삭제할 수 있습니다. 복원 후에는 더 이상 자동 삭제되지 않으며, 관리자가 삭제해야 삭제 상태가 됩니다.</p>
			</div>
		</div> -->
	</div>
	<div class="content_inbox approval-admin">
		<c:if test="${not empty requestScope.searchWord}">

			<ul class="search-result-tag after from-gnb" id="boxSearchState" style="display: block;">
				<li class="tag">
					<c:choose>
						<c:when test="${requestScope.searchType eq 'all'}">
							전체:
						</c:when>
						<c:when test="${requestScope.searchType eq 'title'}">
							제목:
						</c:when>
						<c:when test="${requestScope.searchType eq 'empName'}">
							기안자:
						</c:when>
						<c:when test="${requestScope.searchType eq 'depName'}">
							기안 부서:
						</c:when>
						<c:when test="${requestScope.searchType eq 'apd.fk_approvalId'}">
							문서 번호:
						</c:when>
						<c:when test="${requestScope.searchType eq 'formName'}">
							문서 종류:
						</c:when>
					</c:choose>
					 ${requestScope.searchWord}
					<a class="icon file_delete" onclick="수정필">
						<span class="blind"></span>
					</a>
				</li>
				<li class="tag-button">
					<button type="button" class="point_color tag-refresh" onclick="수정필">초기화</button>
				</li>
			</ul>
		</c:if>

		<c:if test="${empty requestScope.searchWord}">
			<ul class="search-result-tag after from-gnb hide" id="boxSearchState" style="display: none;">
				<li class="tag">

					<c:choose>
						<c:when test="${requestScope.searchType eq 'all'}">
							전체:
						</c:when>
						<c:when test="${requestScope.searchType eq 'title'}">
							제목:
						</c:when>
						<c:when test="${requestScope.searchType eq 'empName'}">
							기안자:
						</c:when>
						<c:when test="${requestScope.searchType eq 'depName'}">
							기안 부서:
						</c:when>
						<c:when test="${requestScope.searchType eq 'apd.fk_approvalId'}">
							문서 번호:
						</c:when>
						<c:when test="${requestScope.searchType eq 'formName'}">
							문서 종류:
						</c:when>
					</c:choose>


					 ${requestScope.searchWord}
					<a class="icon file_delete" onclick="수정필">
						<span class="blind"></span>
					</a>
				</li>
				<li class="tag-button">
					<button type="button" class="point_color tag-refresh">초기화</button>
				</li>
			</ul>
		</c:if>

		<div class="cont_box">
			<div class="approval-wrap">
				<fieldset>
					<div class="table-top after" id="barApprovalDocument">
						<div class="select-list-wrap">
							<label>
								<input type="checkbox" class="js-approval-all-checkbox">
							</label>
							<a class="js-approval-btn-state js-approval-check-before" id="anchorApprovalState">선택</a>
							<%-- <img src="<%= ctxPath %>/resources/image/icon/btn_drop.gif" class="open_drop vm js-approval-check-before">
							<ul class="dropdown-menu hide" id="menuApprovalState">
								<li>
									<a href="수정필" class="js-approval-li-state" value="all_deleted">모든 삭제 사유</a>
								</li>
								<li>
									<a href="수정필" class="js-approval-li-state" value="deleted_by_preserved">보존 연한 경과</a>
								</li>
								<li>
									<a href="수정필" class="js-approval-li-state" value="deleted_by_admin">관리자에 의한 삭제</a>
								</li>
							</ul> --%>
							<span class="mgl_10 check-number js-approval-check-after hide" id="countCheckApprovalDocumentList" style="display: none;"></span>
							<span class="mgl_10 js-approval-check-after hide" style="display: none;">
								<button type="button" onclick="batchRestore()">복원</button>
							</span>
							
							
							<!-- <span>
								<button type="button" onclick="수정필" class="approval-document-history-button ml-16 xs">완전 삭제 이력</button>
							</span> -->
						</div>
					</div>
				</fieldset>
				<fieldset>
					<table class="tableType01 mgt_10" id="tableApprovalDocumentList" style="width: 1604px;">
						<caption>삭제 문서 목록</caption>
						<!-- <colgroup>
						<col style="width:38px">
						<col style="width:200px">
						<col style="width:28%">
						<col style="width: 150px">
						<col style="width:100px;">
						<col style="width:180px;"> -->

						<thead>
							<tr>
								<th style="width: 5px; white-space: nowrap;" class="resizable-false"></th>
								<th style="width: 200px; white-space: nowrap;" class="resizable-pdr-0">
									<div class="column-resizer ui-resizable" style="width: 200px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_code">문서 번호</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 6px; white-space: nowrap;" class="resizable-false resizable-pdl-0 resizable-pdr-0"></th>
								<th class="resizable-pdr-0" style="white-space: nowrap; width: 833px;">
									<div class="column-resizer ui-resizable" style="width: 833px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_title">제목</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 150px; white-space: nowrap;">
									<div class="column-resizer ui-resizable" style="width: 150px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_register">기안자</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 100px; white-space: nowrap;" class="resizable-false">
									<button type="button" class="js-approval-order updown" value="document_regdate">
										기안일
										<c:if test="${empty requestScope.orderType || requestScope.orderType eq 'desc'}">
											<span class="down"></span>
										</c:if>
										<c:if test="${not empty requestScope.orderType && requestScope.orderType eq 'asc'}">
											<span type="button" class="up"></span>
										</c:if>
									</button>
								</th>
								<th style="width: 180px; white-space: nowrap;" class="resizable-false">삭제 사유</th>
							</tr>
							
							
							
							<c:if test="${not empty requestScope.documentList}">
								<!-- c:for -->
								<form name="checkFrm">
									<c:forEach var="approvalVo" items="${requestScope.documentList}">
	
										<tr>
											<td>
												<label>
													<input type="checkbox" name="checkApproval" class="js-checkbox-document-list" value="${approvalVo.fk_approvalId}">
												</label>
											</td>
											<td class="docu-num tableData" data-href="수정필">
												<div title="${approvalVo.fk_approvalId}">${approvalVo.fk_approvalId}</div>
											</td>
											<td class="new-open-window resizable-pdl-0 resizable-pdr-0 tableData" data-href="수정필">
												<span class="icon h_new span-new-link" style="display: none; margin-top: 0px;" data-link-url="수정필"></span>
											</td>
											<td class="title new-window tableData" id="${approvalVo.fk_formId}">
												<div title="${approvalVo.title}">${approvalVo.title}</div>
											</td>
											<td class="docu-register tableData" data-href="수정필">
												<div title="${approvalVo.empName}">${approvalVo.empName}</div>
											</td>
											<td class="undefined tableData" data-href="수정필">${fn:substring(approvalVo.draftDay, 0, fn:indexOf(approvalVo.draftDay, " "))}</td>
											<td class="docu-reason tableData" data-href="수정필">
												<div>${approvalVo.isDelete}</div>
											</td>
										</tr>
	
									</c:forEach>
								</form>
							</c:if>

							<c:if test="${empty requestScope.documentList}">
								<tr>
									<td colspan="7" class="approval-no-data">문서가 존재하지 않습니다.</td>
								</tr>
							</c:if>


						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="listbottom bt0" id="pageApprovalDocumentList" style="width: 1604px;">
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
					</div>
				</fieldset>
			</div>
		</div>
	</div>
</div>
