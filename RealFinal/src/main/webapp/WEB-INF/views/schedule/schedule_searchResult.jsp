<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>




<div id="contents">
	<div class="content_inbox" style="top: 20px">
		<div class="board_w"
			style="padding-left: 16px; padding-top: 0px; padding-right: 0px">
			<div id="script-warning">
				<code>데이터 로드 에러</code>
				데이터 로드 중 오류가 발생했습니다.
			</div>
			<div id="loading" style="display: none;">
				<img src="/static/images/common/icon/progress.gif" width="16"
					height="16" align="absmiddle">
			</div>
			<!-- 달력 -->
			<div class="fc fc-ltr fc-unthemed" id="calendar"
				style="display: none;">
				<div class="fc-toolbar">
					<div class="fc-left">
						<div class="" id="left_top">
							<span class="detail_select"><a
								href="javascript:HiworksEvent.drop_view(&quot;v&quot;);">보기
									: <span id="view_mode">월간</span>&nbsp;<img
									src="/static/ui/images/btn_drop.gif" alt="" class="open_drop">
							</a></span><span class="detail_select"><a
								href="javascript:HiworksSchedule.print_preview();">인쇄</a></span>
						</div>
					</div>
					<div class="fc-right">
						<div>
							<div id="right_top">
								<a class="icon setting"
									href="javascript:HiworksEvent.drop_view('b');" title="설정"><span
									class="blind">설정</span></a>
							</div>
							<div class="dropdown hide" style="left: -105px"
								id="cal_setting_option">
								<ul class="dropdown-menu">
									<li><a href="javascript:HiworksSchedule.setConfig('b');"><span
											class="icon check" id="view_birth_right_icon" style=""></span>생일</a></li>
									<li class="view_cnt_class divider"></li>
									<li class="view_cnt_class"><a
										href="javascript:HiworksSchedule.setViewCnt(5);"><span
											class="icon check"></span>일반보기</a></li>
									<li class="view_cnt_class"><a
										href="javascript:HiworksSchedule.setViewCnt(10);"><span
											class="icon check" style="display: none;"></span>확장보기</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="fc-center">
						<button type="button" class="icon directleft"
							onclick="HiworksSchedule.prev(&quot;calendar&quot;)"></button>
						<h2>2023.12</h2>
						<button type="button" class="icon directright"
							onclick="HiworksSchedule.next(&quot;calendar&quot;)"></button>
						<button type="button"
							class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
							disabled="disabled">오늘</button>
					</div>
					<div class="fc-clear"></div>
				</div>
				<div class="fc-view-container" style="">
					<div class="fc-view fc-month-view fc-basic-view" style="">
						<table>
							<thead class="fc-head">
								<tr>
									<td class="fc-widget-header"><div
											class="fc-row fc-widget-header">
											<table>
												<thead>
													<tr>
														<th
															class="fc-day-header fc-widget-header fc-sun red_color"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">일</th>
														<th class="fc-day-header fc-widget-header fc-mon"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">월</th>
														<th class="fc-day-header fc-widget-header fc-tue"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">화</th>
														<th class="fc-day-header fc-widget-header fc-wed"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">수</th>
														<th class="fc-day-header fc-widget-header fc-thu"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">목</th>
														<th class="fc-day-header fc-widget-header fc-fri"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">금</th>
														<th
															class="fc-day-header fc-widget-header fc-sat blue_color"
															style="background: rgb(249, 249, 249); padding: 10px 0px;">토</th>
													</tr>
												</thead>
											</table>
										</div></td>
								</tr>
							</thead>
							<tbody class="fc-body">
								<tr>
									<td class="fc-widget-content"><div
											class="fc-day-grid-container" style="">
											<div class="fc-day-grid">
												<div class="fc-row fc-week fc-widget-content"
													style="height: 126px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td
																		class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																		data-date="2023-11-26"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																		data-date="2023-11-27"></td>
																	<td
																		class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																		data-date="2023-11-28"></td>
																	<td
																		class="fc-day fc-widget-content fc-wed fc-other-month fc-past"
																		data-date="2023-11-29"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-past"
																		data-date="2023-11-30"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2023-12-01"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-today fc-state-highlight"
																		data-date="2023-12-02"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-other-month fc-past"
																		data-date="2023-11-26"><span class="red_color"
																		id="day_number">26</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-other-month fc-past"
																		data-date="2023-11-27"><span class=""
																		id="day_number">27</span><span id="spacial_date"
																		style="padding: 6px;">(음)10.15</span></td>
																	<td class="fc-day-number fc-tue fc-other-month fc-past"
																		data-date="2023-11-28"><span class=""
																		id="day_number">28</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-other-month fc-past"
																		data-date="2023-11-29"><span class=""
																		id="day_number">29</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-other-month fc-past"
																		data-date="2023-11-30"><span class=""
																		id="day_number">30</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2023-12-01"><span class=""
																		id="day_number">1</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-sat fc-today fc-state-highlight"
																		data-date="2023-12-02"><span class="blue_color"
																		id="day_number">2</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable c1"><div
																				class="fc-content">
																				<span class="fc-time">오전 12시30분</span> <span
																					class="fc-title">워크샵</span>
																			</div></a></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 126px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2023-12-03"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-future"
																		data-date="2023-12-04"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2023-12-05"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2023-12-06"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-future"
																		data-date="2023-12-07"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-future"
																		data-date="2023-12-08"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2023-12-09"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2023-12-03"><span class="red_color"
																		id="day_number">3</span><span id="spacial_date"
																		style="padding: 6px;">(음)10.21</span></td>
																	<td class="fc-day-number fc-mon fc-future"
																		data-date="2023-12-04"><span class=""
																		id="day_number">4</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2023-12-05"><span class=""
																		id="day_number">5</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-future"
																		data-date="2023-12-06"><span class=""
																		id="day_number">6</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-future"
																		data-date="2023-12-07"><span class=""
																		id="day_number">7</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-future"
																		data-date="2023-12-08"><span class=""
																		id="day_number">8</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-future"
																		data-date="2023-12-09"><span class="blue_color"
																		id="day_number">9</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 126px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2023-12-10"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-future"
																		data-date="2023-12-11"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2023-12-12"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2023-12-13"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-future"
																		data-date="2023-12-14"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-future"
																		data-date="2023-12-15"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2023-12-16"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2023-12-10"><span class="red_color"
																		id="day_number">10</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-future"
																		data-date="2023-12-11"><span class=""
																		id="day_number">11</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2023-12-12"><span class=""
																		id="day_number">12</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-future"
																		data-date="2023-12-13"><span class=""
																		id="day_number">13</span><span id="spacial_date"
																		style="padding: 6px;">(음)11.1</span></td>
																	<td class="fc-day-number fc-thu fc-future"
																		data-date="2023-12-14"><span class=""
																		id="day_number">14</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-future"
																		data-date="2023-12-15"><span class=""
																		id="day_number">15</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-future"
																		data-date="2023-12-16"><span class="blue_color"
																		id="day_number">16</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable c5"><div
																				class="fc-content">
																				<span class="fc-time">오전 12시30분</span> <span
																					class="fc-title">워크샵</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 126px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2023-12-17"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-future"
																		data-date="2023-12-18"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2023-12-19"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2023-12-20"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-future"
																		data-date="2023-12-21"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-future"
																		data-date="2023-12-22"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2023-12-23"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2023-12-17"><span class="red_color"
																		id="day_number">17</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-future"
																		data-date="2023-12-18"><span class=""
																		id="day_number">18</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2023-12-19"><span class=""
																		id="day_number">19</span><span id="spacial_date"
																		style="padding: 6px;">(음)11.7</span></td>
																	<td class="fc-day-number fc-wed fc-future"
																		data-date="2023-12-20"><span class=""
																		id="day_number">20</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-future"
																		data-date="2023-12-21"><span class=""
																		id="day_number">21</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-future"
																		data-date="2023-12-22"><span class=""
																		id="day_number">22</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-future"
																		data-date="2023-12-23"><span class="blue_color"
																		id="day_number">23</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 126px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2023-12-24"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-future red_color"
																		data-date="2023-12-25"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2023-12-26"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2023-12-27"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-future"
																		data-date="2023-12-28"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-future"
																		data-date="2023-12-29"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2023-12-30"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2023-12-24"><span class="red_color"
																		id="day_number">24</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-future red_color"
																		data-date="2023-12-25"><span class=""
																		id="day_number">25</span><span id="spacial_date"
																		style="padding: 6px;">성탄절</span></td>
																	<td class="fc-day-number fc-tue fc-future"
																		data-date="2023-12-26"><span class=""
																		id="day_number">26</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-future"
																		data-date="2023-12-27"><span class=""
																		id="day_number">27</span><span id="spacial_date"
																		style="padding: 6px;">(음)11.15</span></td>
																	<td class="fc-day-number fc-thu fc-future"
																		data-date="2023-12-28"><span class=""
																		id="day_number">28</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-future"
																		data-date="2023-12-29"><span class=""
																		id="day_number">29</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-future"
																		data-date="2023-12-30"><span class="blue_color"
																		id="day_number">30</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 130px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2023-12-31"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-other-month fc-future red_color"
																		data-date="2024-01-01"></td>
																	<td
																		class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																		data-date="2024-01-02"></td>
																	<td
																		class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																		data-date="2024-01-03"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																		data-date="2024-01-04"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2024-01-05"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2024-01-06"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-future"
																		data-date="2023-12-31"><span class="red_color"
																		id="day_number">31</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-mon fc-other-month fc-future red_color"
																		data-date="2024-01-01"><span class=""
																		id="day_number">1</span><span id="spacial_date"
																		style="padding: 6px;">신정</span></td>
																	<td
																		class="fc-day-number fc-tue fc-other-month fc-future"
																		data-date="2024-01-02"><span class=""
																		id="day_number">2</span><span id="spacial_date"
																		style="padding: 6px;">(음)11.21</span></td>
																	<td
																		class="fc-day-number fc-wed fc-other-month fc-future"
																		data-date="2024-01-03"><span class=""
																		id="day_number">3</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-thu fc-other-month fc-future"
																		data-date="2024-01-04"><span class=""
																		id="day_number">4</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-fri fc-other-month fc-future"
																		data-date="2024-01-05"><span class=""
																		id="day_number">5</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-sat fc-other-month fc-future"
																		data-date="2024-01-06"><span class="blue_color"
																		id="day_number">6</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 결과 검색 -->
			<div class="hide" id="calendar_search" style="display: block;">
				<div class="content_title">
					<h3>검색 결과</h3>
				</div>
				<div class="content_inbox">
					<!-- Contents -->
					<div class="cont_box">
						<form>
							<div class="setting_field appr_write">
								<table class="s_day list" id="search_table">
									<caption>일정 목록</caption>
									<colgroup>
										<col width="14.2%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="row">일자</th>
											<th scope="row">일정</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="col"><span>23.12.02 (토)</span></th>
											<td><div class="plan width1 height1"
													onclick="ScheduleSearch.search_confrim('1116874','11262164')">
													<div class="bar c1 ">
														<span class="txt"><span class="time">오전
																12:30~오전 1:30</span><span>워크샵</span></span><span class="resize"></span>
													</div>
												</div></td>
										</tr>
										<tr>
											<th scope="col"><span>23.12.13 (수)</span></th>
											<td><div class="plan width1 height1"
													onclick="ScheduleSearch.search_confrim('1116878','11262168')">
													<div class="bar c5 ">
														<span class="txt"><span class="time">오전
																12:30~오전 1:00</span><span>워크샵</span></span><span class="resize"></span>
													</div>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- //결과 검색 -->
		</div>
	</div>

	<!-- 드롭 메뉴 -->
	<div class="dropdown hide" style="top: 35px; left: 15px"
		id="cal_option_detail">
		<ul class="dropdown-menu">
			<li><a
				href="javascript:HiworksEvent.calendar_change_view('month');">월간</a></li>
			<li><a
				href="javascript:HiworksEvent.calendar_change_view('agendaWeek');">주간</a></li>
			<li><a
				href="javascript:HiworksEvent.calendar_change_view('agendaDay');">일간</a></li>
			<li><a
				href="javascript:HiworksEvent.calendar_change_view('listMonth');">목록</a></li>
		</ul>
	</div>
	<!-- 드롭 메뉴 -->

	<script>
