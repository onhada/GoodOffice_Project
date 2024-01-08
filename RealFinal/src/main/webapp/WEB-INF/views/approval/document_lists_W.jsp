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
			$(location).attr('href', '<%=ctxPath%>/approval/documentDetail/list/W/view.gw?formId=' + formId + '&approvalId=' + $(this).parent().find("td.docu-num div").html());
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
        	
        	$("input.js-checkbox-approval-lists").each(function(){
        		$(this).prop("checked", true);
        		
   				$("span#countCheckApprovalLists").html($("input:checkbox[name='checkApproval']:checked").length);
   				$("span.js-approval-lists-second-type").show();
        		
        	})
        	
        }else{
        	// 전체 선택 해제
        	
        	$("input.js-checkbox-approval-lists").each(function(){
        		$(this).prop("checked", false);
        		
        		$("span.js-approval-lists-second-type").hide();
				$("span.js-approval-lists-first-type").show();
        		
        	})
        }
	 });
	
	
	
	$("input.js-checkbox-approval-lists").each(function(){
		$(this).change(function(){
						
			var total = $("input[name='checkApproval']").length;
			var checked = $("input[name='checkApproval']:checked").length;

			if(total != checked){
				$("input.js-approval-all-checkbox").prop("checked", false);
				
			}else {
				$("input.js-approval-all-checkbox").prop("checked", true); 
			}
			
			
			
			// 체크된 갯수
			if(checked > 0){
				
				$("span#countCheckApprovalLists").html($("input:checkbox[name='checkApproval']:checked").length);
				$("span.js-approval-lists-second-type").show();
				
			}else{
				$("span.js-approval-lists-second-type").hide();
				$("span.js-approval-lists-first-type").show();
			}
			
			
		})
		
		
	})
	
	
	
	
	
	
})


function batchApproval(){
	// 일괄 결재 처리
	
	// 폼(form)을 전송(submit)
	  const frm = document.checkFrm;
	  frm.method = "post";
	  frm.action = "<%= ctxPath%>/approval/batch/approval.gw";
	  frm.submit();
}


