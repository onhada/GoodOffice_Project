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
					<input type="hidden" name="approval_form_no" value="4602">
					<input type="hidden" name="approval_method" value="BCF"> <input
						type="hidden" name="form_type" value="spending_report"> <input
						type="hidden" name="approval_first_line_type" value="A"> <input
						type="hidden" name="approval_first_line" value="2"> <input
						type="hidden" name="approval_second_line" value=""> <input
						type="hidden" name="approval_third_line" value=""> <input
						type="hidden" name="approval_fourth_line" value="">

					<fieldset>
						<div class="after">
							<h4 class="fl">양식 ID</h4>
							<span class="gt-mh-20"> H1-02 </span> <span class="gt-mh-20"
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
									<td>전자결재</td>
									<th scope="row">결재 분류</th>
									<td><label> <select name="form_category"
											style="width: 190px">
												<option value="605" category-type="normal">공통</option>
												<option value="606" selected="" category-type="testmode">시험
													사용</option>
										</select>
									</label></td>
								</tr>
								<tr>
									<th scope="row">양식명</th>
									<td><label><input type="text" class="txt-input"
											title="양식명" name="form_title" value="지출 결의서" maxlength="20"></label>
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
											title="약칭" name="form_acronym" value="지결" maxlength="10"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td><label><input type="text" class="txt-input"
											title="설명" name="form_comment" value="지출 결의서" maxlength="50"></label>
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
									onclick="ApprovalSetting.formSetting('Y');">설정</button> <a
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
window.onbeforeunload = function() {
	if(ApprovalSetting._formSubmit === false){
		return "작성중인 내용은 저장되지 않습니다.";
	}
};

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
