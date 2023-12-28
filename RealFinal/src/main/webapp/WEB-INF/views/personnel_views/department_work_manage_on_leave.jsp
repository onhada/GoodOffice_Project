<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="router_split_item" class="split-item right"
	style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-22ac11e0="" class="flexible-tab">
			<div data-v-22ac11e0="" class="el-tabs el-tabs--top">
				<div class="el-tabs__header is-top">
					<div class="el-tabs__nav-wrap is-top">
						<div class="el-tabs__nav-scroll">
							<div role="tablist" class="el-tabs__nav is-top is-stretch"
								style="transform: translateX(0px);">
								<div class="el-tabs__active-bar is-top"
									style="width: 75px; transform: translateX(413px);"></div>
								<div id="tab-AttendanceCriteriaTab"
									aria-controls="pane-AttendanceCriteriaTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">기준 근무시간</div>
								<div id="tab-VacationStatusTab"
									aria-controls="pane-VacationStatusTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">휴가현황</div>
								<div id="tab-ManuallyCreateVacationTab"
									aria-controls="pane-ManuallyCreateVacationTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">수동휴가생성</div>
								<div id="tab-SetRestPersonTab"
									aria-controls="pane-SetRestPersonTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">휴직자설정</div>
								<div id="tab-MonthlyWorkStatusTab"
									aria-controls="pane-MonthlyWorkStatusTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근태현황</div>
								<div id="tab-ConfirmWorkCheckTab"
									aria-controls="pane-ConfirmWorkCheckTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근무체크확인</div>
								<div id="tab-DailyWorkStandardManangeTab"
									aria-controls="pane-DailyWorkStandardManangeTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">일근무기준관리</div>
							</div>
						</div>
					</div>
				</div>
				<div class="el-tabs__content">
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-AttendanceCriteriaTab"
						aria-labelledby="tab-AttendanceCriteriaTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-VacationStatusTab"
						aria-labelledby="tab-VacationStatusTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-ManuallyCreateVacationTab"
						aria-labelledby="tab-ManuallyCreateVacationTab"
						class="el-tab-pane" style="display: none;"></div>
					<!---->
					<div data-v-22ac11e0="" role="tabpanel" id="pane-SetRestPersonTab"
						aria-labelledby="tab-SetRestPersonTab" class="el-tab-pane"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-MonthlyWorkStatusTab"
						aria-labelledby="tab-MonthlyWorkStatusTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-ConfirmWorkCheckTab"
						aria-labelledby="tab-ConfirmWorkCheckTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-DailyWorkStandardManangeTab"
						aria-labelledby="tab-DailyWorkStandardManangeTab"
						class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-58f68ad7="" data-v-22ac11e0="" class="container">
				<section data-v-58f68ad7="">
					<p data-v-58f68ad7="" class="mb-30 font-size-14">
						휴직자를 추가, 수정, 삭제할 수 있으며, 설정 시 실제 근태에 다음 날부터 반영됩니다. <br
							data-v-58f68ad7=""> 휴직 기간이 만료된 직원은 휴직자관리에서 수동으로 [삭제]해야 합니다.
						휴직자관리에서 삭제한 이후, 다음 날부터 근태가 정상처리 됩니다.
					</p>
					<div data-v-58f68ad7="" class="d-flex justify-content-between">
						<button data-v-f8d3258e="" data-v-58f68ad7="" type="button"
							class="hw-button text">
							<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
								data-v-f8d3258e="" class="label">휴직자 추가 </span>
							<!---->
						</button>
						<button data-v-f8d3258e="" data-v-58f68ad7="" type="button"
							class="hw-button pill-shape-outline ml-15 font-size-13">
							<!---->
							<span data-v-f8d3258e="" class="label"> 과거 휴직자 내역 </span>
							<!---->
						</button>
					</div>
					<table data-v-58f68ad7="" class="setting-table center mt-20">
						<colgroup data-v-58f68ad7="">
							<col data-v-58f68ad7="" style="width: 20%;">
							<col data-v-58f68ad7="" style="width: 20%;">
							<col data-v-58f68ad7="" style="width: auto;">
							<col data-v-58f68ad7="" style="width: 280px;">
							<col data-v-58f68ad7="" style="width: 15%;">
						</colgroup>
						<thead data-v-58f68ad7="">
							<tr data-v-58f68ad7="">
								<th data-v-58f68ad7="">이름(ID)</th>
								<th data-v-58f68ad7="">소속</th>
								<th data-v-58f68ad7="">사유</th>
								<th data-v-58f68ad7="">기간</th>
								<th data-v-58f68ad7=""></th>
							</tr>
						</thead>
						<tbody data-v-58f68ad7="">
							<!---->
							<tr data-v-58f68ad7="">
								<td data-v-58f68ad7="" class="text-left">김이사(kim)</td>
								<td data-v-58f68ad7="" class="text-left">생산1팀</td>
								<td data-v-58f68ad7="" class="text-left">ㅇㅇ</td>
								<td data-v-58f68ad7="">2023-12-12 ~ 2023-12-14</td>
								<td data-v-58f68ad7=""><button data-v-f8d3258e=""
										data-v-58f68ad7="" type="button"
										class="hw-button secondary sm">
										<!---->
										<span data-v-f8d3258e="" class="label">수정 </span>
										<!---->
									</button>
									<button data-v-f8d3258e="" data-v-58f68ad7="" type="button"
										class="hw-button info sm">
										<!---->
										<span data-v-f8d3258e="" class="label">삭제 </span>
										<!---->
									</button></td>
							</tr>
							<!---->
						</tbody>
					</table>
					<div data-v-58f68ad7="" class="pt-10 font-size-14">총 인원 : 1</div>
				</section>
				<div data-v-36e7f434="" data-v-58f68ad7=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 800px;">
						<div class="el-dialog__header">
							<div data-v-36e7f434="" class="modal-title">과거 휴직자 내역</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-36e7f434="" class="dialog-footer"><div
									data-v-36e7f434="">
									<button data-v-f8d3258e="" data-v-36e7f434="" type="button"
										class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">확인</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
				<div data-v-46292040="" data-v-58f68ad7=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog sm" style="margin-top: 15vh;">
						<div class="el-dialog__header">
							<span class="el-dialog__title"></span>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-46292040="" class="dialog-footer"><button
									data-v-f8d3258e="" data-v-46292040="" type="button"
									class="hw-button secondary">
									<!---->
									<span data-v-f8d3258e="" class="label">취소</span>
									<!---->
								</button>
								<!----></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

