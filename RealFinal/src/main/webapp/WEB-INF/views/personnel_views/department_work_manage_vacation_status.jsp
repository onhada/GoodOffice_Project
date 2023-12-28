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
									style="width: 60px; transform: translateX(167px);"></div>
								<div id="tab-AttendanceCriteriaTab"
									aria-controls="pane-AttendanceCriteriaTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">기준 근무시간</div>
								<div id="tab-VacationStatusTab"
									aria-controls="pane-VacationStatusTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">휴가현황</div>
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
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-AttendanceCriteriaTab"
						aria-labelledby="tab-AttendanceCriteriaTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel" id="pane-VacationStatusTab"
						aria-labelledby="tab-VacationStatusTab" class="el-tab-pane"></div>
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
			<div data-v-01708f0e="" data-v-22ac11e0="" class="container">
				<div data-v-01708f0e="" class="page-head">
					<div data-v-01708f0e="" class="calendar-nav">
						<button data-v-01708f0e="" class="hw-icon" style="display: none;">
							<i data-v-01708f0e="" class="gi gi-short-arrow-left-alt"></i>
						</button>
						<span data-v-01708f0e="" class="period mh-15" style="">2023-01-01
							~ 2023-12-31</span>
						<button data-v-01708f0e="" class="hw-icon" style="display: none;">
							<i data-v-01708f0e="" class="gi gi-short-arrow-right-alt"></i>
						</button>
					</div>
					<div data-v-01708f0e="">
						<!---->
						<span data-v-01708f0e="" class="search-input"><div
								data-v-01708f0e="" class="hw-input-group prefix">
								<input placeholder="이름, ID 검색" class="hw-input"><i
									class="icon fal fa-search"></i>
							</div></span>
						<button data-v-01708f0e="" class="el-tooltip hw-tooltip-file-icon"
							aria-describedby="el-tooltip-6074" tabindex="0">
							<img data-v-01708f0e="" src="/img/excel.a8ac7690.svg" alt="">
						</button>
					</div>
				</div>
				<div data-v-01708f0e="" class="mt-40">
					<span data-v-01708f0e="" class="mr-20"><div role="tooltip"
							id="el-popover-5730" aria-hidden="true"
							class="el-popover el-popper board-popover" tabindex="0"
							style="width: 200px; display: none;">
							<!---->
							<div data-v-01708f0e="" class="pv-10">
								<button data-v-f8d3258e="" data-v-01708f0e="" type="button"
									class="hw-button button-item text filter-bg">
									<!---->
									<span data-v-f8d3258e="" class="label">2023-01-01 ~
										2023-12-31 </span>
									<!---->
								</button>
							</div>
						</div>
						<span class="el-popover__reference-wrapper"><button
								data-v-01708f0e="" type="button"
								class="popover-button el-popover__reference"
								aria-describedby="el-popover-5730" tabindex="0">
								<span data-v-01708f0e="" class="label">2023-01-01 ~
									2023-12-31</span><span data-v-01708f0e="" class="bullet"><i
									data-v-01708f0e="" class="gis gi-short-arrow-down"></i></span>
							</button></span></span><span data-v-01708f0e=""><div role="tooltip"
							id="el-popover-641" aria-hidden="true"
							class="el-popover el-popper board-popover" tabindex="0"
							style="width: 250px; display: none;">
							<!---->
							<div data-v-01708f0e="" class="pv-10 hr-org">
								<div data-v-01708f0e="" class="hw-tree-wrapper" search="">
									<ul data-v-6311f1e8=""
										class="hw-tree-view-item hw-tree-item hw-tree-root">
										<li data-v-6311f1e8=""><div data-v-6311f1e8=""
												class="hw-tree-item-node">
												<i data-v-6311f1e8=""
													class="minus-circle fas fa-minus-circle"></i><span
													data-v-6311f1e8="" title="하이웍스산업"
													class="hw-tree-item-name opened">하이웍스산업</span><span
													data-v-6311f1e8="" class="hw-tree-item-count opened">(11)</span>
											</div>
											<div data-v-6311f1e8="">
												<ul data-v-6311f1e8="" class="hw-tree-item">
													<li data-v-6311f1e8=""><div data-v-6311f1e8=""
															class="hw-tree-item-node">
															<i data-v-6311f1e8=""
																class="minus-circle inline far fa-plus-circle"></i><span
																data-v-6311f1e8="" title="관리부" class="hw-tree-item-name">관리부</span><span
																data-v-6311f1e8="" class="hw-tree-item-count">(4)</span>
														</div>
														<div data-v-6311f1e8="">
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="인사팀"
																			class="hw-tree-item-name">인사팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="구매총무팀"
																			class="hw-tree-item-name">구매총무팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="재무회계팀"
																			class="hw-tree-item-name">재무회계팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(2)</span>
																	</div></li>
															</ul>
														</div></li>
													<!---->
												</ul>
												<ul data-v-6311f1e8="" class="hw-tree-item">
													<li data-v-6311f1e8=""><div data-v-6311f1e8=""
															class="hw-tree-item-node">
															<i data-v-6311f1e8=""
																class="minus-circle inline far fa-plus-circle"></i><span
																data-v-6311f1e8="" title="생산부" class="hw-tree-item-name">생산부</span><span
																data-v-6311f1e8="" class="hw-tree-item-count">(3)</span>
														</div>
														<div data-v-6311f1e8="">
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="생산1팀"
																			class="hw-tree-item-name">생산1팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="생산2팀"
																			class="hw-tree-item-name">생산2팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="품질관리팀"
																			class="hw-tree-item-name">품질관리팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
														</div></li>
													<!---->
												</ul>
												<ul data-v-6311f1e8="" class="hw-tree-item">
													<li data-v-6311f1e8=""><div data-v-6311f1e8=""
															class="hw-tree-item-node">
															<i data-v-6311f1e8=""
																class="minus-circle inline far fa-plus-circle"></i><span
																data-v-6311f1e8="" title="영업부" class="hw-tree-item-name">영업부</span><span
																data-v-6311f1e8="" class="hw-tree-item-count">(3)</span>
														</div>
														<div data-v-6311f1e8="">
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="영업1팀"
																			class="hw-tree-item-name">영업1팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="영업2팀"
																			class="hw-tree-item-name">영업2팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
															<ul data-v-6311f1e8="" class="hw-tree-item"
																style="display: none;">
																<!---->
																<li data-v-6311f1e8=""><div data-v-6311f1e8=""
																		class="hw-tree-item-leaf">
																		<span data-v-6311f1e8="" title="고객지원팀"
																			class="hw-tree-item-name">고객지원팀</span><span
																			data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
																	</div></li>
															</ul>
														</div></li>
													<!---->
												</ul>
											</div></li>
										<!---->
									</ul>
								</div>
							</div>
						</div>
						<span class="el-popover__reference-wrapper"><button
								data-v-01708f0e="" type="button"
								class="popover-button el-popover__reference"
								aria-describedby="el-popover-641" tabindex="0">
								<span data-v-01708f0e="" class="label">모든 부서</span><span
									data-v-01708f0e="" class="bullet"><i data-v-01708f0e=""
									class="gis gi-short-arrow-down"></i></span>
							</button></span></span>
					<table data-v-01708f0e="" class="setting-table center mt-20">
						<thead data-v-01708f0e="">
							<tr data-v-01708f0e="">
								<th data-v-01708f0e="" rowspan="2">이름
									<button data-v-01708f0e="" class="hw-icon ml-5 button-sort">
										<i data-v-01708f0e="" class="gis gi-short-arrow-up"></i><i
											data-v-01708f0e="" class="gis gi-short-arrow-down"
											style="display: none;"></i>
									</button>
								</th>
								<th data-v-01708f0e="" rowspan="2">입사일
									<button data-v-01708f0e="" class="hw-icon ml-5 button-sort">
										<i data-v-01708f0e="" class="gis gi-short-arrow-up"></i><i
											data-v-01708f0e="" class="gis gi-short-arrow-down"
											style="display: none;"></i>
									</button>
								</th>
								<th data-v-01708f0e="" rowspan="2">올해 생성</th>
								<th data-v-01708f0e="" colspan="3">생성내역</th>
								<th data-v-01708f0e="" rowspan="1" colspan="4"
									style="border-left: 1px solid rgb(214, 214, 214);">사용현황</th>
								<th data-v-01708f0e="" rowspan="2">잔여</th>
							</tr>
							<tr data-v-01708f0e="">
								<th data-v-01708f0e="">정기</th>
								<th data-v-01708f0e="">포상</th>
								<th data-v-01708f0e="">기타</th>
								<th data-v-01708f0e=""
									style="border-right: 1px solid rgb(214, 214, 214);">연차</th>
								<th data-v-01708f0e=""
									style="border-right: 1px solid rgb(214, 214, 214);">포상</th>
								<th data-v-01708f0e=""
									style="border-right: 1px solid rgb(214, 214, 214);">월차</th>
								<th data-v-01708f0e=""
									style="border-right: 1px solid rgb(214, 214, 214);">경조사</th>
							</tr>
						</thead>
						<tbody data-v-01708f0e="">
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">대표이사</div>
									<div data-v-01708f0e="" class="truncate">(ceo)</div></td>
								<td data-v-01708f0e="">2012-01-04</td>
								<td data-v-01708f0e="">20일</td>
								<td data-v-01708f0e="">20일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">1일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">19일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">최사장</div>
									<div data-v-01708f0e="" class="truncate">(choi)</div></td>
								<td data-v-01708f0e="">2013-06-23</td>
								<td data-v-01708f0e="">19일</td>
								<td data-v-01708f0e="">19일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">19일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">박상무</div>
									<div data-v-01708f0e="" class="truncate">(park)</div></td>
								<td data-v-01708f0e="">2014-02-10</td>
								<td data-v-01708f0e="">19일</td>
								<td data-v-01708f0e="">19일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">19일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">김이사</div>
									<div data-v-01708f0e="" class="truncate">(kim)</div></td>
								<td data-v-01708f0e="">2015-08-14</td>
								<td data-v-01708f0e="">18일</td>
								<td data-v-01708f0e="">18일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">1일 4시간</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">16일 4시간</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">오부장</div>
									<div data-v-01708f0e="" class="truncate">(oh)</div></td>
								<td data-v-01708f0e="">2016-07-08</td>
								<td data-v-01708f0e="">18일</td>
								<td data-v-01708f0e="">18일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">18일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">조차장</div>
									<div data-v-01708f0e="" class="truncate">(jo)</div></td>
								<td data-v-01708f0e="">2017-11-29</td>
								<td data-v-01708f0e="">17일</td>
								<td data-v-01708f0e="">17일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">17일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">강과장</div>
									<div data-v-01708f0e="" class="truncate">(kang)</div></td>
								<td data-v-01708f0e="">2018-06-01</td>
								<td data-v-01708f0e="">17일</td>
								<td data-v-01708f0e="">17일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">17일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">양대리</div>
									<div data-v-01708f0e="" class="truncate">(yang)</div></td>
								<td data-v-01708f0e="">2019-09-22</td>
								<td data-v-01708f0e="">16일</td>
								<td data-v-01708f0e="">16일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">16일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">안주임</div>
									<div data-v-01708f0e="" class="truncate">(ahn)</div></td>
								<td data-v-01708f0e="">2020-04-04</td>
								<td data-v-01708f0e="">16일</td>
								<td data-v-01708f0e="">16일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">16일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">이사원</div>
									<div data-v-01708f0e="" class="truncate">(lee)</div></td>
								<td data-v-01708f0e="">2021-01-03</td>
								<td data-v-01708f0e="">15일</td>
								<td data-v-01708f0e="">15일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">15일</td>
							</tr>
							<tr data-v-01708f0e="" class="c-hand">
								<td data-v-01708f0e="" class="text-left"><div
										data-v-01708f0e="" class="truncate">주알바</div>
									<div data-v-01708f0e="" class="truncate">(joo)</div></td>
								<td data-v-01708f0e="">2021-08-12</td>
								<td data-v-01708f0e="">15일</td>
								<td data-v-01708f0e="">15일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<td data-v-01708f0e="">0일</td>
								<!---->
								<td data-v-01708f0e="">15일</td>
							</tr>
						</tbody>
					</table>
					<div data-v-01708f0e=""
						class="d-flex justify-content-between align-items-center mt-10">
						<div data-v-01708f0e="" class="font-size-14">총 인원 : 11</div>
						<button data-v-f8d3258e="" data-v-01708f0e="" type="button"
							class="hw-button pill-shape-outline font-size-14">
							<!---->
							<span data-v-f8d3258e="" class="label">휴가 미생성자 </span>
							<!---->
						</button>
					</div>
				</div>
				<div data-v-cd34e2a2="" data-v-01708f0e=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 800px;">
						<div class="el-dialog__header">
							<div data-v-cd34e2a2="" class="modal-title">휴가 상세</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-cd34e2a2="" class="dialog-footer"><div
									data-v-cd34e2a2="">
									<button data-v-f8d3258e="" data-v-cd34e2a2="" type="button"
										class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">확인</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
				<div data-v-0856e148="" data-v-01708f0e=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog lg" style="margin-top: 15vh;">
						<div class="el-dialog__header">
							<div data-v-0856e148="" class="modal-title">휴가 미생성자</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-0856e148="" class="dialog-footer"><div
									data-v-0856e148="">
									<button data-v-f8d3258e="" data-v-0856e148="" type="button"
										class="hw-button secondary">
										<!---->
										<span data-v-f8d3258e="" class="label">취소</span>
										<!---->
									</button>
									<button data-v-f8d3258e="" data-v-0856e148="" type="button"
										disabled="disabled" class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">생성</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

