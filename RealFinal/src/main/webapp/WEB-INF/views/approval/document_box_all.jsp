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
	
	
	$("input#view_all_documents").change(function(){
		
		let searchParam = decodeURI(window.location.search);
		searchParam = searchParam.substring(1, searchParam.length);
		
		let searchParamArr = searchParam.split("&");
		
		let isViewAll;
		
		if($("input#view_all_documents").is(":checked")){
			
			isViewAll = 1;
			
		}else{
			isViewAll = 0;
		}
		
		let hasIsViewAll = false;
		
		for(let i = 0 ; i < searchParamArr.length ; i++){
			if(searchParamArr[i].indexOf('isViewAll') != -1){
				// orderType값이 존재할 경우 확인용 플래그
				searchParamArr[i] = 'isViewAll=' + isViewAll;
				hasIsViewAll = true;
				break;
			}
		}
		
		
		if(hasIsViewAll){
			$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&'));
		}else{
			if(searchParam.length == 0){
				$(location).attr('href',  origin + window.location.pathname + '?isViewAll=' + isViewAll);
			}else{
				$(location).attr('href',  origin + window.location.pathname + '?' + searchParamArr.join('&') + '&isViewAll=' + isViewAll);
			}
			
		}
		
		
		
		
		
		
		
		
		
		
		/* let url = window.location.origin + window.location.pathname + '?';
		const searchParams = new URLSearchParams(location.search);
		
		for (let param of searchParams) {
		  if(param[0] != 'isViewAll'){
			  url += param[0] + '=' + param[1] + '&';
		  }
		}
		
			
		if($("input#view_all_documents").is(":checked")){
			
			$(location).attr('href', url + 'isViewAll=1');
			
		}else{
			$(location).attr('href', url + 'isViewAll=0');
		} */
	})
	
	
	if('${requestScope.isViewAll}' == '1'){
		$("input#view_all_documents").prop('checked', true);
	}
	
	$("td.tableData").each(function(){
		$(this).click(function(){
			let formId = $(this).parent().find("td.docu-form").attr('id');
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
					console.log(JSON.stringify(text));
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
					console.log(JSON.stringify(text));
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
						<a href="<%=ctxPath%>/approval/document/box/all.gw" class="js-approval-li-types">모든 문서</a>
					</li>
					<li>
						<a id="importantDoc" class="js-approval-li-types">중요 문서</a>
					</li>
					<li>
						<a id="fileDoc" class="js-approval-li-types">첨부 있음</a>
					</li>
				</ul>
			</span>

			<div class="resize-with-div" style="width: 1604px;">
				<div class="fr" style="display: flex; align-items: center; margin-right: 5px">
					<span class="include_line" style="margin-right: 5px"> 열람 문서 보기 </span>
					<span class="hw-switch include_line" style="margin-right: 20px;">
						<input type="checkbox" id="view_all_documents">
						<label for="view_all_documents"></label>
					</span>
					<!-- <button id="exportDocumentBox" class="hw-tooltip-file-icon">
						<img src="https://static.hiworks.com/hr/svg/excel.svg" alt="download excel" title="엑셀다운로드">
					</button> -->
				</div>
			</div>
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
						<button type="button" class="point_color tag-refresh" onclick="수정필">초기화</button>
					</li>
				</ul>
			</c:if>
			<div class="cont_box">
				<div class="approval-wrap pdt_0">
					<table class="tableType01 listbox" id="tableApprovalDocumentBox" style="width: 1604px;">
						<caption>문서함 리스트</caption>
						<!-- <colgroup>
					<col width="38">
					<col width="170">
					<col>
					<col width="33">
					<col width="120">
					<col width="110">
					<col width="140">
					<col width="90">
				</colgroup> -->
						<thead>
							<tr>
								<th style="width: 5px; white-space: nowrap;" class="resizable-false"></th>
								<th style="width: 170px; white-space: nowrap;" class="resizable-pdr-0">
									<div class="column-resizer ui-resizable" style="width: 170px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_code">문서 번호</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 6px; white-space: nowrap;" class="resizable-false resizable-pdl-0 resizable-pdr-0"></th>
								<th class="resizable-pdr-0" style="white-space: nowrap; width: 663px;">
									<div class="column-resizer ui-resizable" style="width: 663px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_title">제목</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 120px; white-space: nowrap;">
									<div class="column-resizer ui-resizable" style="width: 120px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
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
								<th style="width: 100px; white-space: nowrap;" class="resizable-false">
									<a href="수정필" class="js-approval-order updown" value="completedate">완료일</a>
								</th>
								<th style="width: 140px; white-space: nowrap;">
									<div class="column-resizer ui-resizable" style="width: 140px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_form">문서 종류</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 90px; white-space: nowrap;" class="resizable-false">구분</th>
							</tr>





							<c:if test="${not empty requestScope.boxList}">
								<!-- c:for -->

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
										<td class="docu-num tableData" data-href="수정필">
											<div title="${approvalVo.fk_approvalId}">${approvalVo.fk_approvalId}</div>
										</td>
										<td class="new-open-window resizable-pdl-0 resizable-pdr-0 tableData" data-href="수정필">
											<span class="icon h_new span-new-link" style="margin-top: 0px; display: none;"></span>
										</td>
										<td class="title new-window tableData" data-href="수정필">
											${approvalVo.title}
											<c:if test="${approvalVo.isFile eq 1}">
												<a href="수정필" class="icon file fr">
													<span class="blind">첨부 파일 표시</span>
												</a>
											</c:if>
										</td>
										<td class="docu-register tableData" data-href="수정필">
											<div title="${approvalVo.empName}">${approvalVo.empName}</div>
										</td>
										<td class="tableData" title="${approvalVo.draftDay}" data-href="수정필">${fn:substring(approvalVo.draftDay, 0, 10)}</td>
										<td class="tableData" title="${approvalVo.completeDay}" data-href="수정필">${fn:substring(approvalVo.completeDay, 0, 10)}</td>
										<td class="docu-form tableData" id="${approvalVo.fk_formId}">
											<div title="${approvalVo.formName}">${approvalVo.formName}</div>
										</td>
										<td class="docu-type tableData" data-href="수정필">
											<div title="${approvalVo.procedureType}">${approvalVo.procedureType}</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${empty requestScope.boxList}">
								<tr>
									<td colspan="10" class="approval-no-data">문서가 존재하지 않습니다.</td>
								</tr>
							</c:if>


						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="listbottom bt0" id="pageApprovalDocument" style="width: 1604px;">
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
				</div>
			</div>
		</div>
	</div>
</div>
