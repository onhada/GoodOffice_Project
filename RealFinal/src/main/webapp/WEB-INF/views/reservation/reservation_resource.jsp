<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>



	<div id="contents" style="left: 276px;">
		<div class="setting_title">
			<h3>
				회의실 <span class="show-rs-info category_detail_view" r_type="C"
					no="1163">i</span>
			</h3>
		</div>
		<div class="content_inbox" style="overflow-y: hidden;">
			<!-- Contents -->
			<div class="rs-wrap" style="margin: 0;">
				<!-- 검색이 존재할 경우 -->
				<ul class="tabType1 mgb_30 hide" id="booking_search_tab_ul">
					<input type="hidden" value="" id="booking_search_name_hidden">
				</ul>
				<!-- // 검색이 존재할 경우 -->
				<input type="hidden" value="1163" id="category_no_hidden"> <input
					type="hidden" value="T" id="resource_type_hidden">
				<div class="cal_head" id="cal_head_fixed_div"
					style="padding-right: 28px; padding-left: 20px;">
					<div id="cal_head_fixed_div_area">
						<button type="button" class="icon directleft"
							onclick="bookingResourceListTime.moveDate('previous');">
							<span class="blind">전일 이동</span>
						</button>
						<input type="text" class="num datepicker hasDatepicker"
							id="booking_date" value="2023-11-30"
							style="width: 110px; border: none; margin-right: 5px;"
							readonly=""><span id="week_name_span">(목)</span><img
							class="ui-datepicker-trigger icon month"
							src="/static/ui/images/bar_bg.png" alt="예약 날짜 선택"
							title="예약 날짜 선택">
						<button type="button" class="icon directright"
							onclick="bookingResourceListTime.moveDate('next');">
							<span class="blind">익일 이동</span>
						</button>
						<button type="button" class="today-btn vt"
							onclick="bookingResourceListTime.setToday();">오늘</button>
					</div>
					<div id="tbl_head_fixed_div_area">
						<table class="rs-cal-table" id="booking_clone_tbl">
							<colgroup id="resource_list_colgroup">
								<col width="80">
								<col width="">
								<col width="">
								<col width="">
								<col width="80">
							</colgroup>
							<tbody>
								<tr>
									<td style="border-bottom: none;">
										<table>
											<thead class="booking_resource_img_top">
												<tr>
													<th scope="col" style="padding: 7px 0;"></th>
												</tr>
												<tr class="rs-bg">
													<td class="rs-btn left cpointer" style="cursor: default;"
														id="booking_prev_page"></td>
												</tr>
												<tr>
													<td class="rs-divider-td"><hr class="rs-divider"></td>
												</tr>
											</thead>
										</table>
									</td>
									<td style="border-bottom: none;">
										<table class="rs-resource-tbl" no="1390">
											<thead class="rs-view booking_resource_img_top">
												<tr>
													<th scope="col"><span class="resource_name_span"
														title="회의실 B2">회의실 B2</span> <span
														class="show-rs-info category_detail_view" r_type="R"
														no="1390">i</span></th>
												</tr>
												<tr class="rs-bg">
													<td class=""><img
														src="/gabia.biz/booking/bookingMain/imageShow/R/1390"
														alt=""></td>
												</tr>
												<tr>
													<td class="rs-divider-td"><hr class="rs-divider"></td>
												</tr>
											</thead>
										</table>
									</td>
									<td style="border-bottom: none;">
										<table class="rs-resource-tbl" no="1393">
											<thead class="rs-view booking_resource_img_top">
												<tr>
													<th scope="col"><span class="resource_name_span"
														title="회의실 A1">회의실 A1</span> <span
														class="show-rs-info category_detail_view" r_type="R"
														no="1393">i</span></th>
												</tr>
												<tr class="rs-bg">
													<td class=""><img
														src="/gabia.biz/booking/bookingMain/imageShow/R/1393"
														alt=""></td>
												</tr>
												<tr>
													<td class="rs-divider-td"><hr class="rs-divider"></td>
												</tr>
											</thead>
										</table>
									</td>
									<td style="border-bottom: none;">
										<table class="rs-resource-tbl" no="1394">
											<thead class="rs-view booking_resource_img_top">
												<tr>
													<th scope="col"><span class="resource_name_span"
														title="회의실 M5">회의실 M5</span> <span
														class="show-rs-info category_detail_view" r_type="R"
														no="1394">i</span></th>
												</tr>
												<tr class="rs-bg">
													<td class=""><img
														src="/gabia.biz/booking/bookingMain/imageShow/R/1394"
														alt=""></td>
												</tr>
												<tr>
													<td class="rs-divider-td"><hr class="rs-divider"></td>
												</tr>
											</thead>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="rs-view" id="tbl_body_div" style="height: 436px;">
					<div class="dropdown hide" id="showMoreResource">
						<ul class="dropdown-menu" id="page_list_ul">
						</ul>
					</div>
					<table class="rs-cal-table" id="booking_main_tbl">
						<colgroup id="resource_list_colgroup">
							<col width="80">
							<col width="">
							<col width="">
							<col width="">
							<col width="80">
						</colgroup>
						<tbody>
							<tr id="resource_list_tr">
								<td style="border-bottom: none;">
									<table>
										<tbody
											class="time-div rs-time-title h1032 time_table_tbody_area">
											<tr>
												<th class="rs-time-pri"><span class="recent-time"><img
														src="/static/ui/images/resource/icon_time.png" alt=""></span>
													오전 0시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 1시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 2시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 3시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 4시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 5시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 6시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 7시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 8시</th>
											</tr>
											<tr>
												<th class="rs-time-pri"><span id="rs-scroll-position"></span>
													오전 9시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 10시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오전 11시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 12시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 1시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 2시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 3시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 4시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 5시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 6시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 7시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 8시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 9시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 10시</th>
											</tr>
											<tr>
												<th class="rs-time-pri">오후 11시</th>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="border-bottom: none;">
									<table class="rs-resource-tbl" no="1390">
										<tbody
											class="marker-wrapper resource_selectable_area h1032 time_table_tbody_area ui-selectable">
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="0"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="0"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="1"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="1"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="2"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="2"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="3"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="3"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="4"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="4"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="5"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="5"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="6"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="6"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="7"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="7"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="8"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="8"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="9"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="9"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="10"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="10"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="11"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="11"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="12"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="12"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="13"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="13"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="14"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="14"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="15"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="15"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="16"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="16"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="17"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="17"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="18"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="18"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="19"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="19"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="20"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="20"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="21"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="21"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="22"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="22"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="23"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="23"></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="border-bottom: none;">
									<table class="rs-resource-tbl" no="1393">
										<tbody
											class="marker-wrapper resource_selectable_area h1032 time_table_tbody_area ui-selectable">
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="0"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="0"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="1"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="1"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="2"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="2"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="3"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="3"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="4"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="4"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="5"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="5"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="6"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="6"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="7"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="7"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="8"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="8"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="9"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="9"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="10"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="10"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="11"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="11"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="12"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="12"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="13"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="13"></td>
											</tr>
											<tr>
												<td
													class="rs-dualmarker rs_time_before NOTABLE booking_detail_view blocking ui-selectee"
													time="14" booking_no="-1" mode="start" rowspan="6"
													style="height: 132px;"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after blocking ui-selectee" time="14"
													style="display: none;"></td>
											</tr>
											<tr>
												<td
													class="rs-dualmarker rs_time_before blocking ui-selectee"
													time="15" style="display: none;"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after blocking ui-selectee" time="15"
													style="display: none;"></td>
											</tr>
											<tr>
												<td
													class="rs-dualmarker rs_time_before blocking ui-selectee"
													time="16" style="display: none;"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td
													class="rs_time_after NOTABLE booking_detail_view blocking ui-selectee"
													time="16" booking_no="-1" mode="end" style="display: none;"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="17"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="17"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="18"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="18"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="19"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="19"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="20"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="20"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="21"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="21"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="22"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="22"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="23"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="23"></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td style="border-bottom: none;">
									<table class="rs-resource-tbl" no="1394">
										<tbody
											class="marker-wrapper resource_selectable_area h1032 time_table_tbody_area ui-selectable">
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="0"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="0"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="1"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="1"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="2"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="2"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="3"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="3"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="4"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="4"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="5"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="5"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="6"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="6"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="7"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="7"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="8"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="8"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="9"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="9"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="10"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="10"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="11"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="11"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="12"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="12"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="13"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="13"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="14"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="14"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="15"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="15"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="16"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="16"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="17"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="17"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="18"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="18"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="19"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="19"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="20"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="20"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="21"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="21"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="22"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="22"></td>
											</tr>
											<tr>
												<td class="rs-dualmarker rs_time_before ui-selectee"
													time="23"></td>
											</tr>
											<tr class="rs-dualmarker-21">
												<td class="rs_time_after ui-selectee" time="23"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- Contents End-->
		</div>
	</div>
	



