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
	
	$("tr.tableData").each(function(){
		$(this).click(function(){
			let formId = $(this).find("td.title").attr('id');
			$(location).attr('href', '<%=ctxPath%>/approval/documentDetail/list/P/view.gw?formId=' + formId + '&approvalId=' + $(this).find("td.docu-num div").html());
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
})
</script>
<div id="contents">
	<div class="content_title">
		<span class="detail_select js-approval-lists-second-type hide" id="countCheckApprovalLists"></span>
		<span class="detail_select js-approval-lists-second-type hide"> </span>
	</div>
	<div class="content_inbox approval approval-admin">
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
				<table class="tableType01" id="tableApprovalDocument" style="width: 1604px;">
					<caption>예정, 진행 문서 리스트</caption>
					<thead>
						<tr>
							<th style="width: 200px; white-space: nowrap;" class="resizable-pdr-0">
								<div class="column-resizer ui-resizable" style="width: 200px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0)" class="js-approval-order updown" value="document_code">문서 번호</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 6px; white-space: nowrap;" class="resizable-false resizable-pdl-0 resizable-pdr-0"></th>
							<th class="resizable-pdr-0" style="white-space: nowrap; width: 873px;">
								<div class="column-resizer ui-resizable" style="width: 873px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0)" class="js-approval-order updown" value="document_title">제목</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 200px; white-space: nowrap;">
								<div class="column-resizer ui-resizable" style="width: 200px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0)" class="js-approval-order updown" value="document_register">기안자</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 120px; white-space: nowrap;" class="resizable-false">
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
							<th style="width: 100px; white-space: nowrap;" class="resizable-false">구분</th>
						</tr>

						<c:if test="${not empty requestScope.ingList}">

							<c:forEach var="approvalVo" items="${requestScope.ingList}">

								<tr class="tableData">
									<td class="docu-num">
										<div title="${approvalVo.fk_approvalId}">${approvalVo.fk_approvalId}</div>
									</td>
									<td class="new-open-window resizable-pdl-0 resizable-pdr-0">
										<span class="icon h_new span-new-link" style="display: none; margin-top: 0px;" data-link-url="javascript:ApprovalDocument.getView('27689', '', 'blank')"></span>
									</td>
									<td class="title new-window" id="${approvalVo.fk_formId}">
										<div title="${approvalVo.title}">${approvalVo.title}</div>
										<c:if test="${approvalVo.isFile eq 1}">
											<span class="blind">첨부 파일 표시</span>
										</c:if>
									</td>
									<td class="docu-register">
										<div title="${approvalVo.empName}">${approvalVo.empName}</div>
									</td>
									<td title="${approvalVo.draftDay}">${fn:substring(approvalVo.draftDay, 0, fn:indexOf(approvalVo.draftDay, " "))}</td>
									<td class="docu-type">
										<div title="${approvalVo.procedureType}">${approvalVo.procedureType}</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty requestScope.ingList}">
							<tr>
								<td colspan="6" class="approval-no-data">문서가 존재하지 않습니다.</td>
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