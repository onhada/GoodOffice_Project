<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents">
	<div class="setting_title">
		<h3 class="fl">삭제 문서 목록</h3>
		<a href="javascript:void(0)" class="icon question tipsIcon"
			style="position: relative; top: 0; margin-left: 10px"><span
			class="blind">세부 설명</span></a>
		<div class="tooltip hide" style="left: 25px; top: 0;">
			<div class="tooltip-box color-set-6" style="width: 400px;">
				<p>전체 문서 목록에서 삭제했거나 보존 연한이 만료된 문서들을 확인하는 곳입니다. 선택 후 복원하거나 완전 삭제할
					수 있습니다. 복원 후에는 더 이상 자동 삭제되지 않으며, 관리자가 삭제해야 삭제 상태가 됩니다.</p>
			</div>
		</div>
	</div>
	<div class="content_inbox approval-admin">
		<ul class="search-result-tag after from-gnb hide" id="boxSearchState"
			style="display: none;"></ul>

		<div class="cont_box">
			<div class="approval-wrap">
				<fieldset>
					<div class="table-top after" id="barApprovalDocument">
						<div class="select-list-wrap">
							<label><input type="checkbox"
								class="js-approval-all-checkbox"></label> <a
								href="javascript:void(0);"
								class="js-approval-btn-state js-approval-check-before"
								id="anchorApprovalState">보기: 모든 삭제 사유</a> <img
								src="/static/ui/images/btn_drop.gif"
								class="open_drop vm js-approval-check-before">
							<ul class="dropdown-menu hide" id="menuApprovalState">
								<li><a href="javascript:void(0);"
									class="js-approval-li-state" value="all_deleted">모든 삭제 사유</a></li>
								<li><a href="javascript:void(0);"
									class="js-approval-li-state" value="deleted_by_preserved">보존
										연한 경과</a></li>
								<li><a href="javascript:void(0);"
									class="js-approval-li-state" value="deleted_by_admin">관리자에
										의한 삭제</a></li>
							</ul>
							<span class="mgl_10 check-number js-approval-check-after hide"
								id="countCheckApprovalDocumentList" style="display: none;"></span>
							<a href="javascript:void(0);"
								onclick="ApprovalSetting.batchManage('RESTORE');"
								class="mgl_10 js-approval-check-after hide"
								style="display: none;">복원</a> <a href="javascript:void(0);"
								onclick="ApprovalSetting.batchManage('DELETE_FOREVER');"
								class="mgl_10 js-approval-check-after hide"
								style="display: none;">완전삭제</a> <span>
								<button type="button"
									onclick="ApprovalSetting.getDeletedApprovalDocumentHistory()"
									class="approval-document-history-button ml-16 xs">완전
									삭제 이력</button>
							</span>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<table class="tableType01 mgt_10" id="tableApprovalDocumentList"
						style="width: 920px;">
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
								<th style="width: 5px; white-space: nowrap;"
									class="resizable-false"></th>
								<th style="width: 200px; white-space: nowrap;"
									class="resizable-pdr-0"><div
										class="column-resizer ui-resizable"
										style="width: 200px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0);" class="js-approval-order updown"
											value="document_code">문서 번호</a>
										<div class="ui-resizable-handle ui-resizable-e"
											style="z-index: 90;"></div>
									</div></th>
								<th style="width: 6px; white-space: nowrap;"
									class="resizable-false resizable-pdl-0 resizable-pdr-0"></th>
								<th class="resizable-pdr-0"
									style="white-space: nowrap; width: 149px;"><div
										class="column-resizer ui-resizable"
										style="width: 149px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0);" class="js-approval-order updown"
											value="document_title">제목</a>
										<div class="ui-resizable-handle ui-resizable-e"
											style="z-index: 90;"></div>
									</div></th>
								<th style="width: 150px; white-space: nowrap;"><div
										class="column-resizer ui-resizable"
										style="width: 150px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="javascript:void(0);" class="js-approval-order updown"
											value="document_register">기안자</a>
										<div class="ui-resizable-handle ui-resizable-e"
											style="z-index: 90;"></div>
									</div></th>
								<th style="width: 100px; white-space: nowrap;"
									class="resizable-false"><a href="javascript:void(0);"
									class="js-approval-order updown" value="document_regdate">기안일<span
										class="down"></span></a></th>
								<th style="width: 180px; white-space: nowrap;"
									class="resizable-false">삭제 사유</th>
							</tr>
							<tr>
								<td><label><input type="checkbox"
										class="js-checkbox-document-list" value="7584"
										data-form-type=""></label></td>
								<td class="docu-num"
									data-href="/gabia.biz/approval/settings/view/7584"><div
										title="GA-업연-20231203-0001">GA-업연-20231203-0001</div></td>
								<td class="new-open-window resizable-pdl-0 resizable-pdr-0"
									data-href="/gabia.biz/approval/settings/view/7584"><span
									class="icon h_new span-new-link"
									style="display: none; margin-top: 0px;"
									data-link-url="/gabia.biz/approval/settings/view/7584"></span></td>
								<td class="title new-window"
									data-href="/gabia.biz/approval/settings/view/7584"><div
										title="ㅇㅇ">ㅇㅇ</div></td>
								<td class="docu-register"
									data-href="/gabia.biz/approval/settings/view/7584"><div
										title="대표이사">대표이사</div></td>
								<td class="undefined"
									data-href="/gabia.biz/approval/settings/view/7584">2023-12-03</td>
								<td class="docu-reason"
									data-href="/gabia.biz/approval/settings/view/7584"><div>관리자에
										의한 삭제</div></td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="listbottom bt0" id="pageApprovalDocumentList"
						style="width: 920px;">
						<p class="number">
							문서 수 : <span>1</span>
						</p>
						<div class="paginate">
							<strong>1</strong>
						</div>
						<div class="page_select">
							<label class="blind" for="pageCurrent">SELECT CURRENT
								PAGE</label> <select
								onchange="ApprovalSetting.getDocumentListByPage($j(this).val());"><option
									value="1" selected="">1</option></select> / 1
						</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>

	<script>
		var approvalDocumentList = new approvalTableClass(
				{
					table : "tableApprovalDocumentList",
					row : [
							[ "checkbox", "" ],
							[ "document_code", "docu-num" ],
							[ "new_window",
									"new-open-window resizable-pdl-0 resizable-pdr-0" ],
							[ "title", "title new-window" ],
							[ "register", "docu-register" ],
							[ "document_regdate" ],
							[ "deleted_reason", "docu-reason" ] ]
				});

		$j(document).ready(function() {
			$j("#searchApprovalDocument").show();
			$j("#searchApprovalState").menu().hide();

			var url_value = Approval.getUrlValue();
			if (url_value.order_key && url_value.order_value) {

			} else {

			}

			$j('#tableApprovalDocumentList th').resizableTableColumns({
				handles : 'e',
				whiteSpace : 'nowrap',
				store : true,
				alsoResizeWithTable : '#pageApprovalDocumentList'
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
				ApprovalSetting.getDeletedDocumentList();
			} else {
				return false;
			}

			History.Adapter.bind(window, 'statechange', function() {
				ApprovalSetting.getDeletedDocumentList();
			});
		});

		$j(document).on(
				"change",
				".js-approval-all-checkbox",
				function() {
					$j('.js-checkbox-document-list').prop("checked",
							$j(this).prop("checked") ? true : false);
					$j("#countCheckApprovalDocumentList").html(
							$j('.js-checkbox-document-list').length);
					if ($j(this).prop("checked")) {
						$j(".js-approval-check-before").hide();
						$j(".js-approval-check-after").show();
					} else {
						$j(".js-approval-check-before").show();
						$j(".js-approval-check-after").hide();
					}
				});

		$j(document).on("change", '.js-checkbox-document-list', function() {
			var checked = false;
			var checked_count = 0;
			$j('.js-checkbox-document-list').each(function(index, value) {
				if ($j(value).prop("checked")) {
					checked = true;
					checked_count++;
				}
			});

			if (checked) {
				$j(".js-approval-check-before").hide();
				$j(".js-approval-check-after").show();
				$j("#countCheckApprovalDocumentList").html(checked_count);
			} else {
				$j(".js-approval-check-before").show();
				$j(".js-approval-check-after").hide();
			}
		});

		$j(document).on("click", '#anchorApprovalState', function() {
			$j("#menuApprovalState").toggleClass("show");
			$j(".js-approval-li-state").removeClass("active");
		});

		$j(document).on("blur", '#barApprovalDocument', function() {
			if ($j('#menuApprovalState').hasClass("show")) {
				$j('#menuApprovalState').toggleClass("show");
			}
		});

		$j(document).on("mousedown", '.js-approval-li-state', function(event) {
			event.preventDefault();
			$j('.js-approval-li-state').removeClass("active");
			$j(this).addClass("active");
			$j('#anchorApprovalState').html("보기: " + $j(this).text());
			if ($j('#menuApprovalState').hasClass("show")) {
				$j('#menuApprovalState').toggleClass("show");
			}
			Approval.pushState({
				"state" : $j(this).attr("value"),
				"page" : '1'
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

		$j(document).on("click", "*[data-href]", function(e) {
			e.stopPropagation();
			if ($j(this).hasClass('new-open-window')) {
				window.open($j(this).find('.span-new-link').data('link-url'));
			} else {
				window.document.location = $j(this).data('href');
			}
			return false;
		});
	</script>
</div>
