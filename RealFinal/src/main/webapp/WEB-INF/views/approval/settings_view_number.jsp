<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="contents">
	<div class="content_title">
		<form>
			<fieldset>
				<span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.documentPrint();">인쇄</a>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.batchManage('ADD', 'F', 'view');">참조자추가</a>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.batchManage('DELETE', '', 'view');">삭제</a>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.forceComplete();">강제완료</a>
				</span>
			</fieldset>
		</form>
	</div>
	<input type="checkbox" class="hide js-checkbox-document-list"
		value="7586" checked="checked"> <input type="hidden"
		name="approval_document_no" value="7586">

	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box view">
			<div class="approval-wrap write view">
				<h1>업무연락</h1>

				<table class="tableType02">
					<caption></caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 37.62%">
						<col style="width: 22.17%">
						<col style="width: 28.12%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">문서 종류</th>
							<td>공통 &gt; 업무연락</td>
							<th scope="row">문서 번호</th>
							<td>GA-업연-20231203-0003</td>
						</tr>
						<tr>
							<th scope="row">기안 부서</th>
							<td>하이웍스산업</td>
							<th scope="row">기안자</th>
							<td>대표이사</td>
						</tr>
						<tr>
							<th scope="row">보존 연한</th>
							<td>5년</td>
							<th scope="row">보안 등급</th>
							<td>A등급</td>
						</tr>
						<tr>
							<th scope="row">기안 일시</th>
							<td>2023-12-03 10:05:32</td>
							<th scope="row">완료 일시</th>
							<td></td>
						</tr>
					</tbody>
				</table>

				<table class="cal_table1 approve-write js-approval-line">
					<caption>결재선</caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="sign">
								<div
									style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									결재</div>
							</th>
							<td class="sign vt" id="approvalFirstLine">
								<table style="width: 100%; table-layout: fixed">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<td class="team name">대표이사</td>
											<td class="team name">대리</td>
											<td class="team name"></td>
											<td class="team name"></td>
											<td class="team name"></td>
											<td class="team name"></td>
											<td class="team name"></td>
										</tr>
										<tr>
											<td class="stamp"><img
												src="/gabia.biz/approval/sign/approval/A/2/2812" alt="결재">
											<p class="date" title="2023-12-03 10:05:32">2023-12-03</p></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
											<td class="stamp"></td>
										</tr>
										<tr>
											<td class="name gt-position-relative"><span
												class="stamp-step-num" style="display: none;">0</span>대표이사</td>
											<td class="name gt-position-relative"><span
												class="stamp-step-num" style="display: none;">0</span>양대리</td>
											<td class="name gt-position-relative"></td>
											<td class="name gt-position-relative"></td>
											<td class="name gt-position-relative"></td>
											<td class="name gt-position-relative"></td>
											<td class="name gt-position-relative"></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="cal_table1  approve-write refer js-approval-line">
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="choice"
									style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									참조</div>
							</th>
							<td id="approvalSecondLine"><input type="text"
								class="refer-add js-complete ui-autocomplete-input"
								placeholder="클릭 후 입력" id="inputApprovalSecondLine"
								style="display: none;" approval_type="F" autocomplete="off">
							</td>
						</tr>
					</tbody>
				</table>
				<table
					class="cal_table1  approve-write reception margin js-approval-line">
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="choice"
									style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									수신</div>
							</th>
							<td id="approvalThirdLine"><input type="text"
								class="refer-add js-complete ui-autocomplete-input"
								placeholder="클릭 후 입력" id="inputApprovalThirdLine"
								style="display: none;" approval_type="G" autocomplete="off">
							</td>
						</tr>
					</tbody>
				</table>

				<table class="cal_table1  approve-write refer2 js-approval-line">
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="choice"
									style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									(수신)참조</div>
							</th>
							<td id="approvalFourthLine"><input type="text"
								class="refer-add js-complete ui-autocomplete-input"
								placeholder="클릭 후 입력" id="inputApprovalFourthLine"
								style="display: none;" approval_type="H" autocomplete="off">
							</td>
						</tr>
					</tbody>
				</table>

				<div class="docu-common-wrap">
					<h2>
						<span class="point_color"> </span> ㄷㄷ
					</h2>
					<div class="contents after">
						<div class="se-contents"
							style="box-sizing: content-box; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.6; margin: 0px;"
							data-document-padding-top="18" data-document-padding-left="23"
							data-document-padding-right="23">
							<p
								style="margin: 0px; display: block; overflow-wrap: break-word;">
								<span>ㄷㄷ</span>
							</p>
						</div>
					</div>

					<div class="file after hide">
						<div class="top">
							<span class="body-color mgr_20">별첨</span>
						</div>
						<div class="filebox"></div>
					</div>
				</div>
			</div>

			<div class="approval-comment-tab" id="approvalCommentsTab">
				<a href="javascript:void(0);"
					class="gt-nav-item gt-active approval-comments-tab1"
					data-id="tab1-1">의견</a> <a href="javascript:void(0);"
					class="gt-nav-item approval-comments-tab2" data-id="tab1-2">이력</a>
			</div>
			<div id="divApprovalComments" class="approval-comment approval">
				<p class="top number_comments">
					<span class="point_color bold" id="approvalCommentsCount">0</span>개의
					의견
				</p>
				<ul id="approvalComments">
				</ul>
			</div>
			<div id="divApprovalCommentsHistory"
				class="approval-comment approval hide">
				<ul id="approvalCommentsHistory">

					<li>
						<div class="profile">
							<img class="myphoto"
								src="/gabia.biz/common/profile/image/2812/80/main" alt="">
						</div>
						<div class="txt">
							<div class="hidden after">
								<p class="name bold">대표이사</p>
								<p class="date">2023-12-03 10:05:32</p>

							</div>
							<p>
								<span style="color: #acacac;">기안</span>
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<script>
		ApprovalSetting._documentNo = '7586';

		$j(document).ready(function() {
			autoComplete();
			ApprovalDepartment.getOrgNodeList("setting_view");
			orgtree.setTopNodeId('2256');
		});

		$j(document).on("click", '.js-approval-line-user-delete', function() {
			$j(this).parent().remove();
		});

		$j(document).on('click', '.approval-comments-tab1', function() {
			$j(this).addClass('gt-active');
			$j('.approval-comments-tab2').removeClass('gt-active');
			$j('#divApprovalComments').show();
			$j('#divApprovalCommentsHistory').hide();
		});

		$j(document).on('click', '.approval-comments-tab2', function() {
			$j(this).addClass('gt-active');
			$j('.approval-comments-tab1').removeClass('gt-active');
			$j('#divApprovalComments').hide();
			$j('#divApprovalCommentsHistory').show();
		});

		$j(document).on(
				"click",
				'.department_delete',
				function() {
					if ($j(this).parent().attr("node_id") === undefined) {
						alert("다시 시도해주시기 바랍니다.");
						return;
					}
					if (ApprovalDepartment.deleteApprovalDepartment($j(this)
							.parent().attr("node_id"), $j(this).parent()
							.children(".approval-group-name").text(),
							ApprovalSetting._documentNo)) {
						$j(this).parent().remove();
					}
				});
	</script>
</div>
