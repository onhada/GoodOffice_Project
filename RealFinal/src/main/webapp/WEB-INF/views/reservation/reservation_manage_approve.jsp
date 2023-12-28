<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>



<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>승인 관리</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field">
			<ul class="tabType1">
				<li class="tab_menu" status="BKWT"><a
					href="javascript:void(0);">승인대기</a></li>
				<li class="tab_menu on" status="BKCP"><a
					href="javascript:void(0);">승인</a></li>
				<li class="tab_menu" status="BKRJ"><a
					href="javascript:void(0);">반려</a></li>
			</ul>

			<div>
				<div class="content_title">
					<!-- Title -->
					<form id="booking_acknowledge_frm">
						<input type="hidden" name="category_no" value=""> <input
							type="hidden" name="resource_no" value="" id="resource_no_hidden">
						<input type="hidden" name="sort_type" value="name"
							id="sort_type_hidden"> <input type="hidden"
							name="sort_asc" value="asc" id="sort_asc_hidden">
						<fieldset>
							<div class="fl pdt_10">
								<div id="ackowledge_btn_list_div">
									<span class="detail_select" style="padding-right: 6px;">
										<label style="margin-left: -10px"><input
											type="checkbox" id="all_ck"
											onclick="bookingAcknowledge.setAllCheck();" title="항목 선택"></label>
									</span> <span class="detail_select" style="padding-right: 6px;"
										id="listCnt"></span> <span
										class="detail_select check_not_visible"> <a
										href="javascript:void(0)"
										onclick="bookingCommon.showDropdownList('category_list_ul', bookingAcknowledge.hideDropdownList, false);">보기:
											<span id="dropdown_status_text">모두</span> <img
											src="/static/ui/images/btn_drop.gif" alt="옵션 드롭다운 메뉴 열기"
											class="open_drop">
									</a>
									</span> <span class="detail_select"> <a
										href="javascript:void(0)" class="booking_del_btn hide">삭제</a>
									</span>
								</div>
								<div class="dropdown" style="left: 15px; top: 18px;">
									<ul class="dropdown-menu hide" id="category_list_ul">
										<li id="category_all_li"><a href="javascript:void(0)"><span
												class="dropdown_text_name">모두</span></a></li>
										<li no="1982"><a href="javascript:void(0)"> <span
												class="dropdown_text_name">회의실</span> <span
												class="icon down deg902"></span>
										</a></li>
										<li no="1983"><a href="javascript:void(0)"> <span
												class="dropdown_text_name">법인 차량</span> <span
												class="icon down deg902"></span>
										</a></li>
										<li no="1985"><a href="javascript:void(0)"> <span
												class="dropdown_text_name">사내 콘도</span> <span
												class="icon down deg902"></span>
										</a></li>
									</ul>
								</div>
								<div class="dropdown" style="left: 146px; top: 18px;">
									<ul class="dropdown-menu hide" id="resource_list_ul">
										<li cate_no="1982" no="2294"><a href="javascript:void(0)">
												<span class="dropdown_text_name">회의실 B2</span>
										</a></li>
										<li cate_no="1982" no="2297"><a href="javascript:void(0)">
												<span class="dropdown_text_name">회의실 A1</span>
										</a></li>
										<li cate_no="1982" no="2298"><a href="javascript:void(0)">
												<span class="dropdown_text_name">회의실 M5</span>
										</a></li>
										<li cate_no="1983" no="2295"><a href="javascript:void(0)">
												<span class="dropdown_text_name">차량(4인)</span>
										</a></li>
										<li cate_no="1983" no="2299"><a href="javascript:void(0)">
												<span class="dropdown_text_name">차량(6인)</span>
										</a></li>
										<li cate_no="1985" no="2300"><a href="javascript:void(0)">
												<span class="dropdown_text_name">콘도1(제주)</span>
										</a></li>
										<li cate_no="1985" no="2301"><a href="javascript:void(0)">
												<span class="dropdown_text_name">콘도2(속초)</span>
										</a></li>
									</ul>
								</div>
							</div>
							<div class="fr"
								style="display: flex; align-items: center; gap: 10px;">
								<a href="javascript:void(0)" id="btn_search_undo"
									class="search_bt fl hide" style="margin: 6px 10px 0 0;"><span
									class="sp_menu searchCancel"></span>검색 취소</a>
								<div class="in-search fl">
									<div class="search">
										<fieldset>
											<input type="text" id="nameSearch" autocomplete="off"
												maxlength="30" name="txtSearch" value="" placeholder="이름 검색"
												style="margin-top: 5px;"> <span class="btn_search"><span
												class="icon src cpointer"><em class="blind">검색</em></span></span>
										</fieldset>
									</div>
								</div>
								<span>
									<button class="excel-button" type="button"
										onclick="bookingAcknowledge.excelDownload();">
										<img src="https://static.hiworks.com/hr/svg/xls.svg"
											alt="download excel">
									</button>
								</span>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="pdt_10">
					<table class="tableType01 rs-table">
						<colgroup>
							<col width="35">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col"><a href="javascript:void(0);"
									class="sort booking_sort" sort_type="name">요청자 <span
										class="icon down" sort_asc="asc"></span>
								</a></th>
								<th scope="col"><a href="javascript:void(0);"
									class="sort booking_sort" sort_type="category">카테고리 <span
										class="icon down" sort_asc="asc"></span>
								</a></th>
								<th scope="col" width="15%"><a href="javascript:void(0);"
									class="sort booking_sort" sort_type="resource">자원 <span
										class="icon down" sort_asc="asc"></span>
								</a></th>
								<th scope="col" width="25%"><a href="javascript:void(0);"
									class="sort booking_sort" sort_type="booking_date">예약 시간 <span
										class="icon down" sort_asc="asc"></span>
								</a></th>
								<th scope="col" id="updateTime" type="hidden" class=""><a
									href="javascript:void(0);" class="sort booking_sort"
									sort_type="approval_date">결재 시간<span class="icon down"
										sort_asc="asc"></span></a></th>
								<th scope="col">설정</th>
							</tr>
						</thead>
						<tbody id="booking_list_tbody">
							<tr>
								<td><label for=""><input type="checkbox"
										name="no[]" value="19215"></label></td>
								<td>김이사(kim)</td>
								<td>법인 차량</td>
								<td>차량(4인)</td>
								<td>2023-12-01 06:30 ~ 2023-12-01 17:00</td>
								<td>2023-12-01 12:37</td>
								<td>
									<button type="button" name="button"
										class="weakblue booking_detail_view_btn" booking_no="19215">상세보기</button>
								</td>
							</tr>
							<tr>
								<td><label for=""><input type="checkbox"
										name="no[]" value="19220"></label></td>
								<td>대표이사(ceo)</td>
								<td>법인 차량</td>
								<td>차량(4인)</td>
								<td>2023-12-13 00:00 ~ 2023-12-14 00:00</td>
								<td>2023-12-01 12:49</td>
								<td>
									<button type="button" name="button"
										class="weakblue booking_detail_view_btn" booking_no="19220">상세보기</button>
								</td>
							</tr>
							<tr>
								<td><label for=""><input type="checkbox"
										name="no[]" value="19221"></label></td>
								<td>대표이사(ceo)</td>
								<td>사내 콘도</td>
								<td>콘도2(속초)</td>
								<td>2023-12-01 오전 ~ 2023-12-01 오후</td>
								<td>2023-12-01 12:49</td>
								<td>
									<button type="button" name="button"
										class="weakblue booking_detail_view_btn" booking_no="19221">상세보기</button>
								</td>
							</tr>
							<tr>
								<td><label for=""><input type="checkbox"
										name="no[]" value="19226"></label></td>
								<td>대표이사(ceo)</td>
								<td>법인 차량</td>
								<td>차량(4인)</td>
								<td>2023-12-01 03:00 ~ 2023-12-01 04:30</td>
								<td>2023-12-01 12:56</td>
								<td>
									<button type="button" name="button"
										class="weakblue booking_detail_view_btn" booking_no="19226">상세보기</button>
								</td>
							</tr>
							<tr>
								<td><label for=""><input type="checkbox"
										name="no[]" value="19227"></label></td>
								<td>대표이사(ceo)</td>
								<td>사내 콘도</td>
								<td>콘도1(제주)</td>
								<td>2023-12-01 오전 ~ 2023-12-01 오후</td>
								<td>2023-12-01 12:57</td>
								<td>
									<button type="button" name="button"
										class="weakblue booking_detail_view_btn" booking_no="19227">상세보기</button>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="text-align: center; margin-top: 15px" id="ack_paging">
						<div class="paginate">
							<strong>1</strong>
						</div>
					</div>
				</div>
				<div class="pdt_20">
					<p>
						총 <span id="total_cnt">5</span>개
					</p>
				</div>
			</div>
		</div>
		<!-- Contents End-->
	</div>
	<!-- 예약 리스트 생성 -->

</div>