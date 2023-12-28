<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>



<div id="leftmenu">
	<!-- left -->
	&#xFEFF;


	<div class="new-split-item left" style="width: inherit;">
		<div class="new-sidebar">
			<button type="button" class="main-btn"
				onclick="HiworksSchedule.layer_schedule_add();">
				<i class="gi gi-plus"></i><span>일정 추가</span>
			</button>

			<nav class="menu-wrap">
				<div class="month_left" style="margin: 15px 5px;">
					<div id="calendar_mini"
						style="cursor: pointer; width: 100%; height: 222px;"
						class="fc fc-ltr fc-unthemed">
						<div class="fc-toolbar">
							<div class="fc-left"></div>
							<div class="fc-right"></div>
							<div class="fc-center">
								<button class="icon monthTo1"
									onclick="HiworksSchedule.prevYear('mini')"></button>
								<button class="icon monthTo2"
									onclick="HiworksSchedule.prev('mini')"></button>
								<h2>2023.11</h2>
								<button class="icon monthTo3"
									onclick="HiworksSchedule.next('mini')"></button>
								<button class="icon monthTo4"
									onclick="HiworksSchedule.nextYear('mini')"></button>
							</div>
							<div class="fc-clear"></div>
						</div>
						<div class="fc-view-container" style="">
							<div class="fc-view fc-month-view fc-basic-view" style="">
								<table>
									<thead class="fc-head">
										<tr>
											<td class="fc-widget-header" style="border-style: none;"><div
													class="fc-row fc-widget-header">
													<table>
														<thead>
															<tr>
																<th
																	class="fc-day-header fc-widget-header fc-sun red_color"
																	style="border-style: none;">일</th>
																<th class="fc-day-header fc-widget-header fc-mon"
																	style="border-style: none;">월</th>
																<th class="fc-day-header fc-widget-header fc-tue"
																	style="border-style: none;">화</th>
																<th class="fc-day-header fc-widget-header fc-wed"
																	style="border-style: none;">수</th>
																<th class="fc-day-header fc-widget-header fc-thu"
																	style="border-style: none;">목</th>
																<th class="fc-day-header fc-widget-header fc-fri"
																	style="border-style: none;">금</th>
																<th
																	class="fc-day-header fc-widget-header fc-sat blue_color"
																	style="border-style: none;">토</th>
															</tr>
														</thead>
													</table>
												</div></td>
										</tr>
									</thead>
									<tbody class="fc-body">
										<tr>
											<td class="fc-widget-content" style="border-style: none;"><div
													class="fc-day-grid-container" style="">
													<div class="fc-day-grid">
														<div class="fc-row fc-week fc-widget-content">
															<div class="fc-bg">
																<table>
																	<tbody>
																		<tr>
																			<td
																				class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																				data-date="2023-10-29" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																				data-date="2023-10-30" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																				data-date="2023-10-31" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-wed fc-past"
																				data-date="2023-11-01" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-thu fc-past"
																				data-date="2023-11-02" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-fri fc-past"
																				data-date="2023-11-03" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-sat fc-past"
																				data-date="2023-11-04" style="border-style: none;"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="fc-content-skeleton">
																<table>
																	<thead>
																		<tr>
																			<td
																				class="fc-day-number fc-sun fc-other-month fc-past"
																				data-date="2023-10-29" style="border-style: none;"><span
																				class="red_color" id="day_number">29</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-mon fc-other-month fc-past"
																				data-date="2023-10-30" style="border-style: none;"><span
																				class="" id="day_number">30</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-tue fc-other-month fc-past"
																				data-date="2023-10-31" style="border-style: none;"><span
																				class="" id="day_number">31</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-wed fc-past"
																				data-date="2023-11-01" style="border-style: none;"><span
																				class="" id="day_number">1</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-thu fc-past"
																				data-date="2023-11-02" style="border-style: none;"><span
																				class="" id="day_number">2</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-fri fc-past"
																				data-date="2023-11-03" style="border-style: none;"><span
																				class="" id="day_number">3</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-sat fc-past"
																				data-date="2023-11-04" style="border-style: none;"><span
																				class="blue_color" id="day_number">4</span><span
																				id="spacial_date"></span></td>
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
															<div class="fc-bgevent-skeleton">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-bgevent"
																				style="background-color: #FFFFFF" colspan="1"></td>
																			<td colspan="6"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="fc-bgevent-skeleton">
																<table>
																	<tbody>
																		<tr>
																			<td colspan="6"></td>
																			<td class="fc-bgevent"
																				style="background-color: #FFFFFF" colspan="1"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="fc-row fc-week fc-widget-content">
															<div class="fc-bg">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-day fc-widget-content fc-sun fc-past"
																				data-date="2023-11-05" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-mon fc-past"
																				data-date="2023-11-06" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-tue fc-past"
																				data-date="2023-11-07" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-wed fc-past"
																				data-date="2023-11-08" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-thu fc-past"
																				data-date="2023-11-09" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-fri fc-past"
																				data-date="2023-11-10" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-sat fc-past"
																				data-date="2023-11-11" style="border-style: none;"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="fc-content-skeleton">
																<table>
																	<thead>
																		<tr>
																			<td class="fc-day-number fc-sun fc-past"
																				data-date="2023-11-05" style="border-style: none;"><span
																				class="red_color" id="day_number">5</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-mon fc-past"
																				data-date="2023-11-06" style="border-style: none;"><span
																				class="" id="day_number">6</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-tue fc-past"
																				data-date="2023-11-07" style="border-style: none;"><span
																				class="" id="day_number">7</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-wed fc-past"
																				data-date="2023-11-08" style="border-style: none;"><span
																				class="" id="day_number">8</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-thu fc-past"
																				data-date="2023-11-09" style="border-style: none;"><span
																				class="" id="day_number">9</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-fri fc-past"
																				data-date="2023-11-10" style="border-style: none;"><span
																				class="" id="day_number">10</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-sat fc-past"
																				data-date="2023-11-11" style="border-style: none;"><span
																				class="blue_color" id="day_number">11</span><span
																				id="spacial_date"></span></td>
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
														<div class="fc-row fc-week fc-widget-content">
															<div class="fc-bg">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-day fc-widget-content fc-sun fc-past"
																				data-date="2023-11-12" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-mon fc-past"
																				data-date="2023-11-13" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-tue fc-past"
																				data-date="2023-11-14" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-wed fc-past"
																				data-date="2023-11-15" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-thu fc-past"
																				data-date="2023-11-16" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-fri fc-past"
																				data-date="2023-11-17" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-sat fc-past"
																				data-date="2023-11-18" style="border-style: none;"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="fc-content-skeleton">
																<table>
																	<thead>
																		<tr>
																			<td class="fc-day-number fc-sun fc-past"
																				data-date="2023-11-12" style="border-style: none;"><span
																				class="red_color" id="day_number">12</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-mon fc-past"
																				data-date="2023-11-13" style="border-style: none;"><span
																				class="" id="day_number">13</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-tue fc-past"
																				data-date="2023-11-14" style="border-style: none;"><span
																				class="" id="day_number">14</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-wed fc-past"
																				data-date="2023-11-15" style="border-style: none;"><span
																				class="" id="day_number">15</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-thu fc-past"
																				data-date="2023-11-16" style="border-style: none;"><span
																				class="" id="day_number">16</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-fri fc-past"
																				data-date="2023-11-17" style="border-style: none;"><span
																				class="" id="day_number">17</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-sat fc-past"
																				data-date="2023-11-18" style="border-style: none;"><span
																				class="blue_color" id="day_number">18</span><span
																				id="spacial_date"></span></td>
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
															<div class="fc-bgevent-skeleton">
																<table>
																	<tbody>
																		<tr>
																			<td colspan="1"></td>
																			<td class="fc-bgevent"
																				style="background-color: #FFFFFF" colspan="1"></td>
																			<td colspan="5"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="fc-row fc-week fc-widget-content">
															<div class="fc-bg">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-day fc-widget-content fc-sun fc-past"
																				data-date="2023-11-19" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-mon fc-past"
																				data-date="2023-11-20" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-tue fc-past"
																				data-date="2023-11-21" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-wed fc-past"
																				data-date="2023-11-22" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-thu fc-past"
																				data-date="2023-11-23" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-fri fc-past"
																				data-date="2023-11-24" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-sat fc-past"
																				data-date="2023-11-25" style="border-style: none;"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="fc-content-skeleton">
																<table>
																	<thead>
																		<tr>
																			<td class="fc-day-number fc-sun fc-past"
																				data-date="2023-11-19" style="border-style: none;"><span
																				class="red_color" id="day_number">19</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-mon fc-past"
																				data-date="2023-11-20" style="border-style: none;"><span
																				class="" id="day_number">20</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-tue fc-past"
																				data-date="2023-11-21" style="border-style: none;"><span
																				class="" id="day_number">21</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-wed fc-past"
																				data-date="2023-11-22" style="border-style: none;"><span
																				class="" id="day_number">22</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-thu fc-past"
																				data-date="2023-11-23" style="border-style: none;"><span
																				class="" id="day_number">23</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-fri fc-past"
																				data-date="2023-11-24" style="border-style: none;"><span
																				class="" id="day_number">24</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-sat fc-past"
																				data-date="2023-11-25" style="border-style: none;"><span
																				class="blue_color" id="day_number">25</span><span
																				id="spacial_date"></span></td>
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
															<div class="fc-bgevent-skeleton">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-bgevent"
																				style="background-color: #FFFFFF" colspan="1"></td>
																			<td colspan="6"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="fc-row fc-week fc-widget-content">
															<div class="fc-bg">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-day fc-widget-content fc-sun fc-past"
																				data-date="2023-11-26" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-mon fc-past"
																				data-date="2023-11-27" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-tue fc-past"
																				data-date="2023-11-28" style="border-style: none;"></td>
																			<td class="fc-day fc-widget-content fc-wed fc-past"
																				data-date="2023-11-29" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-thu fc-today fc-state-highlight"
																				data-date="2023-11-30" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																				data-date="2023-12-01" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																				data-date="2023-12-02" style="border-style: none;"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<div class="fc-content-skeleton">
																<table>
																	<thead>
																		<tr>
																			<td class="fc-day-number fc-sun fc-past"
																				data-date="2023-11-26" style="border-style: none;"><span
																				class="red_color" id="day_number">26</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-mon fc-past"
																				data-date="2023-11-27" style="border-style: none;"><span
																				class="" id="day_number">27</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-tue fc-past"
																				data-date="2023-11-28" style="border-style: none;"><span
																				class="" id="day_number">28</span><span
																				id="spacial_date"></span></td>
																			<td class="fc-day-number fc-wed fc-past"
																				data-date="2023-11-29" style="border-style: none;"><span
																				class="" id="day_number">29</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-thu fc-today fc-state-highlight"
																				data-date="2023-11-30" style="border-style: none;"><span
																				class="" id="day_number">30</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-fri fc-other-month fc-future"
																				data-date="2023-12-01" style="border-style: none;"><span
																				class="" id="day_number">1</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-sat fc-other-month fc-future"
																				data-date="2023-12-02" style="border-style: none;"><span
																				class="blue_color" id="day_number">2</span><span
																				id="spacial_date"></span></td>
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
															<div class="fc-bgevent-skeleton">
																<table>
																	<tbody>
																		<tr>
																			<td colspan="1"></td>
																			<td class="fc-bgevent"
																				style="background-color: #FFFFFF" colspan="1"></td>
																			<td colspan="5"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="fc-row fc-week fc-widget-content"
															style="height: 33px;">
															<div class="fc-bg">
																<table>
																	<tbody>
																		<tr>
																			<td
																				class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																				data-date="2023-12-03" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																				data-date="2023-12-04" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																				data-date="2023-12-05" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																				data-date="2023-12-06" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																				data-date="2023-12-07" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																				data-date="2023-12-08" style="border-style: none;"></td>
																			<td
																				class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																				data-date="2023-12-09" style="border-style: none;"></td>
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
																				data-date="2023-12-03" style="border-style: none;"><span
																				class="red_color" id="day_number">3</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-mon fc-other-month fc-future"
																				data-date="2023-12-04" style="border-style: none;"><span
																				class="" id="day_number">4</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-tue fc-other-month fc-future"
																				data-date="2023-12-05" style="border-style: none;"><span
																				class="" id="day_number">5</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-wed fc-other-month fc-future"
																				data-date="2023-12-06" style="border-style: none;"><span
																				class="" id="day_number">6</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-thu fc-other-month fc-future"
																				data-date="2023-12-07" style="border-style: none;"><span
																				class="" id="day_number">7</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-fri fc-other-month fc-future"
																				data-date="2023-12-08" style="border-style: none;"><span
																				class="" id="day_number">8</span><span
																				id="spacial_date"></span></td>
																			<td
																				class="fc-day-number fc-sat fc-other-month fc-future"
																				data-date="2023-12-09" style="border-style: none;"><span
																				class="blue_color" id="day_number">9</span><span
																				id="spacial_date"></span></td>
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
															<div class="fc-bgevent-skeleton">
																<table>
																	<tbody>
																		<tr>
																			<td class="fc-bgevent"
																				style="background-color: #FFFFFF" colspan="1"></td>
																			<td colspan="6"></td>
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
				</div>

				<ul>

					<li class="el-collapse gt-mt-8">
						<div class="el-collapse-item is-active">
							<div class="el-collapse-item__header menu-item" id="myCalendar"
								onclick="new_sidebar.toggleParent(this.id)">
								<span class="link gt-pl-10"> <span
									class="collapse-prefix-icon"><i
										class="fal fa-chevron-down"></i></span> <span
									class="flex-truncate collapse">내 캘린더</span>
									<button class="collapse-suffix-icon"
										onclick="event.stopPropagation(); HiworksSchedule.make_my_project(0);">
										<i class="gi gi-plus-alt" data-tooltip="캘린더 만들기"
											data-tooltip-placement="bottom"></i>
									</button>
								</span>
							</div>
							<div class="el-collapse-item__wrap" style="display: block;">
								<ul class="el-collapse-item__content" id="myProject_list">
									<li class="menu-item"><a class="link" title="나의 프로젝트"><span
											class="color-mark link-prefix-icon label"><span
												class="color_tag c1"></span></span><span class="flex-truncate">나의
												프로젝트</span>
											<button class="collapse-suffix-icon">
												<i class="gi gi-pencil fix-btn" data-tooltip="수정하기"
													data-tooltip-placement="bottom"></i>
											</button></a></li>
									<li class="menu-item"><a class="link" title="개인"><span
											class="color-mark link-prefix-icon label"><span
												class="color_tag c2"></span></span><span class="flex-truncate">개인</span>
											<button class="collapse-suffix-icon">
												<i class="gi gi-pencil fix-btn" data-tooltip="수정하기"
													data-tooltip-placement="bottom"></i>
											</button></a></li>
								</ul>
							</div>
						</div>
					</li>

					<li class="el-collapse gt-mt-8">
						<div class="el-collapse-item is-active">
							<div class="el-collapse-item__header menu-item"
								id="publicCalendar" onclick="new_sidebar.toggleParent(this.id)">
								<span class="link gt-pl-10"> <span
									class="collapse-prefix-icon"><i
										class="fal fa-chevron-down"></i></span> <span
									class="flex-truncate collapse">공유 캘린더</span>
									<button class="collapse-suffix-icon"
										onclick="event.stopPropagation(); HiworksSchedule.make_shared_project(0);">
										<i class="gi gi-plus-alt" data-tooltip="캘린더 만들기"
											data-tooltip-placement="bottom"></i>
									</button>
								</span>
							</div>
							<div class="el-collapse-item__wrap" style="display: block;">
								<ul class="el-collapse-item__content" id="sharedProject_list">
									<li class="menu-item"><a class="link" title="재무팀,인사팀"><span
											class="color-mark link-prefix-icon label"><span
												class="color_tag share c8"></span></span><span
											class="flex-truncate">재무팀,인사팀</span>
											<button class="collapse-suffix-icon">
												<i class="gi gi-pencil fix-btn" data-tooltip="수정하기"
													data-tooltip-placement="bottom"></i>
											</button></a></li>
								</ul>
							</div>
						</div>
					</li>

					<li class="el-collapse gt-mt-8">
						<div class="el-collapse-item is-active">
							<div class="el-collapse-item__header menu-item" id="del-project"
								onclick="new_sidebar.toggleParent(this.id)">
								<span class="link gt-pl-10"> <span
									class="collapse-prefix-icon"><i
										class="fal fa-chevron-down"></i></span> <span
									class="flex-truncate collapse">휴지통</span>
								</span>
							</div>
							<div class="el-collapse-item__wrap" style="display: block;">
								<ul class="el-collapse-item__content" id="del-project-list">
									<li class="menu-item"><a class="link" title=""> <span
											class="color-mark link-prefix-icon label"> <span
												class="color_tag c6"></span>
										</span> <span class="flex-truncate">동호회</span>
									</a></li>
								</ul>
							</div>
						</div>
					</li>

				</ul>
			</nav>
		</div>
	</div>

	<form method="post" name="xForm" id="xForm" action="">
		<input type="hidden" name="_accesstype" id="_accesstype" value="S">
		<input type="hidden" name="_accesstype_original"
			id="_accesstype_original" value="S"> <input type="hidden"
			name="_syncflag" id="_syncflag" value="N"> <input
			type="hidden" name="_hid" id="_hid" value=""> <input
			type="hidden" name="_basicno" id="_basicno" value="617798"> <input
			type="hidden" name="_userno" id="_userno" value="62885"> <input
			type="hidden" name="_solutionname" id="_solutionname"
			value="gabia.biz"> <input type="hidden" name="_userid"
			id="_userid" value="kim"> <input type="hidden"
			name="_username" id="_username" value="김이사"> <input
			type="hidden" name="_sitetype" id="_sitetype" value="D"> <input
			type="hidden" name="_set_language" id="_set_language" value="korean">
		<input type="hidden" name="_birthday_show_flag"
			id="_birthday_show_flag" value="Y"> <input type="hidden"
			name="_set_adminflag" id="_set_adminflag" value="">
	</form>

	<!-- left End -->
</div>