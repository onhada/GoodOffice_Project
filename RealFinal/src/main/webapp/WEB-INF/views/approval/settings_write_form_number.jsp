<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents">
	<div class="content_inbox approval-admin non-space">
		<div class="cont_box">
			<div class="content_title after">
				<span class="detail_select"> <!-- <a href="/gabia.biz/approval/settings/write_form/4610/M">양식 수정</a> -->
					<a href="javascript:ApprovalSetting.getFormInfo('4610', 'M');">양식
						수정</a>
				</span>
			</div>

			<div class="allform-wrap">
				<form action="" onsubmit="return false;">
					<input type="hidden" name="approval_form_no" value="4610">
					<input type="hidden" name="approval_method" value="BCF"> <input
						type="hidden" name="form_type" value="hr_plan_personal"> <input
						type="hidden" name="approval_first_line_type" value="A"> <input
						type="hidden" name="approval_first_line" value="2"> <input
						type="hidden" name="approval_second_line" value=""> <input
						type="hidden" name="approval_third_line" value=""> <input
						type="hidden" name="approval_fourth_line" value="">

					<fieldset>
						<div class="after">
							<h4 class="fl">양식 ID</h4>
							<span class="gt-mh-20">H4</span> <span class="gt-mh-20">사용</span>
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
									<td>[하이웍스] 인사</td>
									<th scope="row">결재 분류</th>
									<td><label> 해당없음 </label></td>
								</tr>
								<tr>
									<th scope="row">양식명</th>
									<td>근무계획서</td>
									<th scope="row">약칭</th>
									<td>근계</td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td>개인은 권한설정상태에 따라 근무계획서를 신청</td>
									<th scope="row">양식 규정</th>
									<td>미등록</td>
								</tr>
								<tr>
									<th scope="row">보존 연한</th>
									<td>3년, 변경 금지</td>
									<th scope="row">보안 등급</th>
									<td>B등급, 변경 금지</td>

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
											신청: 자동 (레벨2)</li>
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

						<!-- DB 유닛 -->
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

	<script>
ApprovalSetting._formRule = '';
Approval._defaultFontFamily = '맑은 고딕';
Approval._defaultFontSize = '16px';
Approval._defaultLineHeight = '1.6';
Approval._defaultEditor = 'synap';

$j(document).ready(function(){
	
	ApprovalSetting.setApprovalFormUseArea();
	$j(document).on('change', 'select[name="form_category"]', function(){
		ApprovalSetting.setApprovalFormUseArea();
	});

	$j(document).on("click", ".js-approval-form-line-delete", function(){
		if( $j(this).parent().length > 0 ){
			ApprovalForm.deleteApprovalLine($j(this).parent().attr('line'), $j(this).parent().attr('user_no'));
			$j(this).parent().remove();
		}
	});

	    FormModule.initialize('[]');
});

Approval._writeType = 'form';


var ApprovalUniversal = new ApprovalUniversalClass('ApprovalUniversal', 'ApprovalSetting.saveSecondStepUniversal');

ApprovalSetting._universalApprovalLine = "";
ApprovalSetting._universalSetting = 'N';
FormModule._hrWorkApi = 'https://hr-work-api.office.hiworks.com';
</script>
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
							name="vacation_module" value="1138"> 연차</label>
					</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1139"> 포상</label>
					</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1140"> 월차</label>
					</p>
				</div>
				<div class="js-vacation-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="vacation_module" value="1141"> 경조사</label>
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
							name="workcheck_module" value="1366"> 업무</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1367"> 외출</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1368"> 회의</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1369"> 외근</label>
					</p>
				</div>
				<div class="js-worcheck-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="workcheck_module" value="1370"> 휴식</label>
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
							name="overwork_module" value="1366"> 업무</label>
					</p>
				</div>
				<div class="js-overwork-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="overwork_module" value="1368"> 회의</label>
					</p>
				</div>
				<div class="js-overwork-module gt-clearfix gt-mt-10">
					<p>
						<label><input class="gt-checkbox" type="checkbox"
							name="overwork_module" value="1369"> 외근</label>
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
