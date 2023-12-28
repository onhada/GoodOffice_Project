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
									style="width: 90px; transform: translateX(644px);"></div>
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
								<div id="tab-MonthlyWorkStatusTab"
									aria-controls="pane-MonthlyWorkStatusTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근태현황</div>
								<div id="tab-ConfirmWorkCheckTab"
									aria-controls="pane-ConfirmWorkCheckTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">근무체크확인</div>
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
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-SetRestPersonTab" aria-labelledby="tab-SetRestPersonTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-MonthlyWorkStatusTab"
						aria-labelledby="tab-MonthlyWorkStatusTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel"
						id="pane-ConfirmWorkCheckTab"
						aria-labelledby="tab-ConfirmWorkCheckTab" class="el-tab-pane"></div>
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-DailyWorkStandardManangeTab"
						aria-labelledby="tab-DailyWorkStandardManangeTab"
						class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-a9ceba88="" data-v-22ac11e0=""
				class="attendance-check container">
				<section data-v-a9ceba88="" style="width: 200px;">
					<h4 data-v-a9ceba88="" class="section-title">날짜</h4>
					<div data-v-a9ceba88="" class="section-content"
						style="width: 120px;">
						<div data-v-a9ceba88=""
							class="el-date-editor hw-calendar el-input el-input--prefix el-input--suffix el-date-editor--date">
							<!---->
							<input type="text" autocomplete="off" name="" placeholder="날짜 선택"
								class="el-input__inner"><span class="el-input__prefix"><i
								class="el-input__icon gi gi-calendar"></i>
							<!----></span><span class="el-input__suffix"><span
								class="el-input__suffix-inner"><i class="el-input__icon"></i>
								<!---->
									<!---->
									<!---->
									<!----></span>
							<!----></span>
							<!---->
							<!---->
						</div>
					</div>
				</section>
				<section data-v-a9ceba88="" style="width: 200px;">
					<h4 data-v-a9ceba88="" class="section-title">이름</h4>
					<div data-v-a9ceba88="" class="section-content"
						style="width: 160px;">
						<div data-v-147fd5e4="" data-v-a9ceba88=""
							class="position-relative">
							<input data-v-147fd5e4="" placeholder="이름 입력" class="hw-input">
							<div data-v-147fd5e4="" class="ac-serach-result-wrap"
								style="top: 36px; display: none;">
								<!---->
							</div>
						</div>
					</div>
					<button data-v-f8d3258e="" data-v-a9ceba88="" type="button"
						class="hw-button mt-30 primary">
						<!---->
						<span data-v-f8d3258e="" class="label"> 확인하기 </span>
						<!---->
					</button>
				</section>
				<section data-v-a9ceba88="">
					<h4 data-v-a9ceba88="" class="section-title">근무체크 이력</h4>
					<div data-v-a9ceba88="" class="section-content chain-content">
						<ul data-v-a9ceba88="" class="form-group">
							<li data-v-a9ceba88=""><div data-v-a9ceba88="">- 이름
									:&nbsp;</div>
								<div data-v-a9ceba88="">최사장</div></li>
							<li data-v-a9ceba88=""><div data-v-a9ceba88="">- 날짜
									:&nbsp;</div>
								<div data-v-a9ceba88="">2023년 12월 02일 토요일</div></li>
							<li data-v-a9ceba88=""><div data-v-a9ceba88="">- 근무계획</div>
								<div data-v-a9ceba88=""></div></li>
							<!---->
							<li data-v-a9ceba88="" class="mt-40"><div data-v-a9ceba88="">-
									근무체크 상세</div>
								<div data-v-a9ceba88=""></div></li>
							<li data-v-a9ceba88=""><div data-v-a9ceba88=""
									class="content-div">
									<div data-v-a9ceba88="" class="form-table">
										<table data-v-a9ceba88="" class="setting-table center">
											<colgroup data-v-a9ceba88="">
												<col data-v-a9ceba88="" style="width: 33.3%;">
												<col data-v-a9ceba88="" style="width: 33.3%;">
												<col data-v-a9ceba88="" style="width: 33.3%;">
											</colgroup>
											<thead data-v-a9ceba88="">
												<tr data-v-a9ceba88="">
													<th data-v-a9ceba88="">체크 시간</th>
													<th data-v-a9ceba88="">상태</th>
													<th data-v-a9ceba88="">수단</th>
												</tr>
											</thead>
											<tbody data-v-a9ceba88="">
												<tr data-v-a9ceba88="">
													<td data-v-a9ceba88="" colspan="3" class="color-no-data">근무체크
														이력이 없습니다.</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div></li>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>
