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
									style="width: 95px; transform: translateX(24px);"></div>
								<div id="tab-AttendanceCriteriaTab"
									aria-controls="pane-AttendanceCriteriaTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">기준 근무시간</div>
								<div id="tab-VacationStatusTab"
									aria-controls="pane-VacationStatusTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">휴가현황</div>
								<div id="tab-ManuallyCreateVacationTab"
									aria-controls="pane-ManuallyCreateVacationTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">수동휴가생성</div>
								<div id="tab-SetRestPersonTab"
									aria-controls="pane-SetRestPersonTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">휴직자설정</div>
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
					<div data-v-22ac11e0="" role="tabpanel"
						id="pane-AttendanceCriteriaTab"
						aria-labelledby="tab-AttendanceCriteriaTab" class="el-tab-pane"></div>
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
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-DailyWorkStandardManangeTab"
						aria-labelledby="tab-DailyWorkStandardManangeTab"
						class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-ef56bc14="" data-v-22ac11e0="" class="container">
				<section data-v-ef56bc14="" class="mb-30">
					<h4 data-v-ef56bc14="" class="section-title">기준 근무시간</h4>
					<div data-v-ef56bc14="" class="section-content">
						<p data-v-ef56bc14="">회사에서 공통적으로 사용하는 월 근무시간 기준을 설정할 수 있습니다.</p>
						<p data-v-ef56bc14="">이는 연장근무신청/근무계획수정/휴(무)일근무신청 등에서 월 기준
							소정/연장 근무시간으로 표시되며, 계획한 시간과 비교할 수 있는 기준으로 사용됩니다.</p>
						<p data-v-ef56bc14="">월별 소정/연장근무시간 기준을 직접 입력하여 설정하세요.</p>
					</div>
				</section>
				<section data-v-ef56bc14="" class="main-section">
					<div data-v-ef56bc14="" class="calendar-nav">
						<button data-v-ef56bc14="" class="hw-icon">
							<i data-v-ef56bc14="" class="gi gi-short-arrow-left-alt"></i>
						</button>
						<span data-v-ef56bc14="" class="period">2023년</span>
						<button data-v-ef56bc14="" class="hw-icon">
							<i data-v-ef56bc14="" class="gi gi-short-arrow-right-alt"></i>
						</button>
					</div>
					<table data-v-ef56bc14="" class="setting-table center mt-20">
						<colgroup data-v-ef56bc14="">
							<col data-v-ef56bc14="" width="120px">
							<col data-v-ef56bc14="" width="120px">
							<col data-v-ef56bc14="" width="120px">
							<col data-v-ef56bc14="" width="120px">
							<col data-v-ef56bc14="" width="120px">
							<col data-v-ef56bc14="" width="120px">
							<col data-v-ef56bc14="" width="240px">
						</colgroup>
						<thead data-v-ef56bc14="">
							<tr data-v-ef56bc14="">
								<th data-v-ef56bc14="">월</th>
								<th data-v-ef56bc14="">근무일수</th>
								<th data-v-ef56bc14="">8시간/일</th>
								<th data-v-ef56bc14="">소정</th>
								<th data-v-ef56bc14="">연장</th>
								<th data-v-ef56bc14="">총 근무시간</th>
								<th data-v-ef56bc14="">메모</th>
							</tr>
						</thead>
						<tbody data-v-ef56bc14="">
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">1월</td>
								<td data-v-ef56bc14="">20일</td>
								<td data-v-ef56bc14="">160시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 160</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">160
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">2월</td>
								<td data-v-ef56bc14="">20일</td>
								<td data-v-ef56bc14="">160시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 160</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">160
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">3월</td>
								<td data-v-ef56bc14="">22일</td>
								<td data-v-ef56bc14="">176시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 176</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">176
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">4월</td>
								<td data-v-ef56bc14="">20일</td>
								<td data-v-ef56bc14="">160시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 160</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">160
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">5월</td>
								<td data-v-ef56bc14="">20일</td>
								<td data-v-ef56bc14="">160시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 160</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">160
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">6월</td>
								<td data-v-ef56bc14="">21일</td>
								<td data-v-ef56bc14="">168시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 168</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">168
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">7월</td>
								<td data-v-ef56bc14="">21일</td>
								<td data-v-ef56bc14="">168시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 168</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">168
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">8월</td>
								<td data-v-ef56bc14="">22일</td>
								<td data-v-ef56bc14="">176시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 176</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">176
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">9월</td>
								<td data-v-ef56bc14="">19일</td>
								<td data-v-ef56bc14="">152시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 152</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">152
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">10월</td>
								<td data-v-ef56bc14="">19일</td>
								<td data-v-ef56bc14="">152시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 152</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">152
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">11월</td>
								<td data-v-ef56bc14="">22일</td>
								<td data-v-ef56bc14="">176시간</td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 176</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14=""> 0</span></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">176
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><span
									data-v-ef56bc14=""></span></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">12월</td>
								<td data-v-ef56bc14="">20일</td>
								<td data-v-ef56bc14="">160시간</td>
								<td data-v-ef56bc14=""><input data-v-ef56bc14=""
									maxlength="3" class="hw-input text-center"></td>
								<td data-v-ef56bc14=""><input data-v-ef56bc14=""
									maxlength="3" class="hw-input text-center"></td>
								<td data-v-ef56bc14=""><span data-v-ef56bc14="">160
								</span></td>
								<td data-v-ef56bc14="" class="text-left"><input
									data-v-e8284514="" data-v-ef56bc14="" type="text"
									placeholder="" min="0" max="60" class="hw-input" maxlength="40"></td>
							</tr>
							<tr data-v-ef56bc14="">
								<td data-v-ef56bc14="">합계</td>
								<td data-v-ef56bc14="">246일</td>
								<td data-v-ef56bc14="">1,968</td>
								<td data-v-ef56bc14="">1,968</td>
								<td data-v-ef56bc14="">0</td>
								<td data-v-ef56bc14="">1,968</td>
								<td data-v-ef56bc14=""></td>
							</tr>
						</tbody>
					</table>
					<div data-v-ef56bc14="" class="box-content mt-30">
						<button data-v-f8d3258e="" data-v-ef56bc14="" type="button"
							class="hw-button manage-input smallest button-round primary">
							<!---->
							<span data-v-f8d3258e="" class="label">저장하기 </span>
							<!---->
						</button>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>

