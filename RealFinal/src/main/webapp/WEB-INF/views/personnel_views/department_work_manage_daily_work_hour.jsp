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
									style="width: 105px; transform: translateX(782px);"></div>
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
									aria-controls="pane-SetRestPersonTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">휴직자설정</div>
								<!-- <div id="tab-MonthlyWorkStatusTab"
									aria-controls="pane-MonthlyWorkStatusTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근태현황</div> -->
								<div id="tab-ConfirmWorkCheckTab"
									aria-controls="pane-ConfirmWorkCheckTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근무체크확인</div>
								<div id="tab-DailyWorkStandardManangeTab"
									aria-controls="pane-DailyWorkStandardManangeTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">일근무기준관리</div>
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
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-SetRestPersonTab" aria-labelledby="tab-SetRestPersonTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-MonthlyWorkStatusTab"
						aria-labelledby="tab-MonthlyWorkStatusTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-ConfirmWorkCheckTab"
						aria-labelledby="tab-ConfirmWorkCheckTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel"
						id="pane-DailyWorkStandardManangeTab"
						aria-labelledby="tab-DailyWorkStandardManangeTab"
						class="el-tab-pane"></div>
				</div>
			</div>
			<div data-v-057b6512="" data-v-22ac11e0="" class="container">
				<section data-v-057b6512="" class="mb-30">
					<h4 data-v-057b6512="" class="section-title">일 근무 기준시간(소정) 예외
						내역</h4>
					<div data-v-057b6512="" class="section-content">
						<p data-v-057b6512="">단시간 근로계약이나 육아기 근무시간 단축 등으로 일 근무시간이 8시간이
							아닌 사용자의 예외 근무 기준을 적용, 관리할 수 있습니다.</p>
						<p data-v-057b6512="">예외자를 추가하여, 변경할 일 근무 기준 및 적용기간을 설정하세요.</p>
						<p data-v-057b6512="">- 설정한 일 근무시간을 기준으로 휴가를 사용할 수 있습니다. (휴가
							종일=일 근무 기준시간)</p>
						<p data-v-057b6512="">- 일 근무 기준시간 예외자의 휴가일수는 총시간을 기준으로 표시됩니다.
							(예: 15일 -&gt; 90시간)</p>
						<p data-v-057b6512="">- 단, 휴가의 생성은 무조건 일 8시간을 기준으로 생성되므로, 생성
							일수(시간)의 수정이 필요한 경우, 수동휴가생성 페이지를 이용해주세요.</p>
						<button data-v-f8d3258e="" data-v-057b6512="" type="button"
							class="hw-button text">
							<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
								data-v-f8d3258e="" class="label">예외자 추가</span>
							<!---->
						</button>
					</div>
				</section>
				<section data-v-057b6512="" class="main-section">
					<div data-v-057b6512=""
						class="d-flex justify-content-between align-items-center mb-20">
						<div data-v-057b6512="">
							<span data-v-057b6512="" class="mr-20"><div role="tooltip"
									id="el-popover-8763" aria-hidden="true"
									class="el-popover el-popper board-popover " tabindex="0"
									style="display: none;">
									<!---->
									<div data-v-057b6512="" class="pv-10 max-h300">
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">2023년</span>
											<!---->
										</button>
									</div>
								</div>
								<span class="el-popover__reference-wrapper"><button
										data-v-057b6512="" type="button"
										class="popover-button el-popover__reference"
										aria-describedby="el-popover-8763" tabindex="0">
										<span data-v-057b6512="" class="label">2023년</span><span
											data-v-057b6512="" class="bullet"><i
											data-v-057b6512="" class="gis gi-short-arrow-down"></i></span>
									</button></span></span><span data-v-057b6512="" class="mr-20"><div
									role="tooltip" id="el-popover-8017" aria-hidden="true"
									class="el-popover el-popper board-popover" tabindex="0"
									style="display: none;">
									<!---->
									<div data-v-057b6512="" class="pv-10">
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">전체</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">7시간</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">6시간</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">5시간</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">4시간</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-057b6512="" type="button"
											class="hw-button button-item text">
											<!---->
											<span data-v-f8d3258e="" class="label">3시간</span>
											<!---->
										</button>
									</div>
								</div>
								<span class="el-popover__reference-wrapper"><button
										data-v-057b6512="" type="button"
										class="popover-button el-popover__reference"
										aria-describedby="el-popover-8017" tabindex="0">
										<span data-v-057b6512="" class="label">기준: 전체 </span><span
											data-v-057b6512="" class="bullet"><i
											data-v-057b6512="" class="gis gi-short-arrow-down"></i></span>
									</button></span></span>
						</div>
						<div data-v-057b6512="">
							<!---->
							<div data-v-057b6512="" class="hw-input-wrap ml-10">
								<i data-v-057b6512="" class="icon-prefix fal fa-search"></i><input
									data-v-057b6512="" type="text" placeholder="이름, 사유 검색"
									class="hw-input">
							</div>
						</div>
					</div>
					<table data-v-057b6512="" class="setting-table">
						<colgroup data-v-057b6512="">
							<col data-v-057b6512="" style="width: 15%;">
							<col data-v-057b6512="" style="width: 15%;">
							<col data-v-057b6512="" style="width: 295px;">
							<col data-v-057b6512="">
							<col data-v-057b6512="" style="width: 20%;">
						</colgroup>
						<tbody data-v-057b6512="">
							<tr data-v-057b6512="">
								<th data-v-057b6512="">이름(ID)</th>
								<th data-v-057b6512="">일 근무 기준시간</th>
								<th data-v-057b6512="">적용기간</th>
								<th data-v-057b6512="">사유</th>
								<th data-v-057b6512="">저장/삭제</th>
							</tr>
							<!---->
							<tr data-v-057b6512="">
								<td data-v-057b6512="">최사장(choi)</td>
								<td data-v-057b6512="" class="text-center">7시간</td>
								<td data-v-057b6512="" class="text-center">2023-12-14 ~
									2023-12-15</td>
								<td data-v-057b6512="">ㅇㅇ</td>
								<td data-v-057b6512="" class="text-center"><button
										data-v-f8d3258e="" data-v-057b6512="" type="button"
										class="hw-button info">
										<!---->
										<span data-v-f8d3258e="" class="label">삭제</span>
										<!---->
									</button></td>
							</tr>
							<!---->
						</tbody>
					</table>
				</section>
			</div>
		</div>
	</div>
</div>

