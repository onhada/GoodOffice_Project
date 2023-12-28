<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="contents">
	<form autocomplete="off" onsubmit="return false;">
		<input type="submit" style="display: none;" onclick="return false;">
		<div class="content_title">
			<fieldset style="max-width: 969px;">
				<span class="detail_select"> <a href="javascript:void(0);"
					class="fl" onclick="ApprovalDocument.saveDocument('MODIFY');">수정하기</a>
				</span> <span class="detail_select show" id="btnPreviewDocument"> <a
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
							onclick="ApprovalDocument.showApprovalFormRule('4599');">사내전자결재규정</a>
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
								<td>공통 &gt; 업무연락</td>
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
										<option value="5" selected="">5년</option>
										<option value="10">10년</option>
										<option value="0">영구</option>
								</select> <span class="fl hide" id="set_preserved_term_n">5년</span> <a
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
										<option value="A" selected="">A등급</option>
										<option value="B">B등급</option>
										<option value="C">C등급</option>
								</select> <span class="fl hide" id="set_security_level_n">A등급</span> <a
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
						<button type="button" class="weakblue vt show"
							id="btnApprovalAdressbookSelect"
							onclick="ApprovalDocument.getApprovalLineSelect();">결재선설정</button>
					</div>
					<div id="approvalDocumentLine">
						<table class="cal_table1 approve-write js-approval-line">
							<caption>결재선</caption>
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="sign"><div
											style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
											결재<span class="spr-approval set" title="결재"
												onclick="ApprovalDocument.approvalLineSetting('approval_first_line', 'A');"></span>
										</div></th>
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
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
													<td class="stamp"></td>
												</tr>
												<tr>
													<td class="name gt-position-relative">대표이사</td>
													<td class="name gt-position-relative">양대리</td>
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
									<th scope="row">참조</th>
									<td id="approvalSecondLine"><input type="text"
										class="refer-add js-complete ui-autocomplete-input"
										placeholder="클릭 후 입력" id="inputApprovalSecondLine"
										autocomplete="off"></td>
								</tr>
							</tbody>
						</table>
						<table
							class="cal_table1  approve-write reception js-approval-line">
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">수신</th>
									<td id="approvalThirdLine"><input type="text"
										class="refer-add js-complete ui-autocomplete-input"
										placeholder="클릭 후 입력" id="inputApprovalThirdLine"
										autocomplete="off"></td>
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
									<th scope="row">(수신)참조</th>
									<td id="approvalFourthLine"><input type="text"
										class="refer-add js-complete ui-autocomplete-input"
										placeholder="클릭 후 입력" id="inputApprovalFourthLine"
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
									value="ㄷㄷ" oninput="checkTitleLength(this)">
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

					<div class="write_input" id="approvalEditorContent">
						<div class="txt file">
							<div id="dexteditor_holder"></div>
							<textarea style="display: none" id="compose_contents">&lt;div id="hw_dext_default_style"&gt;&lt;div class="se-contents" style="box-sizing: content-box; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.6; margin: 0px;" data-document-padding-top="18" data-document-padding-left="23" data-document-padding-right="23"&gt;&lt;p style="margin: 0px; display: block; overflow-wrap: break-word;"&gt;&lt;span&gt;ㄷㄷ&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;</textarea>
							<div id="new_compose_contents"
								class="se se-edit-mode se-classic-editor se-blur"
								style="width: 100%; height: 500px;">
								<div class="se-container">
									<div class="se-dim-layer" style="height: 502px;">
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
									<div class="se-tooltip-layer">
										<div class="se-tooltip se-hide">
											<div class="se-tooltip-arrow se-hide"></div>
											<span class="se-label"></span>
										</div>
									</div>
								</div>
								<div class="se-header">
									<div class="se-toolbar">
										<div class="se-component-row se-use-navi">
											<div class="se-prev se-clickable se-rotate-180 se-shrink">
												<div class="se-navi-icon"
													style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div>
											</div>
											<div class="se-component-wrapper"
												style="width: calc(100% - 10px);">
												<div class="se-dropdown" tabindex="-1"
													name="fontFamilyWithText" style="width: 85px;">
													<button type="button"
														class="se-dropdown-btn-wrapper se-single-btn se-clickable"
														value="text" aria-label="글꼴" aria-haspopup="true">
														<div class="se-dropdown-btn" value="main">
															<span class="se-label">글꼴</span>
														</div>
														<div class="se-dropdown-btn" value="sub">
															<span class="se-arrow se-rotate-180"></span>
														</div>
													</button>
													<div class="se-dropdown-menu-wrapper">
														<ul class="se-dropdown-menu" role="menu">
															<li role="none"><button type="button"
																	class="se-clickable se-active" role="menuitem"
																	aria-label="기본값">
																	<span class="se-label">기본값</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="맑은 고딕">
																	<span class="se-label"
																		style="font-family: &amp; quot;맑은 고딕&amp;quot;;">맑은
																		고딕</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="돋움">
																	<span class="se-label" style="font-family: 돋움;">돋움</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="돋움체">
																	<span class="se-label" style="font-family: 돋움체;">돋움체</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="굴림">
																	<span class="se-label" style="font-family: 굴림;">굴림</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="굴림체">
																	<span class="se-label" style="font-family: 굴림체;">굴림체</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="바탕">
																	<span class="se-label" style="font-family: 바탕;">바탕</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="바탕체">
																	<span class="se-label" style="font-family: 바탕체;">바탕체</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="Arial">
																	<span class="se-label" style="font-family: Arial;">Arial</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Arial Black">
																	<span class="se-label"
																		style="font-family: &amp; quot;Arial Black&amp;quot;;">Arial
																		Black</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Tahoma">
																	<span class="se-label" style="font-family: Tahoma;">Tahoma</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Verdana">
																	<span class="se-label" style="font-family: Verdana;">Verdana</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Sans-Serif">
																	<span class="se-label" style="font-family: Sans-Serif;">Sans-Serif</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="Serif">
																	<span class="se-label" style="font-family: Serif;">Serif</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Monospace">
																	<span class="se-label" style="font-family: Monospace;">Monospace</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Cursive">
																	<span class="se-label" style="font-family: Cursive;">Cursive</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Fantasy">
																	<span class="se-label" style="font-family: Fantasy;">Fantasy</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Times New Roman">
																	<span class="se-label"
																		style="font-family: &amp; quot;Times New Roman&amp;quot;;">Times
																		New Roman</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Century Gothic">
																	<span class="se-label"
																		style="font-family: &amp; quot;Century Gothic&amp;quot;;">Century
																		Gothic</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Courier New">
																	<span class="se-label"
																		style="font-family: &amp; quot;Courier New&amp;quot;;">Courier
																		New</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="Georgia">
																	<span class="se-label" style="font-family: Georgia;">Georgia</span>
																</button></li>
														</ul>
													</div>
												</div>
												<div class="se-dropdown" tabindex="-1"
													name="fontSizeWithText" style="width: 85px;">
													<button type="button"
														class="se-dropdown-btn-wrapper se-single-btn se-clickable"
														value="text" aria-label="크기" aria-haspopup="true">
														<div class="se-dropdown-btn" value="main">
															<span class="se-label">크기</span>
														</div>
														<div class="se-dropdown-btn" value="sub">
															<span class="se-arrow se-rotate-180"></span>
														</div>
													</button>
													<div class="se-dropdown-menu-wrapper">
														<ul class="se-dropdown-menu" role="menu">
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="기본값">
																	<span class="se-label">기본값</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="9px">
																	<span class="se-label" style="font-size: 9px;">9px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="10px">
																	<span class="se-label" style="font-size: 10px;">10px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="11px">
																	<span class="se-label" style="font-size: 11px;">11px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="12px">
																	<span class="se-label" style="font-size: 12px;">12px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="13px">
																	<span class="se-label" style="font-size: 13px;">13px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="14px">
																	<span class="se-label" style="font-size: 14px;">14px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="16px">
																	<span class="se-label" style="font-size: 16px;">16px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="18px">
																	<span class="se-label" style="font-size: 18px;">18px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="24px">
																	<span class="se-label" style="font-size: 24px;">24px</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="32px">
																	<span class="se-label" style="font-size: 32px;">32px</span>
																</button></li>
														</ul>
													</div>
												</div>
												<div class="se-dropdown" tabindex="-1" name="lineHeight">
													<button type="button"
														class="se-dropdown-btn-wrapper se-single-btn se-clickable"
														value="icon" aria-label="줄간격" aria-haspopup="true">
														<div class="se-dropdown-btn" value="main">
															<div class="se-icon"
																style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpolygon%20points%3D%225.268%2C4.831%205.952%2C4.147%202.979%2C1.171%200%2C4.15%200.685%2C4.833%202.089%2C4.03%202.084%2C12.154%200.685%2C11.291%200%2C11.977%202.976%2C14.951%205.952%2C11.975%205.268%2C11.289%204.036%2C12.137%204.031%2C4.031%20%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%222.092%22%20width%3D%228.053%22%20height%3D%222.035%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%227.019%22%20width%3D%228.053%22%20height%3D%222.036%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%2212.053%22%20width%3D%228.053%22%20height%3D%222.035%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
														</div>
														<div class="se-dropdown-btn" value="sub">
															<span class="se-arrow se-rotate-180"></span>
														</div>
													</button>
													<div class="se-dropdown-menu-wrapper">
														<ul class="se-dropdown-menu" role="menu">
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="기본값">
																	<span class="se-label">기본값</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="1">
																	<span class="se-label">1</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="1.2">
																	<span class="se-label">1.2</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="1.4">
																	<span class="se-label">1.4</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable se-active" role="menuitem"
																	aria-label="1.6">
																	<span class="se-label">1.6</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="1.8">
																	<span class="se-label">1.8</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="2">
																	<span class="se-label">2</span>
																</button></li>
														</ul>
													</div>
												</div>
												<button type="button" class="se-button se-clickable"
													name="bold" aria-label="굵게">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M8.48%2C1.043c3.928%2C0%2C5.341%2C1.469%2C5.341%2C3.476c0%2C1.508-1.004%2C2.419-4.276%2C2.976%20c3.684%2C0.357%2C5.176%2C1.728%2C5.176%2C3.792c0%2C1.945-1.432%2C3.71-6.957%2C3.71H1.016v-0.675l1.997-0.179%20c0.062-2.086%2C0.071-3.81%2C0.071-5.953V7.475c0-2.025-0.01-3.592-0.071-5.597L1.016%2C1.717V1.043H8.48z%20M7.039%2C1.964%20c-0.06%2C1.945-0.06%2C3.062-0.06%2C5.106h0.377c2.107%2C0%2C3.15-0.926%2C3.15-2.892c0-1.808-0.858-2.214-2.925-2.214H7.039z%20M7.662%2C14.047%20c2.21%2C0%2C3.521-0.517%2C3.521-2.701c0-2.302-1.168-3.336-3.644-3.336H6.979c0%2C2.363%2C0%2C3.912%2C0.06%2C6.037H7.662z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="italic" aria-label="기울임꼴">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpath%20d%3D%22M10.912%2C1.992c-0.537%2C1.922-1.058%2C3.502-1.593%2C5.502L9.048%2C8.506c-0.52%2C1.942-1.05%2C3.61-1.551%2C5.551%20l1.985%2C0.22l-0.191%2C0.712H2.796l0.19-0.712l2.081-0.22c0.556-1.921%2C1.08-3.569%2C1.61-5.551l0.271-1.012%20C7.47%2C5.554%2C8%2C3.934%2C8.481%2C1.992L6.517%2C1.774l0.191-0.713h6.369l-0.192%2C0.713L10.912%2C1.992z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="underline" aria-label="밑줄">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%2214.031%22%20width%3D%2216%22%20height%3D%220.946%22%2F%3E%3C%2Fg%3E%3Cpath%20d%3D%22M13.053%2C1.016H10V2h1.017l0.032%2C5.648c0.016%2C3.052-0.488%2C4.212-2.551%2C4.212%20c-1.885%2C0-2.549-1.002-2.549-3.989V6.425c0-1.501%2C0.003-2.969%2C0.032-4.425h1.04V1.016H2.984V2h1.022%20c0.042%2C1.477%2C0.044%2C2.964%2C0.044%2C4.425v1.811c0%2C3.432%2C1.354%2C4.783%2C4.021%2C4.783c2.604%2C0%2C3.895-1.494%2C3.912-5.069L12.015%2C2h1.038%20V1.016z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="strike" aria-label="취소선">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M8.729%2C7.118c2.568%2C1.01%2C3.521%2C2.052%2C3.521%2C3.82c0%2C2.172-1.82%2C4.006-4.632%2C4.006%20c-1.438%2C0-2.846-0.439-3.766-0.992l0.105-2.93H4.91l0.591%2C2.39c0.606%2C0.305%2C1.162%2C0.422%2C1.96%2C0.422%20c1.805%2C0%2C2.969-0.927%2C2.969-2.392c0-1.176-0.644-1.783-2.291-2.406l-0.746-0.32C5.327%2C7.875%2C4.062%2C6.797%2C4.062%2C4.929%20c0-2.188%2C1.856-3.879%2C4.354-3.879c1.301%2C0%2C2.326%2C0.371%2C3.191%2C0.977l-0.104%2C2.966h-0.971L9.941%2C2.604%20c-0.45-0.236-0.901-0.32-1.457-0.32c-1.545%2C0-2.62%2C0.726-2.62%2C2.124c0%2C1.179%2C0.747%2C1.852%2C2.083%2C2.374L8.729%2C7.118z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%220.004%22%20y%3D%228.031%22%20width%3D%2215.992%22%20height%3D%220.946%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-color-button se-clickable"
													name="fontColor" aria-label="글자색">
													<div class="se-color-button-wrapper">
														<div class="se-icon"
															style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2012%22%3E%3Cg%3E%3Cpath%20d%3D%22M8.985%2C0.991C8.956%2C2.359%2C8.956%2C3.443%2C8.956%2C4.838v0.77c0%2C1.368%2C0%2C3.061%2C0.029%2C4.43l2.004%2C0.17v0.785%20H5.043v-0.785l1.983-0.17c0.029-1.354%2C0.029-3.033%2C0.029-4.43v-0.77c0-1.396%2C0-2.479-0.029-3.847H4.713L4.271%2C2.979H3.463%20l0.134-2.984h8.836l0.104%2C2.983h-0.779l-0.455-1.987H8.985z%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
														<div class="se-color-view">
															<svg xmlns="http://www.w3.org/2000/svg" version="1.1"
																viewBox="0 0 12 3" focusable="false">
                        <g>
                            <rect x="0" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="2" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="4" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="6" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="8" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="10" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="0" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="2" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="4" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="6" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="8" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="10" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="1" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="3" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="5" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="7" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="9" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="11" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                        </g>
                    </svg>
															<div class="se-current-color"></div>
														</div>
													</div>
												</button>
												<button type="button" class="se-color-button se-clickable"
													name="fontBackgroundColor" aria-label="글자배경색">
													<div class="se-color-button-wrapper">
														<div class="se-icon"
															style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2012%22%3E%3Cg%3E%3Cpath%20d%3D%22M2%2C0.031v11.032h11.969V0.031H2z%20M10.496%2C4.048l-0.381-1.073H8.981c-0.02%2C0.929-0.02%2C1.453-0.02%2C2.408%20v0.455c0%2C0.927%2C0%2C1.617%2C0.02%2C2.55l1.099%2C0.083v0.566H5.943V8.471l1.096-0.083c0.01-0.917%2C0.01-1.604%2C0.01-2.55V5.383%20c0-0.938%2C0-1.47-0.01-2.408H5.915L5.524%2C4.048h-0.52l0.065-1.885h5.892l0.057%2C1.885H10.496z%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
														<div class="se-color-view">
															<svg xmlns="http://www.w3.org/2000/svg" version="1.1"
																viewBox="0 0 12 3" focusable="false">
                        <g>
                            <rect x="0" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="2" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="4" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="6" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="8" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="10" y="0" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="0" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="2" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="4" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="6" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="8" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="10" y="2" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="1" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="3" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="5" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="7" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="9" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                            <rect x="11" y="1" fill="#C9C9C9" width="1"
																	height="1"></rect>
                        </g>
                    </svg>
															<div class="se-current-color"></div>
														</div>
													</div>
												</button>
												<div class="se-separator-vert"></div>
												<div class="se-dropdown" tabindex="-1" name="bulletList">
													<div class="se-dropdown-btn-wrapper se-dual-btn"
														value="icon">
														<button type="button" class="se-dropdown-btn se-clickable"
															value="main" aria-label="글머리 기호">
															<div class="se-icon"
																style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%222.035%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%228.021%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%2214.03%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%222.521%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%228.501%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%2214.511%22%20r%3D%221.49%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
														</button>
														<button type="button" class="se-dropdown-btn se-clickable"
															value="sub" aria-label="글머리 기호" aria-haspopup="true">
															<span class="se-arrow se-rotate-180"></span>
														</button>
													</div>
													<div class="se-dropdown-menu-wrapper">
														<ul class="se-dropdown-menu" role="menu">
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="검은색 원">
																	<span class="se-label">●</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="흰색 원">
																	<span class="se-label">○</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="검은색 네모">
																	<span class="se-label">■</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="검은색 마름모">
																	<span class="se-label">◆</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="더보기">
																	<span class="se-label">더보기</span>
																</button></li>
														</ul>
													</div>
												</div>
												<div class="se-dropdown" tabindex="-1" name="numberedList">
													<div class="se-dropdown-btn-wrapper se-dual-btn"
														value="icon">
														<button type="button" class="se-dropdown-btn se-clickable"
															value="main" aria-label="글머리 번호">
															<div class="se-icon"
																style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%222.016%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%228.001%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%2214.011%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Crect%20width%3D%222.021%22%20height%3D%221.002%22%2F%3E%3Crect%20x%3D%221.042%22%20width%3D%220.979%22%20height%3D%224.002%22%2F%3E%3Crect%20y%3D%223.002%22%20width%3D%223.021%22%20height%3D%221%22%2F%3E%3Cpolygon%20points%3D%220%2C5.003%200%2C6.023%202.021%2C6.023%202.021%2C6.982%200%2C6.982%200%2C7.731%200%2C8.001%200%2C9.045%200%2C9.314%200%2C10.064%203.021%2C10.064%203.021%2C9.045%201%2C9.045%201%2C8.001%203.021%2C8.001%203.021%2C7.419%203.021%2C6.982%203.021%2C6.023%203.021%2C5.835%203.021%2C5.003%20%22%2F%3E%3Cpolygon%20points%3D%220%2C11.043%200%2C12.002%202.063%2C12.002%202.063%2C13.021%200%2C13.021%200%2C13.98%202.063%2C13.98%202.063%2C15.041%200%2C15.041%200%2C16%202.063%2C16%203.021%2C16%203.021%2C15.041%203.021%2C13.98%203.021%2C13.021%203.021%2C12.002%203.021%2C11.314%203.021%2C11.043%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
														</button>
														<button type="button" class="se-dropdown-btn se-clickable"
															value="sub" aria-label="글머리 번호" aria-haspopup="true">
															<span class="se-arrow se-rotate-180"></span>
														</button>
													</div>
													<div class="se-dropdown-menu-wrapper">
														<ul class="se-dropdown-menu" role="menu">
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="1.">
																	<span class="se-label">1.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="①">
																	<span class="se-label">①</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="(1)">
																	<span class="se-label">(1)</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="A.">
																	<span class="se-label">A.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="a.">
																	<span class="se-label">a.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="I.">
																	<span class="se-label">I.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="i.">
																	<span class="se-label">i.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="가.">
																	<span class="se-label">가.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="ㄱ.">
																	<span class="se-label">ㄱ.</span>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="시작번호 지정">
																	<span class="se-label">시작번호 지정</span>
																</button></li>
														</ul>
													</div>
												</div>
												<button type="button"
													class="se-button se-clickable se-disable"
													name="decreaseIndent" aria-label="내어쓰기">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%220.041%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%223.093%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%227.099%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%2211.113%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20y%3D%2215.035%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%223.91%2C11.934%20-0.001%2C8.061%203.91%2C4.184%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="increaseIndent" aria-label="들여쓰기">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%220.041%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%223.093%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%227.099%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%2211.113%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20y%3D%2215.035%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%220%2C4.184%203.911%2C8.057%200%2C11.934%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<div class="se-separator-vert"></div>
												<div class="se-dropdown" tabindex="-1" name="align">
													<button type="button"
														class="se-dropdown-btn-wrapper se-single-btn se-clickable"
														value="icon" aria-label="정렬" aria-haspopup="true">
														<div class="se-dropdown-btn" value="main">
															<div class="se-icon"
																style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
														</div>
														<div class="se-dropdown-btn" value="sub">
															<span class="se-arrow se-rotate-180"></span>
														</div>
													</button>
													<div class="se-dropdown-menu-wrapper">
														<ul class="se-dropdown-menu" role="menu" value="icon">
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="왼쪽 정렬">
																	<div class="se-icon"
																		style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="가운데 정렬">
																	<div class="se-icon"
																		style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%223%22%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%223%22%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem"
																	aria-label="오른쪽 정렬">
																	<div class="se-icon"
																		style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%226%22%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%226%22%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
																</button></li>
															<li role="none"><button type="button"
																	class="se-clickable" role="menuitem" aria-label="양쪽 정렬">
																	<div class="se-icon"
																		style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.03%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.006%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
																</button></li>
														</ul>
													</div>
												</div>
												<div class="se-separator-vert"></div>
												<button type="button" class="se-button se-clickable"
													name="image" aria-label="이미지">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpath%20d%3D%22M0.021%2C1.001v13.968h16V1.001H0.021z%20M15.064%2C2.055v7.968l-1.959-2.034L10%2C10.252L6.02%2C5.015L1.078%2C9%20V2.055H15.064z%20M1.078%2C14.043v-3.916l4.806-3.894l4.002%2C5.261l3.135-2.285l2.043%2C2.115v2.719H1.078z%22%2F%3E%3Cpath%20d%3D%22M10.982%2C7.017c1.098%2C0%2C1.988-0.892%2C1.988-1.987c0-1.095-0.891-1.987-1.988-1.987%20c-1.094%2C0-1.987%2C0.892-1.987%2C1.987C8.996%2C6.125%2C9.889%2C7.017%2C10.982%2C7.017z%20M10.982%2C3.949c0.598%2C0%2C1.082%2C0.485%2C1.082%2C1.081%20c0%2C0.596-0.484%2C1.08-1.082%2C1.08c-0.596%2C0-1.078-0.484-1.078-1.08C9.904%2C4.434%2C10.387%2C3.949%2C10.982%2C3.949z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="specialCharacter" aria-label="특수문자">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M14.711%2C8.949c-0.248%2C0.689-0.578%2C1.309-0.992%2C1.857c-0.428%2C0.549-0.916%2C1.02-1.465%2C1.416%20c-0.549%2C0.391-1.133%2C0.688-1.75%2C0.885v0.887h3.604v1.982H9.809c-0.359%2C0-0.574-0.106-0.643-0.317%20c-0.07-0.211-0.105-0.442-0.105-0.694v-1.898c0-0.185%2C0.021-0.344%2C0.064-0.476c0.041-0.135%2C0.1-0.243%2C0.166-0.327%20c0.055-0.1%2C0.104-0.168%2C0.156-0.213c0.051-0.039%2C0.086-0.068%2C0.104-0.083c1.252-0.239%2C2.207-0.809%2C2.867-1.71%20c0.66-0.9%2C0.992-2.089%2C0.992-3.566c0-1.617-0.494-2.911-1.479-3.882c-0.988-0.97-2.287-1.457-3.899-1.457%20c-0.789%2C0-1.51%2C0.134-2.162%2C0.4C5.22%2C2.022%2C4.655%2C2.388%2C4.174%2C2.852C3.711%2C3.329%2C3.351%2C3.9%2C3.094%2C4.561%20C2.835%2C5.223%2C2.707%2C5.953%2C2.707%2C6.756c0%2C1.378%2C0.279%2C2.471%2C0.837%2C3.282c0.558%2C0.81%2C1.403%2C1.422%2C2.534%2C1.844%20c0.311%2C0.03%2C0.536%2C0.132%2C0.684%2C0.308c0.146%2C0.179%2C0.242%2C0.361%2C0.295%2C0.563c0.053%2C0.209%2C0.078%2C0.402%2C0.078%2C0.579%20c0%2C0.176%2C0%2C0.271%2C0%2C0.285c0%2C0.026%2C0%2C0.137%2C0%2C0.325c0%2C0.189-0.01%2C0.397-0.025%2C0.621c0%2C0.24-0.01%2C0.459-0.025%2C0.654%20c-0.019%2C0.197-0.035%2C0.311-0.051%2C0.338c-0.053%2C0.129-0.121%2C0.229-0.207%2C0.307c-0.084%2C0.078-0.205%2C0.115-0.361%2C0.115h-4.47%20v-1.98h3.623v-0.822c-1.358-0.406-2.472-1.152-3.348-2.236c-0.873-1.084-1.31-2.462-1.31-4.139%20c0-0.915%2C0.171-1.779%2C0.514-2.594C1.815%2C3.386%2C2.304%2C2.668%2C2.939%2C2.05C3.573%2C1.432%2C4.324%2C0.939%2C5.19%2C0.572%20c0.866-0.364%2C1.813-0.549%2C2.845-0.549c1.028%2C0%2C1.975%2C0.174%2C2.842%2C0.519c0.865%2C0.345%2C1.607%2C0.82%2C2.227%2C1.424%20s1.102%2C1.311%2C1.453%2C2.119c0.354%2C0.811%2C0.527%2C1.686%2C0.527%2C2.628C15.084%2C7.516%2C14.959%2C8.262%2C14.711%2C8.949z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="link" aria-label="링크">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M10.76%2C9.406L6.615%2C5.262l5.256-5.255l4.145%2C4.143L10.76%2C9.406z%20M8.455%2C5.262l2.305%2C2.306l3.418-3.418%20l-2.307-2.305L8.455%2C5.262z%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpath%20d%3D%22M4.171%2C15.993L0.027%2C11.85l5.24-5.24l4.145%2C4.145L4.171%2C15.993z%20M1.866%2C11.85l2.305%2C2.308l3.403-3.4%20L5.267%2C8.449L1.866%2C11.85z%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%227.485%22%20y%3D%224.296%22%20transform%3D%22matrix(0.7007%200.7135%20-0.7135%200.7007%208.1429%20-3.4098)%22%20width%3D%221.3%22%20height%3D%227.409%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button"
													class="se-button se-clickable se-disable" name="unlink"
													aria-label="링크 해제">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpolygon%20points%3D%2210.982%2C9.141%2010.063%2C8.22%2014.084%2C4.201%2011.818%2C1.938%207.8%2C5.958%206.88%2C5.039%2011.818%2C0.101%2015.92%2C4.201%20%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%224.221%2C15.898%200.121%2C11.798%205.06%2C6.859%205.979%2C7.778%201.959%2C11.798%204.221%2C14.063%208.242%2C10.041%209.162%2C10.961%20%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.992%22%20y%3D%221.923%22%20width%3D%221%22%20height%3D%222.151%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%222.799%22%20y%3D%223.336%22%20transform%3D%22matrix(0.7071%200.7071%20-0.7071%200.7071%203.8472%20-1.6152)%22%20width%3D%222.149%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%221.868%22%20y%3D%226.039%22%20width%3D%222.151%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%229.068%22%20y%3D%2211.998%22%20width%3D%221%22%20height%3D%222.15%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%2211.107%22%20y%3D%2211.535%22%20transform%3D%22matrix(0.7071%200.7071%20-0.7071%200.7071%2012.0781%20-5.0887)%22%20width%3D%222.149%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%2212.039%22%20y%3D%228.989%22%20width%3D%222.15%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="horizontalLine" aria-label="가로줄">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%220.021%22%20y%3D%226.044%22%20width%3D%2216%22%20height%3D%224.013%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button" class="se-button se-clickable"
													name="table" aria-label="표">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cpath%20d%3D%22M10.973%2C0.029h-0.855H5.925H5.069H0.021v5.03v0.856v4.17v0.856v5.029h5.048h0.856h4.192h0.855h5.049%20v-5.029v-0.856v-4.17V5.059v-5.03H10.973z%20M6.026%2C0.985h4.091v3.974H6.026V0.985z%20M10.117%2C9.984H6.026V5.915h4.091V9.984z%20M0.978%2C0.985h4.091v3.974H0.978V0.985z%20M0.978%2C5.915h4.091v4.069H0.978V5.915z%20M5.069%2C15.016H0.978v-4.072h4.091V15.016z%20M10.117%2C15.016H6.026v-4.072h4.091V15.016z%20M15.064%2C15.016h-3.99v-4.072h3.99V15.016z%20M15.064%2C9.984h-3.99V5.915h3.99V9.984z%20M11.074%2C4.959V0.985h3.99v3.974H11.074z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<div class="se-separator-vert"></div>
												<button type="button"
													class="se-button se-clickable se-disable" name="undo"
													aria-label="실행취소">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M9.903%2C4.253C9.268%2C4.107%2C8.488%2C4.062%2C8.084%2C4.086V1.832L3.063%2C5.368l5.022%2C3.539V6.417%20c2.462%2C0.298%2C2.889%2C2.689%2C1.54%2C5.195c-0.563%2C1.048-1.434%2C1.924-2.441%2C2.556c1.707-0.53%2C4.448-1.602%2C5.315-3.213%20C13.904%2C8.348%2C12.561%2C4.867%2C9.903%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<button type="button"
													class="se-button se-clickable se-disable" name="redo"
													aria-label="다시 실행">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M6.224%2C4.253c0.636-0.146%2C1.415-0.191%2C1.819-0.167V1.832l5.022%2C3.536L8.042%2C8.906V6.417%20c-2.462%2C0.298-2.889%2C2.689-1.54%2C5.195c0.564%2C1.048%2C1.434%2C1.924%2C2.441%2C2.556c-1.707-0.53-4.447-1.602-5.315-3.213%20C2.223%2C8.348%2C3.566%2C4.867%2C6.224%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
												<div class="se-separator-vert"></div>
												<button type="button"
													class="se-button se-clickable se-hidden" name="source"
													aria-label="소스 보기">
													<div class="se-icon"
														style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M-0.093%2C8.561v-0.98l5.095-3.459V5.41L1.434%2C8.065l3.568%2C2.667v1.287L-0.093%2C8.561z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M9.51%2C2.037L6.885%2C14.178H5.973L8.588%2C2.037H9.51z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M16%2C8.561l-4.994%2C3.458v-1.285l3.566-2.668L11.006%2C5.41V4.122L16%2C7.581V8.561z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
												</button>
											</div>
											<div class="se-next se-clickable">
												<div class="se-navi-icon"
													style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div>
											</div>
										</div>
									</div>
									<div class="se-ruler se-hide">
										<div class="se-ruler-container">
											<div class="se-ruler-background"
												style="left: 23px; right: 23px; width: calc(100% - 46px);"></div>
											<div class="se-ruler-division-container"></div>
											<div class="se-handler-container">
												<div class="se-handler se-margin-left"
													style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC&quot;); left: 19.5px;">
													<div class="se-handler se-both"
														style="background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAFCAIAAAAYMVE8AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjYxNjE3NzVDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjYxNjE3NzZDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCNjE2MTc3M0M4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCNjE2MTc3NEM4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsXs/bMAAAAnSURBVHjaYpk2bRoDDsACxHFxcZgSixYtYmLADfDJsUC0Y5UDCDAAPYIGueXq3bYAAAAASUVORK5CYII=);"></div>
												</div>
												<div class="se-handler se-margin-right"
													style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC&quot;); left: 883.5px;"></div>
												<div class="se-handler se-text-indent"
													style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTA2NDlGQzlDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTA2NDlGQ0FDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5MDY0OUZDN0M4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5MDY0OUZDOEM4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhG6GaUAAACjSURBVHjahJAxDgIhEEWBeBSPoNehsuEKa62FvWzPXdySUJFQaU2yDbGwQZxv2ASSNVIw89+8EIBrrQv7szbYpJQ/BWMME2hKWT9s4ZBm7/2qVPkMae+ce6aUOgEZnNqdUErdc87DNE2dhAxO84eo7BpjvIUQvgEVGXy5EyP7TeVgrX3RkKEiV854+7JxHAfO+YnYkYRz90/NupCwRW3hR4ABAOmdWnwZN/JjAAAAAElFTkSuQmCC&quot;); left: 19.5px;"></div>
											</div>
										</div>
										<div class="se-ruler-guide se-hide"></div>
									</div>
									<div class="se-notification-wrapper"></div>
								</div>
								<div class="se-main se-horz-scroll"
									style="height: calc(100% - 39px);">
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

					<div class="js-approval-input hide" id="approvalDbContent"
						style="display: block;"></div>
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
										id="approvalAttachSize"><span id="attachAttachSum">0KB</span>
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

		<input type="hidden" name="approval_document_no" value="7586">
		<input type="hidden" name="approval_first_line"
			value="2812|2256|old,2819|2263|old"> <input type="hidden"
			name="approval_second_line" value=""> <input type="hidden"
			name="approval_third_line" value=""> <input type="hidden"
			name="approval_fourth_line" value="">
	</form>
	<script>
		ApprovalDocument._documentNo = '7586';
		ApprovalDocument._firstLine = '2812|2256|old,2819|2263|old';
		ApprovalDocument._secondLine = '';
		ApprovalDocument._thirdLine = '';
		ApprovalDocument._fourthLine = '';
		ApprovalDocument._approvalMethod = 'AFGHI';
		ApprovalDocument._enableDelete = 'Y';
		ApprovalDocument._formType = 'common';
		ApprovalDocument._registerNo = '2812';
		ApprovalDocument._formNo = '4599';

		Approval._documentMode = "MODIFY";
		ApprovalDocument._formTitle = '업무연락'.replace(/&#039;/g, "'").replace(
				/&quot;/g, '"').replace(/&lt;/g, '<').replace(/&gt;/g, '>')
				.replace(/&amp;/g, '&');
		Approval._writeType = 'modify';
		Approval._defaultFontFamily = '맑은 고딕';
		Approval._defaultFontSize = '16px';
		Approval._defaultLineHeight = '1.6';
		Approval._defaultEditor = 'synap';
		Approval._hrWork = '';

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

							$j('.js-approval-input').show();
							$j('.js-approval-input-guide').hide();

							ApprovalDocument._editFlag = 'Y';
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
		ApprovalDocument._universalSetting = 'N';

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

