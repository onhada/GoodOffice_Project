<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contents">
	<div class="content_inbox approval-admin non-space">
		<div class="cont_box">
			<div class="content_title after">
				<span class="detail_select"> <!-- <a href="/tempfinal.onhiworks.com/approval/settings/write_form/5527/M">양식 수정</a> -->
					<a href="javascript:ApprovalSetting.getFormInfo('5527', 'M');">양식
						수정</a>
				</span> <span class="detail_select"> <a
					href="/tempfinal.onhiworks.com/approval/settings/write_form/5527/C">양식
						복사</a>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.checkDeleteForm();">삭제</a>
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
							<span class="gt-mh-20">N7</span> <span class="gt-mh-20">사용</span>
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
									<td>전자결재</td>
									<th scope="row">결재 분류</th>
									<td><label> 시험 사용 </label></td>
								</tr>
								<tr>
									<th scope="row">양식명</th>
									<td>재직증명서</td>
									<th scope="row">약칭</th>
									<td>재직</td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td>재직 증명서</td>
									<th scope="row">양식 규정</th>
									<td>미등록</td>
								</tr>
								<tr>
									<th scope="row">보존 연한</th>
									<td>5년</td>
									<th scope="row">보안 등급</th>
									<td>A등급</td>

								</tr>
							</tbody>
						</table>
					</fieldset>

					<fieldset>
						<div class="after">
							<h4 class="fl">결재 양식</h4>
						</div>
						<div id="textApprovalFormat">
							<ul style="list-style: square inside;">
								<li class="pdb_10" style="list-style: square inside;">결재
									포맷: 신청</li>
								<li class="pdb_10" style="list-style: square inside;">지정
									결재자</li>
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
						<div class="after mgt_30">
							<h4 class="fl">제목</h4>
						</div>
						<div class="gt-ml-20">미설정</div>

	 
						<div class="after mgt_30">
							<h4 class="fl">내용설정</h4>
						</div>
						<div class="after gt-ml-20">
							<h4 class="fl">DB 유닛</h4>
						</div>
						<ul style="list-style: square inside;" class=" gt-ml-40">
							<li class="pdb_10" style="list-style: square inside;">사용</li>
							<li class="pdb_10" style="list-style: square inside;">사용 DB
								유닛: 재직 증명</li>
						</ul>
						<div class="after gt-mt-20 gt-ml-20">
							<h4 class="fl">입력 화면</h4>
						</div>
						<div class="gt-ml-40">
							<div class="approval-unit">
								<div id="form_view_db_unit"
									class="unit-box-contents detail-write gt-no-padding gt-d-table gt-w-100 write-page">
									<div id="lprwejz83c78">
										<div class="df-wrap unit-row insa_jyqm70vn96e2"
											id="jyqm70vn96e2" df-type="insa" df-fieldtype="username">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">이름</label>
											</div>
											<div class="df-field unit-cell-body">작성자 이름</div>
										</div>
										<div class="df-wrap unit-row insa_jyqm70vn96e2"
											id="jyqm7pko76zn" df-type="insa" df-fieldtype="org">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">소속</label>
											</div>
											<div class="df-field unit-cell-body">작성자 소속</div>
										</div>
										<div class="df-wrap unit-row insa_jyqm70vn96e2"
											id="jyqm7pkowplp" df-type="insa" df-fieldtype="birthday">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">생년월일</label>
											</div>
											<div class="df-field unit-cell-body">작성자 생년월일</div>
										</div>
										<div class="df-wrap unit-row insa_jyqm70vn96e2"
											id="jyqm7pkorbih" df-type="insa" df-fieldtype="joindate">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">입사일</label>
											</div>
											<div class="df-field unit-cell-body">작성자 입사일</div>
										</div>
										<div class="df-wrap unit-row insa_jyqm70vn96e2"
											id="jyqm7pkpsr20" df-type="insa" df-fieldtype="address">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">주소</label>
											</div>
											<div class="df-field unit-cell-body">작성자 주소</div>
										</div>
										<div class="df-wrap unit-row" id="jyqm7ruune38" df-type="text">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">제출처 </label>
											</div>
											<div class="df-field unit-cell-body gt-d-table gt-h-auto">
												<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
													type="text" class="hw-input-form type-text-width" value=""
													style="width: 50% !important;" disabled="" minlength="0"
													maxlength="100">
												</span> <span class="gt-d-table-cell unit-btn-cell"></span>
											</div>
										</div>
										<div class="df-wrap unit-row" id="jyqm7s52nazl" df-type="text">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">용도 </label>
											</div>
											<div class="df-field unit-cell-body gt-d-table gt-h-auto">
												<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <input
													type="text" class="hw-input-form type-text-width" value=""
													style="width: 80% !important;" disabled="" minlength="0"
													maxlength="100">
												</span> <span class="gt-d-table-cell unit-btn-cell"></span>
											</div>
										</div>
										<div class="df-wrap unit-row" id="jzxgpuw5qgjv" df-type="date">
											<div class="df-field-label unit-cell-head">
												<label class="gt-align-middle">발행일 </label>
											</div>
											<div class="df-field unit-cell-body gt-d-table gt-h-auto">
												<span class="gt-d-table-cell gt-pr-10 gt-w-100"> <span
													class="gt-position-relative gt-d-inline-block"> <input
														type="text"
														class="hw-input-form type-date-width hasDatepicker"
														value="2019. 8. 30" readonly="" disabled=""
														id="dp1701754017783"> <span
														class="input-suffix-btn gt-p-5" disabled="disabled"><i
															class="fal fa-calendar-alt"></i></span>
												</span>
												</span> <span class="gt-d-table-cell unit-btn-cell"></span>
											</div>
										</div>
									</div>
								</div>
							</div>

							 
						</div>
						<div class="after gt-mt-20 gt-ml-20">
							<h4 class="fl">결재 문서 보기 : 인쇄 서식과 동일</h4>
						</div>

						<div class="after gt-mt-20">
							<h4 class="fl">인쇄 서식</h4>
						</div>
						<div class="after gt-ml-40">
							<table align="center"
								style="border: 0px none rgb(0, 0, 0); width: 606px; height: 349px; font-size: 16px; word-break: break-all; border-collapse: separate;"
								border="1" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 1092px; height: 20px;"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; line-height: 1.6; margin-top: 0px; margin-bottom: 0px; font-size: 16px;">
												<span style="font-size: 20px;"><b>OO 주식회사</b></span>
											</p></td>
										<td rowspan="3" colspan="2" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 10px; height: 37px; text-align: right; vertical-align: top;"><p
												style="line-height: 1.2; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="font-size: 12px; font-family: &amp; quot;맑은 고딕&amp;quot;;">&nbsp;</span><span
													style="font-size: 24px;"><b>&nbsp;<img
														src="/static/images/approval/dbunit_logo.png" border="0"
														style="border: 0px solid rgb(0, 0, 0); width: 120px; height: 30px; margin: 0px;"></b></span>
											</p>
											<p
												style="line-height: 1.2; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 12px;">&nbsp;</span>
											</p></td>
									</tr>
									<tr>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 1092px; height: 10px;"><p
												style="line-height: 1.2; font-family: &amp; quot; 맑은 고딕&amp;quot;; margin-top: 0px; margin-bottom: 0px; font-size: 16px;">
												<span
													style="font-size: 12px; font-family: &amp; quot;맑은 고딕&amp;quot;;">OO도
													OO시 OO구 OO로 123 OO빌딩 1234호</span>
											</p></td>
									</tr>
									<tr>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 1092px; height: 10px;"><p
												style="line-height: 1.2; font-family: &amp; quot; 맑은 고딕&amp;quot;; margin-top: 0px; margin-bottom: 0px; font-size: 16px;">
												<span
													style="font-size: 12px; font-family: &amp; quot;맑은 고딕&amp;quot;;">Tel.
													1234-5678&nbsp; Fax. 1234-0987&nbsp; www.abc.com</span>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 600px; height: 10px;"><p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 600px; height: 10px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"><p
												style="text-align: center; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span style="font-size: 28px;"><b>재 직 증 명 서</b></span>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<br>
											</p></td>
									</tr>
									<tr>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"><p
												style="text-align: justify; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">이&nbsp;
												&nbsp; &nbsp;름</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"><p
												style="text-align: center; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">:</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"
											colspan="3"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jyqm70vn96e2"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#이름}}</span><span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p></td>
									</tr>
									<tr>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"><p
												style="text-align: justify; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">생년월일</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"><p
												style="text-align: center; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">:</p></td>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jyqm7pkowplp"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#생년월일}}</span>
											</p></td>
									</tr>
									<tr>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"><p
												style="text-align: justify; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												소&nbsp;&nbsp;&nbsp;&nbsp; 속<br>
											</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"><p
												style="text-align: center; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												:<br>
											</p></td>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jyqm7pko76zn"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#소속}}</span>
											</p></td>
									</tr>
									<tr>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"><p
												style="text-align: justify; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">입
												사 일</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"><p
												style="text-align: center; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">:</p></td>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jyqm7pkorbih"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#입사일}}</span>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 867px; height: 20px;"><p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="4_jyi2cncddbr0"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">이
													사람은&nbsp;</span><span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">상기
													입사일 이후 현재까지 당사에 재직 중임을 확인합니다.</span>
											</p>
											<p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; line-height: 1.4; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p></td>
									</tr>
									<tr>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">제
												출 처</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">&nbsp;:</p></td>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jyqm7ruune38"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#제출처}}</span><span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">&nbsp;</span>
											</p></td>
									</tr>
									<tr>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 66px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">용&nbsp;
												&nbsp; &nbsp;도</p></td>
										<td scope=""
											style="border: 0px none rgb(0, 0, 0); width: 13px; height: 20px;"><p
												style="line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">&nbsp;:</p></td>
										<td colspan="3" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 788px; height: 20px;"><p
												style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jyqm7s52nazl"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#용도}}</span>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 600px; height: 20px;"><p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false" id="1367_jzxgpuw5qgjv"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px;">{{#발행일}}</span>
											</p>
											<p
												style="text-align: center; line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="text-align: center; line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span style="text-align: inherit; font-size: 14px;"><br></span>
											</p>
											<p
												style="text-align: center; line-height: 1.8; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span
													style="text-align: inherit; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span>
											</p>
											<p
												style="line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<span class="hw-editable-false"
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 14px;">&nbsp;</span><span
													style="font-size: 14px; text-align: inherit; font-family: &amp; quot;맑은 고딕&amp;quot;;">&nbsp;</span>
											</p></td>
									</tr>
									<tr>
										<td colspan="5" scope=""
											style="border: 0px none rgb(0, 0, 0); width: 866px; height: 70px; background-repeat: no-repeat;"><p
												style="text-align: center; line-height: 1.6; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; margin-top: 0px; margin-bottom: 0px;">
												<img src="/static/images/approval/dbunit_sign_for_com.png"
													border="0"
													style="border: 0px solid rgb(0, 0, 0); width: 531px; height: 70px; margin: 0px;"><br>
											</p></td>
									</tr>
								</tbody>
							</table>
							<p
								style="margin: 0cm 0cm 8pt; text-align: justify; line-height: 14.26px; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt;">
								<span
									style="line-height: 15.69px; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 11pt;">&nbsp;
									&nbsp; </span><span
									style="text-align: center; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 12pt;">&nbsp;</span>
							</p>
						</div>


						<style>
.hw-approval-module__desc {
	pointer-events: none;
}

.hw-approval-module__desc .hw-approval-module__desc>section {
	margin-bottom: 30px;
}

.hw-approval-module__desc .section-title {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 10px;
	line-height: 1;
}

.hw-approval-module__desc .section-data {
	font-size: 14px;
}

.hw-approval-module__desc .markup-table {
	width: 100%;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
	border-collapse: collapse;
}

.hw-approval-module__desc .markup-table.center {
	text-align: center;
}

.hw-approval-module__desc .markup-table.left>tbody>tr>th,
	.hw-approval-module__desc .markup-table.left>tbody>tr>td {
	text-align: left;
}

.hw-approval-module__desc .text-center {
	text-align: center;
}

.hw-approval-module__desc .markup-table.calendar th {
	background: #fff;
}

.hw-approval-module__desc .markup-table.calendar td {
	height: 80px;
}

.hw-approval-module__desc .markup-table.calendar .calc {
	background: #f8f8f8;
}

.hw-approval-module__desc .markup-table.calendar .prev {
	color: #c4c4c4;
}

.hw-approval-module__desc .manage-divide {
	display: inline-block;
	width: 1px;
	height: 14px;
	background-color: #d6d6d6;
	vertical-align: middle;
}

.hw-approval-module__desc .markup-table.horizontal tr:last-child th {
	border-bottom: none;
}

.hw-approval-module__desc .markup-table tr {
	height: 45px;
}

.hw-approval-module__desc .markup-table tr th, .hw-approval-module__desc .markup-table tr td
	{
	font-size: 14px;
	padding: 0px 14px;
	border-top-color: #d6d6d6;
	border-left: 0;
}

.hw-approval-module__desc .markup-table tr th {
	background: #eff4fc;
	font-weight: normal;
	color: #333;
	border-right: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
}

.hw-approval-module__desc .markup-table tr td {
	background: #fff;
	border-right: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
}

.hw-approval-module__desc .markup-table tr th:last-child,
	.hw-approval-module__desc .markup-table tr td:last-child {
	border-right: none;
}

.hw-approval-module__desc .markup-table>tbody>tr:last-child>td {
	border-bottom: none;
}

.hw-approval-module__desc .markup-table>tbody>tr>td.markup-table-child {
	padding: 0;
}

.hw-approval-module__desc .markup-table>tbody>tr>td.markup-table-child .markup-table
	{
	border-top: 0;
	border-bottom: 0;
}

.hw-approval-module__desc .markup-table>tbody>tr>th.team-plan-table-head
	{
	border-top: 1px solid #d6d6d6;
	text-align: left;
}

.hw-approval-module__desc .markup-table>tbody>tr>th.team-plan-table-head.column-date:not(:nth-child(8))
	{
	border-right: 1px solid #ebebeb;
}

.hw-approval-module__desc .markup-table>tbody>tr>th.week-total-time-head
	{
	border-left: 1px solid #d6d6d6;
}

.hw-approval-module__desc .markup-table.team-plan-table>tbody>tr>td:nth-child(8)
	{
	border-right: 1px solid #d6d6d6;
}

.hw-approval-module__desc .markup-table>tbody>tr>td.week-total-time {
	background: #f8f8f8;
}

.hw-approval-module__desc .markup-table>tbody>tr>td.team-name-cell {
	border-right: 1px solid #d6d6d6;
}

.hw-approval-module__desc .markup-table>tbody>tr.last-team-row>td {
	border-bottom: 1px solid #d6d6d6;
}

.hw-approval-module__desc .hw-input {
	display: inline-block;
	width: 100%;
	min-height: 34px;
	font-size: 14px;
	padding: 0 10px;
	border: 1px solid #d6d6d6;
	transition-duration: 0.2s;
	box-sizing: border-box;
	border-radius: 2px;
}

.hw-approval-module__desc .dummy-select {
	position: relative;
}

.hw-approval-module__desc .dummy-select.time {
	width: 70px;
}

.hw-approval-module__desc .dummy-select .selet-arrow {
	position: absolute;
	top: 12px;
	right: 7px;
	font-size: 12px;
	color: #909090;
}

.hw-approval-module__desc .flex-section {
	display: flex;
	align-items: center;
}

.hw-approval-module__desc .flex-section .range {
	margin-left: 3px;
	margin-right: 3px;
}

.hw-button.sm {
	padding: 0px 14px 0px;
	min-height: 24px;
	height: 30px;
	font-size: 13px;
}

.hw-button+.hw-button {
	margin-left: 0px;
}
</style>

						<div class="docu-common-wrap">
							<div class="contents after"></div>
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