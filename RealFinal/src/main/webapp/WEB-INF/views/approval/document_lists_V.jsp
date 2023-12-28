<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents">
	<div class="content_title">
		<label class="fl mgr_10 mgl_5"><input type="checkbox"
			class="js-approval-all-checkbox"></label> <span
			class="detail_select js-approval-lists-first-type"> <a
			href="javascript:void(0);" class="js-approval-btn-form-mode"
			id="anchorApprovalForm">보기: 모든 문서</a> <img
			src="/static/ui/images/btn_drop.gif" alt="DROPDOWN"
			class="open_drop vm">
			<ul class="dropdown-menu hide js-approval-lists-first-type-layer"
				id="menuApprovalFormMode"
				style="max-height: 550px; overflow-y: auto; padding-right: 8px;">
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="0">모든 문서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4603">(기업용) 공문</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4607">(비영리 기관용) 공문</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4610">근무계획서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4609">근무계획서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4613">근무체크 수정 요청서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4608">급여 지급 품의서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4614">시차출퇴근제 신청서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4604">업무연락</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4599">업무연락</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4611">연장근무 신청서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4605">재직증명서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4597">지출 결의서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4602">지출 결의서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4600">품의서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4601">품의서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4598">회람</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4606">회의록</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4616">휴가 신청서</a></li>
				<li><a href="javascript:void(0);" class="js-approval-li-forms"
					value="4612">휴일근무 신청서</a></li>
			</ul>
		</span> <span class="detail_select js-approval-lists-second-type hide"
			id="countCheckApprovalLists" style="display: none;">0</span> <span
			class="detail_select js-approval-lists-second-type hide"
			style="display: none;"> <a href="javascript:void(0);"
			onclick="ApprovalDocument.batchAction('check');">확인</a>
		</span>
	</div>
	<div class="content_inbox approval approval-admin">
		<ul class="search-result-tag after from-gnb hide" id="boxSearchState"
			style="display: none;"></ul>
		<div class="cont_box">
			<div class="approval-wrap pdt_0">
				<table class="tableType01" id="tableApprovalDocument"
					style="width: 1604px;">
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
								style="white-space: nowrap; width: 738px;"><div
									class="column-resizer ui-resizable"
									style="width: 738px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="document_title">제목</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 200px; white-space: nowrap;"><div
									class="column-resizer ui-resizable"
									style="width: 200px; float: left; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="javascript:void(0);" class="js-approval-order updown"
										value="document_register">기안자</a>
									<div class="ui-resizable-handle ui-resizable-e"
										style="z-index: 90;"></div>
								</div></th>
							<th style="width: 120px; white-space: nowrap;"
								class="resizable-false"><a href="javascript:void(0);"
								class="js-approval-order updown" value="document_regdate">기안일<span
									class="down"></span></a></th>
							<th style="width: 100px; white-space: nowrap;"
								class="resizable-false">구분</th>
							<th style="width: 80px; white-space: nowrap;"
								class="resizable-false">결과</th>
						</tr>
						<tr>
							<td colspan="8" class="approval-no-data">문서가 존재하지 않습니다.</td>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<div class="listbottom bt0" id="pageApprovalDocument"
					style="width: 1604px;"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		ApprovalDocument._listStatus = 'V';
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
							[ "document_regdate", "" ],
							[ "type", "docu-type" ],
							[ "result", "docu-result" ] ]
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
	</script>
</div>

