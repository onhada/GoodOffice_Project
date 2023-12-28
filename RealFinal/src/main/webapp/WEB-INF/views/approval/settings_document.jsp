<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>
<div id="contents">
	<div class="setting_title">
		<h3 class="fl">전체 문서 목록</h3>
		<a href="수정필" class="icon question tipsIcon" style="position: relative; top: 0; margin-left: 10px">
			<span class="blind">세부 설명</span>
		</a>
		<div class="tooltip hide" style="left: 25px; top: 0;">
			<div class="tooltip-box color-set-6" style="width: 400px;">
				<p>모든 결재자가 작성한 결재 문서의 목록을 확인하는 곳입니다. 선택 후 참조자를 추가하거나 삭제 문서 목록으로 보낼 수 있습니다.</p>
			</div>
		</div>
	</div>
	<div class="content_inbox approval-admin">
		<ul class="search-result-tag after from-gnb hide" id="boxSearchState" style="display: none;"></ul>

		<div class="cont_box">
			<div class="approval-wrap">
				<fieldset class="resize-with-div" style="width: 1604px;">
					<div class="table-top after" id="barApprovalDocument">
						<div class="select-list-wrap">
							<label>
								<input type="checkbox" class="js-approval-all-checkbox">
							</label>
							<a href="수정필" class="js-approval-btn-state js-approval-check-before" id="anchorApprovalState">보기: 모든 상태</a>
							<img src="<%= ctxPath %>/resources/image/icon/btn_drop.gif" class="open_drop vm js-approval-check-before">
							<ul class="dropdown-menu hide" id="menuApprovalState">
								<li>
									<a href="수정필" class="js-approval-li-state" value="all_except_delete">모든 문서</a>
								</li>
								<li>
									<a href="수정필" class="js-approval-li-state" value="progress">결재 중</a>
								</li>
								<li>
									<a href="수정필" class="js-approval-li-state" value="complete">결재 완료</a>
								</li>
								<li>
									<a href="수정필" class="js-approval-li-state" value="return">반려</a>
								</li>
							</ul>
							<span class="mgl_10 check-number js-approval-check-after hide" id="countCheckApprovalDocumentList" style="display: none;"></span>
							<a href="수정필" onclick="수정필" class="mgl_10 js-approval-check-after hide" style="display: none;">참조자추가</a>
							<a href="수정필" onclick="수정필" class="mgl_10 js-approval-check-after hide" style="display: none;">회람자추가</a>
							<a href="수정필" onclick="수정필" class="mgl_10 js-approval-check-after hide" style="display: none;">삭제</a>
							<div class="fr" style="display: flex; align-items: center; margin-right: 5px">
								<button class="hw-tooltip-file-icon" id="exportDocumentList" title="엑셀다운로드">
									<img src="https://static.hiworks.com/hr/svg/excel.svg" alt="download excel">
								</button>
							</div>
						</div>
					</div>
				</fieldset>

				<fieldset>
					<table class="tableType01 mgt_10" id="tableApprovalDocumentList" style="width: 1604px;">
						<caption>전체 문서 목록</caption>
						<!-- <colgroup>
						<col style="width:38px">
						<col style="width:200px">
						<col style="width:28%">
						<col style="width:33px;">
						<col style="width: 150px">
						<col style="width:100px;">
						<col style="width:120px;">
						<col style="width:100px;">
					</colgroup> -->
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
								<th class="resizable-pdr-0" style="white-space: nowrap; width: 768px;">
									<div class="column-resizer ui-resizable" style="width: 768px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
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
									<a href="수정필" class="js-approval-order updown" value="document_regdate">
										기안일
										<span class="down"></span>
									</a>
								</th>
								<th style="width: 120px; white-space: nowrap;" class="resizable-false">
									<a href="수정필" class="js-approval-order updown" value="document_completedate">완료일</a>
								</th>
								<th style="width: 100px; white-space: nowrap;" class="resizable-false">결재 상태</th>
							</tr>







							<c:if test="${not empty requestScope.documentList}">
								<!-- c:for -->

								<c:forEach var="approvalVo" items="${requestScope.documentList}">


									<tr>
										<td>
											<label>
												<input type="checkbox" class="js-checkbox-document-list" value="수정필" data-form-type="">
											</label>
										</td>
										<td class="docu-num" data-href="수정필">
											<div title="${approvalVo.fk_approvalId}">${approvalVo.fk_approvalId}</div>
										</td>
										<td class="new-open-window resizable-pdl-0 resizable-pdr-0" data-href="수정필">
											<span class="icon h_new span-new-link" style="margin-top: 0px; display: none;" data-link-url="수정필"></span>
										</td>
										<td class="title new-window" data-href="수정필">
											${approvalVo.title}
											<c:if test="${approvalVo.isFile eq 1}">
												<a href="수정필" class="icon file fr">
													<span class="blind">첨부 파일 표시</span>
												</a>
											</c:if>
										</td>
										<td class="docu-register" data-href="수정필">
											<div title="${approvalVo.empName}">${approvalVo.empName}</div>
										</td>
										<td title="${approvalVo.draftDay}" data-href="수정필">${fn:substring(approvalVo.draftDay, 0, fn:indexOf(approvalVo.draftDay, " "))}</td>
										<td title="${approvalVo.completeDay}" data-href="수정필">${fn:substring(approvalVo.completeDay, 0, fn:indexOf(approvalVo.completeDay, " "))}</td>
										<td class="docu-type" data-href="수정필">
											<div title="${approvalVo.status}">${approvalVo.status}</div>
										</td>
									</tr>

								</c:forEach>
							</c:if>



						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="listbottom bt0 resize-with-div" id="pageApprovalDocumentList" style="width: 1604px;">
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
				</fieldset>
			</div>
		</div>
	</div>


</div>