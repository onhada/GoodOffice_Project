<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents">
	<div class="setting_title">
		<h3>설정</h3>
	</div>
	<div class="content_inbox approval-admin">
		<div class="cont_box">
			<div class="setting_field approval">
				<h4>쓰기 설정</h4>
				<ul class="after mgb_50 pdt_10">
					<li class="gt-mr-5"><select class="" name="font_family">
							<option value="맑은 고딕" selected="">맑은 고딕</option>
							<option value="돋움">돋움</option>
							<option value="돋움체">돋움체</option>
							<option value="굴림">굴림</option>
							<option value="굴림체">굴림체</option>
							<option value="바탕">바탕</option>
							<option value="바탕체">바탕체</option>
							<option value="Arial">Arial</option>
							<option value="Arial Black">Arial Black</option>
							<option value="Tahoma">Tahoma</option>
							<option value="Verdana">Verdana</option>
							<option value="Sans-Serif">Sans-Serif</option>
							<option value="Serif">Serif</option>
							<option value="Monospace">Monospace</option>
							<option value="Cursive">Cursive</option>
							<option value="Fantasy">Fantasy</option>
							<option value="Times New Roman">Times New Roman</option>
							<option value="Century Gothic">Century Gothic</option>
							<option value="Courier New">Courier New</option>
							<option value="Georgia">Georgia</option>
					</select></li>
					<li class="gt-mr-5"><select class="" name="font_size">
							<option value="9px">9px</option>
							<option value="10px">10px</option>
							<option value="11px">11px</option>
							<option value="12px">12px</option>
							<option value="13px">13px</option>
							<option value="14px">14px</option>
							<option value="16px" selected="">16px</option>
							<option value="18px">18px</option>
							<option value="24px">24px</option>
							<option value="32px">32px</option>
					</select></li>
					<li><select class="" name="line_height">
							<option value="1">1</option>
							<option value="1.2">1.2</option>
							<option value="1.4">1.4</option>
							<option value="1.6" selected="">1.6</option>
							<option value="1.8">1.8</option>
							<option value="2">2</option>
					</select></li>
				</ul>
				<h4>읽기 설정</h4>
				<ul class="after mgb_50 pdt_10">
					<li><label><input type="radio" name="list_count"
							value="15" checked=""> 15개</label></li>
					<li><label><input type="radio" name="list_count"
							value="30"> 30개</label></li>
					<li><label><input type="radio" name="list_count"
							value="50"> 50개</label></li>
					<li><label><input type="radio" name="list_count"
							value="100"> 100개</label></li>
				</ul>
				<h4>
					서명 설정
					<button class="weakblue mgl_20"
						onclick="ApprovalPerson.resetSignature();">기본으로재설정</button>
				</h4>
				<div class="approval-bg sign-setting mgb_50">
					<dl class="after">
						<dt>
							<img src="/gabia.biz/approval/sign/approval/A/2/2812/1701566939"
								alt="결재" id="imgApprovalSignature">
						</dt>
						<dd>
							<input type="text" class="input w300" name="sign_org_file_name"
								readonly=""> <input type="file" class="input w300"
								style="display: none;" id="fileApprovalSign"> <input
								type="hidden" name="sign_file_name">
							<button class="weakblue mgl_10 vm"
								onclick="$j('#fileApprovalSign').click();">파일 선택</button>
						</dd>
						<dd class="mgt_5">파일 선택: 46*46 / gif, jpg, jpeg, png 가능</dd>
						<dd class="mgt_10">
							<a href="javascript:void(0);" class="weakblue"
								onclick="ApprovalPerson.deleteTempSignature('/gabia.biz/approval/sign/approval/A/2/2812/1701566939');">삭제</a>
						</dd>
					</dl>
				</div>
				<h4>알림 상세 설정</h4>
				<p class="pdb_10">
					알림 수신 정보: 010-1111-1111 / ceo@gabia.biz <a
						href="/gabia.biz/insa/info/myinfo" class="weakblue vm">변경하기</a>
				</p>
				<table class="tableType01 mgb_10">
					<caption>알림 상세 설정 표</caption>
					<colgroup>
						<col width="90">
						<col width="120">
						<col width="*">
						<col width="330">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="2">구분</th>
							<th scope="col">알림 조건</th>
							<th scope="col">알림 설정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3" class="bdb1">결재</td>
							<td>예정</td>
							<td>예정 문서함에 문서가 등록됐을 때</td>
							<td>
								<ul class="after">
									<li><label><input type="checkbox"
											name="expected_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="expected_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="expected_notification" value="Y"> 메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>대기</td>
							<td>대기 문서함에 문서가 등록되었을 때</td>
							<td>
								<ul class="after">
									<li><label><input type="checkbox"
											name="waiting_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="waiting_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="waiting_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="bdb1">완료</td>
							<td class="bdb1"><span class="fl"> 문서가 결재 완료되었을 때 </span> <a
								href="javascript:void(0)" class="icon question tipsIcon"
								style="position: relative; top: 0px; margin-left: 10px"><span
									class="blind">세부 설명</span></a>
								<div class="tooltip hide" style="left: 100; top: 0">
									<div class="tooltip-box" style="width: 300px;">
										<p>완료나 문서함 &gt; 결재로 이동하였을 때 알림이 갑니다.</p>
									</div>
								</div></td>
							<td class="bdb1">
								<ul class="after">
									<li><label><input type="checkbox"
											name="completion_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="completion_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="completion_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td rowspan="2" class="bdb1">참조</td>
							<td>결재 시작</td>
							<td>참조자로 포함된 문서가 등록되었을 때</td>
							<td>
								<ul class="after">
									<li><label><input type="checkbox"
											name="reference_w_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="reference_w_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="reference_w_notification" value="Y"> 메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="bdb1">결재 완료</td>
							<td class="bdb1">참조자로 포함된 문서의 모든 결재가 완료되었을 때</td>
							<td class="bdb1">
								<ul class="after">
									<li><label><input type="checkbox"
											name="reference_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="reference_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="reference_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="bdb1">수신</td>
							<td class="bdb1">&nbsp;</td>
							<td class="bdb1">문서가 수신되었을 때</td>
							<td class="bdb1">
								<ul class="after">
									<li><label><input type="checkbox"
											name="reception_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="reception_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="reception_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="bdb1">회람</td>
							<td class="bdb1">&nbsp;</td>
							<td class="bdb1">문서가 회람되었을 때</td>
							<td class="bdb1">
								<ul class="after">
									<li><label><input type="checkbox"
											name="circulation_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="circulation_notification" value="Y"> 메일</label></li>
									<li><label><input type="checkbox"
											name="circulation_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td rowspan="3" class="bdb1">기안</td>
							<td>반려</td>
							<td>기안한 문서 중에서 결재자 또는 합의자가 반려했을 때</td>
							<td>
								<ul class="after">
									<li><label><input type="checkbox"
											name="return_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="return_notification" value="Y" checked=""> 메일</label></li>
									<li><label><input type="checkbox"
											name="return_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>협의 요청</td>
							<td>기안한 문서 중에서 결재자 또는 합의자가 협의 요청했을 때</td>
							<td>
								<ul class="after">
									<li><label><input type="checkbox"
											name="request_conference_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="request_conference_notification" value="Y" checked="">
											메일</label></li>
									<li><label><input type="checkbox"
											name="request_conference_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="bdb1">완료</td>
							<td class="bdb1">기안한 문서의 모든 결재 및 합의가 완료되었을 때</td>
							<td class="bdb1">
								<ul class="after">
									<li><label><input type="checkbox"
											name="my_completion_notification" value="Y"> SMS</label></li>
									<li><label><input type="checkbox"
											name="my_completion_notification" value="Y" checked="">
											메일</label></li>
									<li><label><input type="checkbox"
											name="my_completion_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td>문서 변경</td>
							<td>&nbsp;</td>
							<td><span class="fl">문서가 변경되었을 때</span> <a
								href="javascript:void(0)" class="icon question tipsIcon"
								style="position: relative; top: 0px; margin-left: 10px"><span
									class="blind">세부 설명</span></a>
								<div class="tooltip hide" style="left: 100; top: 0">
									<div class="tooltip-box" style="width: 370px;">
										<p>결재 문서의 관련자들이 결재한 문서에 대해 다음과 같은 경우에 웹 알림을 제공합니다.</p>
										<ol>
											<li>1. 결재 문서의 결재선을 변경하였을 때</li>
											<li>2. 관련 문서나 첨부 파일을 삭제 또는 추가하여 변경하였을 때</li>
											<li>3. 보안 등급, 보존 연한을 변경하였을 때</li>
										</ol>
									</div>
								</div></td>
							<td>
								<ul class="after">
									<li><label><input type="checkbox"
											name="web_alarm_notification" value="Y" checked="">
											메신저/앱</label></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>

				<ul class="font12 line24 mgb_50">
					<li>· 문자 전송 방법은 관리자 설정에 따라 90bytes가 넘을 때 분할 발송(SMS) 또는 장문
						발송(LMS)이 될 수 있습니다.</li>
					<li>· 메일 알림을 수신하시려면 하이웍스 메일 계정을 사용하거나 <a
						href="/gabia.biz/insa/info/myinfo" target="_blank"
						class="point_color">인사정보 설정</a>에 개인 이메일 정보를 입력해 주세요.
					</li>
					<li>· 메신저가 설치 되어 있지 않은 경우 먼저 <a
						href="https://hiworks.com/download" target="_blank"
						class="point_color">다운로드</a> 받으시기 바랍니다.
					</li>
				</ul>
				<!-- 참조/회람/수신 확인 방식 -->
				<div class="cont-tit after">
					<h4 class="fl">참조/회람/수신 확인 방식</h4>
					<a href="javascript:void(0)" class="icon question tipsIcon vm"
						style="margin-left: 5px"><span class="blind">세부 설명</span></a>
					<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
						<div class="icon tip_sq" style="left: 150px;"></div>
						<div class="tooltip-box" style="left: 0; width: 500px;">
							<p>참조/회람/수신자로 포함된 문서를 확인하는 방식을 설정합니다. '버튼'을 선택하면 해당 문서에서 버튼을
								클릭해야 확인 상태가 되며, 열람만 한 상태와 구분하여 표시됩니다. '열람'을 선택하면 문서 열람과 동시에 확인
								상태가 됩니다.</p>
						</div>
					</div>
				</div>
				<ul class="after pdb_30">
					<li><label><input type="radio" name="check_action"
							value="N" checked=""> 버튼</label></li>
					<li><label><input type="radio" name="check_action"
							value="Y"> 열람</label></li>
				</ul>

				<div class="bt_left">
					<button type="button" onclick="ApprovalPerson.saveSettings();">저장</button>
				</div>

				<div class="cont-tit after">
					<h4 class="fl">자주 쓰는 결재선</h4>
					<a href="javascript:void(0)" class="icon question tipsIcon vm"
						style="margin-left: 5px"><span class="blind">세부 설명</span></a>
					<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
						<div class="icon tip_sq" style="left: 85px"></div>
						<div class="tooltip-box" style="left: 0; width: 500px;">
							<p>결재 양식별 자주 쓰는 결재자를 미리 저장해놓고, 기안 시 불러올 수 있습니다.</p>
						</div>
					</div>
					<button class="weakblue mgl_20"
						onclick="ApprovalPerson.getApprovalLineStep();">결재선추가</button>
				</div>

				<table class="tableType01 mgb_10" id="tableApprovalLine">
					<caption>결재선 표</caption>
					<colgroup>
						<col width="*">
						<col width="150px">
						<col width="150px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="left">결재선 명</th>
							<th>&nbsp;</th>
							<th scope="col">관리</th>
						</tr>
						<tr>
							<td colspan="3" class="approval-no-data">등록된 결재선이 없습니다.</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="listbottom bt0" id="pageApprovalLine"></div>
			</div>
		</div>
	</div>

	<script>
		var approvalLineTable = new approvalTableClass({
			table : "tableApprovalLine",
			row : [ [ "title", "" ], [ "valid_user", "" ],
					[ "action", "center" ] ]
		});

		$j(document)
				.ready(
						function() {
							Approval
									.settingDblClickForDeleteApprovalSelectUser();
							$j('#fileApprovalSign')
									.fileupload(
											{
												url : '/gabia.biz/approval/upload_file/sign',
												singleFileUploads : true,
												dataType : 'json',
												//replaceFileInput: false,
												paramName : 'signature',
												add : function(e, data) {
													var uploadFile = data.files[0];
													var isValid = true;
													if (!(/png|jpe?g|gif/i)
															.test(uploadFile.name)) {
														alert('png, jpg, gif 만 가능합니다.');
														isValid = false;
													} else if (uploadFile.size > 5 * 1024 * 1024) { // 5mb
														alert('서명 이미지는 5메가를 초과할 수 없습니다.');
														isValid = false;
													}
													if (isValid) {
														data.submit();
													}
												}

												,
												progressall : function(e, data) {
													Common._createProgress();
												}

												,
												done : function(e, data) {
													Common._closeProgress();

													if (data.result.resultCode === RT_OK) {
														$j(
																"input[name='sign_org_file_name']")
																.val(
																		data.result.org_file_name);
														$j(
																"input[name='sign_file_name']")
																.val(
																		data.result.file_name);
														$j(
																"#imgApprovalSignature")
																.attr(
																		"src",
																		data.result.url);
													} else {
														if (data.result.message)
															alert(data.result.message);
													}
												}

												,
												fail : function(e, data) {
													Common._closeProgress();
													alert('서버와 통신 중 문제가 발생했습니다. 다시 시도해주시기 바랍니다.');
												}
											});

							ApprovalPerson.getApprovalLineList();
						});

		var ApprovalUniversal = new ApprovalUniversalClass('ApprovalUniversal',
				'ApprovalPerson.saveApprovalLineUniversal');
		ApprovalUniversal.setConfig({
			showAutoLine : false
		});
	</script>
</div>
