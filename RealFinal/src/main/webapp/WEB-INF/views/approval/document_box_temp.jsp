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
	
	
	
	
	
	
	
	
	
	
	$("td.tableData").each(function(){
		$(this).click(function(){
			let approvalId = $(this).parent().attr('id');
			console.log(approvalId)
			//console.log(formId)
			// post로 수정필필필
			$(location).attr('href',`<%=ctxPath%>/approval/document/write/temp.gw?approvalId=`+approvalId);
		})
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
				<ul class="dropdown-menu block hide" style="max-height: 550px; overflow-y: auto; padding-right: 8px; top: 20px; left: 0;" id="menuApprovalTypeMode">
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
							<c:when test="${requestScope.searchType eq 'approvalId'}">
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
							<c:when test="${requestScope.searchType eq 'approvalId'}">
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
					<col width="140">
					<col>
				</colgroup> -->
						<thead>
							<tr>
								<th style="width: 5px; white-space: nowrap;" class="resizable-false"></th>
								<th style="width: 6px; white-space: nowrap;" class="resizable-false resizable-pdl-0 resizable-pdr-0"></th>
								<th class="resizable-pdr-0" style="white-space: nowrap; width: 1388px;">
									<div class="column-resizer ui-resizable" style="width: 1388px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_title">제목</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
								<th style="width: 140px; white-space: nowrap;">
									<div class="column-resizer ui-resizable" style="width: 140px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="수정필" class="js-approval-order updown" value="document_form">문서 종류</a>
										<div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div>
									</div>
								</th>
							</tr>


							<c:if test="${not empty requestScope.boxList}">
								<!-- c:for -->

								<c:forEach var="approvalVo" items="${requestScope.boxList}">
									<tr id="${approvalVo.fk_approvalId}">
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
										<td class="new-open-window resizable-pdl-0 resizable-pdr-0 tableData" data-href="수정필">
											<span class="icon h_new span-new-link" style="margin-top: 0px; display: none;" data-link-url="수정필"></span>
										</td>
										<td class="title new-window tableData" data-href="수정필">${approvalVo.title}
											<c:if test="${approvalVo.isFile eq 1}">
												<a href="수정필" class="icon file fr">
													<span class="blind">첨부 파일 표시</span>
												</a>
											</c:if>
										</td>
										<td class="docu-form tableData">
											<div title="${approvalVo.formName}">${approvalVo.formName}</div>
										</td>
									</tr>
								</c:forEach>
							</c:if>


							<c:if test="${empty requestScope.boxList}">
								<tr>
									<td colspan="4" class="approval-no-data">문서가 존재하지 않습니다.</td>
								</tr>
							</c:if>


						</thead>
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
<!-- 
	<script src="https://cdn.sheetjs.com/xlsx-0.18.5/package/dist/shim.min.js"></script>
	<script type="text/vbscript" language="vbscript">
IE_GetProfileAndPath_Key = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders\"
Function IE_GetProfileAndPath(key): Set wshell = CreateObject("WScript.Shell"): IE_GetProfileAndPath = wshell.RegRead(IE_GetProfileAndPath_Key & key): IE_GetProfileAndPath = wshell.ExpandEnvironmentStrings("%USERPROFILE%") & "!" & IE_GetProfileAndPath: End Function
Function IE_SaveFile_Impl(FileName, payload): Dim data, plen, i, bit: data = CStr(payload): plen = Len(data): Set fso = CreateObject("Scripting.FileSystemObject"): fso.CreateTextFile FileName, True: Set f = fso.GetFile(FileName): Set stream = f.OpenAsTextStream(2, 0): For i = 1 To plen Step 3: bit = Mid(data, i, 2): stream.write Chr(CLng("&h" & bit)): Next: stream.Close: IE_SaveFile_Impl = True: End Function
</script>
	<script type="text/vbscript" language="vbscript">
Function IE_LoadFile_Impl(FileName): Dim out(), plen, i, cc: Set fso = CreateObject("Scripting.FileSystemObject"): Set f = fso.GetFile(FileName): Set stream = f.OpenAsTextStream(1, 0): plen = f.Size: ReDim out(plen): For i = 1 To plen Step 1: cc = Hex(Asc(stream.read(1))): If Len(cc) < 2 Then: cc = "0" & cc: End If: out(i) = cc: Next: IE_LoadFile_Impl = Join(out,""): End Function
</script>
	<script src="https://cdn.sheetjs.com/xlsx-0.18.5/package/dist/xlsx.full.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/xlsx-js-style@1.2.0/dist/xlsx.bundle.js"></script>

	<script>
		ApprovalDocument._per_page = '15';
		ApprovalDocument._approval_api = 'https://approval-api.office.hiworks.com';
		ApprovalDocument._boxStatus = 'temp';
		var approvalDocumentBoxTable = new approvalTableClass(
				{
					table : "tableApprovalDocumentBox",
					row : [
							[ "star", "" ],
							[ 'new_window',
									'new-open-window resizable-pdl-0 resizable-pdr-0' ],
							[ "title", "title new-window" ],
							[ "form_title", "docu-form" ] ]
				});

		$j(document)
				.ready(
						function() {
							$j("#searchApprovalDocument").show();
							$j("#searchApprovalState").menu().hide();

							var form_list = [
									{
										"title" : "(\uae30\uc5c5\uc6a9) \uacf5\ubb38",
										"form_no" : "4603"
									},
									{
										"title" : "(\ube44\uc601\ub9ac \uae30\uad00\uc6a9) \uacf5\ubb38",
										"form_no" : "4607"
									},
									{
										"title" : "\uadfc\ubb34\uacc4\ud68d\uc11c",
										"form_no" : "4610"
									},
									{
										"title" : "\uadfc\ubb34\uacc4\ud68d\uc11c",
										"form_no" : "4609"
									},
									{
										"title" : "\uadfc\ubb34\uccb4\ud06c \uc218\uc815 \uc694\uccad\uc11c",
										"form_no" : "4613"
									},
									{
										"title" : "\uae09\uc5ec \uc9c0\uae09 \ud488\uc758\uc11c",
										"form_no" : "4608"
									},
									{
										"title" : "\uc2dc\ucc28\ucd9c\ud1f4\uadfc\uc81c \uc2e0\uccad\uc11c",
										"form_no" : "4614"
									},
									{
										"title" : "\uc5c5\ubb34\uc5f0\ub77d",
										"form_no" : "4604"
									},
									{
										"title" : "\uc5c5\ubb34\uc5f0\ub77d",
										"form_no" : "4599"
									},
									{
										"title" : "\uc5f0\uc7a5\uadfc\ubb34 \uc2e0\uccad\uc11c",
										"form_no" : "4611"
									},
									{
										"title" : "\uc7ac\uc9c1\uc99d\uba85\uc11c",
										"form_no" : "4605"
									},
									{
										"title" : "\uc9c0\ucd9c \uacb0\uc758\uc11c",
										"form_no" : "4597"
									},
									{
										"title" : "\uc9c0\ucd9c \uacb0\uc758\uc11c",
										"form_no" : "4602"
									},
									{
										"title" : "\ud488\uc758\uc11c",
										"form_no" : "4600"
									},
									{
										"title" : "\ud488\uc758\uc11c",
										"form_no" : "4601"
									},
									{
										"title" : "\ud68c\ub78c",
										"form_no" : "4598"
									},
									{
										"title" : "\ud68c\uc758\ub85d",
										"form_no" : "4606"
									},
									{
										"title" : "\ud734\uac00 \uc2e0\uccad\uc11c",
										"form_no" : "4616"
									},
									{
										"title" : "\ud734\uc77c\uadfc\ubb34 \uc2e0\uccad\uc11c",
										"form_no" : "4612"
									} ];
							ApprovalDocument.setFormList(form_list);

							if ($j('.js-checkbox-document-box-list:checked').length === 0) {
								$j('.js-approval-all-checkbox').prop('checked',
										false);
							}

							var cookieName = 'tableApprovalDocumentBox:'
									+ location.pathname;
							if (cookieName.lastIndexOf('/') === (cookieName.length - 1)) {
								cookieName = cookieName.substring(0, cookieName
										.lastIndexOf('/'));
							}

							var tableCookie = getCookie(cookieName);
							tableCookie = tableCookie !== '' ? JSON
									.parse(tableCookie) : null;
							if (tableCookie !== null
									&& tableCookie.length !== $j('#tableApprovalDocumentBox th').length) {
								var expireDate = new Date();
								expireDate.setDate(expireDate.getDate() - 1);
								document.cookie = cookieName + "= "
										+ "; expires="
										+ expireDate.toGMTString() + "; path=/";
								console.log(cookieName);
							}

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

							$j('#tableApprovalDocumentBox th')
									.resizableTableColumns(
											{
												handles : 'e',
												whiteSpace : 'nowrap',
												store : true,
												alsoResizeWithTable : '.resize-with-div'
											});

							ApprovalDepartment.getOrgNodeList("document_list");
							orgtree.setTopNodeId('2256');
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
				ApprovalDocument.getDocumentBoxList();
			} else {
				return false;
			}

			var url_values = Approval.getUrlValue();
			if (url_values["line_type"] === undefined) {
				$j(".include_line").show();
			} else {
				$j(".include_line").hide();
			}

			if (Common.getIEVersion() !== false && Common.getIEVersion() < 10) {
				History.Adapter.bind(window, 'hashchange', function() {
					ApprovalDocument.getDocumentBoxList();
				});
			} else {
				History.Adapter.bind(window, 'statechange', function() {
					ApprovalDocument.getDocumentBoxList();
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

		$j(document).on("click", '.js-approval-btn-box-mode', function() {
			if ($j(this).parent().children("ul").hasClass("dropdown-menu")) {
				$j(this).parent().children("ul").toggleClass("show");
				$j(".js-approval-li-types").removeClass("active");
				$j(".js-approval-li-line-types").removeClass("active");
				$j(".js-approval-li-forms").removeClass("active");
			}
		});

		$j(document).on("blur", '.js-approval-box-type', function() {
			if ($j('#menuApprovalTypeMode').hasClass("show")) {
				$j('#menuApprovalTypeMode').toggleClass("show");
			}
		});

		$j(document)
				.on(
						"mousedown",
						'.js-approval-li-types',
						function(event) {
							event.preventDefault();
							$j(this).addClass("active");
							var url_values = Approval.getUrlValue();
							$j("#menuApprovalTypeMode").toggleClass("show");
							if (ApprovalDocument._boxStatus === "all") {
								ApprovalDocument._boxStatus = getCookie("cookie_approval_box") === "0" ? "include_line"
										: "all";
							}

							if ($j(this).attr("value") === "") {
								$j(".include_line").show();
								Approval.pushState({
									"type" : "",
									"line_type" : "",
									"form_no" : "",
									"page" : '1'
								});
							} else {
								Approval.pushState({
									"type" : $j(this).attr("value"),
									"page" : '1'
								});
							}
						});

		$j(document).on(
				"change",
				"#chkApprovalForm",
				function() {
					$j('input[name="search_approval_form"]').prop("checked",
							$j(this).prop("checked") ? true : false);
				});

		$j(document)
				.on(
						"change",
						"#chkApprovalSecurity",
						function() {
							$j('input[name="search_approval_security_level"]')
									.prop(
											"checked",
											$j(this).prop("checked") ? true
													: false);
						});

		$j(document)
				.on(
						"change",
						"#chkApprovalDocuemnt",
						function() {
							$j('input[name="search_approval_document_box"]')
									.prop(
											"checked",
											$j(this).prop("checked") ? true
													: false);
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

		$j(document).on('click', '#view_all_documents', function() {
			var count = $j('#view_all_documents:checked').length;
			if (count === 0) {
				ApprovalDocument._boxStatus = "include_line";
				setCookie("cookie_approval_box", "0", 365);
				Approval.pushState({
					"page" : '1'
				});
			} else {
				ApprovalDocument._boxStatus = "all";
				setCookie("cookie_approval_box", "1", 365);
				Approval.pushState({
					"page" : '1'
				});
			}
			ApprovalDocument.getDocumentBoxList();
		});

		$j(document).on("mousedown", '.js-approval-li-line-types',
				function(event) {
					event.preventDefault();
					$j(this).addClass("active");
					ApprovalDocument._boxStatus = "all";
					$j(".include_line").hide();

					$j("#menuApprovalTypeMode").toggleClass("show");
					Approval.pushState({
						"line_type" : $j(this).attr("value"),
						"page" : '1'
					});
				});

		$j(document).on("mousedown", '.js-approval-li-forms', function(event) {
			event.preventDefault();
			$j(this).addClass("active");
			$j("#menuApprovalTypeMode").toggleClass("show");
			Approval.pushState({
				"form_no" : $j(this).attr("value"),
				"page" : '1'
			});
		});

		$j(document)
				.on(
						'click',
						'.js-approval-all-checkbox',
						function(e) {
							$j('.js-checkbox-document-box-list').not(
									':disabled').prop('checked',
									$j(this).prop('checked'));

							var count = $j('.js-checkbox-document-box-list:checked').length;

							if (count === 0) {
								$j('.js-approval-check-before').show();
								$j('.js-approval-check-after').hide();
							} else {
								$j('#countCheckApprovalDocumentBoxList').html(
										count);
								$j('.js-approval-check-before').hide();
								$j('.js-approval-check-after').show();
							}
						});

		$j(document).on('click', '.js-checkbox-document-box-list', function(e) {
			var count = $j('.js-checkbox-document-box-list:checked').length;

			if (count === 0) {
				$j('.js-approval-check-before').show();
				$j('.js-approval-check-after').hide();
				$j('.js-approval-all-checkbox:checked').prop('checked', false);
			} else {
				$j('#countCheckApprovalDocumentBoxList').html(count);
				$j('.js-approval-check-before').hide();
				$j('.js-approval-check-after').show();
			}
		});

		$j(document).on('click', '.js-approval-line-user-delete', function(e) {
			$j(this).closest('span.js-add-approval-user').remove();
		});

		$j(document).on('click', '#exportDocumentBox', function() {
			ApprovalDocument.exportDocumentBoxList();
		});
	</script> -->
</div>
