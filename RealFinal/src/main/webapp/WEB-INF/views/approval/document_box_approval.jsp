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
			let formId = $(this).parent().find("td.docu-form").attr('id');
			$(location).attr('href', '<%=ctxPath%>/approval/documentDetail/box/approval/view.gw?formId=' + formId + '&approvalId=' + $(this).parent().find("td.docu-num div").html());
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
	
	
	$("button.impt").click(function(){
		
		if($(this).hasClass("on")){
			// 이미 중요에 등록되어 있어 삭제하려고 누른 경우
			
			if(confirm("중요문서에서 지우시겠습니까?")){
				//ajax
				$.ajax({
				url: "<%=ctxPath%>/approval/deleteImportant.gw",
				data: { "empId": ${sessionScope.loginUser.empId}, "approvalId": $(this).attr('id')},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isDelete){
						location.reload();
					}else{
						alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
					}
					
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
			}
			
		}else{
			// 등록되어있지 않아 등록하려고 누른 경우
			
			if(confirm("중요문서로 등록하시겠습니까?")){
				//ajax
				$.ajax({
				url: "<%=ctxPath%>/approval/insertImportant.gw",
				data: { "empId": ${sessionScope.loginUser.empId}, "approvalId": $(this).attr('id')},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isAdd){
						location.reload();
					}else{
						alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
			}
			
		}
	});
	
	
	
	
	

	$("a#importantDoc").click(function(){
		// 드롭리스트에서 중요 문서 클릭했을 경우
		
		let searchParam = decodeURI(window.location.search);
		searchParam = searchParam.substring(1, searchParam.length);
		
		let searchParamArr = searchParam.split("&");
		
		
		let hasImportantView = false;
		
		for(let i = 0 ; i < searchParamArr.length ; i++){
			if(searchParamArr[i].indexOf('listType') != -1){
				searchParamArr[i] = 'listType=1';
				hasImportantView = true;
				break;
			}
		}
		
		
		if(hasImportantView){
			$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&'));
		}else{
			if(searchParam.length == 0){
				$(location).attr('href',  origin + window.location.pathname + '?listType=1');
			}else{
				$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&') + '&listType=1');
			}
			
			
		}
	})
	
	
	$("a#fileDoc").click(function(){
		// 드롭리스트에서 중요 문서 클릭했을 경우
		
		let searchParam = decodeURI(window.location.search);
		searchParam = searchParam.substring(1, searchParam.length);
		
		let searchParamArr = searchParam.split("&");
		
		
		let hasImportantView = false;
		
		for(let i = 0 ; i < searchParamArr.length ; i++){
			if(searchParamArr[i].indexOf('listType') != -1){
				searchParamArr[i] = 'listType=2';
				hasImportantView = true;
				break;
			}
		}
		
		
		if(hasImportantView){
			$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&'));
		}else{
			if(searchParam.length == 0){
				$(location).attr('href',  origin + window.location.pathname + '?listType=2');
			}else{
				$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&') + '&listType=2');
			}
			
			
		}
	})
	
	$("button#anchorApprovalType").click(function(){
		$("ul#menuApprovalTypeMode").show()
	})
})
</script>
<div id="contents">
	<div class="content_approval" style="overflow: auto; position: relative; width: 100%; height: 100%">
		<div class="content_title js-approval-box-type">
			<span class="detail_select mgl_5">
				<c:choose>
					<c:when test="${requestScope.listType eq '1'}">
						<button class="js-approval-btn-box-mode js-approval-check-before" id="anchorApprovalType">보기: 중요 문서</button>
					</c:when>
					<c:when test="${requestScope.listType eq '2'}">
						<button class="js-approval-btn-box-mode js-approval-check-before" id="anchorApprovalType">보기: 첨부 문서</button>
					</c:when>
					<c:otherwise>
						<button class="js-approval-btn-box-mode js-approval-check-before" id="anchorApprovalType">보기: 모든 문서</button>
					</c:otherwise>
				</c:choose>

				<img src="<%=ctxPath%>/resources/image/icon/btn_drop.gif" alt="DROPDOWN" class="open_drop vm js-approval-check-before">
				<ul class="dropdown-menu block hide" style="max-height: 550px; overflow-y: auto; /* padding-right: 8px; */ top: 20px; left: 0;" id="menuApprovalTypeMode">
					<li>
						<a href="<%=ctxPath%>/approval/document/box/approval.gw" class="js-approval-li-types">모든 문서</a>
					</li>
					<li>
						<a id="importantDoc" class="js-approval-li-types">중요 문서</a>
					</li>
					<li>
						<a id="fileDoc" class="js-approval-li-types">첨부 있음</a>
					</li>
				</ul>
			</span>

		</div>
		<div class="content_inbox approval approval-admin" style="overflow: visible;">
			<c:if test="${not empty requestScope.searchWord}">
				<ul class="search-result-tag after from-gnb" id="boxSearchState" style="">
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
						<a class="icon file_delete">
							<span class="blind"></span>
						</a>
					</li>
					<li class="tag-button">
						<button type="button" class="point_color tag-refresh">초기화</button>
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
						<a class="icon file_delete">
							<span class="blind"></span>
						</a>
					</li>
					<li class="tag-button">
						<button type="button" class="point_color tag-refresh">초기화</button>
					</li>
				</ul>
			</c:if>
			<div class="cont_box">
				<div class="approval-wrap pdt_0">
					<table class="tableType01 listbox" id="tableApprovalDocumentBox" style="width: 1604px;">
						<caption>문서함 리스트</caption>
						<thead>
							<tr>
								<th style="width: 5px; white-space: nowrap;" class="resizable-false"></th>
								<th style="width: 170px; white-space: nowrap;" class="resizable-pdr-0">
									<div class="column-resizer ui-resizable" style="width: 170px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0)" class="js-approval-order updown" value="document_code">문서 번호</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 6px; white-space: nowrap;" class="resizable-false resizable-pdl-0 resizable-pdr-0"></th>
								<th class="resizable-pdr-0" style="white-space: nowrap; width: 778px;">
									<div class="column-resizer ui-resizable" style="width: 778px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0)" class="js-approval-order updown" value="document_title">제목</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 120px; white-space: nowrap;">
									<div class="column-resizer ui-resizable" style="width: 120px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0)" class="js-approval-order updown" value="document_register">기안자</a>
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
								<th style="width: 100px; white-space: nowrap;" class="resizable-false">
									<a href="javascript:void(0)" class="js-approval-order updown" value="completedate">완료일</a>
								</th>
								<th style="width: 140px; white-space: nowrap;">
									<div class="column-resizer ui-resizable" style="width: 140px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0)" class="js-approval-order updown" value="document_form">문서 종류</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
							</tr>











							<c:if test="${not empty requestScope.boxList}">
								<c:forEach var="approvalVo" items="${requestScope.boxList}">
									<tr>
										<td>
											<c:if test="${approvalVo.isImportant eq 0}">
												<button type="button" class="sp_menu impt" id="${approvalVo.fk_approvalId}">
													<span class="blind"></span>
												</button>
											</c:if>
											<c:if test="${approvalVo.isImportant eq 1}">
												<button type="button" class="sp_menu impt on" id="${approvalVo.fk_approvalId}">
													<span class="blind"></span>
												</button>
											</c:if>
										</td>
										<td class="docu-num tableData">
											<div title="${approvalVo.fk_approvalId}">${approvalVo.fk_approvalId}</div>
										</td>
										<td class="new-open-window resizable-pdl-0 resizable-pdr-0 tableData">
											<span class="icon h_new span-new-link" style="margin-top: 0px; display: none;"></span>
										</td>
										<td class="title new-window tableData">${approvalVo.title}
											<c:if test="${approvalVo.isFile eq 1}">
												<a href="javascript:void(0)" class="icon file fr">
													<span class="blind">첨부 파일 표시</span>
												</a>
											</c:if>
										</td>
										<td class="docu-register tableData">
											<div title="${approvalVo.empName}">${approvalVo.empName}</div>
										</td>
										<td class="tableData" title="${approvalVo.draftDay}">${fn:substring(approvalVo.draftDay, 0, fn:indexOf(approvalVo.draftDay, " "))}</td>
										<td class="tableData" title="${approvalVo.completeDay}">${fn:substring(approvalVo.completeDay, 0, fn:indexOf(approvalVo.completeDay, " "))}</td>
										<td class="docu-form tableData" id="${approvalVo.fk_formId}">
											<div title="${approvalVo.formName}">${approvalVo.formName}</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${empty requestScope.boxList}">
								<tr>
									<td colspan="9" class="approval-no-data">문서가 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="listbottom bt0" id="pageApprovalDocument" style="width: 1604px;">
						<p class="number">
							문서 수 :
							<span>${requestScope.totalCount}</span>
						</p>
						<div class="documentListPagination">
							<nav>
								<ul class="pagination">${requestScope.pageBar}
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>