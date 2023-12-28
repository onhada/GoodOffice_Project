<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contents">
	<div class="content_inbox approval-admin non-space">
		<div class="cont_box">
			<div class="content_title after">
				<span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.saveForm();">확인</a>
				</span>
			</div>

			<div class="allform-wrap">
				<form action="" onsubmit="return false;">
					<input type="hidden" name="approval_form_no" value="5527">
					<input type="hidden" name="approval_method" value="BCF"> <input
						type="hidden" name="form_type" value="db_form"> <input
						type="hidden" name="approval_first_line_type" value="A"> <input
						type="hidden" name="approval_first_line" value="3"> <input
						type="hidden" name="approval_second_line" value=""> <input
						type="hidden" name="approval_third_line" value=""> <input
						type="hidden" name="approval_fourth_line" value="">

					<fieldset>
						<div class="after">
							<h4 class="fl">양식 ID</h4>
							<span class="gt-mh-20"> N7 </span> <span class="gt-mh-20"
								id="form-use-setting-area" style="display: none;"> <input
								type="radio" id="useForm" name="form_use_flag" value="Y"
								checked="" onchange="ApprovalSetting.changeFormUseFlag(this);">
								<label for="useForm">사용</label> <input type="radio"
								id="unUseForm" name="form_use_flag" class="mgl_20" value="N"
								disabled=""> <label for="unUseForm">미사용</label>
							</span> <span class="form-use-setting-testmode-area hide"
								style="display: inline;">사용</span>
						</div>
					</fieldset>

					<div class="after">
						<h4 class="fl">기본 설정</h4>
					</div>

					<fieldset>
						<table class="tableType02 mgb_50">
							<caption>기본 설정 입력 양식</caption>
							<colgroup>
								<col style="width: 20%">
								<col style="width: 30%">
								<col style="width: 20%">
								<col style="width: 30%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">기안 위치</th>
									<td><span id="listing_flag_area"> <input
											type="checkbox" id="checkbox_listing_flag"
											name="approval_form_listing_flag"> 외부에서 기안 <a
											href="javascript:void(0)" class="icon question tipsIcon"
											style="float: none; position: relative; top: 3px;; margin-left: 3px"><span
												class="blind">세부 설명</span></a>
											<div class="tooltip hide" style="left: 50px; top: -13px;">
												<div class="tooltip-box color-set-6" style="width: 400px;">
													<p>이 박스를 체크하면 전자결재 내부에서 이 양식으로 기안할 수 없고 외부 솔루션에서 기안
														API를 통해서만 기안이 가능합니다.</p>
												</div>
											</div>
									</span> <span id="solution_text" class="hide">전자결재</span></td>
									<th scope="row">결재 분류</th>
									<td><label> <select name="form_category"
											style="width: 190px">
												<option value="685" category-type="normal">공통</option>
												<option value="686" selected="" category-type="testmode">시험
													사용</option>
										</select>
									</label></td>
								</tr>
								<tr>
									<th scope="row">양식명</th>
									<td><label><input type="text" class="txt-input"
											title="양식명" name="form_title" value="재직증명서" maxlength="20"></label>
									</td>
									<th scope="row">약칭 <a href="javascript:void(0)"
										class="icon question tipsIcon"
										style="float: none; position: relative; top: 3px;; margin-left: 10px"><span
											class="blind">세부 설명</span></a>
										<div class="tooltip hide" style="left: 50px; top: -13px;">
											<!-- <div class="icon tip_sq" style="left:85px"></div>
										 -->
											<div class="tooltip-box color-set-6" style="width: 400px;">
												<p>약칭은 문서 번호에 쓰이기 때문에 짧을 수록 보기에 좋습니다. 중복하여 사용할 수 있지만
													구분하는 것이 편리합니다.</p>
											</div>
										</div>
									</th>
									<td><label><input type="text" class="txt-input"
											title="약칭" name="form_acronym" value="재직" maxlength="10"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td><label><input type="text" class="txt-input"
											title="설명" name="form_comment" value="재직 증명서" maxlength="50"></label>
									</td>
									<th scope="row">양식 규정</th>
									<td><span id="rule_regist">미등록</span>
										<button type="button" class="weakblue"
											onclick="ApprovalSetting.formRule();" id="rule_regist_btn">등록</button>
									</td>
								</tr>
								<tr>
									<th scope="row">보존 연한 <a href="javascript:void(0)"
										class="icon question tipsIcon"
										style="float: none; position: relative; top: 3px;; margin-left: 10px"><span
											class="blind">세부 설명</span></a>
										<div class="tooltip hide" style="left: 50px; top: -13px;">
											<div class="tooltip-box color-set-6" style="width: 400px;">
												<p>문서 작성 페이지에서 노출할 보존 연한을 설정하고, 기안자와 결재자가 이를 변경하지 못하도록
													하려면 변경 금지를 선택합니다. 보존 연한이 만료되면 삭제 문서 목록으로 이동합니다.</p>
											</div>
										</div>
									</th>
									<td><label> <select title="보존 연한 선택"
											style="width: 190px" name="preserved_term">
												<option value="1">1년</option>
												<option value="3">3년</option>
												<option value="5" selected="">5년</option>
												<option value="10">10년</option>
												<option value="0">영구</option>
										</select>
									</label>
										<p class="mgt_10">
											<input type="checkbox" id="unset_preserved_term"
												name="set_preserved_term"> <label
												for="unset_preserved_term">변경 금지</label>
										</p></td>
									<th scope="row">보안 등급 <a href="javascript:void(0)"
										class="icon question tipsIcon"
										style="float: none; position: relative; top: 3px;; margin-left: 10px"><span
											class="blind">세부 설명</span></a>
										<div class="tooltip hide" style="left: 50px; top: -13px;">
											<!-- <div class="icon tip_sq" style="left:85px"></div>
										 -->
											<div class="tooltip-box color-set-6" style="width: 400px;">
												<p>문서 작성 페이지에서 노출할 보안 등급을 선택하고, 기안자와 결재자가 이를 변경하지 못하도록
													하려면 변경 금지를 선택합니다. 문서의 보안 등급에 따라 결재선 변경 및 열람 권한이 생깁니다.</p>
											</div>
										</div>
									</th>
									<td><label> <select title="보안 등급 선택"
											style="width: 190px" name="security_level">
												<option value="S">S등급</option>
												<option value="A" selected="">A등급</option>
												<option value="B">B등급</option>
												<option value="C">C등급</option>
										</select>
									</label>
										<p class="mgt_10">
											<input type="checkbox" id="unset_security_level"
												name="set_security_level"> <label
												for="unset_security_level">변경 금지</label>
										</p></td>

								</tr>
							</tbody>
						</table>
					</fieldset>

					<fieldset>
						<div class="after">
							<h4 class="fl">결재 양식</h4>
							<span class="detail_select">
								<button type="button" class="fl weakblue mgl_20"
									onclick="ApprovalSetting.formSetting('N');">설정</button> <a
								href="javascript:void(0)" class="icon question tipsIcon"
								style="position: relative; top: 0; margin-left: 10px"><span
									class="blind">세부 설명</span></a>
								<div class="tooltip hide" style="left: 50px; top: 0">
									<!-- <div class="icon tip_sq" style="left:85px"></div>
								 -->
									<div class="tooltip-box color-set-6" style="width: 400px;">
										<p>문서 종류에 맞는 결재 포맷을 선택하고, 결재자를 미리 지정해놓습니다.</p>
									</div>
								</div>
							</span>
						</div>
						<div id="textApprovalFormat">
							<ul style="list-style: square inside;">
								<li class="pdb_10" style="list-style: square inside;">결재
									포맷: 신청</li>
								<li class="pdb_10" style="list-style: square inside;">지정
									결재자 <label> <input type="checkbox" class="mgl_20"
										name="approval_enable_delete" value="Y"> 삭제 금지
								</label>
								</li>
								<li>
									<ul style="list-style: circle inside; padding-left: 30px;">
										<li class="pdb_10" style="list-style: circle inside;">
											신청: 자동 (레벨3)</li>
										<li class="pdb_10" style="list-style: circle inside;">
											처리: <span style="color: #acacac;">미지정</span>
										</li>
										<li class="pdb_10" style="list-style: circle inside;">
											참조: <span style="color: #acacac;">미지정</span>
										</li>
									</ul>
								</li>
							</ul>
						</div>

 
						<div class="write_input js-approval-input mgt_30">
							<h4>
								제목 <a href="javascript:void(0)"
									class="icon question tipsIcon gt-align-middle gt-float-none gt-margin-0"></a>
								<div class="tooltip hide">
									<div class="tooltip-box color-set-6 gt-font-normal"
										style="left: 50px; top: -40px">
										<p>문서 제목의 기본값을 설정하고 싶은 경우, 입력해주세요.</p>
									</div>
								</div>
							</h4>
							<div class="txt file" style="margin-right: 12px;">
								<div>
									<input type="text" name="form_document_title"
										id="form_document_title" value=""
										oninput="checkTitleLength(this)">
								</div>
							</div>
						</div>
						<div class="after mgt_30">
							<h4 class="fl">내용설정</h4>
						</div>
						<div class="after gt-mb-30 gt-ml-20">
							<h4>
								DB 유닛 <a href="javascript:void(0)"
									class="icon question tipsIcon gt-align-middle gt-float-none gt-margin-0"></a>
								<div class="tooltip hide">
									<div class="tooltip-box color-set-6 gt-font-normal"
										style="left: 0;">
										<p>DB 유닛 관리에서 만들어진 DB 유닛들을 결재 문서 내용으로 사용할 수 있습니다. DB 유닛 설정
											후에 한 번이라도 양식에서 사용하면, 해당 DB 유닛은 수정할 수 없습니다.</p>
									</div>
								</div>
							</h4>
							<ul style="list-style: square inside;" class=" gt-ml-20">
								<li class="pdb_10" style="list-style: square inside;"><input
									type="radio" id="useDbFormUnit" name="form_db_flag" value="Y"
									checked="" onchange="ApprovalSetting.changeUseDBForm(this);">
									<label for="useDbFormUnit">사용</label>
									<button type="button" class="weakblue mgl_20 vt "
										id="useDbFormUnitBtn"
										onclick="ApprovalSetting.showDBFormSelectLayer();">설정</button>
									<input type="radio" id="unUseDbFormUnit" name="form_db_flag"
									class="mgl_20" value="N"
									onchange="ApprovalSetting.changeUseDBForm(this);"> <label
									for="unUseDbFormUnit">미사용</label></li>
								<li class="pdb_10 hide"
									style="list-style: inside square; display: list-item;"
									id="selectedDBUnitName">사용 DB 유닛: 재직 증명</li>
							</ul>
						</div>
						<div id="dbUnitPrintModeSetting" class="after  gt-ml-20">
							<div>
								<h4 class="gt-d-inline-block gt-mr-35 gt-pb-25">
									<strong class="gt-d-align-middle gt-mr-5">결재 문서 보기</strong> <a
										href="javascript:void(0)"
										class="icon question tipsIcon gt-align-middle gt-float-none gt-margin-0"></a>
									<div class="tooltip hide">
										<div class="tooltip-box color-set-6 gt-font-normal"
											style="left: 0;">
											<p>DB 유닛의 입력 화면 또는 인쇄 서식 중에 결재 문서가 보이는 형태를 선택합니다. 인쇄 서식과
												동일하다면, 인쇄 서식을 양식에 맞게 편집해야 합니다.</p>
										</div>
									</div>
								</h4>
								<label class="gt-d-inline-block gt-mr-20"><input
									type="radio" id="dbFormViewMode1" name="dbFormViewMode"
									value="I" onclick="ApprovalSetting.changeDBFormViewMode('I');">
									입력 화면과 동일</label> <label class="gt-d-inline-block"><input
									type="radio" id="dbFormViewMode2" name="dbFormViewMode"
									value="P" onclick="ApprovalSetting.changeDBFormViewMode('P');">
									인쇄 서식과 동일</label>
							</div>

							<div class="approval-db-print-mode" style="display: none;">
								<h4 class="gt-d-inline-block gt-mr-35 gt-pb-25">
									<strong class="gt-d-align-middle gt-mr-5">인쇄 서식</strong> <a
										href="javascript:void(0)"
										class="icon question tipsIcon gt-align-middle gt-float-none gt-margin-0"></a>
									<div class="tooltip hide">
										<div class="tooltip-box color-set-6 gt-font-normal"
											style="left: 0;">
											<p>결재 문서가 보이는 형태와 다르게 인쇄 서식을 사용할지 여부를 선택합니다. 사용하면 양식에 맞는
												결과물로 출력할 수 있으며, 사용하지 않으면 입력 화면과 동일하게 인쇄합니다.</p>
										</div>
									</div>
								</h4>
								<label class="gt-d-inline-block gt-mr-20"><input
									type="radio" id="dbFormPrintUse" name="db_form_print_use"
									value="Y" onclick="ApprovalSetting.useDBUnitPrint('Y');">
									사용</label> <label class="gt-d-inline-block"><input type="radio"
									id="dbFormPrintUnuse" name="db_form_print_use" value="N"
									onclick="ApprovalSetting.useDBUnitPrint('N');"> 사용 안 함</label>
							</div>
						</div>
						<div id="db-form-print" class="after hide approval-unit gt-mb-30"
							style="display: block;">
							<h4>인쇄 서식 편집</h4>
							<div class="unit-box">
								<div id="db-form-print-components" class="unit-box-menu">
									<div class="menu-title">재직 증명</div>
									<div class="gt-p-10">
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm70vn96e2', '이름');">이름</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm7pko76zn', '소속');">소속</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm7pkowplp', '생년월일');">생년월일</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm7pkorbih', '입사일');">입사일</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm7pkpsr20', '주소');">주소</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm7ruune38', '제출처');">제출처</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jyqm7s52nazl', '용도');">용도</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('1367_jzxgpuw5qgjv', '발행일');">발행일</button>
									</div>
									<div class="menu-title">제공 출력 항목</div>
									<div class="gt-p-10">
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('hw_approval_org_user', '결재 정보(공공기관용)');">결재
											정보(공공기관용)</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('hw_approval_com_user', '결재 정보(사기업)');">결재
											정보(사기업)</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('hw_document_code', '문서 번호');">문서
											번호</button>
										<button class="menu-item--outline"
											onclick="ApprovalSetting.includeDBDataToPrintFormat('hw_document_title', '문서 제목');">문서
											제목</button>
									</div>
								</div>
								<textarea style="display: none" id="edit_print_compose">&lt;table align="center" style="border: 0px none rgb(0, 0, 0); width: 606px; height: 349px; font-size: 16px; word-break: break-all; border-collapse: separate;" border="1" cellspacing="0" cellpadding="0"&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 1092px; height: 20px;"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; line-height: 1.6; margin-top: 0px; margin-bottom: 0px; font-size: 16px;"&gt;&lt;span style="font-size: 20px;"&gt;&lt;b&gt;OO 주식회사&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;td rowspan="3" colspan="2" scope="" style="border: 0px none rgb(0, 0, 0); width: 10px; height: 37px; text-align: right; vertical-align: top;"&gt;&lt;p style="line-height: 1.2; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="font-size: 12px; font-family: &amp;quot;맑은 고딕&amp;quot;;"&gt;&amp;nbsp;&lt;/span&gt;&lt;span style="font-size: 24px;"&gt;&lt;b&gt;&amp;nbsp;&lt;img src="/static/images/approval/dbunit_logo.png" border="0" style="border: 0px solid rgb(0, 0, 0); width: 120px; height: 30px; margin: 0px;"&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style="line-height: 1.2; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 12px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 1092px; height: 10px;"&gt;&lt;p style="line-height: 1.2; font-family: &amp;quot;맑은 고딕&amp;quot;; margin-top: 0px; margin-bottom: 0px; font-size: 16px;"&gt;&lt;span style="font-size: 12px; font-family: &amp;quot;맑은 고딕&amp;quot;;"&gt;OO도 OO시 OO구 OO로 123 OO빌딩 1234호&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 1092px; height: 10px;"&gt;&lt;p style="line-height: 1.2; font-family: &amp;quot;맑은 고딕&amp;quot;; margin-top: 0px; margin-bottom: 0px; font-size: 16px;"&gt;&lt;span style="font-size: 12px; font-family: &amp;quot;맑은 고딕&amp;quot;;"&gt;Tel. 1234-5678&amp;nbsp; Fax. 1234-0987&amp;nbsp; www.abc.com&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 600px; height: 10px;"&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 600px; height: 10px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"&gt;&lt;p style="text-align: center; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="font-size: 28px;"&gt;&lt;b&gt;재 직 증 명 서&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"&gt;&lt;p style="text-align: justify; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;이&amp;nbsp; &amp;nbsp; &amp;nbsp;름&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"&gt;&lt;p style="text-align: center; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;:&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;" colspan="3"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jyqm70vn96e2" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#이름}}&lt;/span&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"&gt;&lt;p style="text-align: justify; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;생년월일&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"&gt;&lt;p style="text-align: center; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;:&lt;/p&gt;&lt;/td&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jyqm7pkowplp" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#생년월일}}&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"&gt;&lt;p style="text-align: justify; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;소&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 속&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"&gt;&lt;p style="text-align: center; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;:&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jyqm7pko76zn" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#소속}}&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"&gt;&lt;p style="text-align: justify; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;입 사 일&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"&gt;&lt;p style="text-align: center; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;:&lt;/p&gt;&lt;/td&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jyqm7pkorbih" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#입사일}}&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="4_jyi2cncddbr0" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;이 사람은&amp;nbsp;&lt;/span&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;상기 입사일 이후 현재까지 당사에 재직 중임을 확인합니다.&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.4; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;제 출 처&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&amp;nbsp;:&lt;/p&gt;&lt;/td&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jyqm7ruune38" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#제출처}}&lt;/span&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;용&amp;nbsp; &amp;nbsp; &amp;nbsp;도&lt;/p&gt;&lt;/td&gt;&lt;td scope="" style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"&gt;&lt;p style="line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&amp;nbsp;:&lt;/p&gt;&lt;/td&gt;&lt;td colspan="3" scope="" style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"&gt;&lt;p style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jyqm7s52nazl" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#용도}}&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 600px; height: 20px;"&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" id="1367_jzxgpuw5qgjv" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px;"&gt;{{#발행일}}&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="text-align: inherit; font-size: 14px;"&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style="text-align: center; line-height: 1.8; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span style="text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style="line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;span class="hw-editable-false" style="font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 14px;"&gt;&amp;nbsp;&lt;/span&gt;&lt;span style="font-size: 14px; text-align: inherit; font-family: &amp;quot;맑은 고딕&amp;quot;;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan="5" scope="" style="border: 0px none rgb(0, 0, 0); width: 866px; height: 70px; background-repeat: no-repeat;"&gt;&lt;p style="text-align: center; line-height: 1.6; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;"&gt;&lt;img src="/static/images/approval/dbunit_sign_for_com.png" border="0" style="border: 0px solid rgb(0, 0, 0); width: 531px; height: 70px; margin: 0px;"&gt;&lt;br&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style="margin: 0cm 0cm 8pt; text-align: justify; line-height: 14.26px; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 10pt;"&gt;&lt;span style="line-height: 15.69px; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 11pt;"&gt;&amp;nbsp; &amp;nbsp; &lt;/span&gt;&lt;span style="text-align: center; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 12pt;"&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;</textarea>
								<div id="new_edit_print_compose"
									class="se se-edit-mode se-classic-editor se-blur"
									style="width: 100%; height: 500px;">
									<div class="se-container">
										<div class="se-dim-layer" style="height: 500px;">
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
																		class="se-clickable" role="menuitem"
																		aria-label="맑은 고딕">
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
																		class="se-clickable" role="menuitem"
																		aria-label="Arial">
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
																		<span class="se-label"
																			style="font-family: Sans-Serif;">Sans-Serif</span>
																	</button></li>
																<li role="none"><button type="button"
																		class="se-clickable" role="menuitem"
																		aria-label="Serif">
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
																<span class="se-label">16px</span>
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
																		class="se-clickable se-active" role="menuitem"
																		aria-label="16px">
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
															<button type="button"
																class="se-dropdown-btn se-clickable" value="main"
																aria-label="글머리 기호">
																<div class="se-icon"
																	style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%222.035%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%228.021%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%2214.03%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%222.521%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%228.501%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%2214.511%22%20r%3D%221.49%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
															</button>
															<button type="button"
																class="se-dropdown-btn se-clickable" value="sub"
																aria-label="글머리 기호" aria-haspopup="true">
																<span class="se-arrow se-rotate-180"></span>
															</button>
														</div>
														<div class="se-dropdown-menu-wrapper">
															<ul class="se-dropdown-menu" role="menu">
																<li role="none"><button type="button"
																		class="se-clickable" role="menuitem"
																		aria-label="검은색 원">
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
															<button type="button"
																class="se-dropdown-btn se-clickable" value="main"
																aria-label="글머리 번호">
																<div class="se-icon"
																	style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%222.016%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%228.001%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%2214.011%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Crect%20width%3D%222.021%22%20height%3D%221.002%22%2F%3E%3Crect%20x%3D%221.042%22%20width%3D%220.979%22%20height%3D%224.002%22%2F%3E%3Crect%20y%3D%223.002%22%20width%3D%223.021%22%20height%3D%221%22%2F%3E%3Cpolygon%20points%3D%220%2C5.003%200%2C6.023%202.021%2C6.023%202.021%2C6.982%200%2C6.982%200%2C7.731%200%2C8.001%200%2C9.045%200%2C9.314%200%2C10.064%203.021%2C10.064%203.021%2C9.045%201%2C9.045%201%2C8.001%203.021%2C8.001%203.021%2C7.419%203.021%2C6.982%203.021%2C6.023%203.021%2C5.835%203.021%2C5.003%20%22%2F%3E%3Cpolygon%20points%3D%220%2C11.043%200%2C12.002%202.063%2C12.002%202.063%2C13.021%200%2C13.021%200%2C13.98%202.063%2C13.98%202.063%2C15.041%200%2C15.041%200%2C16%202.063%2C16%203.021%2C16%203.021%2C15.041%203.021%2C13.98%203.021%2C13.021%203.021%2C12.002%203.021%2C11.314%203.021%2C11.043%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
															</button>
															<button type="button"
																class="se-dropdown-btn se-clickable" value="sub"
																aria-label="글머리 번호" aria-haspopup="true">
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
																		class="se-clickable" role="menuitem"
																		aria-label="왼쪽 정렬">
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
																		class="se-clickable" role="menuitem"
																		aria-label="양쪽 정렬">
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
													<button type="button"
														class="se-button se-clickable se-hidden" name="table"
														aria-label="표">
														<div class="se-icon"
															style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cpath%20d%3D%22M10.973%2C0.029h-0.855H5.925H5.069H0.021v5.03v0.856v4.17v0.856v5.029h5.048h0.856h4.192h0.855h5.049%20v-5.029v-0.856v-4.17V5.059v-5.03H10.973z%20M6.026%2C0.985h4.091v3.974H6.026V0.985z%20M10.117%2C9.984H6.026V5.915h4.091V9.984z%20M0.978%2C0.985h4.091v3.974H0.978V0.985z%20M0.978%2C5.915h4.091v4.069H0.978V5.915z%20M5.069%2C15.016H0.978v-4.072h4.091V15.016z%20M10.117%2C15.016H6.026v-4.072h4.091V15.016z%20M15.064%2C15.016h-3.99v-4.072h3.99V15.016z%20M15.064%2C9.984h-3.99V5.915h3.99V9.984z%20M11.074%2C4.959V0.985h3.99v3.974H11.074z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
													</button>
													<div class="se-separator-vert se-hidden"></div>
													<button type="button"
														class="se-button se-clickable se-hidden se-disable"
														name="undo" aria-label="실행취소">
														<div class="se-icon"
															style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M9.903%2C4.253C9.268%2C4.107%2C8.488%2C4.062%2C8.084%2C4.086V1.832L3.063%2C5.368l5.022%2C3.539V6.417%20c2.462%2C0.298%2C2.889%2C2.689%2C1.54%2C5.195c-0.563%2C1.048-1.434%2C1.924-2.441%2C2.556c1.707-0.53%2C4.448-1.602%2C5.315-3.213%20C13.904%2C8.348%2C12.561%2C4.867%2C9.903%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
													</button>
													<button type="button"
														class="se-button se-clickable se-hidden se-disable"
														name="redo" aria-label="다시 실행">
														<div class="se-icon"
															style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M6.224%2C4.253c0.636-0.146%2C1.415-0.191%2C1.819-0.167V1.832l5.022%2C3.536L8.042%2C8.906V6.417%20c-2.462%2C0.298-2.889%2C2.689-1.54%2C5.195c0.564%2C1.048%2C1.434%2C1.924%2C2.441%2C2.556c-1.707-0.53-4.447-1.602-5.315-3.213%20C2.223%2C8.348%2C3.566%2C4.867%2C6.224%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
													</button>
													<div class="se-separator-vert se-hidden"></div>
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
														style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC&quot;); left: 90.5px;">
														<div class="se-handler se-both"
															style="background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAFCAIAAAAYMVE8AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjYxNjE3NzVDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjYxNjE3NzZDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCNjE2MTc3M0M4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCNjE2MTc3NEM4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsXs/bMAAAAnSURBVHjaYpk2bRoDDsACxHFxcZgSixYtYmLADfDJsUC0Y5UDCDAAPYIGueXq3bYAAAAASUVORK5CYII=);"></div>
													</div>
													<div class="se-handler se-margin-right"
														style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC&quot;); left: 696.5px;"></div>
													<div class="se-handler se-text-indent"
														style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTA2NDlGQzlDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTA2NDlGQ0FDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5MDY0OUZDN0M4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5MDY0OUZDOEM4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhG6GaUAAACjSURBVHjahJAxDgIhEEWBeBSPoNehsuEKa62FvWzPXdySUJFQaU2yDbGwQZxv2ASSNVIw89+8EIBrrQv7szbYpJQ/BWMME2hKWT9s4ZBm7/2qVPkMae+ce6aUOgEZnNqdUErdc87DNE2dhAxO84eo7BpjvIUQvgEVGXy5EyP7TeVgrX3RkKEiV854+7JxHAfO+YnYkYRz90/NupCwRW3hR4ABAOmdWnwZN/JjAAAAAElFTkSuQmCC&quot;); left: 90.5px;"></div>
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

						<div class="after js-module-setting js-module-setting hide"
							style="display: flex; align-items: center">
							<h4 style="padding-bottom: 0">모듈 사용</h4>
							<a href="javascript:void(0)" class="icon question tipsIcon"
								style="position: relative; top: 0; margin-left: 10px"><span
								class="blind">세부 설명</span></a>
							<div class="tooltip hide" style="left: 50px; top: 0">
								<div class="tooltip-box color-set-6"
									style="width: 700px; line-height: 1.5; word-break: keep-all">
									<p>전자결재 양식에서 사용할 수 있는 각종 모듈을 제공합니다.</p>
									<p>- 휴가 신청: 한 번에 여러 사용자의 휴가를 신청할 수 있으며, 인사 솔루션에 반영됩니다.</p>
									<p>- 근무 체크: 한 번에 여러 사용자의 근무체크를 신청할 수 있으며, 인사 근무체크 기능과 동일하게
										근무현황에 결재 완료된 근무체크 내용이 표시됩니다. 근무상태 체크와 출퇴근체크를 동시에 할 수 있습니다.
										(출장, 교육 신청 등에 활용)</p>
									<p>- 추가 근무: 한 번에 여러 사용자의 추가근무를 신청할 수 있습니다. 인사 연장근무신청과 달리,
										출근~퇴근 체크 범위 내에 있지 않아도 근무 시간으로 인정됩니다. (긴급근무 신청 등에 활용 )</p>
								</div>
							</div>
							<div class="after js-module-setting hide" style="display: block;">
								<select name="workModule" id="workModule"
									style="width: 200px; margin-left: 10px">
									<option value="none">사용 안 함</option>
									<option value="vacation">휴가 신청</option>
									<option value="workcheck">근무체크</option>
									<option value="overwork">추가 근무</option>
								</select>
								<button id="moduleSetting" type="button"
									class="weakblue mgl_20 gt-mb-2" style="display: none;"
									onclick="setModuleConfigs()">설정</button>
							</div>
						</div>
 

						<div class="after mgt_30 hide" id="remittance_setting_area">
							<h4>송금 요청</h4>
							<li class="pdb_10" style="list-style: square inside;"><label><input
									type="radio" name="use_remittance" value="Y"
									onchange="ApprovalSetting.changeListingFlagVisibility();">
									사용</label> <label class="mgl_20"><input type="radio"
									name="use_remittance" value="N"
									onchange="ApprovalSetting.changeListingFlagVisibility();"
									checked=""> 미사용</label></li>
						</div>

						<div class="edit-wrap" style="display: none;">
							<!-- Edit Wrap -->
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
							<ul class="font12 pdb_30 line24 gt-mt-10">
								<li>MS OFFICE나 한글 파일을 복사하여 에디터에 붙여 넣기를 하면 원본 파일 서식과 100%
									일치하지 않을 수 있습니다.<br>그럴 때는 사용자가 에디터의 소스 보기를 통해 수정을 해주시거나
									에디터에서 직접 작성해 주셔야 합니다.
								</li>
							</ul>
						</div>
						<!-- // DB 유닛 -->
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<div class="layer_box docu-view db large hide"
		id="approval_setting_view">
		<div class="title_layer text_variables">DB 항목 설정</div>
		<div class="after">
			<div class="docu-case-list db-docu">
				<dl>
					<dd class="on">
						<a href="javascript:void(0);">송금요청</a>
					</dd>
				</dl>
			</div>
			<div class="docu-detail db-docu">
				<div class="vertical">
					<div class="after">
						<h4 class="fl">송금요청</h4>
					</div>
					<table class="tableType01 account mgb_20">
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
								<th scope="col">거래처</th>
								<th scope="col">은행명</th>
								<th scope="col">계좌번호</th>
								<th scope="col">예금주</th>
								<th scope="col">송금액</th>
								<th scope="col">송금 요청일</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>

			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="$j('#approval_setting_view').hidePopup(false);">선택</button>
			<button type="button"
				onclick="$j('#approval_setting_view').hidePopup(false);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="$j('#approval_setting_view').hidePopup(false);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>

	 
	<div class="layer_box app-dialog middle hide" id="layerVacationModule"
		style="width: 408px;">
		<div class="title_layer text_variables">휴가신청 모듈 설정</div>
		<div class="dialog-approval-add">
			<div class="to-add" id="vacationList">
				<div>
					<p class="">양식에서 사용할 휴가 종류를 선택하세요 (1개 이상)</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1262"> 연차</label>
					</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1263"> 포상</label>
					</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1264"> 월차</label>
					</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1265"> 경조사</label>
					</p>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="FormModule.setHrWorkModule('vacation');">저장</button>
			<button type="button"
				onclick="$j('#layerVacationModule').hidePopup(false);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="$j('#layerVacationModule').hidePopup(false);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<div class="layer_box app-dialog middle hide" id="layerWorkCheckModule"
		style="width: 408px;">
		<div class="title_layer text_variables">근무체크 모듈 설정</div>
		<div class="dialog-approval-add">
			<div class="to-add" id="workCheckList">
				<div>
					<p class="">양식에서 사용할 근무 상태를 선택하세요 (1개 이상)</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1507"> 업무</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1508"> 외출</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1509"> 회의</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1510"> 외근</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1511"> 휴식</label>
					</p>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="FormModule.setHrWorkModule('workcheck');">저장</button>
			<button type="button"
				onclick="$j('#layerWorkCheckModule').hidePopup(false);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="$j('#layerWorkCheckModule').hidePopup(false);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
	<div class="layer_box app-dialog middle hide" id="layerOverWorkModule"
		style="width: 408px;">
		<div class="title_layer text_variables">추가근무 모듈 설정</div>
		<div class="dialog-approval-add">
			<div class="to-add" id="overWorkList">
				<div>
					<p class="">양식에서 사용할 근무 상태를 선택하세요 (1개 이상)</p>
				</div>
				<div class="js-overwork-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="overwork_module" value="1507"> 업무</label>
					</p>
				</div>
				<div class="js-overwork-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="overwork_module" value="1509"> 회의</label>
					</p>
				</div>
				<div class="js-overwork-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="overwork_module" value="1510"> 외근</label>
					</p>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="FormModule.setHrWorkModule('overwork');">저장</button>
			<button type="button"
				onclick="$j('#layerOverWorkModule').hidePopup(false);">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="$j('#layerOverWorkModule').hidePopup(false);" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
</div>