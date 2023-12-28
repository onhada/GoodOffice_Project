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
				</span> <span class="detail_select hide" id="btnTempSaveDocument"
					style="display: inline;"> <a href="javascript:void(0);"
					onclick="ApprovalDocument.saveDocument('TEMP');">임시저장</a>
				</span> <span class="detail_select hide" id="btnPreviewDocument"
					style="display: inline;"> <a href="javascript:void(0);"
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
							onclick="ApprovalDocument.showApprovalFormRule('');"
							style="display: none;">사내전자결재규정</a>
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
									<input type="hidden" id="prevApprovalFormNo" value="4597">
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
								</select> <span class="fl hide" id="set_preserved_term_n"
									style="display: none;">년</span> <a href="javascript:void(0)"
									class="icon question tipsIcon"
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
								</select> <span class="fl hide" id="set_security_level_n"
									style="display: none;">등급</span> <a href="javascript:void(0)"
									class="icon question tipsIcon"
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
							onclick="ApprovalDocument.getApprovalLineSelect();"
							style="display: inline-block;">결재선설정</button>
					</div>
					<div id="approvalDocumentLine">
						<table class="cal_table1 approve-write js-approval-line">
							<caption>신청, 처리</caption>
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 37.62%;">
								<col style="width: 12.09%;">
								<col style="width: 38.02%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="agree"><div class="choice"
											style="height: 162px; display: table-cell; width: 108px; vertical-align: middle; text-align: center;">
											신청<span class="spr-approval set" title="신청"
												onclick="ApprovalDocument.approvalLineSetting('approval_first_line', 'B');"></span>
										</div></th>
									<td class="confer vt" id="approvalFirstLine">
										<table>
											<colgroup>
												<col width="">
												<col width="">
												<col width="">
												<col width="">
											</colgroup>
											<tbody>
												<tr>
													<td class="team name">대표이사</td>
													<td class="team name"></td>
													<td class="team name"></td>
													<td class="team name"></td>
												</tr>
												<tr>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
												</tr>
												<tr>
													<td class="name">대표이사</td>
													<td class="name"></td>
													<td class="name"></td>
													<td class="name"></td>
												</tr>
											</tbody>
										</table>
									</td>
									<th scope="row" class="confer"><div class="choice"
											style="height: 162px; display: table-cell; width: 108px; vertical-align: middle; text-align: center;">
											처리<span class="spr-approval set" title="처리"
												onclick="ApprovalDocument.approvalLineSetting('approval_second_line', 'C');"></span>
										</div></th>
									<td class="confer vt" id="approvalSecondLine">
										<table>
											<colgroup>
												<col width="">
												<col width="">
												<col width="">
												<col width="">
											</colgroup>
											<tbody>
												<tr>
													<td class="team name"></td>
													<td class="team name"></td>
													<td class="team name"></td>
													<td class="team name"></td>
												</tr>
												<tr>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
												</tr>
												<tr>
													<td class="name"></td>
													<td class="name"></td>
													<td class="name"></td>
													<td class="name"></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="cal_table1 approve-write refer">
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">참조</th>
									<td id="approvalThirdLine"><input type="text"
										class="refer-add js-complete ui-autocomplete-input"
										placeholder="클릭 후 입력" id="inputApprovalThirdLine"
										autocomplete="off"></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="write_input js-approval-input hide mgt_50"
						style="display: block;">
						<h4 class="fl">제목</h4>
						<div class="txt file" style="margin-right: 2px;">
							<div>
								<input type="text" name="approval_document_title"
									id="approval_document_title" placeholder="제목을 입력해 주세요."
									value="" oninput="checkTitleLength(this)" tabindex="-1">
							</div>
						</div>
					</div>
					<div class="write_input js-approval-input hide mgt_50"
						style="display: block;">
						<h4>본문</h4>
					</div>

					<h4 class="mgt_50 js-approval-input-guide" style="display: none;">상세
						입력</h4>

					<div class="write_input js-approval-input-guide"
						style="display: none;">문서 종류 선택 시 상세 입력이 노출됩니다.</div>

					<div class="write_input hide" id="approvalEditorContent"
						style="display: none;">
						<div class="txt file">
							<div id="dexteditor_holder"></div>
							<textarea style="display: none" id="compose_contents"></textarea>
							<div id="new_compose_contents"
								class="se se-edit-mode se se-classic-editor se-blur"
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
									<iframe class="se-contents-edit" tabindex="2"></iframe>
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

					<div class="js-approval-input hide" id="approvalDbContent"
						style="display: block;">
						<table class="tableType02 account">
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">구분</th>
									<td><label> <input type="radio"
											name="accounting_type" value="P" checked=""
											onchange="ApprovalDocument.changeSpendingReportType();">
											개인
									</label> <label class="mgl_20"> <input type="radio"
											name="accounting_type" value="C"
											onchange="ApprovalDocument.changeSpendingReportType();">
											법인
									</label></td>
								</tr>
								<tr>
									<th scope="row" id="th_spending_regist_month">회계 기준월</th>
									<th scope="row" style="display: none;"
										id="th_spending_regist_days">회계 기준일</th>
									<td>
										<div class="to-item" id="spending_regist_md">
											<!-- 회계 기준 : 월별 -->
											<select class="write-select" style="width: 80px;"
												onchange="ApprovalDocument.changeFixedDate();"
												id="selectFixedYear">
												<option value="2016">2016</option>
												<option value="2017">2017</option>
												<option value="2018">2018</option>
												<option value="2019">2019</option>
												<option value="2020">2020</option>
												<option value="2021">2021</option>
												<option value="2022">2022</option>
												<option value="2023" selected="">2023</option>
											</select> 년 <select class="write-select" style="width: 50px;"
												onchange="ApprovalDocument.changeFixedDate();"
												id="selectFixedMonth">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12" selected="">12</option>
											</select> 월
											<!-- 회계 기준 : 일별 -->
											<select class="write-select"
												style="width: 120px; display: none;"
												onchange="ApprovalDocument.changeFixedDate();"
												id="selectFixedDays">
												<option value="0">회계 기준일</option>
											</select>
										</div>
										<div class="to-item" id="spending_regist_c"
											style="display: none;">
											<!-- 회계 기준 : 사용자 정의 -->
											<input type="text" class="cal hasDatepicker"
												id="spendingDateCustom" readonly="readonly"
												value="2023-12-03">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">지출자</th>
									<td><input type="text"
										class="account-add js-complete ui-autocomplete-input"
										placeholder="클릭 후 입력" id="inputSpenderName" autocomplete="off">
										<span class="hide" id="textSpenderName"> </span>
										<button class="weakblue mgl_20 vt hide" id="modifySpenderName"
											onclick="ApprovalDocument.modifySpenderName();">변경</button></td>
								</tr>
								<tr id="infoEmployeeAccount">
									<th scope="row">계좌 정보</th>
									<td></td>
								</tr>
								<tr id="infoCorporationCard" class="hide">
									<th scope="row">법인 카드</th>
									<td><select id="corporationCard" class="write-select"
										style="min-width: 240px; width: auto;">
											<option value="">법인 카드</option>
									</select></td>
								</tr>
								<tr>
									<th scope="row">총괄 적요</th>
									<td id="approvalFirstLine"><textarea class="gt-w-100"
											id="inputGeneralBrief" name="generalBriefs" rows="8"
											cols="80"
											style="box-sizing: border-box; resize: none; padding: 2px;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="after">
							<h4 class="fl">거래 내역</h4>
							<button type="button" class="weakblue mgl_20 vt"
								onclick="ApprovalDocument.getDealInformationLayer();">추가</button>
						</div>

						<table class="tableType01 account mgb_20"
							id="tableAccoutingDealInformation">
							<colgroup>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="account_name">계정 과목</a></th>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="expense_date">지출일자</a></th>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="department_name">코스트센터</a></th>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="proof">증빙</a></th>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="price">금액</a></th>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="customer_name">거래처</a></th>
									<th scope="col"><a href="javascript:void(0);"
										class="js-approval-spending-order js-approval-order updown"
										value="brief">적요</a></th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>

						<script>
							var approval_msg = new validateMessage('approval');

							$j(function() {
								ApprovalDocument._spendingReport = {};
								ApprovalDocument._incomeReport = undefined;
								ApprovalDocument._spendingReport.type = 'P';
								ApprovalDocument._spendingReport.spendingRegist = 'M';
								ApprovalDocument._spendingReport.spendingDate = [];
								ApprovalDocument._spendingReport.fixedYear = '2023';
								ApprovalDocument._spendingReport.fixedMonth = '12';
								ApprovalDocument._spendingReport.fixedDays = '3';
								ApprovalDocument._spendingReport.spender = {
									'user_no' : '',
									'node_id' : ''
								};
								$j("#infoEmployeeAccount").children().filter(
										":odd").html('');
								ApprovalDocument._spendingReport.deal = [];
								ApprovalDocument._spendingReport.currentDeal = [];

								$j("input[name='approval_document_title']")
										.val('2023년 12월 지출 결의서 - 개인');

								if ($j('#spendingDateCustom').length) {
									$j('#spendingDateCustom')
											.datepicker(
													{
														dateFormat : 'yy-mm-dd',
														prevText : '이전 달',
														nextText : '다음 달',
														monthNames : [ '1월',
																'2월', '3월',
																'4월', '5월',
																'6월', '7월',
																'8월', '9월',
																'10월', '11월',
																'12월' ],
														monthNamesShort : [
																'1월', '2월',
																'3월', '4월',
																'5월', '6월',
																'7월', '8월',
																'9월', '10월',
																'11월', '12월' ],
														dayNames : [ '일', '월',
																'화', '수', '목',
																'금', '토' ],
														dayNamesShort : [ '일',
																'월', '화', '수',
																'목', '금', '토' ],
														dayNamesMin : [ '일',
																'월', '화', '수',
																'목', '금', '토' ],
														showMonthAfterYear : true,
														yearSuffix : '년',
														onSelect : function() {
															if (ApprovalDocument
																	.initDealInformation() === false) {
																$j(
																		'#spendingDateCustom')
																		.datepicker(
																				'setDate',
																				ApprovalDocument._spendingReport.fixedYear
																						+ '-'
																						+ ApprovalDocument._spendingReport.fixedMonth
																						+ '-'
																						+ ApprovalDocument._spendingReport.fixedDays);
																return;
															}
															var d = $j(this)
																	.datepicker(
																			'getDate');
															ApprovalDocument._spendingReport.fixedYear = d
																	.getFullYear();
															ApprovalDocument._spendingReport.fixedMonth = d
																	.getMonth() + 1;
															ApprovalDocument._spendingReport.fixedDays = d
																	.getDate();

															ApprovalDocument
																	.setAutoTitleInSpendingReport();
														}
													});
								}
							});

							$j(document)
									.on(
											'click',
											'.js-approval-spending-order',
											function(e) {
												e.preventDefault();
												var up_template = '<span class="up"></span>';
												var down_template = '<span class="down"></span>';
												var append_template = up_template;
												var order_value = 'ASC';

												if ($j(this).children('span')
														.hasClass('up')) {
													append_template = down_template;
													order_value = 'DESC';
												}

												var tdIdx = 0;
												var order_key = $j(this).attr(
														'value');
												if ($j(this).attr('value') === 'account_name') {
													tdIdx = 0;
												} else if ($j(this).attr(
														'value') === 'expense_date') {
													tdIdx = 1;
												} else if ($j(this).attr(
														'value') === 'department_name') {
													tdIdx = 2;
												} else if ($j(this).attr(
														'value') === 'price') {
													tdIdx = 3;
												} else if ($j(this).attr(
														'value') === 'customer_name') {
													tdIdx = 4;
												} else if ($j(this).attr(
														'value') === 'brief') {
													tdIdx = 5;
												}

												_this._spendingReport.deal
														.sort(function(a, b) {
															var aTxt = '';
															var bTxt = '';

															if (tdIdx === 3) {
																aTxt = parseInt(a['supply_price'])
																		+ (a['tax_amount'] !== '' ? parseInt(a['tax_amount'])
																				: 0);
																bTxt = parseInt(b['supply_price'])
																		+ (b['tax_amount'] !== '' ? parseInt(b['tax_amount'])
																				: 0);
															} else {
																aTxt = a[order_key];
																bTxt = b[order_key];
															}
															console.log(aTxt);
															console.log(bTxt);
															if (order_value === 'ASC') {
																return bTxt < aTxt ? 1
																		: -1;
															} else {
																return bTxt > aTxt ? 1
																		: -1;
															}
														});

												$j(
														'.js-approval-spending-order span')
														.remove();

												$sumRow = $j(
														'#tableAccoutingDealInformation #sumRow')
														.detach();

												$j(
														'#tableAccoutingDealInformation tbody')
														.html(
																$j(
																		'#tableAccoutingDealInformation tbody')
																		.children(
																				'tr')
																		.not(
																				'#sumRow')
																		.sort(
																				function(
																						a,
																						b) {
																					var $b = $j(
																							b)
																							.children(
																									'td')
																							.eq(
																									tdIdx);
																					var $a = $j(
																							a)
																							.children(
																									'td')
																							.eq(
																									tdIdx);
																					var bTxt = $b
																							.text();
																					var aTxt = $a
																							.text();
																					if ($b
																							.find('span.fl').length) {
																						bTxt = $b
																								.find(
																										'span.fl')
																								.text();
																					}

																					if ($a
																							.find('span.fl').length) {
																						aTxt = $a
																								.find(
																										'span.fl')
																								.text();
																					}

																					if (tdIdx === 3) {
																						aTxt = parseInt(aTxt
																								.replace(
																										/,/gi,
																										''));
																						bTxt = parseInt(bTxt
																								.replace(
																										/,/gi,
																										''));
																					}

																					if (order_value === 'ASC') {
																						return bTxt < aTxt ? 1
																								: -1;
																					} else {
																						return bTxt > aTxt ? 1
																								: -1;
																					}
																				}));

												$sumRow
														.appendTo($j('#tableAccoutingDealInformation tbody'));

												$j(this)
														.append(append_template);
											});

							function rewriteMessage(text, size) {
								var message = "";

								message = text.substring(0, text.indexOf("%s"))
										+ size
										+ text
												.substring(text.indexOf("%s") + 2);

								return message;
							}
						</script>
					</div>
					<div class="js-approval-input hide" id="approvalModule"
						style="display: block;"></div>
					<div class="write_input js-approval-input mgt_15 hide"
						style="display: block;">
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
										id="approvalAttachSize" style="display: none;"><span
										id="attachAttachSum"></span> / 50MB</span>
									<p></p>
								</div>
								<div class="file-list mgt_15" id="dragZone"
									style="min-height: 66px;">

									<div class="center viewAttachedFileArea show"
										id="approvalAttachText">여기로 파일을 끌어놓으세요</div>
									<div class="list gt-mt-5 hide" id="approvalAttachList"
										style="display: none;">
										<table id="tableApprovalRelated">
											<caption></caption>
											<colgroup>
												<col width="">
											</colgroup>
											<tbody></tbody>
										</table>
										<table id="tableApprovalAttach">
											<caption></caption>
											<colgroup>
												<col width="">
											</colgroup>
											<tbody></tbody>
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