$j(document).ready(function() {
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var currentLangCode = 'ko';             // 언어
	var initView = getCookie('schedule_init_view') ? getCookie('schedule_init_view') : 'month';
	var initViewCnt = getCookie('schedule_init_viewcnt') ? getCookie('schedule_init_viewcnt') : 5;

	if('english' == Common.getLanguage())	currentLangCode = 'en';

    HiworksSchedule.calendar_draw(currentLangCode, initViewCnt, initView);
    HiworksSchedule.mini_calendar_draw(currentLangCode);

    $j('button[name=cc]').click(function() {
        $j('button[name=cc]').removeClass('on');
        $j(this).addClass('on');
    });
});
</script>

	<style>
.toast-type-success {
	font-size: 14px;
	color: #007e04 !important;
	background: #e3f8d2;
	font-weight: 500;
}

.toast-type-warning {
	font-size: 14px;
	color: #D5620A !important;
	background: #FEEED2;
	font-weight: 500;
}
</style>
	<!-- 내 캘린더 생성 -->
	<div class="layer_box mid_large hide popup2" id="layer_make_my_project">
		<div class="title_layer text_variables">내 캘린더</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>
						<input type="text" id="__cal_name">
					</div></li>
				<li><span>색깔</span>
					<div>
						<button type="button" class="label on" name="cc">
							<span class="c1"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c2"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c3"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c4"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c5"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c6"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c7"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c8"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c9"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="c10"></span>
						</button>
						<br>
					</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables btn_make shared_btn"
				onclick="HiworksSchedule.makeCalendar('P');">저장</button>
			<button type="button"
				class="btn_variables btn_mod btn_mod2 shared_btn"
				onclick="HiworksSchedule.modifyCalendar('P');">저장</button>
			<button type="button" class="btn_mod shared_btn"
				onclick="HiworksSchedule.deleteCalendar('P');">삭제</button>
			<button type="button" class="btn_make btn_mod btn_mod2 shared_btn"
				onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 내 캘린더 생성 -->
	<!-- 공유 소유 캘린더 -->
	<div class="layer_box large address hide popup3"
		id="layer_make_shared_project">

		<div class="title_layer text_variables">공유 캘린더</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>
						<input type="text" id="__cal_name">
					</div></li>

				<li><span>색깔</span>
					<div>
						<button type="button" class="label on" name="cc">
							<span class="share c1"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c2"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c3"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c4"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c5"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c6"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c7"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c8"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c9"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c10"></span>
						</button>
					</div></li>
				<li id="modify_show_owner" style="display: none;">
					<!--<span></span>--> <span>소유자</span>
					<div style="width: auto;">
						<span>김개똥</span>
					</div> <a href="#" id="btn-owner"
					style="margin-left: 15px; color: #779ec0; display: none;">변경</a>
				</li>
			</ul>

			<h4 class="pdb_10" style="font-weight: normal;">공유 대상</h4>

			<div class="search-address" id="searchP"
				style="display: block; margin-top: 0px;">

				<span id="spnSearchCtl"> <input type="radio" value="name"
					name="searchField" id="rdo_sch_name" checked="checked"><label
					for="rdo_sch_name">이름</label>&nbsp;&nbsp; <input type="radio"
					value="const" name="searchField" id="rdo_sch_const"><label
					for="rdo_sch_const">조직</label>&nbsp;&nbsp;
				</span> <input type="text" style="height: 21px" class="text-box"
					title="검색어 입력" id="keyword"
					onkeydown="javascript: if (event.keyCode == 13) {AddrLayer.searchMemberOrConst()}">
				<a href="#" class="btn-search"
					onclick="AddrLayer.searchMemberOrConst()">검색</a> <a href="#"
					id="addrCancelSearch" style="display: none"
					class="search_bt weakblue"
					onclick="AddrLayer.rollbackSearchMemberOrConst()"><span
					class="sp_menu searchCancel"></span>검색 취소</a>
				<div>
					<div class="title"
						style="display: none; width: 100%; font-weight: normal;"
						id="searchMessage">
						<a class="btn-search">검색초기화</a>
					</div>
				</div>
			</div>



			<div class="address-choice-form type2 after">
				<div class="category_list" id="spLeftList">
					<select name="" id="__sel_left_list" multiple="">
						<option value=""></option>
					</select>
				</div>
				<div class="list" id="spRightList">
					<select multiple="" name="" id="selAddressList">
						<option value="">리스트가 존재하지 않습니다.</option>
					</select>
					<div class="add-btn">
						<a href="#" onclick="AddrLayer.select('selTo');"
							class="blind icon btn-to">추가</a> <a href="#"
							onclick="AddrLayer.select('selBcc');" class="blind icon btn-bcc">추가</a>
					</div>
					<div class="choice-area">
						<a href="#" onclick="AddrLayer.is_grabAll(true);"
							class="text_variables">전체</a> <a href="#"
							onclick="AddrLayer.is_grabAll(false);" class="text_variables">선택안함</a>
					</div>
				</div>
				<div class="to-item">
					<h5>
						조회/등록 권한 <span id="selToCnt">1</span>
					</h5>
					<div class="to" style="height: 176px">
						<select multiple="" style="height: 176px" id="selTo"></select>
						<div class="del-btn">
							<a href="javascript:AddrLayer.unSelect('selTo');"
								class="blind icon btn-to">삭제</a>
						</div>
					</div>
					<h5>
						조회 권한 <span id="selBccCnt">0</span>
					</h5>
					<div class="bcc" style="height: 176px">
						<select multiple="" style="height: 176px" id="selBcc"></select>
						<div class="del-btn">
							<a href="javascript:AddrLayer.unSelect('selBcc');"
								class="blind icon btn-bcc">삭제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables btn_make shared_btn"
				onclick="HiworksSchedule.makeCalendar('S');">저장</button>
			<button type="button" class="btn_variables btn_mod shared_btn"
				onclick="HiworksSchedule.modifyCalendar('S');">저장</button>
			<button type="button" class="btn_mod shared_btn delete_s_btn"
				onclick="HiworksSchedule.deleteCalendar('S');">삭제</button>
			<button type="button" class="btn_make btn_mod shared_btn"
				onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 공유 소유 캘린더 -->
	<!-- 공유 캘린더 -->
	<div class="layer_box large hide popup3" id="layer_view_shared_project">
		<div class="title_layer text_variables">공유 캘린더</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>
						<input type="text" id="__cal_name" disabled="disabled">
					</div></li>
				<li><span>색깔</span>
					<div>
						<button type="button" class="label" name="cc">
							<span class="share c1"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c2"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c3"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c4"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c5"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c6"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c7"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c8"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c9"></span>
						</button>
						<button type="button" class="label" name="cc">
							<span class="share c10"></span>
						</button>
						<br>
					</div></li>
				<li><span>소유자</span>
					<div id="_create_name"></div></li>
				<li><span>공유 대상</span>
					<div class="address-choice-form type2 after">
						<div class="to-item after share">
							<div class="left">
								<h5>
									조회/등록 권한 <span id="_write_cnt">0</span>
								</h5>
								<div class="to" style="height: 176px">
									<select id="_write_list" multiple="" style="height: 176px">
									</select>
								</div>
							</div>
							<div class="right">
								<h5>
									조회 권한 <span id="_view_cnt">0</span>
								</h5>
								<div class="bcc" style="height: 176px">
									<select id="_view_list" multiple="" style="height: 176px">
									</select>
								</div>
							</div>

						</div>
					</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="HiworksSchedule.update_share_project_color()">저장</button>
			<button type="button" class=""
				onclick="HiworksSchedule.delete_shared_info()">삭제</button>
			<button type="button" class="" onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 공유 캘린더 -->


	<!-- 공유 캘린더 read_only-->
	<div class="layer_box large hide popup3"
		id="layer_view_shared_project_read_only">
		<div class="title_layer text_variables">공유 캘린더</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>
						<input type="text" id="__cal_name" disabled="disabled">
					</div></li>
				<li><span>색깔</span>
					<div>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c1"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c2"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c3"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c4"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c5"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c6"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c7"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c8"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c9"></span>
						</button>
						<button type="button" class="label" name="cc" disabled="">
							<span class="share c10"></span>
						</button>
						<br>
					</div></li>
				<li><span>최초 생성자</span>
					<div id="_create_name"></div></li>
				<li><span>공유 대상</span>
					<div class="address-choice-form type2 after">
						<div class="to-item after share">
							<div class="left">
								<h5>
									조회/등록 권한 <span id="_write_cnt">0</span>
								</h5>
								<div class="to" style="height: 176px">
									<select id="_write_list" multiple="" style="height: 176px">
									</select>
								</div>
							</div>
							<div class="right">
								<h5>
									조회 권한 <span id="_view_cnt">0</span>
								</h5>
								<div class="bcc" style="height: 176px">
									<select id="_view_list" multiple="" style="height: 176px">
									</select>
								</div>
							</div>

						</div>
					</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables" onclick="hidePopup();">확인</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 공유 캘린더 read_only-->


	<!-- 추가/수정 레이어 -->
	<div class="layer_box mid_large hide popup4" id="layer_schedule">
		<input type="hidden" name="no" id="__no" value="0">
		<div class="title_layer text_variables" id="__cal_name"></div>
		<div class="to-add">
			<form method="post" name="lForm" id="lForm"
				action="javascript:void(0);">
				<ul class="sch_form text100">
					<li><span>캘린더</span>
						<div id="__project_name"></div></li>
					<li><span>일정 제목</span>
						<div>
							<input type="text" name="cal_subject" id="__subject">
						</div></li>
					<li><span>시작</span>
						<div>
							<input type="text"
								class="w100 cal_date repeat_info hasDatepicker"
								id="__start_date" value="2023-12-02"
								onchange="HiworksEvent.change_start_date(this);" readonly="">
							<select name="start_time" id="__start_time"
								class="w100 mgr_10 cal_time repeat_info"
								onchange="HiworksEvent.change_start_time(this);"><option
									value="00:00">오전 12:00</option>
								<option value="00:30">오전 12:30</option>
								<option value="01:00">오전 01:00</option>
								<option value="01:30">오전 01:30</option>
								<option value="02:00">오전 02:00</option>
								<option value="02:30">오전 02:30</option>
								<option value="03:00">오전 03:00</option>
								<option value="03:30">오전 03:30</option>
								<option value="04:00">오전 04:00</option>
								<option value="04:30">오전 04:30</option>
								<option value="05:00">오전 05:00</option>
								<option value="05:30">오전 05:30</option>
								<option value="06:00">오전 06:00</option>
								<option value="06:30">오전 06:30</option>
								<option value="07:00">오전 07:00</option>
								<option value="07:30">오전 07:30</option>
								<option value="08:00">오전 08:00</option>
								<option value="08:30">오전 08:30</option>
								<option value="09:00">오전 09:00</option>
								<option value="09:30">오전 09:30</option>
								<option value="10:00">오전 10:00</option>
								<option value="10:30">오전 10:30</option>
								<option value="11:00">오전 11:00</option>
								<option value="11:30">오전 11:30</option>
								<option value="12:00">오후 12:00</option>
								<option value="12:30">오후 12:30</option>
								<option value="13:00">오후 01:00</option>
								<option value="13:30">오후 01:30</option>
								<option value="14:00">오후 02:00</option>
								<option value="14:30">오후 02:30</option>
								<option value="15:00">오후 03:00</option>
								<option value="15:30">오후 03:30</option>
								<option value="16:00">오후 04:00</option>
								<option value="16:30">오후 04:30</option>
								<option value="17:00">오후 05:00</option>
								<option value="17:30">오후 05:30</option>
								<option value="18:00">오후 06:00</option>
								<option value="18:30">오후 06:30</option>
								<option value="19:00">오후 07:00</option>
								<option value="19:30">오후 07:30</option>
								<option value="20:00">오후 08:00</option>
								<option value="20:30">오후 08:30</option>
								<option value="21:00">오후 09:00</option>
								<option value="21:30">오후 09:30</option>
								<option value="22:00">오후 10:00</option>
								<option value="22:30">오후 10:30</option>
								<option value="23:00">오후 11:00</option>
								<option value="23:30">오후 11:30</option>
							</select> <label><input type="checkbox"
								class="_checkbox repeat_info" title="종일" id="__allday"
								onclick="HiworksEvent.allDay(this);"> 종일</label>
						</div></li>
					<li><span>종료</span>
						<div>
							<input type="text"
								class="w100 cal_date repeat_info hasDatepicker" id="__end_date"
								value="2023-12-02"
								onchange="HiworksEvent.change_end_date(this);" readonly="">
							<select name="end_time" id="__end_time"
								class="w100 mgr_10 cal_time repeat_info"><option
									value="00:00">오전 12:00</option>
								<option value="00:30">오전 12:30</option>
								<option value="01:00">오전 01:00</option>
								<option value="01:30">오전 01:30</option>
								<option value="02:00">오전 02:00</option>
								<option value="02:30">오전 02:30</option>
								<option value="03:00">오전 03:00</option>
								<option value="03:30">오전 03:30</option>
								<option value="04:00">오전 04:00</option>
								<option value="04:30">오전 04:30</option>
								<option value="05:00">오전 05:00</option>
								<option value="05:30">오전 05:30</option>
								<option value="06:00">오전 06:00</option>
								<option value="06:30">오전 06:30</option>
								<option value="07:00">오전 07:00</option>
								<option value="07:30">오전 07:30</option>
								<option value="08:00">오전 08:00</option>
								<option value="08:30">오전 08:30</option>
								<option value="09:00">오전 09:00</option>
								<option value="09:30">오전 09:30</option>
								<option value="10:00">오전 10:00</option>
								<option value="10:30">오전 10:30</option>
								<option value="11:00">오전 11:00</option>
								<option value="11:30">오전 11:30</option>
								<option value="12:00">오후 12:00</option>
								<option value="12:30">오후 12:30</option>
								<option value="13:00">오후 01:00</option>
								<option value="13:30">오후 01:30</option>
								<option value="14:00">오후 02:00</option>
								<option value="14:30">오후 02:30</option>
								<option value="15:00">오후 03:00</option>
								<option value="15:30">오후 03:30</option>
								<option value="16:00">오후 04:00</option>
								<option value="16:30">오후 04:30</option>
								<option value="17:00">오후 05:00</option>
								<option value="17:30">오후 05:30</option>
								<option value="18:00">오후 06:00</option>
								<option value="18:30">오후 06:30</option>
								<option value="19:00">오후 07:00</option>
								<option value="19:30">오후 07:30</option>
								<option value="20:00">오후 08:00</option>
								<option value="20:30">오후 08:30</option>
								<option value="21:00">오후 09:00</option>
								<option value="21:30">오후 09:30</option>
								<option value="22:00">오후 10:00</option>
								<option value="22:30">오후 10:30</option>
								<option value="23:00">오후 11:00</option>
								<option value="23:30">오후 11:30</option>
							</select> <label><input type="checkbox" class="_checkbox"
								title="반복" id="__chk_is_repeat"> 반복</label>
						</div></li>
					<div id="__repeatDetail" class="hide">
						<li><span>반복 빈도</span> <select
							class="w100 mgr_10 repeat_info" name="__sel_repeat_freq_list"
							id="__sel_repeat_freq_list"
							onchange="HiworksSchedule.change_repeat_option();"
							style="float: left">
								<option value="day" selected="">매일</option>
								<option value="week">매주</option>
								<option value="agendaweek">매주 월-금</option>
								<option value="month">매월</option>
								<option value="year">매년</option>
						</select> <select class="w50 mgr_10 repeat_info" id="__sel_repeat_freq"
							style="float: left;"></select> <span id="freq_txt"></span></li>
						<li class="hide" id="__repeatDetail_option"><span>&nbsp;</span>
						</li>
						<li><span>반복 범위</span> <label><input type="radio"
								class="repeat_info" name="repeat_type" value="1" checked="">
								계속 반복</label> <label><input type="radio" class="repeat_info"
								name="repeat_type" style="margin-left: 5px" value="2"> <input
								type="text" class="repeat_info" style="width: 30px"
								id="_repeat_cnt" value="1"
								onkeyup="HiworksEvent.repeat_cnt(this);"> 번</label> <label><input
								type="radio" class="repeat_info" name="repeat_type"
								style="margin-left: 5px" value="3"> 반복 종료일 <input
								type="text" class="cal_date hasDatepicker" style="width: 80px"
								id="_repeat_end_date"
								onchange="HiworksEvent.change_repeat_enddate(this);" readonly=""></label>
						</li>
						<li class="hide" id="_repeat_info_txt">
							<div style="width: 435px; border: 1px solid #c5c5c5;">&nbsp;</div>
						</li>
					</div>
					<li><span>내용</span>
						<div>
							<textarea name="contents" id="__contents" cols="30" rows="10"></textarea>
						</div></li>
					<li><span>알림</span>
						<div id="__schedule_alarm_info">
							<ul class="sch_form text100" id="__schedule_alarm_list">
								<li id="__alarm_mail"><label class="mgr_10"><input
										type="checkbox" class="_checkbox" value="mail"> 메일</label> <select
									class="w100 mgr_10 alarm_time _select" id="__sel_alarm_mail"></select>
									<button class="weakblue hide" name="_btn_alarm"
										onclick="HiworksSchedule.layer_shared_list('mail');">대상자
										선택</button> <input type="text" class="w150" name="__alarm_data"
									id="__alarm_mail_data"></li>
								<li id="__alarm_sms"><label class="mgr_10"><input
										type="checkbox" class="_checkbox" value="sms"> 문자</label> <select
									class="w100 mgr_10 alarm_time _select" id="__sel_alarm_sms"></select>
									<button class="weakblue hide" name="_btn_alarm"
										onclick="HiworksSchedule.layer_shared_list('sms');">대상자
										선택</button> <input type="text" class="w150" name="__alarm_data"
									id="__alarm_sms_data"></li>
								<li id="__alarm_messenger"><label class="mgr_10"><input
										type="checkbox" class="_checkbox" value="messenger"
										onclick="HiworksSchedule.updateMessengerAlarmList(this);">
										메신저</label> <select class="w100 mgr_10 alarm_time _select"
									id="__sel_alarm_messenger"></select></li>
							</ul>
						</div></li>
				</ul>

			</form>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="HiworksSchedule.layer_schedule_save();">저장</button>
			<button type="button" onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!-- 추가/수정 레이어 -->

	<!-- 확인 레이어 -->
	<div class="layer_box mid_large hide popup9"
		style="margin-left: -256px; margin-top: -174px; display: none;"
		id="layer_schedule_confirm">
		<div class="title_layer text_variables">일정 내용</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더</span>
					<div>
						<button type="button" class="label" disabled="">
							<span id="__color_code"></span>
						</button>
						<span class="fl" id="__cal_name">캘린더명 </span> <a
							href="javascript:void(0)" id="__shared_member_icon"
							class="boardUse mgl_5"
							onclick="HiworksSchedule.show_shared_member_project();"> <span
							class="icon boardUser"></span> <span class="member_count"></span>
						</a>

					</div></li>
				<li><span>일정 제목</span>
					<div id="__subject">일정 제목</div></li>
				<li><span>일정 시간</span>
					<div id="__schedule_time">일정시간</div></li>
				<!-- 
        <li>
            <span>생성자</span>
            <div id="__schedule_owner">생성자</div>
        </li>
		-->
				<li><span>최초 등록</span>
					<div id="__schedule_regidate">최초 등록</div></li>

				<li><span>최종 수정</span>
					<div id="__schedule_modify_date">최종 수정</div></li>

				<li><span>반복</span>
					<div id="__repaet_date">
						2014-12-09부터 계속 <span class="grey_bar">|</span><span
							id="__repeat_detail"> 1일마다 </span><span class="grey_bar">|</span>오전
						10:00 ? 오전 11:00
					</div></li>
				<li><span>알림</span>
					<div id="__alram_info">10분전 메일 알림</div></li>
				<li><span>내용</span>
					<div class="scroll" id="__contents" style="word-break: break-all;">반복
						일정입니다.</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables btn_editY"
				id="__btn_modify">수정</button>
			<button type="button" class="btn_editY" id="__btn_delete">삭제</button>
			<button type="button" class="btn_variables btn_editN" id="__btn_save"
				onclick="HiworksSchedule.setShareAlarmFlag()">확인</button>
			<!-- <button type="button" class="btn_editN" id="" onclick="hidePopup();">닫기</button> -->
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a> <a href="javascript:void(0)" class="more" onclick="showMenu();"><span
			class="blind">더보기</span></a> <a href="javascript:void(0)" class="more"
			onclick="HiworksSchedule.toggleMiniMenu();"><span class="blind">더보기</span></a>
		<ul id="mini_menu_layer" class="show-menu" style="display: none;">
			<li id="schedule-copy-btn">복사</li>
		</ul>
	</div>
	<!-- 확인 레이어 -->
	<!--  -->
	<div class="layer_box official middle hide popup5"
		style="margin-left: -175px; margin-top: -243px; display: none;"
		id="layer_shared_list">
		<div class="title_layer text_variables">알림 대상자 선택</div>
		<div class="to-add">
			<p class="bold pdb_10">
				알림 대상자(<span id="__shared_alarm_cnt">0</span>명)
			</p>
			<div class="scroll">
				<table class="tableType01 shared_alarm_list"
					id="__shared_alarm_table">
					<caption>알림 대상자 선택 목록으로 이름, 이메일로 구성되어 있습니다.</caption>
					<colgroup>
						<col width="20">
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="row"><label><input type="checkbox"
									title="항목 선택" onclick="HiworksSchedule.check_all(this)"
									checked=""></label></th>
							<th scope="row">이름</th>
							<th scope="row">이메일</th>
							<th scope="row">휴대전화</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="HiworksSchedule.alarm_list_save();">확인</button>
			<button type="button"
				onclick="HiworksSchedule.closeLayer('layer_shared_list');">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="HiworksSchedule.closeLayer('layer_shared_list');"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>

	<!-- 인쇄  -->
	<div class="layer_box large print hide popup7"
		style="margin-left: -411px; margin-top: -346.5px;" id="layer_print">
		<form name="pForm"></form>
		<div class="title_layer text_variables">인쇄 미리보기</div>
		<div class="to-add">
			<div class="p_month">
				<a href="#" class="point_color fl hide"
					onclick="Common.toggleMenu('print_view_menu');">보기:<span
					id="print_view_name">&nbsp;</span> <img
					src="/static/ui/images/btn_drop.gif" alt="보기: 드롭다운 메뉴 열기"
					class="open_drop"></a>
				<!-- 드롭 메뉴 -->
				<div class="dropdown hide" style="top: 15px; left: 0px"
					id="print_view_menu">
					<ul class="dropdown-menu">
						<li name="month"><a href="#"
							onclick="HiworksSchedule.set_print_view('month','')">월간</a></li>
						<li name="agendaWeek"><a href="#"
							onclick="HiworksSchedule.set_print_view('agendaWeek','')">주간</a></li>
					</ul>
				</div>
				<!-- 드롭 메뉴 -->
				<button type="button" class="icon print_change_btn_class monthTo1"
					onclick="HiworksSchedule.change_print_view_date('nextY')">
					<span class="blind">연 이동</span>
				</button>
				<button type="button" class="icon print_change_btn_class monthTo2"
					onclick="HiworksSchedule.change_print_view_date('next')">
					<span class="blind">월 이동</span>
				</button>
				<span class="title" id="print_date">&nbsp;</span>
				<button type="button" class="icon print_change_btn_class monthTo3"
					onclick="HiworksSchedule.change_print_view_date('prev')">
					<span class="blind">월 이동</span>
				</button>
				<button type="button" class="icon print_change_btn_class monthTo4"
					onclick="HiworksSchedule.change_print_view_date('prevY')">
					<span class="blind">연 이동</span>
				</button>
			</div>
			<div class="preview" style="width: 756px; height: 495px;">
				<span id="load_msg"><img
					src="/static/images/common/icon/progress.gif" width="16"
					height="16" align="absmiddle">로딩</span>
				<iframe name="pframe" style="visibility: hidden;"></iframe>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="HiworksSchedule.print_test();">인쇄</button>
			<button type="button" onclick="HiworksSchedule.close_print_view();">닫기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!--  -->
	<div class="layer_box middle hide popup6"
		style="margin-left: -175px; margin-top: -115px;" id="layer_repeat_del">
		<div class="title_layer text_variables">반복 일정 삭제</div>
		<div class="to-add">
			<div class="pdb_10">
				<label><input type="radio" name="sch_plan1"
					title="선택한 일정만 삭제"
					onclick="HiworksSchedule.setSelectCalEvent_option('select_option',1);"
					checked=""> 선택한 일정만 삭제</label>
			</div>
			<div class="pdb_10">
				<label><input type="radio" name="sch_plan1"
					title="향후 일정 모두 삭제"
					onclick="HiworksSchedule.setSelectCalEvent_option('select_option',2);">
					향후 일정 모두 삭제</label>
			</div>
			<div>
				<label><input type="radio" name="sch_plan1"
					title="반복 일정 모두 삭제"
					onclick="HiworksSchedule.setSelectCalEvent_option('select_option',3);">
					반복 일정 모두 삭제</label>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables" id="repeat_del_detail">확인</button>
			<button type="button" onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>
	<!--  -->
	<div class="layer_box middle hide popup1"
		style="margin-left: -175px; margin-top: -115px;" id="layer_repeat_mod">
		<div class="title_layer text_variables">반복 일정 수정</div>
		<div class="to-add">
			<div class="pdb_10">
				<label><input type="radio" name="sch_plan2"
					title="선택한 일정만 수정"
					onclick="HiworksSchedule.setSelectCalEvent_option('select_option',1);"
					checked=""> 선택한 일정만 수정</label>
			</div>
			<div class="pdb_10">
				<label><input type="radio" name="sch_plan2"
					title="향후 일정 모두 수정"
					onclick="HiworksSchedule.setSelectCalEvent_option('select_option',2);">
					향후 일정 모두 수정</label>
			</div>
			<div>
				<label><input type="radio" name="sch_plan2"
					title="반복 일정 모두 수정"
					onclick="HiworksSchedule.setSelectCalEvent_option('select_option',3);">
					반복 일정 모두 수정</label>
			</div>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables" id="repeat_mod_detail">확인</button>
			<button type="button" onclick="hidePopup();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>

	<!-- 소유자 변경 -->
	<div class="layer_box mid_large hide popup8" id="owner-change-layer">
		<div class="title_layer text_variables">소유자 변경</div>
		<div class="to-add" style="padding-bottom: 33px;">
			<ul class="sch_form">
				<li style="overflow: visible;">
					<div style="width: 75px; height: 43px;">
						<span style="line-height: 43px; vertical-align: middle;">소유자</span>
					</div>
					<div class="custom-dropdown" style="width: 373px;">
						<input class="custom-dropdown-input" type="text"
							placeholder="이름을 입력해주세요."> <i
							class="custom-dropdown-arrow fas fa-caret-down"></i>
						<div class="custom-dropdown-menu">
							<div class="custom-dropdown-menu-item">옵션 1</div>
							<div class="custom-dropdown-menu-item">옵션 2</div>
							<div class="custom-dropdown-menu-item">옵션 3</div>
						</div>
					</div>

				</li>

			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="_ownerLayer.change();">변경</button>
			<button type="button" class="btn_make" onclick="_ownerLayer.close();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="_ownerLayer.close();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>


	<!-- /소유자 변경 -->
	<!-- 휴지통 내 캘린더 -->
	<div class="layer_box mid_large hide popup9" id="del-my-project-layer">
		<div class="title_layer text_variables">휴지통(내 캘린더)</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>캘린더1</div></li>
			</ul>
		</div>
		<div class="layer_button">

			<button type="button" class="btn_variables"
				onclick="_deletedProjectLayer.restoreProject(this);">복원</button>
			<button type="button" class=""
				onclick="_deletedProjectLayer.removeProject(this);">완전 삭제</button>
			<button type="button" class=""
				onclick="_deletedProjectLayer.close();"
				style="display: inline-block;">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="_deletedProjectLayer.close();" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- /휴지통 내 캘린더 -->
	<!-- 휴지통 공유 캘린더 -->
	<div class="layer_box large hide popup10" id="del-shared-project-layer">
		<div class="title_layer text_variables">휴지통(공유 캘린더)</div>
		<div class="to-add">
			<ul class="sch_form">
				<li><span>캘린더 이름</span>
					<div>공유 캘린더 123</div></li>
				<li><span>소유자</span>
					<div>소유자123</div></li>
				<li><span>공유 대상</span>
					<div class="address-choice-form type2 after">
						<div class="to-item after share">
							<div class="left" style="cursor: default">
								<h5>
									조회/등록 권한 <span id="del_write_cnt">4</span>
								</h5>
								<div class="to" style="height: 176px">
									<select id="del_write_list" multiple="" style="height: 176px">
										<option>ciaobar4</option>
										<option>게시판팀2</option>
										<option>ciaobar2</option>
										<option>ciaobar</option>
									</select>
								</div>
							</div>
							<div class="right" style="cursor: default">
								<h5>
									조회 권한 <span id="del_view_cnt">0</span>
								</h5>
								<div class="bcc" style="height: 176px">
									<select id="del_view_list" multiple="" style="height: 176px">
										<option>대상자가 없습니다</option>
									</select>
								</div>
							</div>
						</div>
					</div></li>
			</ul>
		</div>
		<div class="layer_button">
			<button type="button" class="btn_variables"
				onclick="_deletedProjectLayer.restoreProject(this);">복원</button>
			<button type="button" class=""
				onclick="_deletedProjectLayer.removeProject(this);">완전 삭제</button>
			<button type="button" class=""
				onclick="_deletedProjectLayer.close();">취소</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="_deletedProjectLayer.close();" title="레이어 닫기"><span
			class="blind">레이어 닫기</span></a>
	</div>
	<!-- /휴지통 공유 캘린더 -->
</div>
