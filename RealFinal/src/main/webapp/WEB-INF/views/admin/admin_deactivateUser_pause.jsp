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
											style="width: 52px; transform: translateX(24px);"></div>
										<div id="tab-pause" aria-controls="pane-pause" role="tab"
											aria-selected="true" tabindex="0"
											class="el-tabs__item is-top is-active">일시정지</div>
										<div id="tab-wait" aria-controls="pane-wait" role="tab"
											tabindex="-1" class="el-tabs__item is-top">삭제대기</div>
										<div id="tab-delete" aria-controls="pane-delete" role="tab"
											tabindex="-1" class="el-tabs__item is-top">삭제완료</div>
									</div>
								</div>
							</div>
						</div>
						<div class="el-tabs__content">
							<div data-v-35746452="" role="tabpanel" id="pane-pause"
								aria-labelledby="tab-pause" class="el-tab-pane">
								<div data-v-267a8a5f="" data-v-35746452="">
									<div data-v-d2b3b332="" data-v-267a8a5f="">
										<section data-v-d2b3b332="" class="action-wrapper">
											<div data-v-d2b3b332="" class="left">
												<div data-v-267a8a5f="" data-v-d2b3b332=""
													class="d-flex align-items-center">
													<label data-v-778fe7d8="" data-v-267a8a5f=""
														class="hu-checkbox-wrapper ml-12 mr-8" data-v-d2b3b332=""><div
															data-v-778fe7d8="" class="hu-checkbox">
															<span data-v-778fe7d8="" class="checkbox-input"></span><input
																data-v-778fe7d8="" type="checkbox"
																class="checkbox-original"><span
																data-v-778fe7d8="" class="title"></span>
														</div></label>
													<button data-v-267a8a5f="" data-v-d2b3b332="" type="button"
														class="table-filter">모든 사용자</button>
												</div>
											</div>
											<div data-v-d2b3b332="" class="right">
												<!---->
												<div data-v-f9143df2="" data-v-267a8a5f=""
													class="search-input-wrapper search-input-wrapper search-input-"
													data-v-d2b3b332="">
													<i data-v-f9143df2="" class="icon prefix fal fa-search"></i>
													<!---->
													<input data-v-f9143df2="" type="text" name=""
														placeholder="이름, ID 검색" maxlength="21"
														class="search-input">
												</div>
												<button data-v-5a097b0d="" data-v-267a8a5f="" type="button"
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
													<col data-v-d2b3b332="">
													<col data-v-d2b3b332="">
													<col data-v-d2b3b332="">
												</colgroup>
												<thead data-v-d2b3b332="">
													<tr data-v-d2b3b332="" class="table-header">
														<th data-v-d2b3b332="" style="width: 40px;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: default;">
																<span data-v-d2b3b332=""></span>
																<!---->
															</button></th>
														<th data-v-d2b3b332="" style="width: auto;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: pointer;">
																<span data-v-d2b3b332="">이름</span><span
																	data-v-d2b3b332="" class="icon-wrapper ml-4"><object
																		data-v-d2b3b332=""
																		data="https://static.hiworks.com/icon/caret-down.svg"
																		class="icon off"></object></span>
															</button></th>
														<th data-v-d2b3b332="" style="width: auto;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: default;">
																<span data-v-d2b3b332="">ID</span>
																<!---->
															</button></th>
														<th data-v-d2b3b332="" style="width: auto;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: pointer;">
																<span data-v-d2b3b332="">접수일</span><span
																	data-v-d2b3b332="" class="icon-wrapper ml-4"><object
																		data-v-d2b3b332=""
																		data="https://static.hiworks.com/icon/caret-down.svg"
																		class="icon"></object></span>
															</button></th>
														<th data-v-d2b3b332="" style="width: auto;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: default;">
																<span data-v-d2b3b332="">작업자</span>
																<!---->
															</button></th>
														<th data-v-d2b3b332="" style="width: 20%;"><button
																data-v-d2b3b332="" type="button" class="icon-button"
																style="cursor: default;">
																<span data-v-d2b3b332="">처리</span>
																<!---->
															</button></th>
													</tr>
												</thead>
												<tbody data-v-d2b3b332="">
													<tr data-v-267a8a5f="" data-v-d2b3b332="">
														<td data-v-267a8a5f="" data-v-d2b3b332="" colspan="7"
															class="text-center color-999">사용자가 없습니다.</td>
													</tr>
												</tbody>
											</table>
										</section>
										<!---->
									</div>
								</div>
							</div>
							<!---->
							<!---->
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
