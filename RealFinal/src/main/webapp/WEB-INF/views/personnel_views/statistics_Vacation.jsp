<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="router_split_item" class="split-item right"
	style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-2780bff5="" class="setting">
			<div data-v-2780bff5="" class="flexible-tab">
				<div data-v-2780bff5="" class="el-tabs el-tabs--top">
					<div class="el-tabs__header is-top">
						<div class="el-tabs__nav-wrap is-top">
							<div class="el-tabs__nav-scroll">
								<div role="tablist" class="el-tabs__nav is-top is-stretch"
									style="transform: translateX(0px);">
									<div class="el-tabs__active-bar is-top"
										style="width: 60px; transform: translateX(132px);"></div>
									<div id="tab-Default" aria-controls="pane-Default" role="tab"
										tabindex="-1" class="el-tabs__item is-top">근무현황</div>
									<div id="tab-Vacation" aria-controls="pane-Vacation" role="tab"
										aria-selected="true" tabindex="0"
										class="el-tabs__item is-top is-active">휴가내역</div>
									<div id="tab-Statistics" aria-controls="pane-Statistics"
										role="tab" tabindex="-1" class="el-tabs__item is-top">연간통계</div>
									<div id="tab-History" aria-controls="pane-History" role="tab"
										tabindex="-1" class="el-tabs__item is-top">근무신청내역</div>
									<div id="tab-CompanyVacation"
										aria-controls="pane-CompanyVacation" role="tab" tabindex="-1"
										class="el-tabs__item is-top">전사휴가캘린더</div>
								</div>
							</div>
						</div>
					</div>
					<div class="el-tabs__content">
						<div data-v-2780bff5="" role="tabpanel" aria-hidden="true"
							id="pane-Default" aria-labelledby="tab-Default"
							class="el-tab-pane" style="display: none;"></div>
						<div data-v-2780bff5="" role="tabpanel" id="pane-Vacation"
							aria-labelledby="tab-Vacation" class="el-tab-pane" style="">
							<div data-v-58e2bac0="" data-v-2780bff5="">
								<div data-v-58e2bac0="" class="page-head">
									<div data-v-58e2bac0="" class="calendar-nav">
										<button data-v-58e2bac0="" class="hw-icon">
											<i data-v-58e2bac0="" class="gi gi-short-arrow-left-alt"></i>
										</button>
										<span data-v-58e2bac0="" class="period mh-15">2023-01-01
											~ 2023-12-31</span>
										<button data-v-58e2bac0="" class="hw-icon">
											<i data-v-58e2bac0="" class="gi gi-short-arrow-right-alt"></i>
										</button>
									</div>
									<button data-v-f8d3258e="" data-v-58e2bac0="" type="button"
										class="hw-button pill-shape-outline font-size-13 ml-15">
										<!---->
										<span data-v-f8d3258e="" class="label">휴가 신청</span>
										<!---->
									</button>
								</div>
								<section data-v-58e2bac0="" class="mt-40">
									<h4 data-v-58e2bac0="" class="section-title">
										휴가 생성 내역<span data-v-58e2bac0=""
											class="font-weight-normal ml-12">2023-01-01 ~
											2023-12-31</span>
									</h4>
									<table data-v-58e2bac0="" class="setting-table center mv-20">
										<colgroup data-v-58e2bac0="">
											<col data-v-58e2bac0="" style="width: 15%;">
											<col data-v-58e2bac0="" style="width: 15%;">
											<col data-v-58e2bac0="" style="width: 15%;">
											<col data-v-58e2bac0="" style="width: 15%;">
											<col data-v-58e2bac0="" style="width: 40%;">
										</colgroup>
										<thead data-v-58e2bac0="">
											<tr data-v-58e2bac0="">
												<th data-v-58e2bac0="" rowspan="2">생성일</th>
												<th data-v-58e2bac0="" colspan="2">생성 내역</th>
												<th data-v-58e2bac0="" rowspan="2">내용</th>
												<th data-v-58e2bac0="" rowspan="2">비고</th>
											</tr>
											<tr data-v-58e2bac0="">
												<th data-v-58e2bac0="">발생</th>
												<th data-v-58e2bac0=""
													style="border-right: 1px solid rgb(214, 214, 214) !important;">최종</th>
											</tr>
										</thead>
										<tbody data-v-58e2bac0="">
											<tr data-v-58e2bac0="">
												<td data-v-58e2bac0="">2023-12-02</td>
												<td data-v-58e2bac0="">20일</td>
												<td data-v-58e2bac0="">20일</td>
												<td data-v-58e2bac0="" class="text-left">정기 휴가</td>
												<td data-v-58e2bac0="" class="text-left">연차 (20일 x
													8시간=160시간)</td>
											</tr>
										</tbody>
									</table>
									<div data-v-58e2bac0="">
										<strong data-v-58e2bac0="" class="font-size-15">휴가 현황</strong><span
											data-v-58e2bac0="" class="ml-12">총 휴가: 20일</span><span
											data-v-58e2bac0="" class="bar"></span><span
											data-v-58e2bac0="">사용: 1일 </span>
										<!---->
										<span data-v-58e2bac0="" class="bar"></span><span
											data-v-58e2bac0=""> 잔여: 19일 (<span data-v-58e2bac0="">연차:
												19일<!---->
										</span>)
										</span>
									</div>
								</section>
								<section data-v-58e2bac0="">
									<h4 data-v-58e2bac0="" class="section-title">휴가 신청 내역</h4>
									<span data-v-58e2bac0=""><div role="tooltip"
											id="el-popover-3024" aria-hidden="true"
											class="el-popover el-popper board-popover" tabindex="0"
											style="display: none;">
											<!---->
											<div data-v-58e2bac0="" class="pv-10">
												<button data-v-f8d3258e="" data-v-58e2bac0="" type="button"
													class="hw-button button-item text filter-bg">
													<!---->
													<span data-v-f8d3258e="" class="label">모두</span>
													<!---->
												</button>
												<button data-v-f8d3258e="" data-v-58e2bac0="" type="button"
													class="hw-button button-item text">
													<!---->
													<span data-v-f8d3258e="" class="label">연차</span>
													<!---->
												</button>
											</div>
										</div>
										<span class="el-popover__reference-wrapper"><button
												data-v-58e2bac0="" type="button"
												class="popover-button el-popover__reference"
												aria-describedby="el-popover-3024" tabindex="0">
												<span data-v-58e2bac0="" class="label">모두</span><span
													data-v-58e2bac0="" class="bullet"><i
													data-v-58e2bac0="" class="gis gi-short-arrow-down"></i></span>
											</button></span></span>
									<table data-v-58e2bac0=""
										class="setting-table has-child center mt-20">
										<tbody data-v-58e2bac0="">
											<tr data-v-58e2bac0="">
												<td data-v-58e2bac0=""><table data-v-58e2bac0=""
														class="setting-table center">
														<colgroup data-v-58e2bac0="">
															<col data-v-58e2bac0="" style="width: 8%;">
															<col data-v-58e2bac0="" style="width: 12%;">
															<col data-v-58e2bac0="" style="width: 16%;">
															<col data-v-58e2bac0="" style="width: 12%;">
															<col data-v-58e2bac0="" style="width: 30%;">
															<col data-v-58e2bac0="" style="width: 12%;">
															<col data-v-58e2bac0="" style="width: 10%;">
														</colgroup>
														<thead data-v-58e2bac0="">
															<tr data-v-58e2bac0="">
																<th data-v-58e2bac0="">번호</th>
																<th data-v-58e2bac0="">신청자</th>
																<th data-v-58e2bac0="">휴가 종류</th>
																<th data-v-58e2bac0="">일수</th>
																<th data-v-58e2bac0="">기간</th>
																<th data-v-58e2bac0="">상태</th>
																<th data-v-58e2bac0="">상세</th>
															</tr>
														</thead>
														<tbody data-v-58e2bac0="">
															<tr data-v-58e2bac0="">
																<td data-v-58e2bac0="" rowspan="1">1</td>
																<td data-v-58e2bac0="" class="text-left">대표이사</td>
																<td data-v-58e2bac0="" class="text-left">연차</td>
																<td data-v-58e2bac0="">1일</td>
																<td data-v-58e2bac0=""
																	class="text-left show-border-right">2023-12-04 ~
																	2023-12-04<!---->
																</td>
																<td data-v-58e2bac0="" rowspan="1">결재완료</td>
																<td data-v-58e2bac0="" rowspan="1"><a
																	data-v-58e2bac0=""
																	href="https://approval.office.hiworks.com/gabia.biz/approval/document/view/278463"
																	target="_blank" class="hw-button text">상세</a></td>
															</tr>
														</tbody>
													</table></td>
											</tr>
										</tbody>
									</table>
								</section>
								<!---->
							</div>
						</div>
						<div data-v-2780bff5="" role="tabpanel" aria-hidden="true"
							id="pane-Statistics" aria-labelledby="tab-Statistics"
							class="el-tab-pane" style="display: none;"></div>
						<div data-v-2780bff5="" role="tabpanel" aria-hidden="true"
							id="pane-History" aria-labelledby="tab-History"
							class="el-tab-pane" style="display: none;"></div>
						<div data-v-2780bff5="" role="tabpanel" aria-hidden="true"
							id="pane-CompanyVacation" aria-labelledby="tab-CompanyVacation"
							class="el-tab-pane" style="display: none;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

