<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>




<div id="router_split_item" class="split-item right"
				style="width: calc(100% - 276px); overflow: hidden;">
				<div id="contents" class="contents-wrap">
					<div data-v-748cbf4a="" class="accounts">
						<div data-v-748cbf4a="" class="topper">
							<h1 data-v-748cbf4a="" class="accounts__header">사용자 관리</h1>
							<section data-v-748cbf4a="" class="accounts__dashboard">
								<div data-v-31ad4c0b="" data-v-748cbf4a="" class="dashboard">
									<div data-v-31ad4c0b="" class="dashboard__contents">
										<div data-v-31ad4c0b="" class="dashboard__contents--name">
											사용자</div>
										<div data-v-31ad4c0b="" class="dashboard__contents--info">
											<span data-v-748cbf4a="" data-v-31ad4c0b="" class="mr-2">11명
											</span><span data-v-748cbf4a="" data-v-31ad4c0b=""
												class="non-emphasize"> (사용: 11 / 일시정지: 0)</span>
										</div>
									</div>
								</div>
								<div data-v-31ad4c0b="" data-v-748cbf4a="" class="dashboard">
									<div data-v-31ad4c0b="" class="dashboard__contents">
										<div data-v-31ad4c0b="" class="dashboard__contents--name">
											서비스 이용 계정</div>
										<div data-v-31ad4c0b="" class="dashboard__contents--info">
											<div data-v-748cbf4a="" data-v-31ad4c0b="" class="mr-40">
												<span data-v-748cbf4a="" data-v-31ad4c0b="" class="mr-12">그룹웨어</span><span
													data-v-748cbf4a="" data-v-31ad4c0b="" class="">11</span><span
													data-v-748cbf4a="" data-v-31ad4c0b="" class="mv-2 mh-0">/</span><span
													data-v-748cbf4a="" data-v-31ad4c0b="">50</span>
											</div>
										</div>
									</div>
								</div>
							</section>
							<section data-v-748cbf4a="" class="accounts__buttons">
								<a data-v-748cbf4a="" href="/accounts/add_user" class=""><button
										data-v-1434033c="" data-v-748cbf4a="" type="button"
										class="hu-button">
										<!---->
										<span data-v-1434033c="" class="label">사용자 등록</span>
										<!---->
									</button></a><a data-v-748cbf4a="" href="/accounts/user_regist_batch_form"
									class=""><button data-v-1434033c="" data-v-748cbf4a=""
										type="button" class="hu-button">
										<!---->
										<span data-v-1434033c="" class="label">일괄 등록</span>
										<!---->
									</button></a><a data-v-748cbf4a="" href="/accounts/user_modify_batch_form"
									class=""><button data-v-1434033c="" data-v-748cbf4a=""
										type="button" class="hu-button">
										<!---->
										<span data-v-1434033c="" class="label">일괄 수정</span>
										<!---->
									</button></a>
							</section>
						</div>
						<section data-v-748cbf4a="" class="accounts__list">
							<div data-v-5c8be384="" data-v-748cbf4a="" class="accounts-list">
								<div data-v-3fb3a1b8="" data-v-5c8be384=""
									class="accounts-list-header">
									<div data-v-3fb3a1b8="" class="accounts-list-header__left">
										<button data-v-1434033c="" data-v-3fb3a1b8="" type="button"
											class="hu-button selection-button text">
											<!---->
											<span data-v-1434033c="" class="label"><span
												data-v-3fb3a1b8="" data-v-1434033c=""> 보기: 모든 사용자 <i
													data-v-3fb3a1b8="" data-v-1434033c="" name="arrow-down"
													class="gis gi-short-arrow-down"></i></span></span>
											<!---->
										</button>
									</div>
									<div data-v-3fb3a1b8="" class="accounts-list-header__right">
										<!---->
										<div data-v-3fb3a1b8="" class="search-area">
											<article data-v-788c42fd="" data-v-3fb3a1b8=""
												class="autocomplete-wrap">
												<div data-v-788c42fd="" class="input-box use-prefix-icon">
													<div data-v-788c42fd="" type="button" class="prefix-icon">
														<i data-v-788c42fd="" class="fal fa-search"></i>
													</div>
													<input data-v-788c42fd="" type="text"
														placeholder="이름, ID 검색" class="search-input">
													<!---->
												</div>
												<div data-v-788c42fd="" class="list-box"
													style="display: none;">
													<div data-v-788c42fd="" class="search-list"
														style="max-height: 200px;">
														<div data-v-788c42fd="" class="search-list-item-wrapper"></div>
														<div data-v-788c42fd="" class="detail-search-list">상세
															검색</div>
													</div>
												</div>
											</article>
										</div>
										<button data-v-5a097b0d="" data-v-3fb3a1b8="" type="button"
											class="download-button-wrapper">
											<img data-v-5a097b0d=""
												src="https://static.hiworks.com/hr/svg/xls.svg"
												alt="Do Download Excel">
										</button>
										<button data-v-5a097b0d="" data-v-3fb3a1b8="" type="button">
											<img data-v-5a097b0d=""
												src="https://static.hiworks.com/hr/svg/icon_cog.svg"
												alt="Do Setting">
										</button>
									</div>
								</div>
								<section data-v-5c8be384="">
									<div data-v-4f2a5c28="" data-v-5c8be384=""
										class="accounts-table" lastselectedaccountindex="0"
										style="height: calc(100vh - 422px);">
										<table data-v-4f2a5c28="" class="account-header">
											<colgroup data-v-4f2a5c28="">
												<col data-v-4f2a5c28="" class="checkbox">
												<col data-v-4f2a5c28="" class="name">
												<col data-v-4f2a5c28="" class="user_id">
												<col data-v-4f2a5c28="" class="pwd">
												<col data-v-4f2a5c28="" class="license"
													style="min-width: 130px;">
												<col data-v-4f2a5c28="" class="working_type">
												<col data-v-4f2a5c28="" class="const">
												<col data-v-4f2a5c28="" class="position">
												<col data-v-4f2a5c28="" class="status">
											</colgroup>
											<thead data-v-4f2a5c28="">
												<tr data-v-4f2a5c28="" class="table-header">
													<th data-v-4f2a5c28="" class="checkbox"><label
														data-v-5eae55e0="" data-v-4f2a5c28=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></th>
													<th data-v-4f2a5c28=""
														class="account-table-header-item name"><button
															data-v-4f2a5c28="" type="button" class="icon-button"
															style="cursor: pointer;">
															<span data-v-4f2a5c28="">이름</span><span
																data-v-4f2a5c28="" class="icon-wrapper ml-4"><object
																	data-v-4f2a5c28=""
																	data="https://static.hiworks.com/icon/caret-down.svg"
																	class="icon rotate"></object></span>
														</button></th>
													<th data-v-4f2a5c28=""
														class="account-table-header-item user_id"><button
															data-v-4f2a5c28="" type="button" class="icon-button"
															style="cursor: pointer;">
															<span data-v-4f2a5c28="">ID</span><span
																data-v-4f2a5c28="" class="icon-wrapper ml-4"><object
																	data-v-4f2a5c28=""
																	data="https://static.hiworks.com/icon/caret-down.svg"
																	class="icon off"></object></span>
														</button></th>
													<th data-v-4f2a5c28="" class="pwd"><button
															data-v-4f2a5c28="" type="button" class="icon-button"
															style="cursor: default;">
															<span data-v-4f2a5c28="">비밀번호</span>
															<!---->
														</button></th>
													<th data-v-4f2a5c28="" class="license-th"><div
															data-v-4f2a5c28="" class="license-wrap">
															<div data-v-4f2a5c28="" class="license-wrap-inner">
																<div data-v-4f2a5c28=""
																	class="account-table-header-item">
																	<button data-v-4f2a5c28="" type="button"
																		class="icon-button" style="cursor: pointer;">
																		<span data-v-4f2a5c28="">그룹웨어</span><span
																			data-v-4f2a5c28="" class="icon-wrapper ml-4"><object
																				data-v-4f2a5c28=""
																				data="https://static.hiworks.com/icon/caret-down.svg"
																				class="icon off"></object></span>
																	</button>
																</div>
															</div>
														</div></th>
													<th data-v-4f2a5c28=""
														class="account-table-header-item working_type"><button
															data-v-4f2a5c28="" type="button" class="icon-button"
															style="cursor: pointer;">
															<span data-v-4f2a5c28="">근로형태</span><span
																data-v-4f2a5c28="" class="icon-wrapper ml-4"><object
																	data-v-4f2a5c28=""
																	data="https://static.hiworks.com/icon/caret-down.svg"
																	class="icon off"></object></span>
														</button></th>
													<th data-v-4f2a5c28=""
														class="account-table-header-item const"><button
															data-v-4f2a5c28="" type="button" class="icon-button"
															style="cursor: pointer;">
															<span data-v-4f2a5c28="">소속조직</span><span
																data-v-4f2a5c28="" class="icon-wrapper ml-4"><object
																	data-v-4f2a5c28=""
																	data="https://static.hiworks.com/icon/caret-down.svg"
																	class="icon off"></object></span>
														</button></th>
													<th data-v-4f2a5c28=""
														class="account-table-header-item position"><button
															data-v-4f2a5c28="" type="button" class="icon-button"
															style="cursor: pointer;">
															<span data-v-4f2a5c28="">직위</span><span
																data-v-4f2a5c28="" class="icon-wrapper ml-4"><object
																	data-v-4f2a5c28=""
																	data="https://static.hiworks.com/icon/caret-down.svg"
																	class="icon off"></object></span>
														</button></th>
													<th data-v-4f2a5c28=""
														class="account-table-header-item status"><span
														data-v-4f2a5c28="" class="account-table-tab-name">
															상태 </span>
													<!----></th>
												</tr>
											</thead>
										</table>
										<table data-v-4f2a5c28="" class="account-content">
											<colgroup data-v-4f2a5c28="">
												<col data-v-4f2a5c28="" class="checkbox">
												<col data-v-4f2a5c28="" class="name">
												<col data-v-4f2a5c28="" class="user_id">
												<col data-v-4f2a5c28="" class="pwd">
												<col data-v-4f2a5c28="" class="license"
													style="min-width: 130px;">
												<col data-v-4f2a5c28="" class="working_type">
												<col data-v-4f2a5c28="" class="const">
												<col data-v-4f2a5c28="" class="position">
												<col data-v-4f2a5c28="" class="status">
											</colgroup>
											<tbody data-v-4f2a5c28="">
												<tr data-v-0bda246c="" data-v-4f2a5c28=""
													class="add-account-quickly-row">
													<td data-v-0bda246c="" class="checkbox"></td>
													<td data-v-0bda246c="" class="name"><input
														data-v-257b8828="" data-v-0bda246c="" type="text" name=""
														placeholder="이름 입력" min="0" max="0" maxlength="20"
														class="hu-input"></td>
													<!---->
													<!---->
													<td data-v-0bda246c="" class="user_id"><input
														data-v-257b8828="" data-v-0bda246c="" type="text" name=""
														placeholder="ID 입력" min="0" max="0" maxlength="20"
														class="hu-input"></td>
													<!---->
													<!---->
													<!---->
													<td data-v-0bda246c="" class="pwd"><input
														data-v-257b8828="" data-v-0bda246c="" type="password"
														name="" placeholder="비밀번호 입력" min="0" max="0"
														maxlength="16" class="hu-input"
														autocomplete="new-password"
														style="background-color: inherit;"></td>
													<!---->
													<!---->
													<td data-v-0bda246c=""><div data-v-0bda246c=""
															class="license-wrap">
															<div data-v-0bda246c="" class="license-wrap-inner">
																<div data-v-0bda246c="">
																	<div data-v-0bda246c="" class="license-text">
																		<span data-v-0bda246c=""><label
																			data-v-5eae55e0="" data-v-0bda246c=""
																			class="hu-checkbox-wrapper"><div
																					data-v-5eae55e0="" class="hu-checkbox">
																					<span data-v-5eae55e0="" class="checkbox-input"></span><input
																						data-v-5eae55e0="" type="checkbox"
																						checked="checked" class="checkbox-original"><span
																						data-v-5eae55e0="" class="title">그룹웨어</span>
																				</div></label></span>
																	</div>
																</div>
															</div>
														</div></td>
													<!---->
													<!---->
													<td data-v-0bda246c="" class="working_type"><div
															data-v-0bda246c="" class="el-select">
															<!---->
															<div class="el-input el-input--suffix">
																<!---->
																<input type="text" readonly="readonly"
																	autocomplete="off" placeholder="근로형태 선택"
																	class="el-input__inner">
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
																style="display: none; min-width: 119px;">
																<div class="el-scrollbar" style="">
																	<div
																		class="el-select-dropdown__wrap el-scrollbar__wrap"
																		style="margin-bottom: -8px; margin-right: -8px;">
																		<ul
																			class="el-scrollbar__view el-select-dropdown__list">
																			<!---->
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item selected"><span>일반직</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>임원,촉탁</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>연구직</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>생산직</span></li>
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
														</div></td>
													<!---->
													<!---->
													<td data-v-0bda246c="" class="const"><div
															data-v-0bda246c=""
															class="select-box selection-button organization-select-box-placeholder">
															<p data-v-0bda246c="" class="select-box-content">
																<span data-v-0bda246c="" class="none-select"> 조직
																	선택 </span><span data-v-0bda246c=""><i
																	data-v-0bda246c=""
																	class="el-select__caret el-input__icon el-icon-arrow-up is-reverse-icon"></i></span>
															</p>
														</div></td>
													<!---->
													<!---->
													<!---->
													<td data-v-0bda246c="" class="position"><div
															data-v-0bda246c="" class="el-select">
															<!---->
															<div class="el-input el-input--suffix">
																<!---->
																<input type="text" readonly="readonly"
																	autocomplete="off" placeholder="직위 선택"
																	class="el-input__inner">
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
																style="display: none; min-width: 109px;">
																<div class="el-scrollbar" style="">
																	<div
																		class="el-select-dropdown__wrap el-scrollbar__wrap"
																		style="margin-bottom: -8px; margin-right: -8px;">
																		<ul
																			class="el-scrollbar__view el-select-dropdown__list">
																			<!---->
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>선택안함</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>대표이사</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>사장</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>상무</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>이사</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>부장</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>차장</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>과장</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>대리</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>주임</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>사원</span></li>
																			<li data-v-0bda246c=""
																				class="el-select-dropdown__item"><span>계약직</span></li>
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
														</div></td>
													<td data-v-0bda246c="" class="text-center"><button
															data-v-1434033c="" data-v-0bda246c="" type="button"
															class="hu-button primary sm">
															<!---->
															<span data-v-1434033c="" class="label">저장</span>
															<!---->
														</button></td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">강과장</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">kang</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 영업2팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">과장</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">김이사</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">kim</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 생산1팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">이사</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">대표이사</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">ceo</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 하이웍스산업 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">대표이사</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">박상무</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">park</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 구매총무팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">상무</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">안주임</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">ahn</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 품질관리팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">주임</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">양대리</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">yang</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 재무회계팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">대리</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">오부장</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">oh</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 생산2팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">부장</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">이사원</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">lee</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 고객지원팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">사원</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">조차장</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">jo</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 영업1팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">차장</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">주알바</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">joo</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 재무회계팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">계약직</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
												<tr data-v-9a88e898="" data-v-4f2a5c28=""
													class="account-row">
													<td data-v-9a88e898="" ondragstart="return false"
														onselectstart="return false" class="text-center checkbox"><label
														data-v-5eae55e0="" data-v-9a88e898=""
														class="hu-checkbox-wrapper"><div
																data-v-5eae55e0="" class="hu-checkbox">
																<span data-v-5eae55e0="" class="checkbox-input"></span><input
																	data-v-5eae55e0="" type="checkbox" checked="checked"
																	class="checkbox-original"><span
																	data-v-5eae55e0="" class="title"></span>
															</div></label></td>
													<td data-v-9a88e898="" class="name is-editable">최사장</td>
													<!---->
													<td data-v-9a88e898="" class="user_id"><button
															data-v-1434033c="" data-v-9a88e898="" type="button"
															class="hu-button text">
															<!---->
															<span data-v-1434033c="" class="label">choi</span>
															<!---->
														</button></td>
													<!---->
													<!---->
													<td data-v-9a88e898="" class="pwd is-editable">
														********</td>
													<!---->
													<td data-v-9a88e898=""><div data-v-9a88e898=""
															class="license-wrap">
															<div data-v-9a88e898="" class="license-wrap-inner">
																<div data-v-9a88e898="" class="license-text">
																	<span data-v-9a88e898="" class=""> 사용 </span>
																</div>
															</div>
														</div></td>
													<!---->
													<td data-v-9a88e898="" class="working_type">일반직</td>
													<!---->
													<td data-v-9a88e898="" class="const"><span
														data-v-9a88e898=""> 인사팀 </span></td>
													<!---->
													<td data-v-9a88e898="" class="position">사장</td>
													<td data-v-9a88e898="" class="text-center status">사용</td>
												</tr>
											</tbody>
										</table>
									</div>
									<section data-v-5c8be384="" class="pagination mt-24">
										<div data-v-a92c4e3c="" data-v-5c8be384=""
											class="hw-pagination">
											<span data-v-a92c4e3c="" class="hw-pagination-inner"><button
													data-v-a92c4e3c="" type="button" disabled="disabled"
													class="hw-pagination-num hw-pagination-direction disabled">
													<i data-v-a92c4e3c="" class="far fa-chevron-double-left"></i>
												</button>
												<button data-v-a92c4e3c="" type="button" disabled="disabled"
													class="hw-pagination-num hw-pagination-direction disabled">
													<i data-v-a92c4e3c="" class="far fa-chevron-left"></i>
												</button>
												<button data-v-a92c4e3c="" type="button"
													class="hw-pagination-num active">1</button>
												<button data-v-a92c4e3c="" type="button" disabled="disabled"
													class="hw-pagination-num hw-pagination-direction disabled">
													<i data-v-a92c4e3c="" class="far fa-chevron-right"></i>
												</button>
												<button data-v-a92c4e3c="" type="button" disabled="disabled"
													class="hw-pagination-num hw-pagination-direction disabled">
													<i data-v-a92c4e3c=""
														class="far fa-chevron-double-right ml-3"></i>
												</button></span>
										</div>
									</section>
								</section>
							</div>
						</section>
					</div>
				</div>
			</div>