</script>
<div id="contents">
	<div class="content_title">
		<c:if test="${not empty requestScope.ingList}">
			<label class="fl mgr_10 mgl_5">
				<input type="checkbox" class="js-approval-all-checkbox">
			</label>
		</c:if>
		<span class="detail_select js-approval-lists-first-type">
			<c:if test="${not empty requestScope.ingList}">
				<a class="js-approval-btn-form-mode" id="anchorApprovalForm">선택</a>
			</c:if>
			<%-- <img src="<%= ctxPath %>/resources/image/icon/btn_drop.gif" alt="DROPDOWN" class="open_drop vm">
			<ul class="dropdown-menu hide js-approval-lists-first-type-layer" id="menuApprovalFormMode" style="max-height: 550px; overflow-y: auto; padding-right: 8px;">

				<!-- 양식에서 가져오던가하기 -->
				<li>
					<a href="수정필" class="js-approval-li-forms" value="0">모든 문서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4613">근무체크 수정 요청서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4608">급여 지급 품의서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4604">업무연락</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4611">연장근무 신청서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4605">재직증명서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4600">품의서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4601">품의서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4598">회람</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4616">휴가 신청서</a>
				</li>
				<li>
					<a href="수정필" class="js-approval-li-forms" value="4612">휴일근무 신청서</a>
				</li>
			</ul> --%>
		</span>
		<span class="detail_select js-approval-lists-second-type hide" id="countCheckApprovalLists" style="display: none;"></span>
		<span class="detail_select js-approval-lists-second-type hide" style="display: none;">
			<button type="button" onclick="batchApproval()">결재</button>
		</span>
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
				<table class="tableType01" id="tableApprovalDocument" style="width: 1604px;">
					<caption>대기 문서 리스트</caption>
					<thead>
						<tr>
							<th style="width: 5px; white-space: nowrap;" class="resizable-false"></th>
							<th style="width: 200px; white-space: nowrap;" class="resizable-pdr-0">
								<div class="column-resizer ui-resizable" style="width: 200px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="수정필" class="js-approval-order updown" value="document_code">문서 번호</a>
									<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
								</div>
							</th>
							<th style="width: 6px; white-space: nowrap;" class="resizable-false resizable-pdr-0 resizable-pdl-0"></th>
							<th class="resizable-pdr-0" style="white-space: nowrap; width: 903px;">
								<div class="column-resizer ui-resizable" style="width: 903px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
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
							<th style="width: 120px; white-space: nowrap;" class="resizable-false">구분</th>
						</tr>

						
						<c:if test="${not empty requestScope.ingList}">
							<form name="checkFrm">
								<c:forEach var="approvalVo" items="${requestScope.ingList}">
									<tr>
										<td>
											<label>
												<input type="checkbox" name="checkApproval" class="js-checkbox-approval-lists" value="${approvalVo.fk_approvalId}">
											</label>
										</td>
										<td class="docu-num tableData" data-href="수정필">
											<div title="${approvalVo.fk_approvalId}">${approvalVo.fk_approvalId}</div>
										</td>
										<td class="new-open-window resizable-pdl-0 resizable-pdr-0 tableData" data-href="수정필">
											<span class="icon h_new span-new-link" style="margin-top: 0px; display: none;" data-link-url="수정필"></span>
										</td>
										<td class="title new-window tableData" id="${approvalVo.fk_formId}">
											<div title="${approvalVo.title}">${approvalVo.title}</div>
											<c:if test="${approvalVo.isFile eq 1}">
												<span class="blind">첨부 파일 표시</span>
											</c:if>
										</td>
										<td class="docu-register tableData" data-href="수정필">
											<div title="${approvalVo.empName}">${approvalVo.empName}</div>
										</td>
										<td class="tableData" title="${approvalVo.draftDay}" data-href="수정필">${fn:substring(approvalVo.draftDay, 0, fn:indexOf(approvalVo.draftDay, " "))}</td>
										<td class="docu-type tableData" data-href="수정필">
											<div title="${approvalVo.procedureType}">${approvalVo.procedureType}</div>
										</td>
									</tr>
	
								</c:forEach>
							</form>
						</c:if>

						<c:if test="${empty requestScope.ingList}">
							<tr>
								<td colspan="7" class="approval-no-data">문서가 존재하지 않습니다.</td>
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
					<!-- <div class="paginate">
						<strong>1</strong>
					</div>
					<div class="page_select">
						<label class="blind" for="pageCurrent">SELECT CURRENT PAGE</label>
						<select onchange="ApprovalDocument.getDocumentListByPage($j(this).val());">
							<option value="1" selected="">1</option>
						</select>
						/ 1
					</div> -->
				</div>
			</div>
		</div>
	</div>

	<!-- <script type="text/javascript">
		ApprovalDocument._listStatus = 'W';
		var approvalDocumentTable = new approvalTableClass(
				{
					table : "tableApprovalDocument",
					row : [
							[ "checkbox", "" ],
							[ "document_code", "docu-num" ],
							[ "new_window",
									"new-open-window resizable-pdl-0 resizable-pdr-0" ],
							[ "title", "title new-window" ],
							[ "register", "docu-register" ],
							[ "document_regdate", "" ], [ "type", "docu-type" ] ]
				});

		$j(document)
				.ready(
						function() {
							$j("#searchApprovalDocument").show();
							$j("#searchApprovalState").menu().hide();

							var url_value = Approval.getUrlValue();
							if (url_value.order_key && url_value.order_value) {
								if ($j('.js-approval-order[value="'
										+ url_value.order_key + '"]').length > 0) {
									$j(
											'.js-approval-order[value="'
													+ url_value.order_key
													+ '"]')
											.append(
													url_value.order_value === "DESC" ? '<span class="down"></span>'
															: '<span class="up"></span>');
								}
							} else {
								$j(
										'.js-approval-order[value="document_regdate"]')
										.append('<span class="down"></span>');
							}

							$j('#tableApprovalDocument th')
									.resizableTableColumns(
											{
												handles : 'e',
												whiteSpace : 'nowrap',
												store : true,
												alsoResizeWithTable : '#pageApprovalDocument'
											});
						});

		$j(document).on('mouseover', '.new-window', function(e) {
			$j(this).prev().find('span.span-new-link').show();
		});
		$j(document).on('mouseout', '.new-window', function(e) {
			$j(this).prev().find('span.span-new-link:visible').hide();
		});
		$j(document).on('mouseover', 'td.new-open-window', function(e) {
			$j(this).find('span.span-new-link').show();
		});
		$j(document).on('mouseout', 'td.new-open-window', function(e) {
			$j(this).find('span.span-new-link').hide();
		});

		$j(function() {
			var History = window.History;
			var pageUrl = window.location.search.substring(0);

			if (History.enabled) {
				ApprovalDocument.getDocumentList();
			} else {
				return false;
			}

			if (Common.getIEVersion() !== false && Common.getIEVersion() < 10) {
				History.Adapter.bind(window, 'hashchange', function() {
					ApprovalDocument.getDocumentList();
				});
			} else {
				History.Adapter.bind(window, 'statechange', function() {
					ApprovalDocument.getDocumentList();
				});
			}
		});

		$j(document).on(
				"click",
				"*[data-href]",
				function(e) {
					e.stopPropagation();

					if ($j(this).hasClass('new-open-window')) {
						window.document.location = $j(this).find(
								'.span-new-link').data('link-url');
					} else {
						window.document.location = $j(this).data('href');
					}
					return false;
				});

		$j(document).on(
				"change",
				".js-approval-all-checkbox",
				function() {
					$j('.js-checkbox-approval-lists').prop("checked",
							$j(this).prop("checked") ? true : false);
					$j("#countCheckApprovalLists").html(
							$j('.js-checkbox-approval-lists').length);
					if ($j(this).prop("checked")) {
						$j(".js-approval-lists-first-type").hide();
						$j(".js-approval-lists-second-type").show();
					} else {
						$j(".js-approval-lists-first-type").show();
						$j(".js-approval-lists-second-type").hide();
					}
				});

		$j(document).on("change", '.js-checkbox-approval-lists', function() {
			var checked = false;
			var checked_count = 0;
			$j('.js-checkbox-approval-lists').each(function(index, value) {
				if ($j(value).prop("checked")) {
					checked = true;
					checked_count++;
				}
			});

			if (checked) {
				$j(".js-approval-lists-first-type").hide();
				$j(".js-approval-lists-second-type").show();
				$j("#countCheckApprovalLists").html(checked_count);
			} else {
				$j(".js-approval-lists-first-type").show();
				$j(".js-approval-lists-second-type").hide();
			}
		});

		$j(document).on("mousedown", '.js-approval-li-forms', function(event) {
			event.preventDefault();
			$j('.js-approval-li-forms').removeClass("active");
			$j(this).addClass("active");
			$j('#anchorApprovalForm').html("보기: " + $j(this).text());
			$j(".js-approval-forms-first-type-layer").toggleClass("show");
			$j("#menuApprovalFormMode").toggleClass("show");
			Approval.pushState({
				"form_no" : $j(this).attr("value"),
				'page' : '1'
			});
		});

		$j(document).on(
				"mousedown",
				'.js-approval-li-liststatus',
				function(event) {
					event.preventDefault();
					$j('.js-approval-li-liststatus').removeClass("active");
					$j(this).addClass("active");
					$j('#anchorApprovalListStatus').html(
							"보기: " + $j(this).text());
					$j(".js-approval-forms-first-type-layer").toggleClass(
							"show");
					$j("#menuApprovalListStatusMode").toggleClass("show");
					Approval.pushState({
						"document_list_status" : $j(this).attr("value"),
						'page' : '1'
					});
				});

		$j(document)
				.on(
						"click",
						'.js-approval-btn-form-mode, .js-approval-btn-list-status-mode',
						function() {
							if ($j(this).parent().children("ul").hasClass(
									"dropdown-menu")) {
								$j(this).parent().children("ul").toggleClass(
										"show");
							}
						});

		$j(document).on("blur", '.js-approval-lists-first-type', function() {
			if ($j('#menuApprovalFormMode').hasClass("show")) {
				$j('#menuApprovalFormMode').toggleClass("show");
			}
			if ($j('#menuApprovalListStatusMode').hasClass("show")) {
				$j('#menuApprovalListStatusMode').toggleClass("show");
			}
		});

		$j(document).on("click", '.js-approval-order', function() {
			var up_template = '<span class="up"></span>';
			var down_template = '<span class="down"></span>';
			var append_template = up_template;
			var order_value = "ASC";

			if ($j(this).children("span").hasClass("up")) {
				append_template = down_template;
				order_value = "DESC";
			}

			$j('.js-approval-order span').remove();

			$j(this).append(append_template);

			Approval.pushState({
				"order_key" : $j(this).attr("value"),
				"order_value" : order_value
			});
		});

		$j(document).on(
				"change",
				"#textDateRange",
				function() {
					var textRange = $j(this).val();
					var nDate = new Date();
					var endDate = nDate.getFullYear() + '-'
							+ ('0' + (nDate.getMonth() + 1)).slice(-2) + '-'
							+ ('0' + (nDate.getDate())).slice(-2);

					if (textRange === "10D") {
						nDate.setDate(nDate.getDate() - 10);
					} else if (textRange === "1M") {
						nDate.setMonth(nDate.getMonth() - 1);
					} else if (textRange === "6M") {
						nDate.setMonth(nDate.getMonth() - 6);
					} else if (textRange === "1Y") {
						nDate.setFullYear(nDate.getFullYear() - 1);
					} else if (textRange === "A") {
						$j("#textStartDate").val('');
						$j("#textEndDate").val('');
						$j("#textStartDate").attr("disabled", true);
						$j("#textEndDate").attr("disabled", true);
						return;
					}

					$j("#textStartDate").attr("disabled", false);
					$j("#textEndDate").attr("disabled", false);

					// 직접 입력 선택 시 값 변경 없음
					if (textRange === "DI")
						return;

					var startDate = nDate.getFullYear() + '-'
							+ ('0' + (nDate.getMonth() + 1)).slice(-2) + '-'
							+ ('0' + (nDate.getDate())).slice(-2);

					$j("#textStartDate").val(startDate);
					$j("#textEndDate").val(endDate);
				});
	</script> -->
</div>
