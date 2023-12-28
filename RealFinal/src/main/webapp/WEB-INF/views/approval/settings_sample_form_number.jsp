<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contents">
	<div class="content_inbox approval-admin non-space">
		<!-- Contents -->
		<div class="cont_box">
			<div class="content_title after">
				<span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalSetting.setApprovalForm('no', '147');">양식함으로가져오기</a>
				</span>
			</div>

			<div class="allform-wrap">
				<h4>기본 설정</h4>
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
								<th scope="row">양식명</th>
								<td>일반 공문</td>
								<th scope="row">약칭</th>
								<td>공문</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="3">일반적인 공문을 보낼때 사용</td>
							</tr>
							<tr>
								<th scope="row">보존 연한</th>
								<td>10년</td>
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
							<li class="pdb_10" style="list-style: square inside;">결재 포맷:
								결재, 재무 합의 사용</li>
							<li class="pdb_10" style="list-style: square inside;">지정 결재자
							</li>
							<li>
								<ul style="list-style: circle inside; padding-left: 30px;">
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 11)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 10)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 9)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 8)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 7)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 6)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 5)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 4)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 3)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 2)</li>
									<li class="pdb_10" style="list-style: circle inside;">
										[결재] 자동 결재선(레벨 1)</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="docu-common-wrap">
						<div class="contents">
							<div
								style="margin: 0px; padding: 0px; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8;">
								<h1
									style="text-align: center; padding: 30px 0px; font-size: 26px; font-family: &amp; quot; 맑은 고딕&amp;quot;; line-height: 1.8;">회사명</h1>
								<table
									style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #cdcdcd; margin: 0; padding: 0">
									<tbody>
										<tr>
											<td
												style="padding: 10px 0; text-align: center; border: 1px solid #cdcdcd; border-left: 0;"><p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">주소입력</p>
											</td>
											<td style="padding: 0 0 0 10px; border: 1px solid #cdcdcd;"><p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">/
													전화 OOO)OOOO-OOOO / Fax OOO)OOOO-OOOO</p></td>
										</tr>
										<tr>
											<td
												style="padding: 0 0 10px 10px; border: 1px solid #cdcdcd; border-left: 0;"><p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">담당자:</p>
											</td>
											<td
												style="padding: 0 0 10px 10px; border: 1px solid #cdcdcd;"><p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">E-mail:</p>
											</td>
										</tr>
										<tr>
											<td colspan="2"
												style="padding: 10px; border: 1px solid #cdcdcd"><p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">문서번호:</p>
												<p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">시행일자:</p>
												<p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">경
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유:</p>
												<p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">수
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신:</p>
												<p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p>
												<p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">제
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목:</p></td>
										</tr>
										<tr>
											<td colspan="2"
												style="padding: 20px 10px; border: 1px solid #cdcdcd;"><p
													style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">&nbsp;</p>
											</td>
										</tr>
										<tr>
											<td colspan="2"
												style="padding: 10px; border: 1px solid #cdcdcd; border-top: 0;"><p
													style="padding-top: 100px; text-align: center; font-size: 18px; font-weight: bold; font-family: &amp; quot; 맑은 고딕&amp;quot;; line-height: 1.8; margin-top: 0px; margin-bottom: 0px;">
													(주)○○○○<br> 대표이사 ○○○
												</p></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
</div>