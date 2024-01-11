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
									style="width: 110px; transform: translateX(110px);"></div>
								<div id="tab-WorkTab" aria-controls="pane-WorkTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근무</div>
								<div id="tab-VacationTab" aria-controls="pane-VacationTab"
									role="tab" aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">휴가</div>
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
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-WorkTab" aria-labelledby="tab-WorkTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" id="pane-VacationTab"
						aria-labelledby="tab-VacationTab" class="el-tab-pane"></div>
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
			<div data-v-9b59966e="" data-v-5aa223d2="" class="container">
				<section data-v-9b59966e="">
					<h4 data-v-9b59966e="" class="section-title">휴가 생성 조건</h4>
					<p data-v-9b59966e="">
						- 설정한 휴가 생성 기준으로 매년 생성일자(회계연도 기준) 또는 사용자 입사일(입사일 기준)에 휴가가 자동
						생성됩니다. <br data-v-9b59966e=""> - 조직에 속하지 않거나 입사일이 없는 사용자는 휴가가
						생성되지 않습니다. <br data-v-9b59966e=""> - 사용하던 휴가 생성 기준을 변경 적용하는
						경우, 기존 휴가 데이터는 초기화됩니다. (기존 휴가 생성분 삭제 및 새 기준에 맞추어 재생성) <br
							data-v-9b59966e=""> - 적용 전 입력한 휴가 생성 조건에 따라 생성될 전직원 생성 예정휴가를
						다운로드받아보실 수 있습니다. <br data-v-9b59966e="">
					</p>
					<div data-v-9b59966e="" class="mt-20">
						<div data-v-9b59966e="" role="radiogroup" class="el-radio-group">
							<label data-v-9b59966e="" role="radio" tabindex="0"
								class="el-radio is-checked" aria-checked="true"><span
								class="el-radio__input is-checked"><span
									class="el-radio__inner"></span><input type="radio"
									aria-hidden="true" tabindex="-1" autocomplete="off"
									class="el-radio__original" value="A"></span><span
								class="el-radio__label">회계일 기준<!----></span></label><label
								data-v-9b59966e="" role="radio" tabindex="-1" class="el-radio"><span
								class="el-radio__input"><span class="el-radio__inner"></span><input
									type="radio" aria-hidden="true" tabindex="-1"
									autocomplete="off" class="el-radio__original" value="J"></span><span
								class="el-radio__label">입사일 기준<!----></span></label>
						</div>
					</div>
					<div data-v-9b59966e="" class="form-box mt-30">
						<div data-v-9b59966e="" class="mb-24">
							<strong data-v-9b59966e="" class="mr-30">회계일</strong>
							<div data-v-9b59966e="" class="el-select flex-grow-1">
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
									style="display: none; min-width: 205px;">
									<div class="el-scrollbar" style="">
										<div class="el-select-dropdown__wrap el-scrollbar__wrap"
											style="margin-bottom: -8px; margin-right: -8px;">
											<ul class="el-scrollbar__view el-select-dropdown__list">
												<!---->
												<li data-v-9b59966e=""
													class="el-select-dropdown__item selected"><span>매년
														1월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														2월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														3월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														4월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														5월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														6월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														7월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														8월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														9월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														10월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														11월 1일</span></li>
												<li data-v-9b59966e="" class="el-select-dropdown__item"><span>매년
														12월 1일</span></li>
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
						<div data-v-9b59966e="" class="mb-10">
							<strong data-v-9b59966e="" class="mr-20">연차별 휴가일수</strong>
							<button data-v-f8d3258e="" data-v-9b59966e="" type="button"
								class="hw-button ml-12 text">
								<!---->
								<span data-v-f8d3258e="" class="label">전직원 생성 예정 휴가 다운로드</span>
								<!---->
							</button>
						</div>
						<div data-v-9b59966e="" class="form-box-row">
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">입사</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-disabled is-controls-right">
										<span role="button"
											class="el-input-number__decrease is-disabled"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small is-disabled">
											<!---->
											<input type="text" disabled="disabled" autocomplete="off"
												max="100" min="0" class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="0"
												aria-disabled="true">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">1년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-disabled is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small is-disabled">
											<!---->
											<input type="text" disabled="disabled" autocomplete="off"
												max="100" min="0" class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="15"
												aria-disabled="true">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">2년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="15"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">3년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="16"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">4년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="16"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">5년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="17"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">6년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="17"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">7년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="18"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">8년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="18"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">9년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="19"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">10년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="19"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">11년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="20"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">12년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="20"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">13년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="21"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">14년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="21"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">15년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="22"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">16년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="22"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">17년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="23"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">18년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="23"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">19년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="24"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">20년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="24"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">21년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="25"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">22년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="25"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">23년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="25"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">24년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="25"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
							<div data-v-9b59966e="" class="cell">
								<div data-v-9b59966e="" class="cell-name">25년차</div>
								<div data-v-9b59966e="">
									<div data-v-9b59966e=""
										class="el-input-number el-input-number--small is-controls-right">
										<span role="button" class="el-input-number__decrease"><i
											class="el-icon-arrow-down"></i></span><span role="button"
											class="el-input-number__increase"><i
											class="el-icon-arrow-up"></i></span>
										<div class="el-input el-input--small">
											<!---->
											<input type="text" autocomplete="off" max="100" min="0"
												class="el-input__inner" role="spinbutton"
												aria-valuemax="100" aria-valuemin="0" aria-valuenow="25"
												aria-disabled="false">
											<!---->
											<!---->
											<!---->
											<!---->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section data-v-9b59966e="">
					<h4 data-v-9b59966e="" class="section-title">1년차 휴가 자동 생성 설정</h4>
					<p data-v-9b59966e="">
						근로한 기간이 1년 미만인 근로자에게 입사일을 기준으로 1년간 매달 하루의 휴가를 생성합니다.
						<button data-v-f8d3258e="" data-v-9b59966e="" type="button"
							class="hw-button ml-12 text">
							<!---->
							<span data-v-f8d3258e="" class="label"> 자세히 보기 </span>
							<!---->
						</button>
					</p>
					<p data-v-9b59966e="">1년차 휴가(월차)는 입사일을 기준으로 1년간 사용할 수 있으며, 사용기간
						만료 후 자동으로 마이너스 처리됩니다.</p>
					<div data-v-9b59966e="" class="mt-15">
						<div data-v-9b59966e="" role="radiogroup" class="el-radio-group">
							<label data-v-9b59966e="" role="radio" tabindex="0"
								class="el-radio is-checked" aria-checked="true"><span
								class="el-radio__input is-checked"><span
									class="el-radio__inner"></span><input type="radio"
									aria-hidden="true" tabindex="-1" autocomplete="off"
									class="el-radio__original" value="Y"></span><span
								class="el-radio__label">사용<!----></span></label><label
								data-v-9b59966e="" role="radio" tabindex="-1" class="el-radio"><span
								class="el-radio__input"><span class="el-radio__inner"></span><input
									type="radio" aria-hidden="true" tabindex="-1"
									autocomplete="off" class="el-radio__original" value="N"></span><span
								class="el-radio__label">사용 안 함<!----></span></label>
						</div>
					</div>
					<button data-v-f8d3258e="" data-v-9b59966e="" type="button"
						class="hw-button mt-30 primary">
						<!---->
						<span data-v-f8d3258e="" class="label">적용</span>
						<!---->
					</button>
				</section>
				<section data-v-9b59966e="">
					<h4 data-v-9b59966e="" class="section-title">기타 설정</h4>
					<ul data-v-9b59966e="" class="form-group">
						<li data-v-9b59966e=""><div data-v-9b59966e="">- 휴가 이월
								설정 :</div>
							<div data-v-9b59966e="">
								<label data-v-682bb766="" data-v-9b59966e="" class="mr-20"><div
										data-v-682bb766="" class="hw-checkbox">
										<span data-v-682bb766="" class="checkbox-input"></span><input
											data-v-682bb766="" type="checkbox" checked="checked"
											class="checkbox-original"><span data-v-682bb766=""
											class="label"><span data-v-9b59966e=""
											data-v-682bb766="">연차휴가 이월</span></span>
									</div></label><label data-v-682bb766="" data-v-9b59966e="" class="mr-20"><div
										data-v-682bb766="" class="hw-checkbox">
										<span data-v-682bb766="" class="checkbox-input"></span><input
											data-v-682bb766="" type="checkbox" checked="checked"
											class="checkbox-original"><span data-v-682bb766=""
											class="label"><span data-v-9b59966e=""
											data-v-682bb766="">포상휴가 이월</span></span>
									</div></label>
							</div></li>
						<li data-v-9b59966e=""><div data-v-9b59966e="">- 마이너스
								휴가사용 :</div>
							<div data-v-9b59966e="">
								<div data-v-9b59966e="" role="radiogroup" class="el-radio-group">
									<label data-v-9b59966e="" role="radio" tabindex="0"
										class="el-radio"><span class="el-radio__input"><span
											class="el-radio__inner"></span><input type="radio"
											aria-hidden="true" tabindex="-1" autocomplete="off"
											class="el-radio__original" value="Y"></span><span
										class="el-radio__label">사용<!----></span></label><label
										data-v-9b59966e="" role="radio" tabindex="0"
										class="el-radio is-checked" aria-checked="true"><span
										class="el-radio__input is-checked"><span
											class="el-radio__inner"></span><input type="radio"
											aria-hidden="true" tabindex="-1" autocomplete="off"
											class="el-radio__original" value="N"></span><span
										class="el-radio__label">사용 안 함<!----></span></label>
								</div>
							</div></li>
						<li data-v-9b59966e=""><div data-v-9b59966e="">- 휴가캘린더
								출력옵션 :</div>
							<div data-v-9b59966e="" class="ml-5">
								<div data-v-9b59966e="" class="el-select flex-grow-1">
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
										style="display: none; min-width: 205px;">
										<div class="el-scrollbar" style="">
											<div class="el-select-dropdown__wrap el-scrollbar__wrap"
												style="margin-bottom: -8px; margin-right: -8px;">
												<ul class="el-scrollbar__view el-select-dropdown__list">
													<!---->
													<li data-v-9b59966e=""
														class="el-select-dropdown__item selected"><span>휴가캘린더
															사용</span></li>
													<li data-v-9b59966e="" class="el-select-dropdown__item"><span>휴가캘린더
															사용 안 함</span></li>
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
								<div data-v-9b59966e="" role="radiogroup"
									class="el-radio-group ml-30" style="">
									<label data-v-9b59966e="" role="radio" tabindex="0"
										class="el-radio is-checked" aria-checked="true"><span
										class="el-radio__input is-checked"><span
											class="el-radio__inner"></span><input type="radio"
											aria-hidden="true" tabindex="-1" autocomplete="off"
											class="el-radio__original" value="C"></span><span
										class="el-radio__label">결재 완료된 휴가만 출력<!----></span></label><label
										data-v-9b59966e="" role="radio" tabindex="-1" class="el-radio"><span
										class="el-radio__input"><span class="el-radio__inner"></span><input
											type="radio" aria-hidden="true" tabindex="-1"
											autocomplete="off" class="el-radio__original" value="P"></span><span
										class="el-radio__label">결재 진행+완료된 휴가 모두 출력<!----></span></label>
								</div>
							</div></li>
					</ul>
					<button data-v-f8d3258e="" data-v-9b59966e="" type="button"
						class="hw-button mt-30 primary">
						<!---->
						<span data-v-f8d3258e="" class="label">저장</span>
						<!---->
					</button>
				</section>
				<section data-v-9b59966e="" class="work-rule-table-section mt-40">
					<h4 data-v-9b59966e="" class="section-title">휴가 종류</h4>
					<div data-v-9b59966e="" class="mt-20 mb-20">휴가 종류를 생성하고, 연차에서
						차감할지 여부를 선택하세요. 또한, 휴가 종류별로 시간제 휴가 사용여부와 최소단위를 선택할 수 있습니다.</div>
					<div data-v-9b59966e="" class="mt-20 mb-20">
						<button data-v-f8d3258e="" data-v-9b59966e="" type="button"
							class="hw-button text">
							<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
								data-v-f8d3258e="" class="label"> 추가하기 </span>
							<!---->
						</button>
					</div>
					<table data-v-9b59966e="" class="setting-table center mt-10">
						<colgroup data-v-9b59966e="">
							<col data-v-9b59966e="" style="width: 15%;">
							<col data-v-9b59966e="" style="width: 15%;">
							<col data-v-9b59966e="" style="width: 15%;">
							<col data-v-9b59966e="" style="width: 15%;">
							<col data-v-9b59966e="" style="width: 20%;">
							<col data-v-9b59966e="" style="width: 20%;">
						</colgroup>
						<thead data-v-9b59966e="">
							<tr data-v-9b59966e="">
								<th data-v-9b59966e="">휴가명</th>
								<th data-v-9b59966e="">사용여부</th>
								<th data-v-9b59966e="">연차에서 차감여부</th>
								<th data-v-9b59966e="">생성여부</th>
								<th data-v-9b59966e="">시간제 휴가 최소단위</th>
								<th data-v-9b59966e="">수정 / 삭제</th>
							</tr>
						</thead>
						<!---->
						<tbody data-v-9b59966e="">
							<tr data-v-9b59966e="">
								<td data-v-9b59966e="">연차</td>
								<td data-v-9b59966e="" class="select-td"><span
									data-v-9b59966e="">사용</span>
								<!----></td>
								<td data-v-9b59966e=""><span data-v-9b59966e="">차감</span>
								<!----></td>
								<td data-v-9b59966e="" class="select-td"><span
									data-v-9b59966e="">생성 필요</span>
								<!----></td>
								<td data-v-9b59966e="">
									<!---->
									<span data-v-9b59966e="">4시간</span>
								<!---->
									<!---->
									<!---->
								</td>
								<td data-v-9b59966e=""><button data-v-cde747bc=""
										data-v-9b59966e="" type="button"
										class="hu-button secondary xs">
										<!---->
										<span data-v-cde747bc="" class="label">수정</span>
										<!---->
									</button>
									<button data-v-cde747bc="" data-v-9b59966e="" type="button"
										disabled="disabled" class="hu-button info xs">
										<!---->
										<span data-v-cde747bc="" class="label">삭제 </span>
										<!---->
									</button></td>
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
							</tr>
							<tr data-v-9b59966e="">
								<td data-v-9b59966e="">포상</td>
								<td data-v-9b59966e="" class="select-td"><span
									data-v-9b59966e="">사용</span>
								<!----></td>
								<td data-v-9b59966e="">
									<!---->
									<span data-v-9b59966e="">차감 안함</span>
								</td>
								<td data-v-9b59966e="" class="select-td"><span
									data-v-9b59966e="">생성 필요</span>
								<!----></td>
								<td data-v-9b59966e=""><span data-v-9b59966e="">비허용</span>
								<!---->
									<!---->
									<!---->
									<!----></td>
								<td data-v-9b59966e=""><button data-v-cde747bc=""
										data-v-9b59966e="" type="button"
										class="hu-button secondary xs">
										<!---->
										<span data-v-cde747bc="" class="label">수정</span>
										<!---->
									</button>
									<button data-v-cde747bc="" data-v-9b59966e="" type="button"
										disabled="disabled" class="hu-button info xs">
										<!---->
										<span data-v-cde747bc="" class="label">삭제 </span>
										<!---->
									</button></td>
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
							</tr>
							<tr data-v-9b59966e="">
								<td data-v-9b59966e="">경조사</td>
								<td data-v-9b59966e="" class="select-td"><span
									data-v-9b59966e="">사용</span>
								<!----></td>
								<td data-v-9b59966e="">
									<!---->
									<span data-v-9b59966e="">차감 안함</span>
								</td>
								<td data-v-9b59966e="" class="select-td">
									<!---->
									<span data-v-9b59966e="">생성 없이 사용</span>
								</td>
								<td data-v-9b59966e=""><span data-v-9b59966e="">비허용</span>
								<!---->
									<!---->
									<!---->
									<!----></td>
								<td data-v-9b59966e=""><button data-v-cde747bc=""
										data-v-9b59966e="" type="button"
										class="hu-button secondary xs">
										<!---->
										<span data-v-cde747bc="" class="label">수정</span>
										<!---->
									</button>
									<button data-v-cde747bc="" data-v-9b59966e="" type="button"
										class="hu-button info xs">
										<!---->
										<span data-v-cde747bc="" class="label">삭제 </span>
										<!---->
									</button></td>
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
							</tr>
							<!---->
						</tbody>
					</table>
				</section>
				<section data-v-9b59966e="" class="mb-40">
					<h4 data-v-9b59966e="" class="section-title">시간제 휴가 관련 설정</h4>
					<div data-v-9b59966e="" class="setting-div">
						<div data-v-9b59966e="" class="label mr-15">- 1일 최대 허용 시간 :</div>
						<label data-v-9b59966e="" role="radio" tabindex="0"
							class="el-radio"><span class="el-radio__input"><span
								class="el-radio__inner"></span><input type="radio"
								aria-hidden="true" tabindex="-1" autocomplete="off"
								class="el-radio__original" value="04:00:00"></span><span
							class="el-radio__label">4시간 <!----></span></label><label
							data-v-9b59966e="" role="radio" tabindex="0" class="el-radio"><span
							class="el-radio__input"><span class="el-radio__inner"></span><input
								type="radio" aria-hidden="true" tabindex="-1" autocomplete="off"
								class="el-radio__original" value="02:00:00"></span><span
							class="el-radio__label">2시간 <!----></span></label><label
							data-v-9b59966e="" role="radio" aria-checked="true" tabindex="0"
							class="el-radio is-checked"><span
							class="el-radio__input is-checked"><span
								class="el-radio__inner"></span><input type="radio"
								aria-hidden="true" tabindex="-1" autocomplete="off"
								class="el-radio__original" value=""></span><span
							class="el-radio__label">제한없음 <!----></span></label>
					</div>
					<div data-v-9b59966e="" class="setting-div">
						<div data-v-9b59966e="" class="label mr-15">- 사용 제한 :</div>
						<label data-v-9b59966e="" role="radio" tabindex="0"
							class="el-radio"><span class="el-radio__input"><span
								class="el-radio__inner"></span><input type="radio"
								aria-hidden="true" tabindex="-1" autocomplete="off"
								class="el-radio__original" value="Y"></span><span
							class="el-radio__label"> 출근 및 퇴근시간에 붙여서만 사용 <!----></span></label><label
							data-v-9b59966e="" role="radio" tabindex="0"
							class="el-radio is-checked" aria-checked="true"><span
							class="el-radio__input is-checked"><span
								class="el-radio__inner"></span><input type="radio"
								aria-hidden="true" tabindex="-1" autocomplete="off"
								class="el-radio__original" value="N"></span><span
							class="el-radio__label"> 제한없음 <!----></span></label>
					</div>
					<button data-v-f8d3258e="" data-v-9b59966e="" type="button"
						class="hw-button mt-30 primary">
						<!---->
						<span data-v-f8d3258e="" class="label">저장</span>
						<!---->
					</button>
				</section>
				<div data-v-3cc3ad0c="" data-v-9b59966e="">
					<section data-v-3cc3ad0c="" class="mb-40">
						<h4 data-v-3cc3ad0c="" class="section-title">연차촉진 관리</h4>
						<div data-v-3cc3ad0c="" class="section-description">
							근로기준법에 따라 연차를 촉진하고 관리하는 기능입니다. <br data-v-3cc3ad0c=""> 올해 잔여
							연차와 연차 사용기한을 확인하여 사용자에게 촉진 메일을 발송하고, 메일을 수취한 사용자는 사용계획을 전자결재로 기안할
							수 있습니다.
						</div>
						<div data-v-3cc3ad0c="" role="radiogroup" class="el-radio-group">
							<label data-v-3cc3ad0c="" role="radio" tabindex="-1"
								class="el-radio"><span class="el-radio__input"><span
									class="el-radio__inner"></span><input type="radio"
									aria-hidden="true" tabindex="-1" autocomplete="off"
									class="el-radio__original" value="true"></span><span
								class="el-radio__label">사용<!----></span></label><label
								data-v-3cc3ad0c="" role="radio" aria-checked="true" tabindex="0"
								class="el-radio is-checked"><span
								class="el-radio__input is-checked"><span
									class="el-radio__inner"></span><input type="radio"
									aria-hidden="true" tabindex="-1" autocomplete="off"
									class="el-radio__original" value="false"></span><span
								class="el-radio__label">사용 안 함<!----></span></label>
						</div>
					</section>
					<!---->
					<button data-v-cde747bc="" data-v-3cc3ad0c="" type="button"
						class="hu-button primary">
						<!---->
						<span data-v-cde747bc="" class="label">저장</span>
						<!---->
					</button>
				</div>
				<div data-v-46292040="" data-v-9b59966e=""
					class="el-dialog__wrapper" style="display: none;">
					<div role="dialog" aria-modal="true" aria-label="dialog"
						class="el-dialog md" style="margin-top: 15vh;">
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

