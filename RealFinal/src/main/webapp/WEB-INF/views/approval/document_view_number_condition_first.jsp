<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents">
	<div class="content_title">
		<form>
			<fieldset>
				<span class="detail_select"> <a href="javascript:void(0);"
					class="fl" onclick="ApprovalProcess.modifyDocument();">내용수정</a><a
					href="javascript:void(0)" class="icon question tipsIcon"
					style="position: relative; top: 0; margin-left: 10px"><span
						class="blind">세부 설명</span></a>
					<div class="tooltip hide"
						style="left: 45px; top: 0; color: #676767;">
						<div class="tooltip-box" style="width: 400px;">
							<p>ㆍ내용이 수정되면, 기존 승인 내역은 모두 초기화됩니다.</p>
						</div>
					</div>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					class="fl" onclick="ApprovalProcess.cancelDocument('');">기안취소</a><a
					href="javascript:void(0)" class="icon question tipsIcon"
					style="position: relative; top: 0; margin-left: 10px"><span
						class="blind">세부 설명</span></a>
					<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
						<div class="tooltip-box" style="width: 360px;">
							<p>ㆍ기안자가 기안 자체를 삭제하고 싶을 때 사용할 수 있습니다.</p>
							<p>ㆍ기존 결재 내역 뿐만 아니라 문서 번호 자체가 없어지게 됩니다.</p>
							<p>ㆍ관리자 설정에 따라 반려 처리될 수 있습니다.</p>
						</div>
					</div>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					class="fl" onclick="ApprovalProcess.copyDocument();">기안복사</a><a
					href="javascript:void(0);" class="icon question tipsIcon"
					style="position: relative; top: 0; margin-left: 10px"><span
						class="blind">세부 설명</span></a>
					<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
						<div class="tooltip-box" style="width: 300px;">
							<p>ㆍ기안한 문서를 복사해서 문서를 작성할 수 있습니다.</p>
							<p>ㆍ결재선과 결재 양식 정보가 입력된 채로 작성을 할 수 있습니다.</p>
						</div>
					</div>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalProcess.getApprovalLineLayer();">결재선변경</a>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalProcess.documentPrint();">인쇄</a>
				</span>
			</fieldset>
		</form>
		<div class="setting_box">
			<button type="button" class="hw-icon outlined list_bt"
				onclick="javascript:location.href='/gabia.biz/approval/document/lists/A/?&amp;list_mode=A'"
				title="목록보기">
				<i class="gi gi-list"></i>
			</button>
			<button type="button" class="hw-icon outlined next_bt"
				onclick="javascript:location.href='/gabia.biz/approval/document/view/7585/condition/Jmxpc3RfbW9kZT1B'"
				title="다음으로 이동">
				<i class="gi gi-short-arrow-down"></i>
			</button>
		</div>
	</div>

	<input type="hidden" name="approval_document_no" value="7586">
	<input type="hidden" name="approval_first_line" value="2812,2819">
	<input type="hidden" name="approval_second_line" value=""> <input
		type="hidden" name="approval_third_line" value=""> <input
		type="hidden" name="approval_fourth_line" value=""> <input
		type="hidden" name="approval_fifth_line" value=""> <input
		type="hidden" name="approval_preserved_term" value="5"> <input
		type="hidden" name="approval_security_level" value="A"> <input
		type="hidden" name="approval_list_view"
		value="/gabia.biz/approval/document/lists/A/?&amp;list_mode=A">

	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box view">
			<div class="approval-wrap write view">
				<h1>업무연락</h1>
				<table class="tableType02">
					<caption>전자결재 문서보기</caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 37.62%">
						<col style="width: 22.17%">
						<col style="width: 28.12%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">기안 부서</th>
							<td>하이웍스산업</td>
							<th scope="row">기안자</th>
							<td>대표이사</td>
						</tr>
						<tr>
							<th scope="row">문서 번호</th>
							<td>GA-업연-20231203-0003</td>
							<th scope="row">보존 연한 / 보안 등급</th>
							<td><select name="preserved_term"
								class="fl write-select view"
								onchange="ApprovalProcess.modifyApprovalDocumentSetting('preserved_term');">
									<option value="1">1년</option>
									<option value="3">3년</option>
									<option value="5" selected="">5년</option>
									<option value="10">10년</option>
									<option value="0">영구</option>
							</select> <select name="security_level"
								class="fl write-select mgl_10 view"
								onchange="ApprovalProcess.modifyApprovalDocumentSetting('security_level');">
									<option value="S">S등급</option>
									<option value="A" selected="">A등급</option>
									<option value="B">B등급</option>
									<option value="C">C등급</option>
							</select> <a href="javascript:void(0)" class="icon question tipsIcon"
								style="position: relative; top: 4px; margin-left: 10px"><span
									class="blind">세부 설명</span></a>
								<div class="tooltip hide" style="left: -290px; top: 0">
									<div class="tooltip-box" style="width: 570px;">
										<p>보존 연한</p>
										<p>ㆍ1년: 경미한 연결 문서 및 일시적인 사용 또는 처리에 그치는 문서</p>
										<p>ㆍ3년: 사무의 수행상 1년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 3년간 보존을
											요하는 문서</p>
										<p>ㆍ5년: 사무의 수행상 3년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 5년간 보존을
											요하는 문서</p>
										<p>ㆍ10년: 사무의 수행상 장기간 참고 또는 이용해야 할 문서 및 법률상 10년간 보존을 요하는 문서</p>
										<p>ㆍ영구: 회사의 존속에 필요 불가결한 문서 및 역사적 또는 기타 사유로 중요한 문서</p>
										<p class="pdt_10">보안 등급</p>
										<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할 수
											있음.</p>
										<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(부장)등급 이상인 사람이 문서를 볼
											수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
										<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(과장)등급 이상인 사람이 문서를 볼
											수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
										<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할 수
											있음.</p>
									</div>
								</div></td>
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
									결재 <span class="spr-approval set" title="결재"
										onclick="ApprovalProcess.getApprovalUserInfoLayer('A', 'approval_first_line');"></span>
								</div>
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
									참조 <span class="spr-approval set" title="참조"
										onclick="ApprovalProcess.showApprovalInput('approvalSecondLine', 'inputApprovalSecondLine');"></span>
								</div>
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
									수신 <span class="spr-approval set" title="수신"
										onclick="ApprovalProcess.showApprovalInput('approvalThirdLine', 'inputApprovalThirdLine');"></span>
								</div>
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
									(수신)참조 <span class="spr-approval set" title="수신"
										onclick="ApprovalProcess.showApprovalInput('approvalFourthLine', 'inputApprovalFourthLine');"></span>
								</div>
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

					<div class="file after">
						<div class="top">
							<span class="body-color mgr_20">별첨</span> <a
								href="javascript:void(0);" class="addfile"
								onclick="ApprovalProcess.getAttchedFileLayer();">파일 첨부</a> <span
								class="weakgray">|</span> <a href="javascript:void(0);"
								class="addfile"
								onclick="ApprovalProcess.getRelatedDocumentLayer();">관련문서 첨부</a>
						</div>
						<div class="filebox"></div>
					</div>

				</div>
			</div>

			<div class="approval-comment-tab" id="approvalCommentsTab">
				<a href="javascript:void(0);"
					class="gt-nav-item gt-active approval-comments-tab1"
					data-id="tab1-1" onclick="ApprovalProcess.getApprovalComments();">의견</a>
				<a href="javascript:void(0);"
					class="gt-nav-item approval-comments-tab2" data-id="tab1-2"
					onclick="ApprovalProcess.getApprovalCommentsHistory();">이력</a>
			</div>
			<div id="divApprovalComments" class="approval-comment approval">
				<p class="top number_comments">
					<span class="point_color bold" id="approvalCommentsCount">0</span>개의
					의견
				</p>
				<ul id="approvalComments"></ul>
				<div class="comment_write">
					<label for="commentInput" class="blind">댓글 입력란</label>
					<textarea id="approvalDocumentComment" placeholder="댓글을 남겨주세요."
						title="댓글을 남겨주세요." class="comment-texarea"
						style="overflow: hidden; overflow-wrap: break-word; height: 36px;"></textarea>
					<button type="button" class="bt_left"
						onclick="ApprovalProcess.addApprovalComment();">등록</button>
				</div>
			</div>
			<div id="divApprovalCommentsHistory"
				class="approval-comment approval hide" style="display: none;">
				<ul id="approvalCommentsHistory"></ul>
			</div>
		</div>
	</div>

	<script>
		ApprovalProcess._documentNo = '7586';
		ApprovalProcess._firstLine = '2812,2819';
		ApprovalProcess._secondLine = '';
		ApprovalProcess._thirdLine = '';
		ApprovalProcess._fourthLine = '';
		ApprovalProcess._fifthLine = '';
		ApprovalProcess._approvalMethod = 'AFGHI';
		ApprovalProcess._registerNo = '2812';
		ApprovalProcess._documentType = 'common';

		ApprovalProcess._nextURL = '/gabia.biz/approval/document/view/7585/condition/Jmxpc3RfbW9kZT1B';

		var approvalRelatedDocumentTable = new approvalTableClass({
			table : "tableRelatedDocument",
			row : [ [ "action2", "" ], [ "star", "" ],
					[ "document_code", "docu-num" ],
					[ "none_link_title", "title" ],
					[ "register", "docu-register" ] ]
		});

		$j(document).ready(function() {
			autoComplete();
			Approval.settingDblClickForDeleteApprovalSelectUser();
			ApprovalProcess.getApprovalComments();
			autosize(document.querySelector("#approvalDocumentComment"));

			ApprovalDepartment.getOrgNodeList("view");
			orgtree.setTopNodeId('2256');

		});

		$j(document).on(
				"click",
				'.js-approval-line-delete',
				function() {
					if ($j(this).parent().attr("user_no") === undefined) {
						alert("다시 시도해주시기 바랍니다.");
						return;
					}

					if (ApprovalProcess.deleteApprovalLinUser($j(this).parent()
							.attr("user_no"), $j(this).parent().contents()
							.eq(0).text(), $j(this).parent().attr("type"), $j(
							this).closest('td').attr('id'))) {
						$j(this).parent().remove();
					}
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
							ApprovalProcess._documentNo)) {
						$j(this).parent().remove();
					}
				});

		$j(document).on("click", '.js-approval-circulation', function() {
			$j(this).parent().remove();
		});

		$j(document).on(
				"mousedown",
				'.js-approval-li-types',
				function(event) {
					event.preventDefault();
					$j('.js-approval-li-forms').removeClass("active");
					$j(this).addClass("active");
					$j('#anchorApprovalType').html("보기: " + $j(this).text());
					$j("#menuApprovalTypeMode").toggleClass("show");
					ApprovalProcess._searchRelatedDocument['type'] = $j(this)
							.attr("value");
					ApprovalProcess._searchRelatedDocument['page'] = '1';
					ApprovalProcess.getRelatedDocumentList();
				});

		$j(document).on("keydown", '#textSearchRelatedDocument', function(e) {
			if (e.keyCode == 13) { // enter
				e.preventDefault();
				e.stopPropagation();

				ApprovalProcess.searchRelatedDocument();
			}
		});

		$j(document).on("click", '.js-approval-btn-box-mode', function() {
			if ($j(this).parent().children("ul").hasClass("dropdown-menu")) {
				$j(this).parent().children("ul").toggleClass("show");
				$j(".js-approval-li-types").removeClass("active");
			}
		});

		$j(document).on("click", '#anchorApprovalUserOrder', function() {
			var options = $j('#orderApprovalDropdown').find('a');
			var orderKey = getCookie('orderKey');

			if (!orderKey) {
				orderKey = 'name';
			}

			for (var i = 0; i < options.length; i++) {
				var option = options[i];

				if (option.onclick.toString().includes(orderKey)) {
					option.style.fontWeight = 'bold';
				} else {
					option.style.fontWeight = '';
				}
			}

			$j('#orderApprovalDropdown').toggleClass("show");
		});

		$j('#m_view_more_menu').on('click', function(e) {
			e.preventDefault();
			e.stopPropagation();
			$j('#m_view_more_menu_detail').show();
		});

		$j(document).on('click', function() {
			$j('button:focus').blur();
			$j('#m_view_more_menu_detail').hide();
		});

		ApprovalProcess._universalSetting = 'N';
	</script>
</div>
