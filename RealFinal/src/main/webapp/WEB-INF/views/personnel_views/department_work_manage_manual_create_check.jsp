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
									style="width: 90px; transform: translateX(275px);"></div>
								<div id="tab-AttendanceCriteriaTab"
									aria-controls="pane-AttendanceCriteriaTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">기준 근무시간</div>
								<div id="tab-VacationStatusTab"
									aria-controls="pane-VacationStatusTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">휴가현황</div>
								<div id="tab-ManuallyCreateVacationTab"
									aria-controls="pane-ManuallyCreateVacationTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">수동휴가생성</div>
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
					<div data-v-22ac11e0="" role="tabpanel" aria-hidden="true"
						id="pane-VacationStatusTab"
						aria-labelledby="tab-VacationStatusTab" class="el-tab-pane"
						style="display: none;"></div>
					<div data-v-22ac11e0="" role="tabpanel"
						id="pane-ManuallyCreateVacationTab"
						aria-labelledby="tab-ManuallyCreateVacationTab"
						class="el-tab-pane"></div>
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
			<div data-v-6b9f430d="" data-v-22ac11e0="" class="container">
				<section data-v-6b9f430d="">
					<div data-v-6b9f430d="" class="mb-15">
						<p data-v-6b9f430d="" class="mr-15">입사일 기준으로 대상을 검색하거나 조직을
							선택하여 휴가를 수동생성할 대상자를 선택하고, 현재 휴가에 추가로 생성 또는 생성된 휴가 초기화 후</p>
						<p data-v-6b9f430d="">새로 생성할 수 있습니다. 생성할 휴가 종류와 일수(또는 시간)를
							선택하여 사용자의 휴가를 생성하세요.</p>
						<p data-v-6b9f430d="">엑셀파일로 일괄 생성을 원하시면 아래 [파일로 휴가 생성] 버튼을
							클릭하세요.</p>
					</div>
					<button data-v-f8d3258e="" data-v-6b9f430d="" type="button"
						class="hw-button text">
						<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14 "></i><span
							data-v-f8d3258e="" class="label">파일로 휴가 생성 </span>
						<!---->
					</button>
				</section>
				<section data-v-6b9f430d="">
					<table data-v-6b9f430d="" class="layout-table">
						<tbody data-v-6b9f430d="">
							<tr data-v-6b9f430d="">
								<td data-v-6b9f430d=""><span data-v-6b9f430d=""
									class="count">1</span></td>
								<td data-v-6b9f430d="" class="title-td"><p
										data-v-6b9f430d="">대상자 선택</p></td>
								<td data-v-6b9f430d=""><div data-v-6b9f430d="">
										<label data-v-6b9f430d="" role="radio" aria-checked="true"
											tabindex="0" class="el-radio is-checked"><span
											class="el-radio__input is-checked"><span
												class="el-radio__inner"></span><input type="radio"
												aria-hidden="true" tabindex="-1" autocomplete="off"
												class="el-radio__original" value="org"></span><span
											class="el-radio__label">조직선택<!----></span></label>
											<!-- <label
											data-v-6b9f430d="" role="radio" tabindex="0"
											class="el-radio ml-30"><span class="el-radio__input"><span
												class="el-radio__inner"></span><input type="radio"
												aria-hidden="true" tabindex="-1" autocomplete="off"
												class="el-radio__original" value="joinDate"></span><span
											class="el-radio__label">입사일 검색</span></label> -->
											
										<div data-v-6b9f430d="" class="target-select-div">
											<div data-v-6b9f430d="" class="el-select"
												style="position: relative;">
												<div data-v-6b9f430d="" class="el-select-region"
													style="position: absolute; inset: 0px; z-index: 2200;"></div>
												<div data-v-6b9f430d="" class="el-input el-input--suffix">
													<input data-v-6b9f430d="" type="text" readonly="readonly"
														autocomplete="off" placeholder="선택"
														class="el-input__inner"><span data-v-6b9f430d=""
														class="el-input__suffix"><span data-v-6b9f430d=""
														class="el-input__suffix-inner"><i
															data-v-6b9f430d=""
															class="el-select__caret el-input__icon el-icon-arrow-up"></i></span></span>
												</div>
											</div>
											<section data-v-6b9f430d="" class="mt-20">
												<div data-v-6b9f430d=""
													class="d-flex justify-content-between align-items-center mb-20">
													<div data-v-6b9f430d="" class="pl-15">
														<label data-v-682bb766="" data-v-6b9f430d=""><div
																data-v-682bb766="" class="hw-checkbox checked">
																<span data-v-682bb766="" class="checkbox-input"></span><input
																	data-v-682bb766="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-682bb766="" class="label"><span
																	data-v-6b9f430d="" data-v-682bb766=""
																	class="primary-color ml-10">1명</span></span>
															</div></label>
													</div>
													<div data-v-6b9f430d="">
														<button data-v-f8d3258e="" data-v-6b9f430d=""
															type="button" class="hw-button text">
															<i data-v-f8d3258e="" class="icon left gi gi-undo-alt"></i><span
																data-v-f8d3258e="" class="label">선택 우선 정렬 </span>
															<!---->
														</button>
													</div>
												</div>
												<table data-v-6b9f430d="" class="setting-table">
													<colgroup data-v-6b9f430d="">
														<col data-v-6b9f430d="" style="width: 15%;">
														<col data-v-6b9f430d="" style="width: 15%;">
														<col data-v-6b9f430d="" style="width: 10%;">
														<col data-v-6b9f430d="" style="width: 10%;">
														<col data-v-6b9f430d="">
														<col data-v-6b9f430d="">
														<col data-v-6b9f430d="">
													</colgroup>
													<tbody data-v-6b9f430d="">
														<tr data-v-6b9f430d="">
															<th data-v-6b9f430d="" rowspan="2">이름</th>
															<th data-v-6b9f430d="" rowspan="2">소속 정보</th>
															<th data-v-6b9f430d="" rowspan="2">입사일</th>
															<th data-v-6b9f430d="" rowspan="2">소정 기준</th>
															<th data-v-6b9f430d="" colspan="3">현재 휴가일수</th>
														</tr>
														<tr data-v-6b9f430d="">
															<th data-v-6b9f430d="">연차</th>
															<th data-v-6b9f430d="">포상</th>
															<th data-v-6b9f430d="">월차</th>
														</tr>
													</tbody>
												</table>
												<div data-v-6b9f430d="" class="vb vb-invisible"
													style="width: auto; height: auto; position: relative; overflow: hidden;">
													<div class="vb-content"
														style="max-height: 300px; display: block; overflow: hidden scroll; height: 100%; width: calc(100% + 8px);">
														<table data-v-6b9f430d=""
															class="setting-table no-top-border">
															<colgroup data-v-6b9f430d="">
																<col data-v-6b9f430d="" style="width: 15%;">
																<col data-v-6b9f430d="" style="width: 15%;">
																<col data-v-6b9f430d="" style="width: 10%;">
																<col data-v-6b9f430d="" style="width: 10%;">
																<col data-v-6b9f430d="">
																<col data-v-6b9f430d="">
																<col data-v-6b9f430d="">
															</colgroup>
															<tbody data-v-6b9f430d="">
																<tr data-v-6b9f430d="">
																	<td data-v-6b9f430d=""><label data-v-682bb766=""
																		data-v-6b9f430d=""><div data-v-682bb766=""
																				class="hw-checkbox checked">
																				<span data-v-682bb766="" class="checkbox-input"></span><input
																					data-v-682bb766="" type="checkbox"
																					checked="checked" class="checkbox-original"><span
																					data-v-682bb766="" class="label"><span
																					data-v-6b9f430d="" data-v-682bb766=""
																					class="text-truncate trancate-15 ml-10">최사장</span></span>
																			</div></label></td>
																	<td data-v-6b9f430d=""
																		class="d-flex align-items-center"><span
																		data-v-6b9f430d="" class="text-truncate trancate-15">인사팀</span></td>
																	<td data-v-6b9f430d="" class="text-center"><span
																		data-v-6b9f430d="">2013-06-23</span></td>
																	<td data-v-6b9f430d="" class="text-center">8시간</td>
																	<td data-v-6b9f430d="" class="text-center">20일</td>
																	<td data-v-6b9f430d="" class="text-center">0일</td>
																	<td data-v-6b9f430d="" class="text-center">0일</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="vb-dragger"
														style="position: absolute; height: 0px; top: 0px;">
														<div class="vb-dragger-styler"></div>
													</div>
												</div>
											</section>
										</div>
									</div></td>
							</tr>
							<tr data-v-6b9f430d="">
								<td data-v-6b9f430d=""><span data-v-6b9f430d=""
									class="count">2</span></td>
								<td data-v-6b9f430d="" class="title-td"><p
										data-v-6b9f430d="" class="mt-20">생성 방식 선택</p></td>
								<td data-v-6b9f430d="" class="setting-td"><div
										data-v-6b9f430d="" class="mt-20 mb-20">
										<label data-v-6b9f430d="" role="radio" tabindex="0"
											class="el-radio is-checked" aria-checked="true"><span
											class="el-radio__input is-checked"><span
												class="el-radio__inner"></span><input type="radio"
												aria-hidden="true" tabindex="-1" autocomplete="off"
												class="el-radio__original" value="N"></span><span
											class="el-radio__label">생성되어있는 휴가에 추가로 생성합니다.<!----></span></label>
									</div>
									<div data-v-6b9f430d="">
										<label data-v-6b9f430d="" role="radio" tabindex="0"
											class="el-radio"><span class="el-radio__input"><span
												class="el-radio__inner"></span><input type="radio"
												aria-hidden="true" tabindex="-1" autocomplete="off"
												class="el-radio__original" value="Y"></span><span
											class="el-radio__label">선택한 종류를 포함한 올해의 모든 휴가를 초기화하고,
												새로운 생성내역에서 휴가를 새로 생성합니다. <!---->
										</span></label>
									</div></td>
							</tr>
							<tr data-v-6b9f430d="">
								<td data-v-6b9f430d=""><span data-v-6b9f430d=""
									class="count">3</span></td>
								<td data-v-6b9f430d="" class="title-td"><p
										data-v-6b9f430d="">생성할 휴가 종류 및 일수 선택</p></td>
								<td data-v-6b9f430d="" class="setting-td"><div
										data-v-6b9f430d="" class="mb-20">
										<span data-v-6b9f430d="" class="title-span">생성할 휴가종류</span>
										<div data-v-6b9f430d="" class="el-select"
											style="width: 120px;">
											<!---->
											<div class="el-input el-input--suffix">
												<!---->
												<input type="text" readonly="readonly" autocomplete="off"
													placeholder="선택" class="el-input__inner">
												<!---->
												<span class="el-input__suffix"><span
													class="el-input__suffix-inner"><i
														class="el-select__caret el-input__icon el-icon-arrow-up"></i>
													<!---->
														<!---->
														<!---->
														<!---->
														<!----></span>
												<!----></span>
												<!---->
												<!---->
											</div>
											<div class="el-select-dropdown el-popper"
												style="display: none; min-width: 120px;">
												<div class="el-scrollbar" style="">
													<div class="el-select-dropdown__wrap el-scrollbar__wrap"
														style="margin-bottom: -8px; margin-right: -8px;">
														<ul class="el-scrollbar__view el-select-dropdown__list">
															<!---->
															<li data-v-6b9f430d=""
																class="el-select-dropdown__item selected"><span>연차</span></li>
															<li data-v-6b9f430d="" class="el-select-dropdown__item"><span>포상</span></li>
															<li data-v-6b9f430d="" class="el-select-dropdown__item"><span>월차</span></li>
														</ul>
													</div>
													<div class="el-scrollbar__bar is-horizontal">
														<div class="el-scrollbar__thumb"
															style="transform: translateX(0%);"></div>
													</div>
													<div class="el-scrollbar__bar is-vertical">
														<div class="el-scrollbar__thumb"
															style="transform: translateY(0%);"></div>
													</div>
												</div>
												<!---->
											</div>
										</div>
									</div>
									<div data-v-6b9f430d="" class="d-flex align-items-center">
										<span data-v-6b9f430d="" class="title-span">생성 일수(시간)</span><input
											data-v-e8284514="" data-v-6b9f430d="" type="text"
											placeholder="" min="0" max="60" class="hw-input" value="2"
											style="width: 120px;"><span data-v-6b9f430d=""
											class="ml-10 mr-20">일</span>
										<button data-v-f8d3258e="" data-v-6b9f430d="" type="button"
											class="hw-button text">
											<!---->
											<span data-v-f8d3258e="" class="label"> 시간으로 생성 </span>
											<!---->
										</button>
									</div></td>
							</tr>
						</tbody>
					</table>
				</section>
				<section data-v-6b9f430d="">
					<button data-v-f8d3258e="" data-v-6b9f430d="" type="button"
						class="hw-button primary">
						<!---->
						<span data-v-f8d3258e="" class="label">생성하기</span>
						<!---->
					</button>
				</section>
				<div data-v-b389fa44="" data-v-6b9f430d=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 800px;">
						<div class="el-dialog__header">
							<div data-v-b389fa44="" class="modal-title">파일로 휴가 생성</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-b389fa44="" class="dialog-footer"><div
									data-v-b389fa44="">
									<button data-v-f8d3258e="" data-v-b389fa44="" type="button"
										class="hw-button secondary">
										<!---->
										<span data-v-f8d3258e="" class="label">닫기</span>
										<!---->
									</button>
									<button data-v-f8d3258e="" data-v-b389fa44="" type="button"
										disabled="disabled" class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">생성</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
				<div data-v-0de0c186="" data-v-6b9f430d=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog" style="margin-top: 15vh; width: 800px;">
						<div class="el-dialog__header">
							<div data-v-0de0c186="" class="modal-title">포상 휴가 생성</div>
							<button type="button" aria-label="Close"
								class="el-dialog__headerbtn">
								<i class="el-dialog__close el-icon el-icon-close"></i>
							</button>
						</div>
						<!---->
						<div class="el-dialog__footer">
							<span data-v-0de0c186="" class="dialog-footer"><div
									data-v-0de0c186="">
									<button data-v-f8d3258e="" data-v-0de0c186="" type="button"
										class="hw-button secondary">
										<!---->
										<span data-v-f8d3258e="" class="label">닫기</span>
										<!---->
									</button>
									<button data-v-f8d3258e="" data-v-0de0c186="" type="button"
										disabled="disabled" class="hw-button primary">
										<!---->
										<span data-v-f8d3258e="" class="label">생성</span>
										<!---->
									</button>
								</div></span>
						</div>
					</div>
				</div>
				<div data-v-6b9f430d="" class="hw-tree-org-wrapper"
					style="display: none;">
					<div data-v-6b9f430d="" class="hw-tree-wrapper" search="">
						<ul data-v-6311f1e8=""
							class="hw-tree-view-item hw-tree-item hw-tree-root">
							<li data-v-6311f1e8=""><div data-v-6311f1e8=""
									class="hw-tree-item-node">
									<i data-v-6311f1e8="" class="minus-circle fas fa-minus-circle"></i><span
										data-v-6311f1e8="" title="하이웍스산업"
										class="hw-tree-item-name opened">하이웍스산업</span><span
										data-v-6311f1e8="" class="hw-tree-item-count opened">(11)</span>
								</div>
								<div data-v-6311f1e8="">
									<ul data-v-6311f1e8="" class="hw-tree-item">
										<li data-v-6311f1e8=""><div data-v-6311f1e8=""
												class="hw-tree-item-node">
												<i data-v-6311f1e8=""
													class="minus-circle fas fa-minus-circle"></i><span
													data-v-6311f1e8="" title="관리부"
													class="hw-tree-item-name opened">관리부</span><span
													data-v-6311f1e8="" class="hw-tree-item-count opened">(4)</span>
											</div>
											<div data-v-6311f1e8="">
												<ul data-v-6311f1e8="" class="hw-tree-item" style="">
													<!---->
													<li data-v-6311f1e8=""><div data-v-6311f1e8=""
															class="hw-tree-item-leaf">
															<span data-v-6311f1e8="" title="인사팀"
																class="hw-tree-item-name">인사팀</span><span
																data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
														</div></li>
												</ul>
												<ul data-v-6311f1e8="" class="hw-tree-item" style="">
													<!---->
													<li data-v-6311f1e8=""><div data-v-6311f1e8=""
															class="hw-tree-item-leaf">
															<span data-v-6311f1e8="" title="구매총무팀"
																class="hw-tree-item-name">구매총무팀</span><span
																data-v-6311f1e8="" class="hw-tree-item-count">(1)</span>
														</div></li>
												</ul>
												<ul data-v-6311f1e8="" class="hw-tree-item" style="">
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
		</div>
	</div>
</div>



