<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div id="router_split_item" class="split-item right"
	style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-3fa27d9e="" class="setting-tab">
			<div data-v-3fa27d9e="" class="el-tabs el-tabs--top">
				<div class="el-tabs__header is-top">
					<div class="el-tabs__nav-wrap is-top">
						<div class="el-tabs__nav-scroll">
							<div role="tablist" class="el-tabs__nav is-top"
								style="transform: translateX(0px);">
								<div class="el-tabs__active-bar is-top"
									style="width: 110px; transform: translateX(0px);"></div>
								<div id="tab-PayrollTab" aria-controls="pane-PayrollTab"
									role="tab" aria-selected="true" tabindex="0"
									class="el-tabs__item is-top is-active">급여대장</div>
								<div id="tab-PaySettingTab" aria-controls="pane-PaySettingTab"
									role="tab" tabindex="-1" class="el-tabs__item is-top">급여
									설정</div>
							</div>
						</div>
					</div>
				</div>
				<div class="el-tabs__content">
					<div data-v-3fa27d9e="" role="tabpanel" id="pane-PayrollTab"
						aria-labelledby="tab-PayrollTab" class="el-tab-pane"></div>
					<div data-v-3fa27d9e="" role="tabpanel" aria-hidden="true"
						id="pane-PaySettingTab" aria-labelledby="tab-PaySettingTab"
						class="el-tab-pane" style="display: none;"></div>
				</div>
			</div>
			<div data-v-df99e578="" data-v-3fa27d9e="" class="container">
				<div data-v-df99e578="" class="information-wrapper">
					<h4 data-v-df99e578="">급여대장 작성</h4>
					<ul data-v-df99e578="">
						<li data-v-df99e578="">급여대장 업로드 양식을 다운로드 받아 직원별 급여 대장을 작성하세요.
							일괄 업로드 후 급여를 확정할 수 있습니다.</li>
						<li data-v-df99e578="">급여대장 입력 양식은 급여 설정 페이지의 지급/공제 항목을 기준으로
							생성됩니다.</li>
						<li data-v-df99e578="">대상자 추가 및 수정은 등록된 급여대장 삭제 후, 파일을 수정하여
							다시 등록해야합니다.</li>
						<li data-v-df99e578="">확정된 급여대장은 급여지급일에 맞춰 사용자의 급여 메뉴를 통해
							급여명세서로 교부됩니다.</li>
					</ul>
					<div data-v-df99e578="">
						<button data-v-f8d3258e="" data-v-df99e578="" type="button"
							class="hw-button text no-space">
							<!---->
							<span data-v-f8d3258e="" class="label">급여대장입력 양식 다운로드 </span>
							<!---->
						</button>
					</div>
				</div>
				<section data-v-df99e578="" class="payroll-wrapper">
					<div data-v-df99e578="" class="header">
						<div data-v-df99e578="" class="header-left">
							<div data-v-df99e578="" class="month-picker">
								<div data-v-20e681c6="" data-v-df99e578="" class="picker_wrap">
									<button data-v-20e681c6="" class="hw-icon">
										<i data-v-20e681c6="" class="gi gi-short-arrow-left-alt"></i>
									</button>
									<span data-v-20e681c6="" class="picker_date">2023년 12월</span>
									<button data-v-20e681c6="" class="hw-icon">
										<i data-v-20e681c6="" class="gi gi-short-arrow-right-alt"></i>
									</button>
								</div>
							</div>
							<div data-v-1f6af9b4="" data-v-df99e578="" class="status confirm">
								<span data-v-1f6af9b4=""> 급여확정 2023-12-02 16:09:46</span>
							</div>
						</div>
						<div data-v-df99e578="" class="header-right">
							<button data-v-f8d3258e="" data-v-df99e578="" type="button"
								class="hw-button text no-space">
								<!---->
								<span data-v-f8d3258e="" class="label">전자결재 품의연동 </span>
								<!---->
							</button>
						</div>
					</div>
					<div data-v-df99e578="" class="summary">
						<div data-v-5440997e="" data-v-df99e578="" class="summary">
							<div data-v-5440997e="" class="writing-payroll summary-sort">
								<ul data-v-5440997e="">
									<li data-v-5440997e=""><span data-v-5440997e=""
										class="title">산정 기간</span><span data-v-5440997e=""
										class="content">2023년 12월 1일 ~ 2023년 12월 31일</span></li>
									<li data-v-5440997e=""><span data-v-5440997e=""
										class="title">급여 지급일</span><span data-v-5440997e=""
										class="content">2023년 12월 2일</span></li>
									<li data-v-5440997e=""><span data-v-5440997e=""
										class="title">대상자</span><span data-v-5440997e=""
										class="content">2명</span></li>
									<li data-v-5440997e=""><span data-v-5440997e=""
										class="title">지급 총액</span><span data-v-5440997e=""
										class="content">911,000원</span></li>
									<li data-v-5440997e=""><span data-v-5440997e=""
										class="title">공제 총액</span><span data-v-5440997e=""
										class="content">3,000원</span></li>
									<li data-v-5440997e=""><span data-v-5440997e=""
										class="title">실 지급 총액</span><span data-v-5440997e=""
										class="content">908,000원</span></li>
								</ul>
							</div>
						</div>
					</div>
					<div data-v-df99e578="" class="actions">
						<div data-v-41d95e92="" data-v-df99e578="" class="actions">
							<button data-v-cde747bc="" data-v-41d95e92="" type="button"
								class="hu-button pill-shape-outline button-round">
								<!---->
								<span data-v-cde747bc="" class="label"><span
									data-v-3492dd16="" data-v-41d95e92="" class="mr-6"
									data-v-cde747bc="" style="e9135: #909090;"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16.001"
											viewBox="0 0 16 16.001">
    <g data-name="Layer 2">
        <path data-name="사각형 33993" transform="translate(0 .001)"
												style="fill:transparent" d="M0 0h16v16H0z"></path>
        <path data-name="패스 4070"
												d="M9.517.115A7.51 7.51 0 0 0 1 5.449V1H0v6.366h5.964v-1h-4.15a6.521 6.521 0 1 1 .989 4.72l-.84.541A7.5 7.5 0 1 0 9.516.115z"
												style="fill:#909090" transform="translate(0 -.001)"></path>
    </g>
