<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<div id="contents">
	<form autocomplete="off" onsubmit="return false;">
		<input type="submit" style="display: none;" onclick="return false;">
		<div class="content_title">
			<fieldset style="max-width: 969px;">
				<span class="detail_select" id="btnWriteSaveDocument"> <a
					href="javascript:void(0);"
					onclick="ApprovalDocument.saveDocument('WRITE');">기안하기</a>
				</span> <span class="detail_select hide" id="btnTempSaveDocument"> <a
					href="javascript:void(0);"
					onclick="ApprovalDocument.saveDocument('TEMP');">임시저장</a>
				</span> <span class="detail_select hide" id="btnPreviewDocument"> <a
					href="javascript:void(0);"
					onclick="ApprovalDocument.previewDocument();">인쇄미리보기</a>
				</span>
			</fieldset>
		</div>
		<div class="content_inbox">
			<div class="cont_box write">
				<div class="approval-wrap write">
					<h4 style="display: inline-block">
						기본 설정 <a href="javascript:void(0);" class="mgl_20 weakblue hide"
							id="approvalFormRule"
							onclick="ApprovalDocument.showApprovalFormRule('');">사내전자결재규정</a>
					</h4>
					<span class="gt-float-right gt-mt-5"> <a
						href="/gabia.biz/approval/document/write_test"
						style="color: #2985db;">시험 사용 양식을 이용해보세요.</a>
					</span>
					<table class="tableType02">
						<caption>전자결재 기본 설정</caption>
						<colgroup>
							<col style="width: 12.15%;">
							<col style="width: 44.94%">
							<col style="width: 12.15%">
							<col style="width: 30.76%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">문서 종류</th>
								<td><select name="approval_category_no"
									class="write-select" autocomplete="off">
										<option value="605" selected="">공통</option>
								</select> <input type="hidden" id="prevApprovalCategoryNo" value="605">
									<select name="approval_form_no" class="write-select"
									autocomplete="off">
										<option value="">선택</option>
										<option value="4597">지출 결의서</option>
										<option value="4598">회람</option>
										<option value="4599">업무연락</option>
										<option value="4600">품의서</option>
								</select>
									<button class="weakblue"
										onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button>
									<input type="hidden" id="prevApprovalFormNo" value="">
									<input type="hidden" id="prevApprovalFormTitle" value="">
								</td>
								<th scope="row">작성자</th>
								<td><input type="hidden" name="node_id" value="2256">
									하이웍스산업 <span>대표이사 대표이사</span></td>
							</tr>
							<tr>
								<th scope="row">보존 연한</th>
								<td><select name="preserved_term" class="fl write-select"
									id="set_preserved_term_y">
										<option value="">보존 연한</option>
										<option value="1">1년</option>
										<option value="3">3년</option>
										<option value="5">5년</option>
										<option value="10">10년</option>
										<option value="0">영구</option>
								</select> <span class="fl hide" id="set_preserved_term_n">년</span> <a
									href="javascript:void(0)" class="icon question tipsIcon"
									style="position: relative; top: 4px; margin-left: 10px"><span
										class="blind">세부 설명</span></a>
									<div class="tooltip hide" style="left: 0; top: 0">
										<div class="tooltip-box" style="width: 570px;">
											<p>ㆍ1년: 경미한 연결 문서 및 일시적인 사용 또는 처리에 그치는 문서</p>
											<p>ㆍ3년: 사무의 수행상 1년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 3년간 보존을
												요하는 문서</p>
											<p>ㆍ5년: 사무의 수행상 3년 이상에 걸쳐 참고 또는 이용해야 할 문서 및 법률상 5년간 보존을
												요하는 문서</p>
											<p>ㆍ10년: 사무의 수행상 장기간 참고 또는 이용해야 할 문서 및 법률상 10년간 보존을 요하는
												문서</p>
											<p>ㆍ영구: 회사의 존속에 필요 불가결한 문서 및 역사적 또는 기타 사유로 중요한 문서</p>
										</div>
									</div></td>
								<th scope="row">보안 등급</th>
								<td><select name="security_level" class="fl write-select"
									id="set_security_level_y">
										<option value="">보안 등급</option>
										<option value="S">S등급</option>
										<option value="A">A등급</option>
										<option value="B">B등급</option>
										<option value="C">C등급</option>
								</select> <span class="fl hide" id="set_security_level_n">등급</span> <a
									href="javascript:void(0)" class="icon question tipsIcon"
									style="position: relative; top: 4px; margin-left: 10px"><span
										class="blind">세부 설명</span></a>
									<div class="tooltip hide" style="right: 150px; top: 0;">
										<div class="tooltip-box" style="width: 450px;">
											<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할
												수 있음.</p>
											<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(부장)등급 이상인 사람이 문서를 볼
												수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
											<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(과장)등급 이상인 사람이 문서를 볼
												수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
											<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할
												수 있음.</p>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="after">
						<h4 class="fl mgr_20">결재선</h4>
						<button type="button" class="weakblue vt hide"
							id="btnApprovalAdressbookSelect"
							onclick="ApprovalDocument.getApprovalLineSelect();">결재선설정</button>
					</div>
					<div id="approvalDocumentLine">문서 종류 선택 시 결재선이 노출됩니다.</div>

					<div class="write_input js-approval-input hide mgt_50">
						<h4 class="fl">제목</h4>
						<div class="txt file" style="margin-right: 2px;">
							<div>
								<input type="text" name="approval_document_title"
									id="approval_document_title" placeholder="제목을 입력해 주세요."
									value="" oninput="checkTitleLength(this)">
							</div>
						</div>
					</div>
					<div class="write_input js-approval-input hide mgt_50">
						<h4>본문</h4>
					</div>

					<h4 class="mgt_50 js-approval-input-guide">상세 입력</h4>

					<div class="write_input js-approval-input-guide">문서 종류 선택 시
						상세 입력이 노출됩니다.</div>

					<div class="write_input hide" id="approvalEditorContent">
						<div class="txt file">
							<div id="dexteditor_holder"></div>
							<textarea style="display: none" id="compose_contents"></textarea>
							<div id="new_compose_contents"
								class="se se-edit-mode se-classic-editor se-blur"
								style="width: 100%; height: 500px;">
								<div class="se-container">
									<div class="se-dim-layer" style="height: 0px;">
										<div class="se-loader">
											<div></div>
											<div></div>
											<div></div>
											<span></span>
										</div>
									</div>
									<div class="se-balloon-container se-fold"></div>
									<div class="se-dialog-container"></div>
									<div class="se-calculate"></div>
									<input class="se-file-selector" type="file" name="file">
									<iframe class="se-print se-hide"></iframe>
									<div class="se-clipboard" contenteditable="true" tabindex="-1"></div>
								</div>
								<div class="se-header"></div>
								<div class="se-main se-horz-scroll"
									style="height: calc(100% - 0px);">
									<iframe class="se-contents-edit"></iframe>
									<iframe class="se-contents-preview"></iframe>
									<div class="se-code-viewer"></div>
								</div>

								<div class="se-footer">
									<div class="se-editor-resizer">
										<div class="se-resizer-bar"></div>
										<svg class="se-resizer-knob" version="1.1"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
											width="75px" height="21.512px" viewBox="0 0 75 21.512"
											enable-background="new 0 0 75 21.512" xml:space="preserve">
											<g>
											<g>
											<g>
											<polygon class="se-resizer-knob-bg"
												points="68.995,16.49 5.971,16.49 4.983,4.49 69.983,4.49"></polygon></g>
											<g>
											<path class="se-resizer-knob-border"
												d="M69.456,16.99H5.51l-1.07-13h66.086L69.456,16.99z M6.431,15.99h62.103l0.906-11H5.526L6.431,15.99z"></path></g></g>
											<g>
											<polygon class="se-resizer-knob-icon"
												points="37.483,13.862 33.573,8.276 34.393,7.703 37.483,12.118 40.574,7.703 41.392,8.276"></polygon></g></g></svg>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="js-approval-input hide" id="approvalDbContent"></div>
					<div class="js-approval-input hide" id="approvalModule"></div>
					<div class="write_input js-approval-input mgt_15 hide">
						<label for="write_txt3" class="blind">파일 첨부</label>
						<div class="txt file">
							<div class="position">
								<div class="top">
									<p class="left"></p>
									<h4 class="fl mgr_20 gt-bold viewAttachedFileArea">별첨</h4>
									<a href="javascript:void(0);"
										class="addfile viewAttachedFileArea" style="color: #779ec0;"
										onclick="$j('#fileApprovalAttach').click();">파일 첨부</a> <input
										type="file" style="overflow: hidden; width: 0px; height: 0px;"
										name="approval_attach" id="fileApprovalAttach" multiple="">
									<span class="weakgray viewAttachedFileArea">|</span> <a
										href="javascript:void(0);" class="addfile"
										style="color: #779ec0;"
										onclick="ApprovalDocument.getRelatedDocumentLayer();">관련문서
										첨부</a> <span
										class="right gt-float-right viewAttachedFileArea hide"
										id="approvalAttachSize"><span id="attachAttachSum"></span>
										/ 50MB</span>
									<p></p>
								</div>
								<div class="file-list mgt_15" id="dragZone"
									style="min-height: 66px;">

									<div class="center viewAttachedFileArea show"
										id="approvalAttachText">여기로 파일을 끌어놓으세요</div>
									<div class="list gt-mt-5 hide" id="approvalAttachList">
										<table id="tableApprovalRelated">
											<caption></caption>
											<colgroup>
												<col width="">
											</colgroup>
											<tbody>
											</tbody>
										</table>
										<table id="tableApprovalAttach">
											<caption></caption>
											<colgroup>
												<col width="">
											</colgroup>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<input type="hidden" name="approval_document_no" value=""> <input
			type="hidden" name="approval_first_line" value="2812|2256"> <input
			type="hidden" name="approval_second_line" value=""> <input
			type="hidden" name="approval_third_line" value=""> <input
			type="hidden" name="approval_fourth_line" value="">
	</form>
	<script>
		ApprovalDocument._documentNo = '';
		ApprovalDocument._firstLine = '2812|2256';
		ApprovalDocument._secondLine = '';
		ApprovalDocument._thirdLine = '';
		ApprovalDocument._fourthLine = '';
		ApprovalDocument._approvalMethod = '';
		ApprovalDocument._enableDelete = '';
		ApprovalDocument._formType = '';
		ApprovalDocument._registerNo = '2812';
		ApprovalDocument._formNo = '';

		Approval._documentMode = "WRITE";
		Approval._writeType = 'write';
		Approval._defaultFontFamily = '맑은 고딕';
		Approval._defaultFontSize = '16px';
		Approval._defaultLineHeight = '1.6';
		Approval._defaultEditor = 'synap';
		Approval._hrWork = 'https://hr-work.office.hiworks.com';

		var approval_msg = new validateMessage('approval');

		var approvalRelatedDocumentTable = new approvalTableClass({
			table : "tableRelatedDocument",
			row : [ [ "action", "" ], [ "star", "" ],
					[ "document_code", "docu-num" ],
					[ "none_link_title", "title" ],
					[ "register", "docu-register" ] ]
		});

		$j(document)
				.ready(
						function() {
							autoComplete();
							Approval
									.settingDblClickForDeleteApprovalSelectUser();
							ApprovalDepartment.getOrgNodeList("write");
							orgtree.setTopNodeId('2256');

							ApprovalDocument._editFlag = 'N';
							var approval_editor = Approval._defaultEditor === "dext" ? makeEditor_dext()
									: makeEditor_synap();

							$j(document)
									.on(
											"click",
											".js-approval-form-line-delete",
											function() {
												if ($j(this).parent().length > 0) {
													ApprovalForm
															.deleteApprovalLine(
																	$j(this)
																			.parent()
																			.attr(
																					'line'),
																	$j(this)
																			.parent()
																			.attr(
																					'user_no'));
													$j(this).parent().remove();
												}
											});

							$j(document).on(
									"change",
									"select[name='approval_category_no']",
									function() {
										ApprovalDocument
												.getApprovalFormByCategory($j(
														this).val());
									});

							$j(document)
									.on(
											"change",
											"select[name='approval_form_no']",
											function() {
												ApprovalDocument._formNo = $j(
														this).val();
												ApprovalDocument
														.changeApprovalForm(ApprovalDocument._formNo);
											});

							$j(document)
									.on(
											"change",
											"select[name='node_id']",
											function() {
												ApprovalDocument
														.changeNodeId($j(this)
																.val());
												if (typeof dbUnitWrite === "object") {
													dbUnitWrite
															.setInsaOrgBySelectedNodeId();
												}
											});

							$j(document)
									.on(
											"click",
											'.js-approval-line-delete',
											function() {
												if ($j(this).parent().parent()
														.attr("id") === undefined) {
													alert("다시 시도해주시기 바랍니다.");
													return;
												}

												var approval_line_id_name = {
													'approvalFirstLine' : 'approval_first_line',
													'approvalSecondLine' : 'approval_second_line',
													'approvalThirdLine' : 'approval_third_line',
													'approvalFourthLine' : 'approval_fourth_line'
												};
												var approval_line_id = $j(this)
														.parent().parent()
														.attr("id");
												var approval_line_name = approval_line_id_name[approval_line_id];

												$j(this).parent().remove();
												ApprovalDocument
														.saveApprovalLine(
																approval_line_id,
																approval_line_name);

												if (ApprovalDocument._universalSetting === 'Y') {
													ApprovalUniversal
															.deleteUser($j(this)
																	.parent()
																	.attr(
																			'user_no'));
												}
											});

							$j('#fileApprovalAttach')
									.fileupload(
											{
												url : '/gabia.biz/approval/upload_file/attach',
												sequentialUploads : true,
												dataType : 'json',
												paramName : 'approval_attach',
												add : function(e, data) {
													console.log("start");
													var isValid = true;

													var total_size = get_attached_file_sum();
													for (var i = 0; i < data.originalFiles.length; i++) {
														total_size += data.originalFiles[i].size;
													}

													var uploadFile = data.files[0];
													if (uploadFile.size > 50 * 1024 * 1024
															|| total_size > 50 * 1024 * 1024) {
														alert('파일 첨부는 50MB까지입니다.');
														isValid = false;
													}
													if ($j('.js-approval-attach').length >= 100) {
														alert('파일 첨부는 100개까지입니다.');
														isValid = false;
													}
													if ($j('.viewAttachedFileArea:visible').length === 0) {
														isValid = false;
													}

													if (isValid) {
														data.submit();
													} else {
														return false;
													}
												}

												,
												progressall : function(e, data) {
													console.log('progressall');
													Common._createProgress();
												}

												,
												done : function(e, data) {
													Common._closeProgress();

													if ($j('.js-approval-attach').length >= 100) {
														alert('파일 첨부는 100개까지입니다.');
														return;
													}

													$j('#approvalAttachText')
															.hide();
													$j('#approvalAttachSize')
															.show();
													$j('#approvalAttachList')
															.show();

													if (data.result.resultCode === RT_OK) {
														$j(
																"#tableApprovalAttach")
																.append(
																		$j("<tr><td>"
																				+ data.result.text
																				+ "</td></tr>"));
													}

													set_attached_file_sum();
												}

												,
												fail : function(e, data) {
													Common._closeProgress();
													alert('서버와 통신 중 문제가 발생했습니다. 다시 시도해주시기 바랍니다.');
												}

												,
												drop : function(e, data) {

												}

												,
												dropZone : $j("#dragZone")
											});

							$j("#dragZone")
									.on(
											'drag dragstart dragend dragover dragenter dragleave drop',
											function(e) {
												e.preventDefault();
												e.stopPropagation();
											})
									.on(
											'dragover dragenter',
											function() {
												if ($j('.viewAttachedFileArea:visible').length) {
													$j("#dragZone").addClass(
															"drag");
												}
											})
									.on(
											'dragleave dragend drop',
											function() {
												if ($j('.viewAttachedFileArea:visible').length) {
													$j("#dragZone")
															.removeClass("drag");
												}
											});

							//에디터 변경 버튼 임시사용 (2022.11 삭제예정)
							if (Approval._documentMode !== "WRITE") {
								$j('.select_editor').hide();
							}

							if (ApprovalDocument._enableDelete === "N") {

							}
						});

		$j(document).on(
				'click',
				'.js-approval-attach-delete',
				function() {
					$j(this).parent().parent().parent().remove();

					if ($j('.js-approval-attach-delete').length === 0
							&& $j('.js-approval-related').length === 0) {
						$j('#approvalAttachText').show();
						$j('#approvalAttachSize').hide();
						$j('#approvalAttachList').hide();
					}

					set_attached_file_sum();
				});

		$j(document).on("click", '.js-approval-btn-box-mode', function() {
			if ($j(this).parent().children("ul").hasClass("dropdown-menu")) {
				$j(this).parent().children("ul").toggleClass("show");
				$j(".js-approval-li-types").removeClass("active");
			}
		});

		$j(document).on("blur", '.js-approval-box-type', function() {
			if ($j('#menuApprovalTypeMode').hasClass("show")) {
				$j('#menuApprovalTypeMode').toggleClass("show");
			}
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
					ApprovalDocument._searchRelatedDocument['type'] = $j(this)
							.attr("value");
					ApprovalDocument._searchRelatedDocument['page'] = '1';
					ApprovalDocument.getRelatedDocumentList();
				});

		$j(document).on("keydown", '#textSearchRelatedDocument', function(e) {
			if (e.keyCode == 13) { // enter
				e.preventDefault();
				e.stopPropagation();

				ApprovalDocument.searchRelatedDocument();
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

		$j(document).on("click", '.js-approval-node-order', function() {
			// $j("#treeDiv .selectedNode").  click();
		});

		var set_attached_file_sum = function() {
			var sum = 0;
			$j('.js-approval-attach').each(
					function(index, value) {
						if ($j(value).attr('deleted')
								&& $j(value).attr('deleted') === 'Y') {
							return true;
						}
						if ($j(value).attr("size")) {
							sum += parseInt($j(value).attr("size"));
						}

						if ($j(value).hasClass('hide')) {
							$j(value).closest('tr').hide();
						}
					});

			if (sum <= 0) {
				$j('#approvalAttachSize').hide();
			} else {
				$j('#approvalAttachSize').show();
			}
			$j("#attachAttachSum").html(Approval.formatFileSize(sum));
		}

		$j(document)
				.on(
						"change",
						"select[name='security_level']",
						function() {
							if ($j(this).val() === "S") {
								var remain_department = $j(
										".approval-group-box").find(
										".approval-group-cont");
								if (remain_department.length > 0) {
									$j("select[name='security_level']").val(
											ApprovalDocument._security_level);
									alert(ApprovalLang
											.getMessage('APPROVAL_ADDED_DEPARTMENT_REMAIN'));
									return;
								} else {
									$j('#approvalDepartment').hide();
								}
							} else {
								$j('#approvalDepartment').show();
							}
						});
		$j(document).on("click", '.department_delete', function() {
			if ($j(this).parent().attr("node_id") === undefined) {
				alert("다시 시도해주시기 바랍니다.");
				return;
			}
			$j(this).parent().remove();
		});

		var get_attached_file_sum = function() {
			var sum = 0;
			$j('.js-approval-attach').each(function(index, value) {
				if ($j(value).attr("size")) {
					sum += parseInt($j(value).attr("size"));
				}
			});

			return sum;
		}

		var set_attached_file = function(pText) {
			if ($j('.js-approval-attach').length >= 100) {
				alert('파일 첨부는 100개까지입니다.');
				return;
			}

			$j('#approvalAttachText').hide();
			$j('#approvalAttachSize').show();
			$j('#approvalAttachList').show();

			$j("#tableApprovalAttach").append(
					$j("<tr><td>" + pText + "</td></tr>"));

			set_attached_file_sum();
		}

		window.onbeforeunload = function() {
			if (ApprovalDocument._documentSubmit === false) {
				return "작성중인 내용은 저장되지 않습니다.";
			}
		};

		$j(document).on('click', 'a[href^="javascript:void"]', function(e) {
			e.preventDefault();
		});

		$j(document)
				.on(
						'click',
						'#content_editor',
						function() {
							var editor_mode = Approval._defaultEditor === "dext" ? "신규"
									: "기존";
							if (confirm(editor_mode
									+ " 에디터로 변경하시겠습니까?\n작성한 내용은 저장되지 않습니다.")) {
								var count = $j('#content_editor:checked').length;
								if (count === 0) {
									Approval._defaultEditor = "synap";
									setCookie(
											"cookie_approval_editor_mode_temp",
											"0", 365);
									ApprovalDocument
											.getApprovalFormInfo(ApprovalDocument._formNo);
									$j('#dext_frame_holdereditor2').hide();
									$j('#new_compose_contents').show();

									$j('.DEXT_frame_resizebar').hide();
									$j('.se-container').show();
									$j('.se-header').show();
									$j('.se-main').show();
									$j('.se-footer').show();
								} else {
									Approval._defaultEditor = "dext";
									setCookie(
											"cookie_approval_editor_mode_temp",
											"1", 365);
									ApprovalDocument
											.getApprovalFormInfo(ApprovalDocument._formNo);
									$j('#dext_frame_holdereditor2').show();
									$j('#new_compose_contents').hide();

									$j('.DEXT_frame_resizebar').show();
									$j('.se-container').hide();
									$j('.se-header').hide();
									$j('.se-main').hide();
									$j('.se-footer').hide();
								}

							} else {
								if ($j(this).is(":checked", true)) {
									$j(this).prop('checked', false);
								} else {
									$j(this).prop('checked', true);
								}
							}
						});

		// 기안 복사 삭제된 계정 안내

		function dext_editor_before_insert_url_event(editorId, url) {
			var pValue = JSON.parse(url);

			if (pValue.resultCode === 'SUCCESS') {
				set_attached_file(pValue.text);
				return pValue.image;
			} else {
				alert(pValue.message);
				return '';
			}

			return '';
		}

		// 본문 내 용량 변경 시
		function dext_editor_contentsize_change_event(editorID, sizeInfoObj) {
			console.log('content_change');
			var dom = DEXT5.getD5Dom(editorID);
			var cDomImages = dom.body.getElementsByTagName('img');
			var cImages = [];

			for (var i = 0; i < cDomImages.length; i++) {
				var imgSrc = cDomImages[i].src;
				if (imgSrc.indexOf('/approval/image/view/') !== -1) {
					var findFileNo = imgSrc.split('/');
					cImages.push(findFileNo.pop());
				}
			}

			$j('.js-approval-attach:hidden').each(function(k, v) {
				if ($j.inArray($j(v).attr('file'), cImages) === -1) {
					$j(v).attr('deleted', 'Y');
				} else {
					$j(v).removeAttr('deleted');
				}
			});

			set_attached_file_sum();
		}

		var ApprovalUniversal = new ApprovalUniversalClass('ApprovalUniversal',
				'ApprovalDocument.saveApprovalLineSelectUniversal');
		ApprovalUniversal.setConfig({
			showAutoLine : false
		});

		function checkTitleLength(e) {
			var titleLength = 0;
			titleLength = e.value.length;

			if (titleLength > 100) {
				alert(rewriteMessage(approval_msg
						.getMessage('APPROVAL_TITLE_LENGTH_VALIDATION'), 100));
				e.value = e.value.substring(0, 100);
			}
		}

		function rewriteMessage(text, size) {
			var message = "";

			message = text.substring(0, text.indexOf("%s")) + size
					+ text.substring(text.indexOf("%s") + 2);

			return message;
		}
	</script>
</div>
