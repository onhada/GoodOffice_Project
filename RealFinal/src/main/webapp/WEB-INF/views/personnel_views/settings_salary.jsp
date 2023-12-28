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
									style="width: 130px; transform: translateX(470px);"></div>
								<div id="tab-WorkTab" aria-controls="pane-WorkTab" role="tab"
									tabindex="-1" class="el-tabs__item is-top">근무</div>
								<div id="tab-VacationTab" aria-controls="pane-VacationTab"
									role="tab" tabindex="-1" class="el-tabs__item is-top">휴가</div>
								<div id="tab-WorkCheckTab" aria-controls="pane-WorkCheckTab"
									role="tab" tabindex="-1" class="el-tabs__item is-top">근무체크</div>
								<div id="tab-DailyWorkRuleTab"
									aria-controls="pane-DailyWorkRuleTab" role="tab" tabindex="-1"
									class="el-tabs__item is-top">일일근무규칙</div>
								<div id="tab-PayTab" aria-controls="pane-PayTab" role="tab"
									aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">급여</div>
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
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-VacationTab" aria-labelledby="tab-VacationTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-WorkCheckTab" aria-labelledby="tab-WorkCheckTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-DailyWorkRuleTab" aria-labelledby="tab-DailyWorkRuleTab"
						class="el-tab-pane" style="display: none;"></div>
					<div data-v-5aa223d2="" role="tabpanel" id="pane-PayTab"
						aria-labelledby="tab-PayTab" class="el-tab-pane"></div>
					<div data-v-5aa223d2="" role="tabpanel" aria-hidden="true"
						id="pane-EContractTab" aria-labelledby="tab-EContractTab"
						class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-2dccf564="" data-v-5aa223d2="" class="container">
				<section data-v-2dccf564="">
					<h4 data-v-2dccf564="" class="section-title">급여관리 사용 여부</h4>
					<p data-v-2dccf564="">임직원의 급여 내역을 관리하고 사용자에게 급여명세서를 교부할 수 있습니다.</p>
					<p data-v-2dccf564="">관리자는 급여대장을 작성하고 전자결재를 통해 급여지급 품의를 기안 할 수
						있습니다.</p>
					<div data-v-2dccf564="" class="hw-btntype-radio-group-nomal mt-20">
						<label data-v-2dccf564="" class="hw-btntype-radio-label"><input
							data-v-2dccf564="" type="radio" name="payrollUsage"
							class="hw-btntype-radio-input" value="true"><span
							data-v-2dccf564="" class="hw-btntype-radio-text">사용</span></label><label
							data-v-2dccf564="" class="hw-btntype-radio-label"><input
							data-v-2dccf564="" type="radio" name="payrollUsage"
							class="hw-btntype-radio-input" value="false"><span
							data-v-2dccf564="" class="hw-btntype-radio-text">사용 안 함</span></label>
					</div>
					<div data-v-2dccf564="" class="submit-section">
						<button data-v-f8d3258e="" data-v-2dccf564="" type="button"
							class="hw-button primary">
							<!---->
							<span data-v-f8d3258e="" class="label">저장</span>
							<!---->
						</button>
					</div>
				</section>
				<section data-v-475a5417="" data-v-2dccf564="">
					<h4 data-v-475a5417="" class="section-title">
						급여관리자
						<button data-v-475a5417="" class="ml-16 button-sm white">설정이력</button>
					</h4>
					<p data-v-475a5417="">급여관리자로 지정된 사용자는 전사 급여대장에 접근할 수 있는 권한을
						가집니다.</p>
					<p data-v-475a5417="">전체관리자도 급여관리자 권한 부여 후 메뉴 접근 및 기능 사용이
						가능합니다.</p>
					<button data-v-f8d3258e="" data-v-475a5417="" type="button"
						class="hw-button table-add-button text">
						<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
							data-v-f8d3258e="" class="label"> 관리자 추가 </span>
						<!---->
					</button>
					<table data-v-475a5417="" class="setting-table center">
						<thead data-v-475a5417="">
							<tr data-v-475a5417="">
								<th data-v-475a5417="">이름</th>
								<th data-v-475a5417="">아이디</th>
								<th data-v-475a5417="">소속</th>
								<th data-v-475a5417="">등록일</th>
								<th data-v-475a5417="">삭제</th>
							</tr>
						</thead>
						<!---->
						<tbody data-v-7a2e3100="" data-v-475a5417="">
							<tr data-v-7a2e3100="">
								<td data-v-7a2e3100="" class="text-left">양대리</td>
								<td data-v-7a2e3100="" class="text-left">yang</td>
								<td data-v-7a2e3100="" class="text-left">재무회계팀</td>
								<td data-v-7a2e3100="">2023-12-02</td>
								<td data-v-7a2e3100=""><button data-v-cde747bc=""
										data-v-7a2e3100="" type="button" class="hu-button info xs">
										<!---->
										<span data-v-cde747bc="" class="label">삭제</span>
										<!---->
									</button></td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
		</div>
	</div>
</div>