</svg></span> 확정해제 </span>
								<!---->
							</button>
							<button data-v-cde747bc="" data-v-41d95e92="" type="button"
								class="hu-button button-round primary">
								<!---->
								<span data-v-cde747bc="" class="label">급여대장 다운로드 </span>
								<!---->
							</button>
						</div>
					</div>
				</section>
				<section data-v-df99e578="" class="payroll-list-wrapper">
					<div data-v-df99e578="">
						<div data-v-3a733414="" data-v-df99e578="" class="list">
							<div data-v-3a733414="" class="header">
								<div data-v-3a733414="" class="header-left">
									<span data-v-3a733414="">전체 2명</span>
								</div>
								<div data-v-3a733414="" class="header-right">
									<!---->
									<div data-v-3a733414="" class="hw-input-group prefix"
										style="width: 240px;">
										<input placeholder="이름, ID 검색" class="hw-input"><i
											class="icon fal fa-search"></i>
									</div>
								</div>
							</div>
							<div data-v-3a733414="" class="table-wrapper">
								<div data-v-3a733414=""
									class="el-table el-table--fit el-table--fluid-height el-table--scrollable-x el-table--enable-row-transition"
									style="width: 100%; max-height: 500px;">
									<div class="hidden-columns">
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
										<div data-v-3a733414=""></div>
									</div>
									<div class="el-table__header-wrapper">
										<table cellspacing="0" cellpadding="0" border="0"
											class="el-table__header" style="width: 2303px;">
											<colgroup>
												<col name="el-table_3_column_35" width="150">
												<col name="el-table_3_column_36" width="150">
												<col name="el-table_3_column_37" width="200">
												<col name="el-table_3_column_38" width="150">
												<col name="el-table_3_column_39" width="120">
												<col name="el-table_3_column_40" width="120">
												<col name="el-table_3_column_41" width="120">
												<col name="el-table_3_column_42" width="120">
												<col name="el-table_3_column_43" width="153">
												<col name="el-table_3_column_44" width="140">
												<col name="el-table_3_column_45" width="120">
												<col name="el-table_3_column_46" width="120">
												<col name="el-table_3_column_47" width="120">
												<col name="el-table_3_column_48" width="120">
												<col name="el-table_3_column_49" width="120">
												<col name="el-table_3_column_50" width="140">
												<col name="el-table_3_column_51" width="140">
												<col name="gutter" width="0">
											</colgroup>
											<thead class="has-gutter">
												<tr class="">
													<th colspan="1" rowspan="1"
														class="el-table_3_column_35  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell"><div
															class="cell">
															<span data-v-3a733414="">이름</span><i data-v-3a733414=""
																class="sort-icon gis gi-short-arrow-up"></i>
														</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_36  is-center table-col table-id  is-hidden is-leaf table-header el-table__cell"><div
															class="cell">
															<span data-v-3a733414="">ID</span>
															<!---->
														</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_37  is-center table-col table-org  is-leaf table-header el-table__cell"><div
															class="cell">
															<span data-v-3a733414="">소속조직</span>
															<!---->
														</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_38  is-center table-col table-position  is-leaf table-header el-table__cell"><div
															class="cell">
															<span data-v-3a733414="">직위</span>
															<!---->
														</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_39  is-center table-col table-payments  is-leaf table-header el-table__cell"><div
															class="cell">기본급</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_40  is-center table-col table-payments  is-leaf table-header el-table__cell"><div
															class="cell">연장근로 수당</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_41  is-center table-col table-payments  is-leaf table-header el-table__cell"><div
															class="cell">야간근로 수당</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_42  is-center table-col table-payments  is-leaf table-header el-table__cell"><div
															class="cell">휴일근로 수당</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_43  is-center table-col table-payments  is-leaf table-header el-table__cell"><div
															class="cell">미사용 연차 수당</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_44  is-center table-col table-payment-amount  is-leaf table-header el-table__cell"><div
															class="cell">지급 총액</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_45  is-center table-col table-deduction  is-leaf table-header el-table__cell"><div
															class="cell">소득세</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_46  is-center table-col table-deduction  is-leaf table-header el-table__cell"><div
															class="cell">지방소득세</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_47  is-center table-col table-deduction  is-leaf table-header el-table__cell"><div
															class="cell">국민연금</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_48  is-center table-col table-deduction  is-leaf table-header el-table__cell"><div
															class="cell">건강보험</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_49  is-center table-col table-deduction  is-leaf table-header el-table__cell"><div
															class="cell">장기요양보험</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_50  is-center table-col table-deduction-amount  is-leaf table-header el-table__cell"><div
															class="cell">공제 총액</div></th>
													<th colspan="1" rowspan="1"
														class="el-table_3_column_51  is-center table-col table-actual-payment-amount  is-hidden is-leaf table-header el-table__cell"><div
															class="cell">실 지급액</div></th>
													<th class="el-table__cell gutter"
														style="width: 0px; display: none;"></th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="el-table__body-wrapper is-scrolling-left"
										style="max-height: 460px;">
										<table cellspacing="0" cellpadding="0" border="0"
											class="el-table__body" style="width: 2303px;">
											<colgroup>
												<col name="el-table_3_column_35" width="150">
												<col name="el-table_3_column_36" width="150">
												<col name="el-table_3_column_37" width="200">
												<col name="el-table_3_column_38" width="150">
												<col name="el-table_3_column_39" width="120">
												<col name="el-table_3_column_40" width="120">
												<col name="el-table_3_column_41" width="120">
												<col name="el-table_3_column_42" width="120">
												<col name="el-table_3_column_43" width="153">
												<col name="el-table_3_column_44" width="140">
												<col name="el-table_3_column_45" width="120">
												<col name="el-table_3_column_46" width="120">
												<col name="el-table_3_column_47" width="120">
												<col name="el-table_3_column_48" width="120">
												<col name="el-table_3_column_49" width="120">
												<col name="el-table_3_column_50" width="140">
												<col name="el-table_3_column_51" width="140">
											</colgroup>
											<tbody>
												<tr class="el-table__row">
													<td rowspan="1" colspan="1"
														class="el-table_3_column_35  table-col table-name is-hidden table-row el-table__cell"><div
															class="cell">김이사</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_36  table-col table-id is-hidden table-row el-table__cell"><div
															class="cell">kim</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_37  table-col table-org table-row el-table__cell"><div
															class="cell">
															<span data-v-3a733414=""> 생산1팀 </span>
														</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_38  table-col table-position table-row el-table__cell"><div
															class="cell">이사</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_39 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">200,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_40 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">100,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_41 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">50,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_42 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">30,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_43 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">50,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_44 is-right table-col table-payment-amount table-row el-table__cell"><div
															class="cell">430,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_45 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">100</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_46 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">200</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_47 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">300</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_48 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">400</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_49 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">500</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_50 is-right table-col table-deduction-amount table-row el-table__cell"><div
															class="cell">1,500</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_51 is-right table-col table-actual-payment-amount is-hidden table-row el-table__cell"><div
															class="cell">428,500</div></td>
												</tr>
												<tr class="el-table__row">
													<td rowspan="1" colspan="1"
														class="el-table_3_column_35  table-col table-name is-hidden table-row el-table__cell"><div
															class="cell">박상무</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_36  table-col table-id is-hidden table-row el-table__cell"><div
															class="cell">park</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_37  table-col table-org table-row el-table__cell"><div
															class="cell">
															<span data-v-3a733414=""> 구매총무팀 </span>
														</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_38  table-col table-position table-row el-table__cell"><div
															class="cell">상무</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_39 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">250,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_40 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">100,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_41 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">80,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_42 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">50,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_43 is-right table-col table-payments table-row el-table__cell"><div
															class="cell">1,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_44 is-right table-col table-payment-amount table-row el-table__cell"><div
															class="cell">481,000</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_45 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">100</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_46 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">200</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_47 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">300</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_48 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">400</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_49 is-right table-col table-deduction table-row el-table__cell"><div
															class="cell">500</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_50 is-right table-col table-deduction-amount table-row el-table__cell"><div
															class="cell">1,500</div></td>
													<td rowspan="1" colspan="1"
														class="el-table_3_column_51 is-right table-col table-actual-payment-amount is-hidden table-row el-table__cell"><div
															class="cell">479,500</div></td>
												</tr>
												<!---->
											</tbody>
										</table>
										<!---->
										<!---->
									</div>
									<!---->
									<div class="el-table__fixed" style="width: 300px; bottom: 8px;">
										<div class="el-table__fixed-header-wrapper">
											<table cellspacing="0" cellpadding="0" border="0"
												class="el-table__header" style="width: 2303px;">
												<colgroup>
													<col name="el-table_3_column_35" width="150">
													<col name="el-table_3_column_36" width="150">
													<col name="el-table_3_column_37" width="200">
													<col name="el-table_3_column_38" width="150">
													<col name="el-table_3_column_39" width="120">
													<col name="el-table_3_column_40" width="120">
													<col name="el-table_3_column_41" width="120">
													<col name="el-table_3_column_42" width="120">
													<col name="el-table_3_column_43" width="153">
													<col name="el-table_3_column_44" width="140">
													<col name="el-table_3_column_45" width="120">
													<col name="el-table_3_column_46" width="120">
													<col name="el-table_3_column_47" width="120">
													<col name="el-table_3_column_48" width="120">
													<col name="el-table_3_column_49" width="120">
													<col name="el-table_3_column_50" width="140">
													<col name="el-table_3_column_51" width="140">
												</colgroup>
												<thead class="">
													<tr class="">
														<th colspan="1" rowspan="1"
															class="el-table_3_column_35  is-center table-col table-name  is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">이름</span><i data-v-3a733414=""
																	class="sort-icon gis gi-short-arrow-up"></i>
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_36  is-center table-col table-id  is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">ID</span>
																<!---->
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_37  is-center table-col table-org  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">소속조직</span>
																<!---->
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_38  is-center table-col table-position  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">직위</span>
																<!---->
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_39  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">기본급</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_40  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">연장근로 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_41  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">야간근로 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_42  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">휴일근로 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_43  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">미사용 연차 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_44  is-center table-col table-payment-amount  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">지급 총액</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_45  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">소득세</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_46  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">지방소득세</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_47  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">국민연금</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_48  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">건강보험</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_49  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">장기요양보험</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_50  is-center table-col table-deduction-amount  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">공제 총액</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_51  is-center table-col table-actual-payment-amount  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">실 지급액</div></th>
													</tr>
												</thead>
											</table>
										</div>
										<div class="el-table__fixed-body-wrapper"
											style="top: 40px; max-height: 452px;">
											<table cellspacing="0" cellpadding="0" border="0"
												class="el-table__body" style="width: 300px;">
												<colgroup>
													<col name="el-table_3_column_35" width="150">
													<col name="el-table_3_column_36" width="150">
												</colgroup>
												<tbody>
													<tr class="el-table__row" style="height: 40px;">
														<td rowspan="1" colspan="1"
															class="el-table_3_column_35  table-col table-name table-row el-table__cell"><div
																class="cell">김이사</div></td>
														<td rowspan="1" colspan="1"
															class="el-table_3_column_36  table-col table-id table-row el-table__cell"><div
																class="cell">kim</div></td>
													</tr>
													<tr class="el-table__row" style="height: 40px;">
														<td rowspan="1" colspan="1"
															class="el-table_3_column_35  table-col table-name table-row el-table__cell"><div
																class="cell">박상무</div></td>
														<td rowspan="1" colspan="1"
															class="el-table_3_column_36  table-col table-id table-row el-table__cell"><div
																class="cell">park</div></td>
													</tr>
													<!---->
												</tbody>
											</table>
											<!---->
										</div>
										<!---->
									</div>
									<div class="el-table__fixed-right"
										style="width: 140px; bottom: 8px;">
										<div class="el-table__fixed-header-wrapper">
											<table cellspacing="0" cellpadding="0" border="0"
												class="el-table__header" style="width: 2303px;">
												<colgroup>
													<col name="el-table_3_column_35" width="150">
													<col name="el-table_3_column_36" width="150">
													<col name="el-table_3_column_37" width="200">
													<col name="el-table_3_column_38" width="150">
													<col name="el-table_3_column_39" width="120">
													<col name="el-table_3_column_40" width="120">
													<col name="el-table_3_column_41" width="120">
													<col name="el-table_3_column_42" width="120">
													<col name="el-table_3_column_43" width="153">
													<col name="el-table_3_column_44" width="140">
													<col name="el-table_3_column_45" width="120">
													<col name="el-table_3_column_46" width="120">
													<col name="el-table_3_column_47" width="120">
													<col name="el-table_3_column_48" width="120">
													<col name="el-table_3_column_49" width="120">
													<col name="el-table_3_column_50" width="140">
													<col name="el-table_3_column_51" width="140">
												</colgroup>
												<thead class="">
													<tr class="">
														<th colspan="1" rowspan="1"
															class="el-table_3_column_35  is-center table-col table-name  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">이름</span><i data-v-3a733414=""
																	class="sort-icon gis gi-short-arrow-up"></i>
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_36  is-center table-col table-id  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">ID</span>
																<!---->
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_37  is-center table-col table-org  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">소속조직</span>
																<!---->
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_38  is-center table-col table-position  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">
																<span data-v-3a733414="">직위</span>
																<!---->
															</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_39  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">기본급</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_40  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">연장근로 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_41  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">야간근로 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_42  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">휴일근로 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_43  is-center table-col table-payments  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">미사용 연차 수당</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_44  is-center table-col table-payment-amount  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">지급 총액</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_45  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">소득세</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_46  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">지방소득세</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_47  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">국민연금</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_48  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">건강보험</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_49  is-center table-col table-deduction  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">장기요양보험</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_50  is-center table-col table-deduction-amount  is-hidden is-leaf table-header el-table__cell"><div
																class="cell">공제 총액</div></th>
														<th colspan="1" rowspan="1"
															class="el-table_3_column_51  is-center table-col table-actual-payment-amount  is-leaf table-header el-table__cell"><div
																class="cell">실 지급액</div></th>
													</tr>
												</thead>
											</table>
										</div>
										<div class="el-table__fixed-body-wrapper"
											style="top: 40px; max-height: 452px;">
											<table cellspacing="0" cellpadding="0" border="0"
												class="el-table__body" style="width: 140px;">
												<colgroup>
													<col name="el-table_3_column_51" width="140">
												</colgroup>
												<tbody>
													<tr class="el-table__row" style="height: 40px;">
														<td rowspan="1" colspan="1"
															class="el-table_3_column_51 is-right table-col table-actual-payment-amount table-row el-table__cell"><div
																class="cell">428,500</div></td>
													</tr>
													<tr class="el-table__row" style="height: 40px;">
														<td rowspan="1" colspan="1"
															class="el-table_3_column_51 is-right table-col table-actual-payment-amount table-row el-table__cell"><div
																class="cell">479,500</div></td>
													</tr>
													<!---->
												</tbody>
											</table>
											<!---->
										</div>
										<!---->
									</div>
									<div class="el-table__fixed-right-patch"
										style="width: 0px; height: 40px;"></div>
									<div class="el-table__column-resize-proxy"
										style="display: none;"></div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>
