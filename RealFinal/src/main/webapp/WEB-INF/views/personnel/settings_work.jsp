<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="router_split_item" class="split-item right"
	style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-5aa223d2="" class="setting-tab">
			<div data-v-5aa223d2="" class="el-tabs el-tabs--top">
				<div class="el-tabs__header is-top">
					<div class="el-tabs__nav-wrap is-top">
						<div class="el-tabs__nav-scroll">
							<div role="tablist" class="el-tabs__nav is-top"
								style="transform: translateX(0px);">
								<div class="el-tabs__active-bar is-top"
									style="width: 110px; transform: translateX(0px);"></div>
								<div id="tab-WorkTab" aria-controls="pane-WorkTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">근무</div>
								<div id="tab-VacationTab" aria-controls="pane-VacationTab"
									role="tab" tabindex="-1" class="el-tabs__item is-top">휴가</div>
								<div id="tab-WorkCheckTab" aria-controls="pane-WorkCheckTab"
									role="tab" tabindex="-1" class="el-tabs__item is-top">근무체크</div>
								<div id="tab-DailyWorkRuleTab"
									aria-controls="pane-DailyWorkRuleTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">일일근무규칙</div>
								<div id="tab-PayTab" aria-controls="pane-PayTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">급여</div>
								<div id="tab-EContractTab" aria-controls="pane-EContractTab"
									role="tab" tabindex="-1" class="el-tabs__item is-top">전자계약</div>
							</div>
						</div>
					</div>
				</div>
				<div class="el-tabs__content">
					<div data-v-5aa223d2="" role="tabpanel" id="pane-WorkTab"
						aria-labelledby="tab-WorkTab" class="el-tab-pane"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-VacationTab" aria-labelledby="tab-VacationTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-WorkCheckTab" aria-labelledby="tab-WorkCheckTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-DailyWorkRuleTab" aria-labelledby="tab-DailyWorkRuleTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-PayTab" aria-labelledby="tab-PayTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-EContractTab" aria-labelledby="tab-EContractTab"
						class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-750d2d9c="" data-v-5aa223d2="" class="container">
				<!---->
				<!---->
				<div data-v-84e8d3e2="" data-v-750d2d9c="" class="work-section">
					<h1 data-v-84e8d3e2="">근무관리 사용 여부</h1>
					<div data-v-84e8d3e2="" class="hw-btntype-radio-group-nomal mt-20">
						<label data-v-84e8d3e2="" class="hw-btntype-radio-label"><input
							data-v-84e8d3e2="" type="radio" value="Y"
							class="hw-btntype-radio-input"><span data-v-84e8d3e2=""
							class="hw-btntype-radio-text">사용</span></label><label data-v-84e8d3e2=""
							class="hw-btntype-radio-label"><input data-v-84e8d3e2=""
							type="radio" value="N" class="hw-btntype-radio-input"><span
							data-v-84e8d3e2="" class="hw-btntype-radio-text">사용 안 함</span></label>
					</div>
					<div data-v-84e8d3e2="" class="submit-section">
						<button data-v-f8d3258e="" data-v-84e8d3e2="" type="button"
							class="hw-button primary">
							<!---->
							<span data-v-f8d3258e="" class="label">저장</span>
							<!---->
						</button>
					</div>
				</div>
				<div data-v-750d2d9c="" class="mt-40">
					<div data-v-750d2d9c="" class="work-section status-manage-div">
						<h1 data-v-750d2d9c="">근무상태 관리</h1>
						<p data-v-750d2d9c="">업무, 외출, 외근 등의 근무상태를 생성하고, 근무시간 포함 여부를
							설정하세요. 근무상태의 근무시간 포함 여부에 따라 일별 근무시간에서 제외되거나 추가됩니다.</p>
						<p data-v-750d2d9c="">사용자가 [내 근무현황] 페이지에서 현재의 근무상태를 체크할 수
							있습니다.</p>
						<button data-v-f8d3258e="" data-v-750d2d9c="" type="button"
							class="hw-button mt-20 text">
							<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
								data-v-f8d3258e="" class="label">근무상태 추가 </span>
							<!---->
						</button>
						<table data-v-750d2d9c=""
							class="setting-table fixed-size-table-955 center mt-20">
							<thead data-v-750d2d9c="">
								<tr data-v-750d2d9c="">
									<th data-v-750d2d9c="">근무상태</th>
									<th data-v-750d2d9c="">근무시간 포함 여부</th>
									<th data-v-750d2d9c="">사용여부</th>
									<th data-v-750d2d9c="">수정 / 삭제</th>
								</tr>
							</thead>
							<tbody data-v-750d2d9c="">
								<tr data-v-750d2d9c="">
									<td data-v-750d2d9c="" class="text-left">업무</td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">포함</span></td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">사용</span></td>
									<td data-v-750d2d9c=""><button data-v-cde747bc=""
											data-v-750d2d9c="" type="button"
											class="hu-button secondary xs">
											<!---->
											<span data-v-cde747bc="" class="label">수정</span>
											<!---->
										</button>
										<button data-v-cde747bc="" data-v-750d2d9c="" type="button"
											class="hu-button info xs">
											<!---->
											<span data-v-cde747bc="" class="label"> 삭제 </span>
											<!---->
										</button></td>
									<!---->
									<!---->
									<!---->
									<!---->
								</tr>
								<tr data-v-750d2d9c="">
									<td data-v-750d2d9c="" class="text-left">외출</td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">미포함</span></td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">사용</span></td>
									<td data-v-750d2d9c=""><button data-v-cde747bc=""
											data-v-750d2d9c="" type="button"
											class="hu-button secondary xs">
											<!---->
											<span data-v-cde747bc="" class="label">수정</span>
											<!---->
										</button>
										<button data-v-cde747bc="" data-v-750d2d9c="" type="button"
											class="hu-button info xs">
											<!---->
											<span data-v-cde747bc="" class="label"> 삭제 </span>
											<!---->
										</button></td>
									<!---->
									<!---->
									<!---->
									<!---->
								</tr>
								<tr data-v-750d2d9c="">
									<td data-v-750d2d9c="" class="text-left">회의</td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">포함</span></td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">사용</span></td>
									<td data-v-750d2d9c=""><button data-v-cde747bc=""
											data-v-750d2d9c="" type="button"
											class="hu-button secondary xs">
											<!---->
											<span data-v-cde747bc="" class="label">수정</span>
											<!---->
										</button>
										<button data-v-cde747bc="" data-v-750d2d9c="" type="button"
											class="hu-button info xs">
											<!---->
											<span data-v-cde747bc="" class="label"> 삭제 </span>
											<!---->
										</button></td>
									<!---->
									<!---->
									<!---->
									<!---->
								</tr>
								<tr data-v-750d2d9c="">
									<td data-v-750d2d9c="" class="text-left">외근</td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">포함</span></td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">사용</span></td>
									<td data-v-750d2d9c=""><button data-v-cde747bc=""
											data-v-750d2d9c="" type="button"
											class="hu-button secondary xs">
											<!---->
											<span data-v-cde747bc="" class="label">수정</span>
											<!---->
										</button>
										<button data-v-cde747bc="" data-v-750d2d9c="" type="button"
											class="hu-button info xs">
											<!---->
											<span data-v-cde747bc="" class="label"> 삭제 </span>
											<!---->
										</button></td>
									<!---->
									<!---->
									<!---->
									<!---->
								</tr>
								<tr data-v-750d2d9c="">
									<td data-v-750d2d9c="" class="text-left">휴식</td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">미포함</span></td>
									<td data-v-750d2d9c="" class="text-left"><span
										data-v-750d2d9c="">미사용</span></td>
									<td data-v-750d2d9c=""><button data-v-cde747bc=""
											data-v-750d2d9c="" type="button"
											class="hu-button secondary xs">
											<!---->
											<span data-v-cde747bc="" class="label">수정</span>
											<!---->
										</button>
										<button data-v-cde747bc="" data-v-750d2d9c="" type="button"
											class="hu-button info xs">
											<!---->
											<span data-v-cde747bc="" class="label"> 삭제 </span>
											<!---->
										</button></td>
									<!---->
									<!---->
									<!---->
									<!---->
								</tr>
								<!---->
								<!---->
							</tbody>
						</table>
					</div>
					<div data-v-a5b3c614="" data-v-750d2d9c="" class="work-section">
						<h1 data-v-a5b3c614="">회사 휴(무)일 설정</h1>
						<div data-v-a5b3c614="" class="holiday-list-container">
							<div data-v-a5b3c614="" class="holiday-item-wrapper">
								<label data-v-682bb766="" data-v-a5b3c614=""><div
										data-v-682bb766="" title="공휴일(일요일제외)"
										class="hw-checkbox checked">
										<span data-v-682bb766="" class="checkbox-input"></span><input
											data-v-682bb766="" type="checkbox" checked="checked"
											class="checkbox-original"><span data-v-682bb766=""
											class="label">공휴일(일요일제외)</span>
									</div></label>
								<!---->
							</div>
							<div data-v-a5b3c614="" class="holiday-item-wrapper">
								<label data-v-682bb766="" data-v-a5b3c614=""><div
										data-v-682bb766="" title="대체공휴일" class="hw-checkbox checked">
										<span data-v-682bb766="" class="checkbox-input"></span><input
											data-v-682bb766="" type="checkbox" checked="checked"
											class="checkbox-original"><span data-v-682bb766=""
											class="label">대체공휴일</span>
									</div></label>
								<!---->
							</div>
							<div data-v-a5b3c614="" class="holiday-item-wrapper">
								<label data-v-682bb766="" data-v-a5b3c614=""><div
										data-v-682bb766="" title="근로자의 날(5/1)"
										class="hw-checkbox checked">
										<span data-v-682bb766="" class="checkbox-input"></span><input
											data-v-682bb766="" type="checkbox" checked="checked"
											class="checkbox-original"><span data-v-682bb766=""
											class="label">근로자의 날(5/1)</span>
									</div></label>
								<!---->
							</div>
						</div>
						<button data-v-f8d3258e="" data-v-a5b3c614="" type="button"
							class="hw-button text">
							<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
								data-v-f8d3258e="" class="label">휴일 추가</span>
							<!---->
						</button>
					</div>
					<div data-v-20fdcc60="" data-v-750d2d9c="" class="work-section">
						<h1 data-v-20fdcc60="">알림 기본 설정</h1>
						<p data-v-20fdcc60="">근로형태 페이지에서 설정한 초과근무알림에 대한 발송 대상을 설정합니다.</p>
						<div data-v-20fdcc60="" class="receiver-wrapper mt-20">
							<label data-v-682bb766="" data-v-20fdcc60=""><div
									data-v-682bb766="" title="본인 사용자" class="hw-checkbox">
									<span data-v-682bb766="" class="checkbox-input"></span><input
										data-v-682bb766="" type="checkbox" checked="checked"
										class="checkbox-original"><span data-v-682bb766=""
										class="label">본인 사용자</span>
								</div></label><label data-v-682bb766="" data-v-20fdcc60=""><div
									data-v-682bb766="" title="근무관리자" class="hw-checkbox">
									<span data-v-682bb766="" class="checkbox-input"></span><input
										data-v-682bb766="" type="checkbox" checked="checked"
										class="checkbox-original"><span data-v-682bb766=""
										class="label">근무관리자</span>
								</div></label>
							<div data-v-20fdcc60="" class="head-of-org">
								<label data-v-682bb766="" data-v-20fdcc60=""><div
										data-v-682bb766="" title="조직장" class="hw-checkbox">
										<span data-v-682bb766="" class="checkbox-input"></span><input
											data-v-682bb766="" type="checkbox" checked="checked"
											class="checkbox-original"><span data-v-682bb766=""
											class="label">조직장</span>
									</div></label>
								<div data-v-20fdcc60="" role="radiogroup" class="el-radio-group">
									<label data-v-20fdcc60="" role="radio" aria-disabled="true"
										tabindex="0" class="el-radio is-disabled"><span
										class="el-radio__input is-disabled"><span
											class="el-radio__inner"></span><input type="radio"
											aria-hidden="true" disabled="disabled" tabindex="-1"
											autocomplete="off" class="el-radio__original" value="P"></span><span
										class="el-radio__label">소속조직장까지<!----></span></label><label
										data-v-20fdcc60="" role="radio" aria-disabled="true"
										tabindex="-1" class="el-radio is-disabled"><span
										class="el-radio__input is-disabled"><span
											class="el-radio__inner"></span><input type="radio"
											aria-hidden="true" disabled="disabled" tabindex="-1"
											autocomplete="off" class="el-radio__original" value="Y"></span><span
										class="el-radio__label">상위조직장까지<!----></span></label>
								</div>
							</div>
							<label data-v-682bb766="" data-v-20fdcc60=""><div
									data-v-682bb766="" title="인사관리자" class="hw-checkbox">
									<span data-v-682bb766="" class="checkbox-input"></span><input
										data-v-682bb766="" type="checkbox" checked="checked"
										class="checkbox-original"><span data-v-682bb766=""
										class="label">인사관리자</span>
								</div></label>
						</div>
						<div data-v-20fdcc60="" class="submit-section">
							<button data-v-f8d3258e="" data-v-20fdcc60="" type="button"
								class="hw-button primary">
								<!---->
								<span data-v-f8d3258e="" class="label">저장</span>
								<!---->
							</button>
						</div>
					</div>
					<div data-v-750d2d9c="" class="work-section">
						<h1>근무시간 출력 단위</h1>
						<p>근무현황에 표시될 근무시간의 표시 단위를 선택할 수 있습니다. 근무 누적시간에도 선택한 표시단위가
							출력됩니다.</p>
						<p>예) 초단위까지 : 8시간 10분 30초 , 분단위까지 : 8시간 10분</p>
						<div class="mt-20">
							<div role="radiogroup" class="el-radio-group">
								<label role="radio" tabindex="0" class="el-radio mr-20"><span
									class="el-radio__input"><span class="el-radio__inner"></span><input
										type="radio" aria-hidden="true" tabindex="-1"
										autocomplete="off" class="el-radio__original" value="S"></span><span
									class="el-radio__label">초 단위까지 표시<!----></span></label><label
									role="radio" tabindex="0" class="el-radio is-checked"
									aria-checked="true"><span
									class="el-radio__input is-checked"><span
										class="el-radio__inner"></span><input type="radio"
										aria-hidden="true" tabindex="-1" autocomplete="off"
										class="el-radio__original" value="M"></span><span
									class="el-radio__label">분 단위까지 표시<!----></span></label>
							</div>
						</div>
						<div class="submit-section">
							<button data-v-f8d3258e="" type="button"
								class="hw-button primary">
								<!---->
								<span data-v-f8d3258e="" class="label">저장</span>
								<!---->
							</button>
						</div>
					</div>
					<div data-v-750d2d9c="" class="work-section">
						<h1 data-v-750d2d9c="">PC 자동종료 기능</h1>
						<p data-v-750d2d9c="">사용자별 계획된 퇴근시간을 기준으로, 근무시간 종료 후 설정에 따라
							사용자의 PC를 자동으로 종료하는 기능입니다</p>
						<p data-v-750d2d9c="">- PC자동 종료 기능은 사용자가 하이웍스 메신저를 설치하고, 메신저에
							로그인되었을 때에만 동작합니다.</p>
						<p data-v-750d2d9c="">- PC자동 종료 기능을 [사용]으로 설정하면 사용자의 근무 종료시간과
							설정에 따라 PC가 자동으로 종료됩니다. 유의하여 설정하세요.</p>
						<p data-v-750d2d9c="">- 근로형태가 선택적 근로시간제인 경우, 퇴근시간이 특정되지 않기 때문에
							PC자동종료 기능을 사용할 수 없습니다.</p>
						<div data-v-750d2d9c="" class="mt-20">
							<label data-v-750d2d9c="" role="radio" tabindex="0"
								class="el-radio mr-20"><span class="el-radio__input"><span
									class="el-radio__inner"></span><input type="radio"
									aria-hidden="true" tabindex="-1" autocomplete="off"
									class="el-radio__original" value="Y"></span><span
								class="el-radio__label">사용<!----></span></label><label
								data-v-750d2d9c="" role="radio" aria-checked="true" tabindex="0"
								class="el-radio is-checked"><span
								class="el-radio__input is-checked"><span
									class="el-radio__inner"></span><input type="radio"
									aria-hidden="true" tabindex="-1" autocomplete="off"
									class="el-radio__original" value="N"></span><span
								class="el-radio__label">사용 안 함<!----></span></label>
						</div>
						<div data-v-750d2d9c="" class="submit-section">
							<button data-v-f8d3258e="" data-v-750d2d9c="" type="button"
								class="hw-button primary">
								<!---->
								<span data-v-f8d3258e="" class="label">저장</span>
								<!---->
							</button>
						</div>
					</div>
					<!---->
				</div>
				<div data-v-f4a71e8c="" data-v-750d2d9c=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog sm-title" style="margin-top: 15vh;">
						<div class="el-dialog__header">
							<div data-v-f4a71e8c="" class="modal-title">회사 휴(무)일 추가</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-f4a71e8c="" class="dialog-footer"><button
									data-v-f8d3258e="" data-v-f4a71e8c="" type="button"
									class="hw-button secondary">
									<!---->
									<span data-v-f8d3258e="" class="label">취소</span>
									<!---->
								</button>
								<button data-v-f8d3258e="" data-v-f4a71e8c="" type="button"
									disabled="disabled" class="hw-button primary">
									<!---->
									<span data-v-f8d3258e="" class="label">확인</span>
									<!---->
								</button></span>
						</div>
					</div>
				</div>
				<div data-v-89219e8e="" data-v-750d2d9c=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog md" style="margin-top: 15vh;">
						<div class="el-dialog__header">
							<div data-v-89219e8e="" class="modal-title">정식 사용일 지정</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-89219e8e="" class="dialog-footer"><div
									data-v-89219e8e="">
									<button data-v-f8d3258e="" data-v-89219e8e="" type="button"
										class="hw-button secondary">
										<!---->
										<span data-v-f8d3258e="" class="label">취소</span>
										<!---->
									</button>
									<button data-v-f8d3258e="" data-v-89219e8e="" type="button"
										class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">확인</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
				<div data-v-68830054="" data-v-750d2d9c=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog md" style="margin-top: 15vh;">
						<div class="el-dialog__header">
							<div data-v-68830054="" class="modal-title">구버전 인사관리 사용자의
								경우</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-68830054="" class="dialog-footer"><div
									data-v-68830054="">
									<button data-v-f8d3258e="" data-v-68830054="" type="button"
										class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">확인</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
				<div data-v-fe694228="" data-v-750d2d9c=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 750px;">
						<div class="el-dialog__header">
							<div data-v-fe694228="" class="modal-title">근무관리 정식사용일 지정</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<!---->
					</div>
				</div>
				<div data-v-a48e80e0="" data-v-750d2d9c=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 700px;">
						<div class="el-dialog__header">
							<div data-v-a48e80e0="" class="modal-title">마이그레이션 신청 안내</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<!---->
					</div>
				</div>
				<div data-v-4bc48bc3="" data-v-750d2d9c=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 700px;">
						<div class="el-dialog__header">
							<div data-v-4bc48bc3="" class="modal-title">구인사관리 결재 중인 문서
								확인</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<!---->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

