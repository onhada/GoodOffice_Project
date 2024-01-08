<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>




<div id="router_split_item" class="split-item right"
	style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-35746452="" class="wrapper">
			<h3 data-v-35746452="" class="header">비활성 사용자</h3>
			<section data-v-35746452="" class="description">
				<ul data-v-35746452="">
					<li data-v-35746452=""><span data-v-35746452="">삭제 사용자는
							삭제 유예 기간(14일) 내에 복원하지 않을 경우, 모든 사용자 데이터가 영구 삭제됩니다.</span></li>
					<li data-v-35746452=""><span data-v-35746452="">일시정지
							사용자는 별도로 처리하지 않을 경우 상태가 유지됩니다.</span></li>
				</ul>
			</section>
			<section data-v-35746452="" class="tab-wrapper">
				<div data-v-35746452="" class="flexible-tab">
					<div data-v-35746452="" class="el-tabs el-tabs--top">
						<div class="el-tabs__header is-top">
							<div class="el-tabs__nav-wrap is-top">
								<div class="el-tabs__nav-scroll">
									<div role="tablist" class="el-tabs__nav is-top is-stretch"
										style="transform: translateX(0px);">
										<div class="el-tabs__active-bar is-top"
											style="width: 52px; transform: translateX(224px);"></div>
										<div id="tab-pause" aria-controls="pane-pause" role="tab"
											tabindex="-1" class="el-tabs__item is-top">일시정지</div>
										<div id="tab-wait" aria-controls="pane-wait" role="tab"
											tabindex="-1" class="el-tabs__item is-top">삭제대기</div>
										<div id="tab-delete" aria-controls="pane-delete" role="tab"
											tabindex="0" class="el-tabs__item is-top is-active"
											aria-selected="true">삭제완료</div>
									</div>
								</div>
							</div>
						</div>
						<div class="el-tabs__content">
							<div data-v-35746452="" role="tabpanel" id="pane-pause"
								aria-labelledby="tab-pause" class="el-tab-pane"
								aria-hidden="true" style="display: none;">
								<!---->
							</div>
							<!---->
							<div data-v-35746452="" role="tabpanel" id="pane-delete"
								aria-labelledby="tab-delete" class="el-tab-pane">
								<div data-v-2736b468="" data-v-35746452="">
									<div data-v-d2b3b332="" data-v-2736b468="">
										<section data-v-d2b3b332="" class="action-wrapper">
											<div data-v-d2b3b332="" class="left">
												<div data-v-2736b468="" data-v-d2b3b332=""
													class="d-flex align-items-center">
													<div data-v-2736b468="" data-v-d2b3b332="" class="pt-4">
														<label data-v-4edc6b75="" data-v-2736b468=""
															class="hu-radio-wrapper" data-v-d2b3b332=""><div
																data-v-4edc6b75="" class="hu-radio selected">
																<span data-v-4edc6b75="" class="radio-input"></span><input
																	data-v-4edc6b75="" type="radio" name="date-setting"
																	class="radio-original"><span data-v-4edc6b75=""
																	class="title">전체</span>
															</div></label><label data-v-4edc6b75="" data-v-2736b468=""
															class="hu-radio-wrapper ml-30" data-v-d2b3b332=""><div
																data-v-4edc6b75="" class="hu-radio">
																<span data-v-4edc6b75="" class="radio-input"></span><input
																	data-v-4edc6b75="" type="radio" name="date-setting"
																	class="radio-original"><span data-v-4edc6b75=""
																	class="title">기간설정</span>
															</div></label>
													</div>
													<div data-v-2736b468="" data-v-d2b3b332=""
														class="d-flex align-items-center ml-12">
														<div data-v-2736b468=""
															class="el-date-editor hw-calendar el-input is-disabled el-input--prefix el-input--suffix el-date-editor--date"
															data-v-d2b3b332="" style="width: 120px;">
															<!---->
															<input type="text" disabled="disabled" autocomplete="off"
																name="" placeholder="시작일" class="el-input__inner"><span
																class="el-input__prefix"><i
																class="el-input__icon gi gi-calendar"></i>
															<!----></span><span class="el-input__suffix"><span
																class="el-input__suffix-inner"><i
																	class="el-input__icon"></i>
																<!---->
																	<!---->
																	<!---->
																	<!----></span>
															<!----></span>
															<!---->
															<!---->
														</div>
														<span data-v-2736b468="" data-v-d2b3b332=""
															class="mr-8 ml-8">~</span>
														<div data-v-2736b468=""
															class="el-date-editor hw-calendar el-input is-disabled el-input--prefix el-input--suffix el-date-editor--date"
															data-v-d2b3b332="" style="width: 120px;">
															<!---->
															<input type="text" disabled="disabled" autocomplete="off"
																name="" placeholder="종료일" class="el-input__inner"><span
																class="el-input__prefix"><i
																class="el-input__icon gi gi-calendar"></i>
															<!----></span><span class="el-input__suffix"><span
																class="el-input__suffix-inner"><i
																	class="el-input__icon"></i>
																<!---->
																	<!---->
																	<!---->
																	<!----></span>
															<!----></span>
															<!---->
															<!---->
														</div>
													</div>
												</div>
											</div>
											<div data-v-d2b3b332="" class="right">
												<!---->
												<div data-v-f9143df2="" data-v-2736b468=""
													class="search-input-wrapper search-input-wrapper search-input-"
													data-v-d2b3b332="">
													<i data-v-f9143df2="" class="icon prefix fal fa-search"></i>
													<!---->
													<input data-v-f9143df2="" type="text" name=""
														placeholder="이름 검색" maxlength="21" class="search-input">
												</div>
												<button data-v-5a097b0d="" data-v-2736b468="" type="button"
													class="download-button-wrapper" data-v-d2b3b332="">
													<img data-v-5a097b0d=""
														src="https://static.hiworks.com/hr/svg/xls.svg"
														alt="Do Download Excel">
												</button>
											</div>
										</section>
										<section data-v-d2b3b332="" class="table-wrapper">
											<table data-v-d2b3b332="">
												<colgroup data-v-d2b3b332="">
													<col data-v-d2b3b332="">
													<col data-v-d2b3b332="">
													<col data-v-d2b3b332="">
												</colgroup>
												<thead data-v-d2b3b332="">
													<tr data-v-d2b3b332="" class="table-header">
														<th data-v-d2b3b332="" style="width: 20%;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: pointer;">
																<span data-v-d2b3b332="">이름</span><span
																	data-v-d2b3b332="" class="icon-wrapper ml-4"><object
																		data-v-d2b3b332=""
																		data="https://static.hiworks.com/icon/caret-down.svg"
																		class="icon off"></object></span>
															</button></th>
														<th data-v-d2b3b332="" style="width: 40%;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: pointer;">
																<span data-v-d2b3b332="">완전삭제일</span><span
																	data-v-d2b3b332="" class="icon-wrapper ml-4"><object
																		data-v-d2b3b332=""
																		data="https://static.hiworks.com/icon/caret-down.svg"
																		class="icon"></object></span>
															</button></th>
														<th data-v-d2b3b332="" style="width: 40%;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: default;">
																<span data-v-d2b3b332="">작업자</span>
																<!---->
															</button></th>
													</tr>
												</thead>
												<tbody data-v-d2b3b332="">
													<tr data-v-2736b468="" data-v-d2b3b332="">
														<td data-v-2736b468="" data-v-d2b3b332="" colspan="3"
															class="text-center color-999">사용자가 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</section>
										<!---->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>