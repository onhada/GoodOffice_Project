<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents">
	<div class="setting_title">
		<h3>기본 설정</h3>
	</div>
	<div class="content_inbox approval-admin">
		<!-- Contents -->
		<div class="cont_box">
			<div class="setting_field approval basic-setting">
				<form action="/gabia.biz/approval/settings/save_basic" method="POST"
					id="formBasicSetting" onsubmit="return false;">
					<!-- 보안 등급별 열람 설정 -->
					<div class="cont-tit first after">
						<strong class="fl">보안 등급별 열람 설정</strong> <a
							href="javascript:void(0)" class="icon question tipsIcon vm"
							style="margin-left: 5px"><span class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 460px;">
								<p>A등급과 B등급 문서가 결재 완료된 후 기본 열람할 수 있는 직위 등급을 설정합니다.</p>
								<p>직위 등급은 인사관리에서 설정합니다.</p>
							</div>
						</div>
					</div>
					<table class="tableType02">
						<caption>보안 등급별 열람 설정</caption>
						<colgroup>
							<col style="width: 20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="levelS">S등급</label></th>
								<td>기안 상에 설정된 관련자들만 문서 열람</td>
							</tr>
							<tr>
								<th scope="row"><label for="levelA">A등급</label></th>
								<td>결재 완료 후 직위 <select id="levelA" class="level-select"
									name="security_level_a">
										<option data-valid="Y" value="1">1등급(대표이사)</option>
										<option data-valid="Y" value="2">2등급(사장)</option>
										<option data-valid="Y" value="3">3등급(상무)</option>
										<option data-valid="Y" value="4">4등급(이사)</option>
										<option data-valid="Y" value="5" selected="">5등급(부장)</option>
										<option data-valid="Y" value="6">6등급(차장)</option>
										<option data-valid="Y" value="7">7등급(과장)</option>
										<option data-valid="Y" value="8">8등급(대리)</option>
										<option data-valid="Y" value="9">9등급(주임)</option>
										<option data-valid="Y" value="10">10등급(사원)</option>
										<option data-valid="Y" value="11">11등급(계약직)</option>
								</select> 이상 기본 열람
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="levelB">B등급</label></th>
								<td>결재 완료 후 직위 <select id="levelB" class="level-select"
									name="security_level_b">
										<option data-valid="Y" value="1">1등급(대표이사)</option>
										<option data-valid="Y" value="2">2등급(사장)</option>
										<option data-valid="Y" value="3">3등급(상무)</option>
										<option data-valid="Y" value="4">4등급(이사)</option>
										<option data-valid="Y" value="5">5등급(부장)</option>
										<option data-valid="Y" value="6">6등급(차장)</option>
										<option data-valid="Y" value="7" selected="">7등급(과장)</option>
										<option data-valid="Y" value="8">8등급(대리)</option>
										<option data-valid="Y" value="9">9등급(주임)</option>
										<option data-valid="Y" value="10">10등급(사원)</option>
										<option data-valid="Y" value="11">11등급(계약직)</option>
								</select> 이상 기본 열람
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="levelC">C등급</label></th>
								<td>모든 임직원이 문서 열람</td>
							</tr>
						</tbody>
					</table>
					<p class="tablebtm-infotxt">※ S등급과 C등급은 설정할 수 없습니다.</p>

					<!-- 결재 순서 설정 허용 -->
					<!-- <div class="cont-tit after">
				<strong class="fl">결재 순서 설정 허용</strong>
				<a href="javascript:void(0)" class="icon question tipsIcon vm" style="margin-left:5px"><span class="blind">세부 설명</span></a>
				<div class="tooltip hide" style="left:0;top:0;color:#676767;">
					<div class="tooltip-box" style="left:0;width:500px;">
						<p>‘허용’ 시 기안자 또는 결재자가 결재 및 합의 순서를 설정할 수 있습니다. ‘허용 안 함’ 선택 시 사전 합의 요청 대상을 제외하고 결재가 완료된 후 합의가 진행됩니다.</p>
					</div>
				</div>
			</div>
			<ul class="list-align-col after">
				<li><input type="radio" id="arrowtypeA_step" name="set_authority" value="W"> <label for="arrowtypeA_step">기안자에게만 허용함</label></li>
				<li><input type="radio" id="arrowtypeB_step" name="set_authority" value="WA"> <label for="arrowtypeB_step">기안자, 결재자에게만 허용함</label></li>
				<li><input type="radio" id="not_arrow_step" name="set_authority" value="N" checked> <label for="not_arrow_step">허용 안 함</label></li>
			</ul> -->

					<!-- 결재 서명 설정 허용 -->
					<!-- <div class="cont-tit">
				<strong>결재 서명 설정 허용</strong>
			</div>
			<ul class="list-align-col after">
				<li><input type="radio" id="arrow_sign" name="set_signature" value="Y" checked> <label for="arrow_sign">허용함</label></li>
				<li><input type="radio" id="not_arrow_sign" name="set_signature" value="N"> <label for="not_arrow_sign">허용 안 함</label></li>
			</ul> -->

					<!-- 지연 문서 표시 -->
					<div class="cont-tit after">
						<strong class="fl">지연 문서 표시</strong> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>지연 문서 표시 기간을 선택하면 그 기간 후 관련자의 문서 목록에 빨간색으로 나타납니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="delay_case_3day"
							name="delayed_document" value="3"> <label
							for="delay_case_3day">3일 후</label></li>
						<li><input type="radio" id="delay_case_7day"
							name="delayed_document" value="7" checked=""> <label
							for="delay_case_7day">7일 후</label></li>
						<li><input type="radio" id="delay_case_15day"
							name="delayed_document" value="15"> <label
							for="delay_case_15day">15일 후</label></li>
						<li><input type="radio" id="not_case" name="delayed_document"
							value="0"> <label for="delay_case_15day"> <label
								for="not_case">표시 안 함</label></label></li>
					</ul>

					<!-- 회사 코드 설정 -->
					<div class="cont-tit">
						<strong>회사 코드 설정</strong>
					</div>
					<p>
						<label for="code_company">문서 번호에 사용할 회사 코드를 정하세요. 짧을 수록
							보기에 좋습니다.</label> <input type="text" id="code_company" name="office_code"
							class="txt-input mgl_10" value="GA"
							style="text-transform: uppercase;" maxlength="10">
					</p>

					<!-- 문서 번호 설정 -->
					<p class="cont-tit">
						<strong>문서 번호 설정</strong>
					</p>
					<table class="tableType03">
						<caption>문서 번호 설정</caption>
						<colgroup>
							<col style="width: 130px;">
							<col style="width: 200px;">
							<col>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">1. 회사 코드</th>
								<th scope="col">2. 약칭 및 소속</th>
								<th scope="col">3. 문서 등록 시점</th>
								<th scope="col">4. 일련 번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="gt-align-top">
									<ul class="">
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step1" value="A" checked=""> 사용</label></li>
										<li><label><input type="radio" name="code_step1"
												value="B"> 사용 안 함</label></li>
									</ul>
								</td>
								<td class="gt-align-top">
									<ul>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step2" value="B"> 등록자 소속명</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step2" value="A" checked=""> 약칭</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step2" value="C"> 둘 다 사용</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step2" value="D"> 둘 다 사용 안 함</label></li>
									</ul>
								</td>
								<td class="gt-align-top">
									<ul>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step3" value="A" checked=""> 연, 월, 일
												8자(YYYYMMDD)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step3" value="B"> 연, 월, 일 6자(YYMMDD)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step3" value="C"> 연, 월 6자(YYYYMM)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step3" value="D"> 연, 월 4자(YYMM)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step3" value="E"> 연 4자(YYYY)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step3" value="F"> 연 2자(YY)</label></li>
									</ul>
								</td>
								<td class="gt-align-top">
									<ul>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step4" value="A"> 2자리(ex. 01)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step4" value="B"> 3자리(ex. 001)</label></li>
										<li class="gt-mb-10"><label><input type="radio"
												name="code_step4" value="C" checked=""> 4자리(ex.
												0001)</label></li>
										<li class="gt-mb-10" style="display: none;"><label><input
												type="radio" name="code_step4" value="D" disabled="">
												5자리(ex. 00001)</label></li>
										<li class="gt-mb-10" style="display: none;"><label><input
												type="radio" name="code_step4" value="E" disabled="">
												6자리(ex. 000001)</label></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="cont-tit gt-pt-10">
						<p>※ 4.일련 번호는 3.문서 등록 시점을 기준으로 매겨지므로 문서 등록 시점에 맞는 일련 번호 자리 수를
							선택하세요.</p>
					</div>
					<div class="cont-tit gt-pt-10">
						<input type="hidden" value="AAAC" id="document_code_type">
						<dl class="gt-d-table-row gt-align-middle">
							<dt class="gt-d-table-cell gt-pr-10">결과 보기</dt>
							<dd class="gt-d-table-cell">
								<input type="text" class="txt-input" style="width: 250px;"
									value="GA-지결-20231203-0001" id="result_document_code"
									disabled="disabled">
							</dd>
						</dl>
					</div>

					<!-- SMS 알림 설정 -->
					<div class="cont-tit">
						<strong>SMS 알림 설정</strong>
					</div>
					<ul class="sms-alramset-txt">
						<li>ㆍ 문자의 잔여 건수가 없으면 알림은 발송되지 않습니다.</li>
						<li>ㆍ 발신번호는 하이웍스 대표번호 1661-4370으로 발송됩니다.</li>
						<li>ㆍ 발송된 문자는 문자 &gt; 환경 설정의 문자 차감 순서에 따라 차감됩니다.</li>
						<li>ㆍ 기본 문구가 90bytes를 넘어가면 전송 방법 설정에 따라 분할 발송(SMS) 또는 장문
							발송(LMS)이 될 수 있습니다.</li>
					</ul>
					<table class="tableType02">
						<caption>SMS 알림 설정</caption>
						<colgroup>
							<col style="width: 20%">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">알람 기능</th>
								<td><label class="color-set-6"><input type="radio"
										title="사용" name="sms_alarm" value="Y" checked=""> 사용</label> <label
									class="mgl_20 color-set-6"><input type="radio"
										title="사용 안 함" name="sms_alarm" value="N"> 사용 안 함</label></td>
							</tr>
							<tr>
								<th scope="row">전송 방법</th>
								<td><label class="color-set-6"><input type="radio"
										title="90bytes가 넘을 때 분할 발송" name="sms_sent" value="S"
										checked=""> 90bytes가 넘을 때 분할 발송</label> <label
									class="mgl_20 color-set-6"><input type="radio"
										title="90bytes가 넘을 때 장문 발송 / 3건 차감" name="sms_sent" value="L">
										90bytes가 넘을 때 장문 발송 / 3건 차감</label></td>
							</tr>
						</tbody>
					</table>

					<!-- 보존 연한 후 완전 삭제 허용 -->
					<div class="cont-tit after">
						<strong class="fl">보존 연한 만료 후 삭제 설정</strong> <a
							href="javascript:void(0)" class="icon question tipsIcon vm"
							style="margin-left: 5px"><span class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>결재 완료된 문서가 보존 연한이 만료된 후 삭제 상태로 변경되는 것의 허용 여부를 설정합니다.
									‘허용함’을 선택하면 기안일로부터 만으로 해당하는 연수의 다음 해 1월 1일을 기준으로 문서들을 삭제 상태로
									변경합니다. 삭제된 문서들은 관리자 설정 &gt; 삭제 문서 목록에서 확인할 수 있으며, 복원 또는 완전 삭제할
									수 있습니다. ‘허용 안 함’을 선택하면 보존 연한이 만료되어도 삭제되지 않습니다. 보존 연한이 영구인 문서는
									직접 삭제하지 않는 한, 삭제 문서가 되지 않습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_delete"
							name="document_delete" value="Y"> <label
							for="arrow_delete">허용함</label></li>
						<li><input type="radio" id="not_delete"
							name="document_delete" value="N" checked=""> <label
							for="not_delete">허용 안 함</label></li>
					</ul>

					<!-- 결재 방식 설정 -->
					<div class="cont-tit">
						<strong>결재 방식 설정</strong>
					</div>
					<div class="cont-tit first after">
						<span class="fl">같은 결재선 내에서 선결재</span> <a
							href="javascript:void(0)" class="icon question tipsIcon vm"
							style="margin-left: 5px"><span class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>같은 결재선 내에서 예정 상태인 결재자의 선결재 허용 여부를 설정합니다. ‘허용함’을 선택하면 이전
									결재자보다 먼저 결재할 수 있으며, ‘허용 안 함’을 선택하면 본인 차례에서만 결재할 수 있습니다. 결재 뿐만
									아니라 재무합의, 신청, 처리 결재선 내부의 선결재에 영향을 미칩니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type1" name="fore_approval"
							value="Y" checked=""> <label for="arrow_type1">허용함</label></li>
						<li><input type="radio" id="not_type1" name="fore_approval"
							value="N"> <label for="not_type1">허용 안 함</label></li>
					</ul>

					<div class="cont-tit after">
						<span class="fl">합의 또는 처리 먼저 결재</span> <a
							href="javascript:void(0)" class="icon question tipsIcon vm"
							style="margin-left: 5px"><span class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>합의, 재무 합의자, 처리 결재자들이 기안자의 결재선보다 먼저 결재하는 것의 허용 여부를 설정합니다.
									‘허용함’을 선택하면 합의와 재무 합의자, 처리 결재자는 예정 상태의 문서를 결재할 수 있습니다. ‘허용 안
									함’을 선택하면 결재-합의-재무합의 또는 신청-처리 순으로만 결재할 수 있습니다. `같은 결재선 내에서 선결재`
									허용 여부에 따라 상위의 재무 합의자와 처리 결재자의 결재 가능 여부는 달라질 수 있습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type1-1"
							name="pre_approval" value="Y" checked=""> <label
							for="arrow_type1-1">허용함</label></li>
						<li><input type="radio" id="not_type1-1" name="pre_approval"
							value="N"> <label for="not_type1-1">허용 안 함</label></li>
					</ul>

					<div class="cont-tit after">
						<span class="fl">전결</span> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>결재자들의 '전결' 가능 여부를 설정합니다. 전결이란 사안별 규정에 따른 정식 결재 권한을 받아 상위
									결재자를 모두 대신해 승인하는 방식입니다. '허용함'을 선택하면 결재자는 상위 결재자를 대신해 결재가 가능하며,
									'허용 안 함'을 선택하면 결재자는 상위 결재자를 대신해 결재할 수 없습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" name="all_approval" value="Y"
							checked=""> <label>허용함</label></li>
						<li><input type="radio" name="all_approval" value="N">
							<label>허용 안 함</label></li>
					</ul>

					<div class="cont-tit after">
						<span class="fl">대결</span> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>결재자들의 ‘대결 가능 여부’를 설정합니다. 대결이란 하위 결재자가 최종 결재자 대신 결재하여 문서를
									승인하는 방식입니다. ‘전체 허용’ 선택 시, 최종 직전 결재자가 아닌 사람도 후열 처리를 통해 ‘대결’을 할 수
									있습니다. ‘사용 안 함’ 선택 시, 결재자 중 아무도 대결을 사용할 수 없습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type2"
							name="deputy_approval" value="Y"> <label
							for="arrow_type2">전체 허용</label></li>
						<li><input type="radio" id="part_arrow_type2"
							name="deputy_approval" value="A"> <label
							for="part_arrow_type2">직전 결재자에게만 허용</label></li>
						<li><input type="radio" id="not_type2" name="deputy_approval"
							value="N" checked=""> <label for="not_type2">사용 안
								함</label></li>
					</ul>

					<div class="cont-tit after">
						<span class="fl">후결</span> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>결재자들의 ‘후결 가능 여부'를 설정합니다. 후결이란 최종 결재자가 부재중일 때, 우선 기안을 집행하고
									이후 최종 결재자의 승인 또는 반려를 받는 방식입니다. ‘전체 허용’ 선택 시, 최종 직전 결재자가 아닌 사람도
									후열 처리를 통해 ‘후결’을 요청할 수 있습니다. ‘사용 안 함’ 선택 시, 결재자 중 아무도 후결을 사용할 수
									없습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type3"
							name="after_approval" value="Y"> <label for="arrow_type3">전체
								허용</label></li>
						<li><input type="radio" id="part_arrow_type3"
							name="after_approval" value="A"> <label
							for="part_arrow_type3">직전 결재자에게만 허용</label></li>
						<li><input type="radio" id="not_type3" name="after_approval"
							value="N" checked=""> <label for="not_type3">사용 안
								함</label></li>
					</ul>

					<div class="cont-tit after">
						<span class="fl">후열</span> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>결재자들의 '후열' 가능 여부를 설정합니다. 후열이란 중간 결재자가 출장, 휴가 등 결재할 수 없는
									경우 후열 처리하고 기안을 집행하는 것을 말합니다. 후열 처리된 결재자는 결재 종료 전에 승인 또는 반려하거나,
									결재 종료 후 확인(열람)할 수 있습니다. 같은선 내에서 선결재를 사용하기 위해서는 후열처리가 '허용함'이어야만
									합니다. '허용함'을 선택하면 결재자는 결재자, 합의자, 재무합의자를, 재무합의자는 재무합의자를, 신청결재자는
									신청결재자를, 처리결재자는 처리결재자를 후열처리할 수 있게됩니다. '허용 안 함'을 선택하면 결재자들은 후열처리를
									사용할 수 없게 되며, 같은선 내에서 선결재도 이용 불가하게됩니다. 또한 대결, 후결을 '전체허용'으로 이용할 수
									없습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" name="post_approval" value="Y"
							checked=""> <label>허용함</label></li>
						<li><input type="radio" name="post_approval" value="N">
							<label>허용 안 함</label></li>
					</ul>

					<div class="cont-tit after">
						<span class="fl">합의 반려</span> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>합의자의 ‘반려 가능 여부’를 설정합니다. '허용' 선택 시, 합의자는 문서를 반려할 수 있으며 그
									즉시 문서는 결재 종료됩니다(재무 합의는 항상 합의 반려 '허용'입니다). '허용 안 함' 선택 시, 합의자는
									문서를 '승인'하거나 '협의 요청'만 할 수 있습니다. 협의 요청 시에는 결재 진행이 중단되며, 협의가 완료된 후
									다시 합의자가 의사 표현을 해야 합니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type4" name="opposition"
							value="Y"> <label for="arrow_type4">허용함</label></li>
						<li><input type="radio" id="not_type4" name="opposition"
							value="N" checked=""> <label for="not_type4">허용 안
								함</label></li>
					</ul>

					<!-- 참조자 열람 시기 설정 -->
					<div class="cont-tit after">
						<strong class="fl">참조 열람 시기 설정</strong> <a
							href="javascript:void(0)" class="icon question tipsIcon vm"
							style="margin-left: 5px"><span class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>참조자의 문서 열람 가능 시기를 설정합니다. ‘결재 시작’을 선택하면 참조자로 포함된 문서가 등록됨과
									동시에 예정에서 확인할 수 있으며, 확인 상태에 따라 예정-진행-완료로 이동합니다. ‘결재 완료’를 선택하면
									참조자로 포함된 문서의 모든 결재 및 합의가 완료되었을 때 완료에서만 확인할 수 있습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type5" name="reference"
							value="W" checked=""> <label for="arrow_type5">결재
								시작</label></li>
						<li><input type="radio" id="not_type5" name="reference"
							value="C"> <label for="not_type5">결재 완료</label></li>
					</ul>

					<!-- 내용 수정 -->
					<div class="cont-tit after">
						<strong class="fl">내용 수정</strong> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>내용 수정 허용 여부를 설정합니다. '기안자 및 결재자 허용'을 선택하면 기안자 뿐만 아니라 기안자와
									같은 결재선 내 결재자가 내용 수정할 수 있는 권한이 주어집니다. '허용 안 함'을 선택하면 기안자와 결재자 모두
									내용 수정을 할 수 없습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="allow_approver_modify_all"
							name="allow_approver_modify" value="Y"> <label
							for="allow_approver_modify_all">기안자 및 결재자 허용</label></li>
						<li><input type="radio" id="allow_approver_modify_writer"
							name="allow_approver_modify" value="N" checked=""> <label
							for="allow_approver_modify_writer">기안자만 허용</label></li>
						<li><input type="radio" id="allow_approver_modify_none"
							name="allow_approver_modify" value="A"> <label
							for="allow_approver_modify_none">허용 안 함</label></li>
					</ul>

					<!-- 첨부 파일 추가 및 삭제 설정 -->
					<div class="cont-tit after">
						<strong class="fl">첨부 파일 추가 및 삭제 설정</strong> <a
							href="javascript:void(0)" class="icon question tipsIcon vm"
							style="margin-left: 5px"><span class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>결재 진행 중 또는 완료 문서의 첨부 파일 추가 및 삭제의 허용 여부를 설정합니다. ‘허용함’을
									선택하면 결재자들이 언제든지 결재 문서에 첨부 파일을 추가하거나 삭제할 수 있습니다. ‘허용 안 함’을 선택하면
									결재자들은 모든 결재 문서에 대해 첨부 파일을 추가 또는 삭제할 수 없습니다. 기안자 또한 내용 수정을 통해서만
									첨부 파일을 수정할 수 있습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type7" name="attached_file"
							value="Y" checked=""> <label for="arrow_type7">허용함</label></li>
						<li><input type="radio" id="not_type7" name="attached_file"
							value="N"> <label for="not_type7">허용 안 함</label></li>
					</ul>

					<!-- 열람 부서 추가 및 삭제 설정 -->
					<div class="cont-tit after">
						<strong class="fl">열람 부서</strong> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">허용함으로 설정한 경우, 결재 문서에 열람부서를 설정할 수 있습니다. 단 문서
								등급과 종류에 따라 열람 부서 설정이 불가능할 수 있습니다.</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>허용함으로 설정한 경우, 결재 문서에 열람부서를 설정할 수 있습니다. 단 문서 등급과 종류에 따라 열람
									부서 설정이 불가능할 수 있습니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type10"
							name="added_department" value="Y"> <label
							for="arrow_type10">허용함</label></li>
						<li><input type="radio" id="not_type10"
							name="added_department" value="N" checked=""> <label
							for="not_type10">허용 안 함</label></li>
					</ul>
					<div class="cnt-tit after hide" id="department_agree">
						<p class="mgt_10">주의사항: '허용 안 함'으로 변경 시, 열람 부서가 설정된 기존 문서에서 열람
							부서가 삭제되며 되돌릴 수 없습니다.</p>
						<label class="fl mgt_10"><input type="checkbox"
							id="department_agree_check"> 주의사항 확인 및 열람 부서 삭제 동의</label>
					</div>

					<!-- 기안 취소 설정 -->
					<div class="cont-tit after">
						<strong class="fl">기안 취소 설정</strong> <a href="javascript:void(0)"
							class="icon question tipsIcon vm" style="margin-left: 5px"><span
							class="blind">세부 설명</span></a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="left: 0; width: 500px;">
								<p>기안자가 기안 취소한 문서의 처리 방법을 설정합니다. '반려 처리'를 선택하면 기안자에 반려 표시가
									되며, 결재 반려와 같이 알림이 가고 완료 및 문서함 &gt; 반려에 노출됩니다. '문서 삭제'를 선택하면 기안
									취소 시 문서 자체가 삭제됩니다.</p>
							</div>
						</div>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type8"
							name="document_cancel" value="return"> <label
							for="arrow_type8">반려 처리</label></li>
						<li><input type="radio" id="not_type8" name="document_cancel"
							value="cancel" checked=""> <label for="not_type8">문서
								삭제</label></li>
					</ul>

					<div class="cont-tit after">
						<strong class="fl">결재 의견 삭제 설정</strong>
					</div>
					<ul class="list-align-col after">
						<li><input type="radio" id="arrow_type9"
							name="delete_comment" value="Y" checked=""> <label
							for="arrow_type9">허용함</label></li>
						<li><input type="radio" id="not_type9" name="delete_comment"
							value="N"> <label for="not_type9">허용 안 함</label></li>
					</ul>

					<div class="bt_left mgt_30">
						<button type="button"
							onclick="ApprovalSetting.saveBasicSetting();">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		set_document_code_result('AAAC');
		autoComplete();

		ApprovalSetting._departmentConfig = 'N';
		var fore_prev_value = $j("input:radio[name='fore_approval']:checked")
				.val();
		var post_prev_value = $j("input:radio[name='post_approval']:checked")
				.val();

		// 참조 열람 시기 설정
		$j(document)
				.on(
						'change',
						'input[name="reference"]',
						function(e) {
							e.preventDefault();
							if (!confirm('참조 열람 시기 설정을 변경하면 이후에 등록된 문서부터 적용됩니다. 변경하시겠습니까?')) {
								if ($j(this).val() === 'W') {
									$j('input[name="reference"][value="C"]')
											.prop('checked', true);
								} else {
									$j('input[name="reference"][value="W"]')
											.prop('checked', true);
								}
							}
						});

		$j(document).on('blur', '#code_company', function(e) {
			var code_reg = new RegExp('^[A-Z가-힣0-9]{2,10}$');
			if (!code_reg.test($j(this).val().toUpperCase())) {
				showWarningToast('한글, 숫자, 영문 10자 이내 입력 가능', 1);
				$j(this).focus();
				return false;
			}
		});

		$j(document).on('keyup', '#code_company', function(e) {
			set_document_code_result($j('#document_code_type').val());
		});

		$j(document).on('click', '.js-delete-approval-last-user', function(e) {
			$j(this).closest('li.js-approval-last-user-list').remove();
		});

		$j(document).on('change', 'input:radio[name="code_step1"]',
				function(e) {
					var codes = $j('#document_code_type').val().split('');
					codes[0] = $j(this).val();
					set_document_code_result(codes.join(''));
				});
		$j(document).on('change', 'input:radio[name="code_step2"]',
				function(e) {
					var codes = $j('#document_code_type').val().split('');
					codes[1] = $j(this).val();
					set_document_code_result(codes.join(''));
				});
		$j(document).on('change', 'input:radio[name="code_step3"]',
				function(e) {
					var codes = $j('#document_code_type').val().split('');
					codes[2] = $j(this).val();
					set_document_code_result(codes.join(''));
				});
		$j(document).on('change', 'input:radio[name="code_step4"]',
				function(e) {
					var codes = $j('#document_code_type').val().split('');
					codes[3] = $j(this).val();
					set_document_code_result(codes.join(''));
				});

		$j(document)
				.on(
						'change',
						'input:radio[name="post_approval"]',
						function(e) {
							if ($j("input:radio[name='fore_approval']:checked")
									.val() === "Y"
									&& $j(this).val() === "N") {
								$j(this).prop('checked', false);
								$j(
										'input[name="post_approval"][value='
												+ post_prev_value + ']').prop(
										'checked', true);
								alert("[후열]을 [허용 안 함]하려면, [같은선 내에서 선결재]를 [허용 안 함]으로 변경 해야합니다. 해당 사항 변경 후, 다시 시도해주세요.")
							} else {
								post_prev_value = $j(this).val();
							}
						});
		$j(document)
				.on(
						'change',
						'input:radio[name="fore_approval"]',
						function(e) {
							if ($j("input:radio[name='post_approval']:checked")
									.val() === "N"
									&& $j(this).val() === "Y") {
								$j(this).prop('checked', false);
								$j(
										'input[name="fore_approval"][value='
												+ fore_prev_value + ']').prop(
										'checked', true);
								alert("[같은선 내에서 선결재]를 [허용]하려면, [후열]을 [허용]으로 변경해야합니다. 해당 사항 변경 후, 다시 시도해주세요.")
							} else {
								fore_prev_value = $j(this).val();
							}
						});

		$j(document)
				.on(
						'change',
						'input[name="added_department"]',
						function(e) {
							if ($j(this).val() === 'Y') {
								showNoticeToast(ApprovalLang
										.getMessage('APPROVAL_ADDED_DEPARTMENT_ALLOW_NOTICE'));
								$j('#department_agree').hide();
							} else if ($j(this).val() === 'N'
									&& ApprovalSetting._departmentConfig === "Y") {
								$j('#department_agree').show();
							}
						});
		$j(document).on("change", '#department_agree_check', function() {
			if ($j(this).prop("checked")) {
				ApprovalSetting._departmentDeleteAgree = true;
			} else {
				ApprovalSetting._departmentDeleteAgree = false;
			}
		});

		function set_document_code_result(pDocumentCodeType) {
			console.log(pDocumentCodeType);
			$j('#document_code_type').val(pDocumentCodeType);

			var codes = pDocumentCodeType.split('');
			var result_code = [];
			if (codes[0] === 'A') {
				result_code.push($j('#code_company').val().toUpperCase());
			}

			if (codes[1] === 'A') {
				result_code.push('지결');
			} else if (codes[1] === 'B') {
				result_code.push('회계팀');
			} else if (codes[1] === 'C') {
				result_code.push('회계팀');
				result_code.push('지결');
			}

			if (codes[2] === 'A' || codes[2] === 'B') {
				if ($j.inArray(codes[3], [ 'A', 'B', 'C' ]) === -1) {
					codes[3] = 'C';
				}
			} else if (codes[2] === 'C' || codes[2] === 'D' || codes[2] === 'E'
					|| codes[2] === 'F') {
				if ($j.inArray(codes[3], [ 'C', 'D', 'E' ]) === -1) {
					codes[3] = 'C';
				}
			}

			$j('input:radio[name="code_step4"]:disabled').each(function(k, v) {
				$j(v).closest('li').show();
				$j(v).prop('disabled', false);
			});

			$j('input:radio[name="code_step4"]').each(
					function(k, v) {
						if ($j(v).val() === codes[3]) {
							$j(v).prop('checked', true);
						}

						if (codes[2] === 'A' || codes[2] === 'B') {
							if (k > 2) {
								$j(v).closest('li').hide();
								$j(v).prop('disabled', true);
							}
						} else if (codes[2] === 'C' || codes[2] === 'D'
								|| codes[2] === 'E' || codes[2] === 'F') {
							if (k < 2) {
								$j(v).closest('li').hide();
								$j(v).prop('disabled', true);
							}
						}
					});

			if (codes[2] === 'A') {
				result_code
						.push($j.datepicker.formatDate('yymmdd', new Date()));
			} else if (codes[2] === 'B') {
				result_code.push($j.datepicker.formatDate('ymmdd', new Date()));
			} else if (codes[2] === 'C') {
				result_code.push($j.datepicker.formatDate('yymm', new Date()));
			} else if (codes[2] === 'D') {
				result_code.push($j.datepicker.formatDate('ymm', new Date()));
			} else if (codes[2] === 'E') {
				result_code.push($j.datepicker.formatDate('yy', new Date()));
			} else if (codes[2] === 'F') {
				result_code.push($j.datepicker.formatDate('y', new Date()));
			} else {
				result_code
						.push($j.datepicker.formatDate('yymmdd', new Date()));
			}

			if (codes[3] === 'A') {
				result_code.push('01');
			} else if (codes[3] === 'B') {
				result_code.push('001');
			} else if (codes[3] === 'C') {
				result_code.push('0001');
			} else if (codes[3] === 'D') {
				result_code.push('00001');
			} else if (codes[3] === 'E') {
				result_code.push('000001');
			}

			$j('#document_code_type').val(codes.join(''));
			$j('#result_document_code').val(result_code.join('-'));
		}
	</script>
</div>
