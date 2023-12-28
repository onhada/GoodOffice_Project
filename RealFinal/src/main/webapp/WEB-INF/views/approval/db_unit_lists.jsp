<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents">
	<div class="setting_title">
		<h3>DB 유닛 관리</h3>
	</div>
	<div class="content_inbox approval-admin">
		<div class="cont_box">
			<div class="content_title after">
				<ul class="partition-list">
					<li><a href="/gabia.biz/approval/db_unit/create">유닛 생성</a></li>
				</ul>
				<div id="dbunit-usage-guide" class="dbunit-usage-guide ui-draggable">
					<span class="gt-float-left" id="show_dbunit_dim">DB 유닛 사용을
						위한 가이드</span>
					<button type="button" class="close-btn gt-float-left gt-ml-5"
						id="dbunit-usage-guide-close-btn">
						<i class="fal fa-times"></i>
					</button>
					<span id="drag-handler" class="drag-handler ui-draggable-handle">
						<img src="/static/images/approval/drag_handler.svg" alt="">
					</span>
				</div>

				<script>
					$j('#dbunit-usage-guide').click(function() {
						guide_img_num = 0;
						$j('.db-unit-dim').show();
					});
					$j('#drag-handler').click(function() {
						return false;
					});
					$j("#dbunit-usage-guide").draggable(({
						handle : "#drag-handler"
					}));
					$j("#dbunit-usage-guide-close-btn").click(function() {
						$j('#dbunit-usage-guide').remove();
					});
				</script>
			</div>

			<div class="allform-wrap wide">
				<div class="after" id="topFncApprovalDBUnit">
					<div
						class="select-list-wrap fl js-approval-db-unit-actionarea hide">
						<label><input type="checkbox"
							class="js-approval-all-checkbox"></label> <span
							class="check-number" id="countApprovalCheckBox"></span>
						<button type="button" class="mgl_10"
							onclick="DBUnitBasic.deleteDBUnitByList();">유닛삭제</button>
					</div>

					<div class="fr">
						<a href="javascript:void(0);"
							class="search_bt fl point_color hide"
							style="margin: 6px 10px 0 0;" id="resetSearchDBUnit"
							onclick="DBUnitBasic.resetSearchDBUnit();"><span
							class="sp_menu searchCancel"></span>검색 취소</a>
						<div class="data-search fl">
							<div class="search"
								style="background-position: 0px 0px; border-color: rgb(192, 197, 202);">
								<fieldset>
									<input type="text" id="textSearchDBUnit" placeholder="유닛명"
										autocomplete="off" maxlength="30" value=""
										onkeypress="if(event.keyCode === 13) DBUnitBasic.searchDBUnit();">
									<span class="btn_search" onclick="DBUnitBasic.searchDBUnit();"><span
										class="icon src"><em class="blind">검색</em></span></span>
								</fieldset>
							</div>
						</div>
					</div>
				</div>

				<table class="tableType01 listbox sapceT" id="tableApprovalDBUnit">
					<thead>
						<tr>
							<th style="width: 32px;"></th>
							<th><a href="javascript:void(0);"
								class="js-approval-order updown" value="title">유닛명</a></th>
							<th><a href="javascript:void(0);"
								class="js-approval-order updown" value="comment">설명</a></th>
						</tr>
						<tr>
							<td><input type="checkbox"
								class="js-approval-db-unit-checkbox" unit_no="1199"></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1199"><div
									class="title">
									<a href="/gabia.biz/approval/db_unit/view/1199">공기업 공문</a>
								</div></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1199">공기업용
								공문을 생성할때 사용</td>
						</tr>
						<tr>
							<td><input type="checkbox"
								class="js-approval-db-unit-checkbox" unit_no="1198"></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1198"><div
									class="title">
									<a href="/gabia.biz/approval/db_unit/view/1198">회의록</a>
								</div></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1198">회의록을
								작성할 때 사용</td>
						</tr>
						<tr>
							<td><input type="checkbox"
								class="js-approval-db-unit-checkbox" unit_no="1197"></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1197"><div
									class="title">
									<a href="/gabia.biz/approval/db_unit/view/1197">재직 증명</a>
								</div></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1197">재직
								증명서를 생성할 때 사용</td>
						</tr>
						<tr>
							<td><input type="checkbox"
								class="js-approval-db-unit-checkbox" unit_no="1196"></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1196"><div
									class="title">
									<a href="/gabia.biz/approval/db_unit/view/1196">공문</a>
								</div></td>
							<td data-href="/gabia.biz/approval/db_unit/view/1196">공문을
								생성할때 사용</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="listbottom bt0" id="pageApprovalDBUnit">
					<p class="number">
						문서 수 : <span>4</span>
					</p>
					<div class="paginate">
						<strong>1</strong>
					</div>
					<div class="page_select">
						<label class="blind" for="pageCurrent">SELECT CURRENT PAGE</label>
						<select onchange="DBUnitBasic.getUnitListByPage($j(this).val());"><option
								value="1" selected="">1</option></select> / 1
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		var approvalDBUnitTable = new approvalTableClass({
			table : "tableApprovalDBUnit",
			row : [ [ "checkbox", "" ], [ "title", "" ], [ "comment", "" ] ]
		});

		$j(function() {
			var History = window.History;
			var pageUrl = window.location.search.substring(0);

			if (History.enabled) {
				DBUnitBasic.getDBUnitList();
			} else {
				return false;
			}

			History.Adapter.bind(window, 'statechange', function() {
				DBUnitBasic.getDBUnitList();
			});
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

		$j(document)
				.on(
						'change',
						'.js-approval-all-checkbox',
						function(e) {
							$j('.js-approval-db-unit-checkbox').prop('checked',
									$j(this).prop('checked'));

							var chk_cnt = $j('.js-approval-db-unit-checkbox:checked').length;

							if (chk_cnt > 0) {
								$j('#countApprovalCheckBox').html(chk_cnt);
								$j('.js-approval-db-unit-actionarea').show();
							} else {
								$j('.js-approval-db-unit-actionarea').hide();
							}
						});

		$j(document).on('change', '.js-approval-db-unit-checkbox', function() {
			var chk_cnt = $j('.js-approval-db-unit-checkbox:checked').length;
			if (chk_cnt > 0) {
				$j('#countApprovalCheckBox').html(chk_cnt);
				$j('.js-approval-db-unit-actionarea').show();
			} else {
				$j('.js-approval-db-unit-actionarea').hide();
			}
		});

		Approval.getDBUnitGuide();
	</script>
</div>
