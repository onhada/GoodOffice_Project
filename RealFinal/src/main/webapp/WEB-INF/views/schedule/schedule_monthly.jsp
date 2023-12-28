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
			<div class="fc fc-ltr fc-unthemed" id="calendar">
				<div class="fc-toolbar">
					<div class="fc-left">
						<div class="" id="left_top">
							<span class="detail_select"><a
								href="javascript:HiworksEvent.drop_view(&quot;v&quot;);">보기
									: <span id="view_mode">월간</span>&nbsp;<img
									src="/static/ui/images/btn_drop.gif" alt="" class="open_drop">
							</a></span><!-- <span class="detail_select"><a
								href="javascript:HiworksSchedule.print_preview();">인쇄</a></span> -->
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
						<h2>2023.11</h2>
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
																		data-date="2023-10-29"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																		data-date="2023-10-30"></td>
																	<td
																		class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																		data-date="2023-10-31"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2023-11-01"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2023-11-02"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2023-11-03"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2023-11-04"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-other-month fc-past"
																		data-date="2023-10-29"><span class="red_color"
																		id="day_number">29</span><span id="spacial_date"
																		style="padding: 6px;">(음)9.15</span></td>
																	<td class="fc-day-number fc-mon fc-other-month fc-past"
																		data-date="2023-10-30"><span class=""
																		id="day_number">30</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-tue fc-other-month fc-past"
																		data-date="2023-10-31"><span class=""
																		id="day_number">31</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2023-11-01"><span class=""
																		id="day_number">1</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-past"
																		data-date="2023-11-02"><span class=""
																		id="day_number">2</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2023-11-03"><span class=""
																		id="day_number">3</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-past"
																		data-date="2023-11-04"><span class="blue_color"
																		id="day_number">4</span><span id="spacial_date"
																		style="padding: 6px;">(음)9.21</span></td>
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
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2023-11-05"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2023-11-06"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2023-11-07"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2023-11-08"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2023-11-09"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2023-11-10"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2023-11-11"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-past"
																		data-date="2023-11-05"><span class="red_color"
																		id="day_number">5</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-past"
																		data-date="2023-11-06"><span class=""
																		id="day_number">6</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-tue fc-past"
																		data-date="2023-11-07"><span class=""
																		id="day_number">7</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2023-11-08"><span class=""
																		id="day_number">8</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-past"
																		data-date="2023-11-09"><span class=""
																		id="day_number">9</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2023-11-10"><span class=""
																		id="day_number">10</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-past"
																		data-date="2023-11-11"><span class="blue_color"
																		id="day_number">11</span><span id="spacial_date"
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
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-not-end share fc-draggable c8"><div
																				class="fc-content">
																				<span class="fc-time">오후 10시</span> <span
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
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2023-11-12"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2023-11-13"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2023-11-14"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2023-11-15"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2023-11-16"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2023-11-17"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2023-11-18"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-past"
																		data-date="2023-11-12"><span class="red_color"
																		id="day_number">12</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-past"
																		data-date="2023-11-13"><span class=""
																		id="day_number">13</span><span id="spacial_date"
																		style="padding: 6px;">(음)10.1</span></td>
																	<td class="fc-day-number fc-tue fc-past"
																		data-date="2023-11-14"><span class=""
																		id="day_number">14</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2023-11-15"><span class=""
																		id="day_number">15</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-past"
																		data-date="2023-11-16"><span class=""
																		id="day_number">16</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2023-11-17"><span class=""
																		id="day_number">17</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-past"
																		data-date="2023-11-18"><span class="blue_color"
																		id="day_number">18</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-not-start fc-end share fc-draggable c8"><div
																				class="fc-content">
																				<span class="fc-title">워크샵</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container" colspan="3"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable c5"><div
																				class="fc-content">
																				<span class="fc-time">오후 10시</span> <span
																					class="fc-title">휴가</span>
																			</div></a></td>
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
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2023-11-19"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2023-11-20"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2023-11-21"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2023-11-22"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2023-11-23"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2023-11-24"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2023-11-25"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-past"
																		data-date="2023-11-19"><span class="red_color"
																		id="day_number">19</span><span id="spacial_date"
																		style="padding: 6px;">(음)10.7</span></td>
																	<td class="fc-day-number fc-mon fc-past"
																		data-date="2023-11-20"><span class=""
																		id="day_number">20</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-tue fc-past"
																		data-date="2023-11-21"><span class=""
																		id="day_number">21</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2023-11-22"><span class=""
																		id="day_number">22</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-thu fc-past"
																		data-date="2023-11-23"><span class=""
																		id="day_number">23</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-fri fc-past"
																		data-date="2023-11-24"><span class=""
																		id="day_number">24</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-sat fc-past"
																		data-date="2023-11-25"><span class="blue_color"
																		id="day_number">25</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end share fc-draggable c4"><div
																				class="fc-content">
																				<span class="fc-time">오후 4시30분</span> <span
																					class="fc-title">정기모임</span>
																			</div></a></td>
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
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2023-11-26"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2023-11-27"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2023-11-28"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2023-11-29"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-today fc-state-highlight"
																		data-date="2023-11-30"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2023-12-01"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2023-12-02"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-number fc-sun fc-past"
																		data-date="2023-11-26"><span class="red_color"
																		id="day_number">26</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-mon fc-past"
																		data-date="2023-11-27"><span class=""
																		id="day_number">27</span><span id="spacial_date"
																		style="padding: 6px;">(음)10.15</span></td>
																	<td class="fc-day-number fc-tue fc-past"
																		data-date="2023-11-28"><span class=""
																		id="day_number">28</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td class="fc-day-number fc-wed fc-past"
																		data-date="2023-11-29"><span class=""
																		id="day_number">29</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-thu fc-today fc-state-highlight"
																		data-date="2023-11-30"><span class=""
																		id="day_number">30</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-fri fc-other-month fc-future"
																		data-date="2023-12-01"><span class=""
																		id="day_number">1</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-sat fc-other-month fc-future"
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
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable c1"><div
																				class="fc-content">
																				<span class="fc-time">오후 10시</span> <span
																					class="fc-title">프로젝트 주제 선정</span>
																			</div></a></td>
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
																	<td
																		class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																		data-date="2023-12-03"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																		data-date="2023-12-04"></td>
																	<td
																		class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																		data-date="2023-12-05"></td>
																	<td
																		class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																		data-date="2023-12-06"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																		data-date="2023-12-07"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2023-12-08"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2023-12-09"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td
																		class="fc-day-number fc-sun fc-other-month fc-future"
																		data-date="2023-12-03"><span class="red_color"
																		id="day_number">3</span><span id="spacial_date"
																		style="padding: 6px;">(음)10.21</span></td>
																	<td
																		class="fc-day-number fc-mon fc-other-month fc-future"
																		data-date="2023-12-04"><span class=""
																		id="day_number">4</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-tue fc-other-month fc-future"
																		data-date="2023-12-05"><span class=""
																		id="day_number">5</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-wed fc-other-month fc-future"
																		data-date="2023-12-06"><span class=""
																		id="day_number">6</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-thu fc-other-month fc-future"
																		data-date="2023-12-07"><span class=""
																		id="day_number">7</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-fri fc-other-month fc-future"
																		data-date="2023-12-08"><span class=""
																		id="day_number">8</span><span id="spacial_date"
																		style="padding: 6px;"></span></td>
																	<td
																		class="fc-day-number fc-sat fc-other-month fc-future"
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
											</div>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 결과 검색 -->
			<div class="hide" id="calendar_search">
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
										<!-- 검색 결과 -->
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

	
	<!-- 내 캘린더 생성 -->

	<!-- 내 캘린더 생성 -->
	<!-- 공유 소유 캘린더 -->

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

	<!-- 추가/수정 레이어 -->

	<!-- 확인 레이어 -->

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
					<tbody>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62885"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">김이사</td>
							<td class="center"><input type="text" value="kim@gabia.biz"></td>
							<td class="center"><input type="text" value="010-4444-4444"></td>
						</tr>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62888"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">강과장</td>
							<td class="center"><input type="text" value="kang@gabia.biz"></td>
							<td class="center"><input type="text" value="010-7777-7777"></td>
						</tr>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62890"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">안주임</td>
							<td class="center"><input type="text" value="ahn@gabia.biz"></td>
							<td class="center"><input type="text" value="010-9999-9999"></td>
						</tr>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62886"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">오부장</td>
							<td class="center"><input type="text" value="oh@gabia.biz"></td>
							<td class="center"><input type="text" value="010-5555-5555"></td>
						</tr>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62891"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">이사원</td>
							<td class="center"><input type="text" value="lee@gabia.biz"></td>
							<td class="center"><input type="text" value="010-1234-5678"></td>
						</tr>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62887"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">조차장</td>
							<td class="center"><input type="text" value="jo@gabia.biz"></td>
							<td class="center"><input type="text" value="010-6666-6666"></td>
						</tr>
						<tr>
							<td class="center"><label><input type="checkbox"
									class="_checkbox" title="항목 선택" value="62892"
									onclick="HiworksSchedule.is_check(this)"></label></td>
							<td class="center">주알바</td>
							<td class="center"><input type="text" value="joo@gabia.biz"></td>
							<td class="center"><input type="text" value="010-1234-4321"></td>
						</tr>
					</tbody>
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
