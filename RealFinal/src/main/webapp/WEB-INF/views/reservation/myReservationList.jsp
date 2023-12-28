<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>






		
	

	<div id="contents" style="left:276px;">
		<div class="setting_title">
			<h3>나의 예약 목록</h3>
		</div>
		<div class="content_inbox">
			<!-- Contents -->
			<div class="setting_field" style="margin-bottom:50px;">
				<h4>예약 목록</h4>
				<div class="pdb_50">
					<table class="tableType01 rs-table">
						<colgroup>
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">자원명</th>
								<th scope="col">예약 시간</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody id="booking_list_tbody"><tr>    <td>회의실</td>    <td>회의실 B2</td>         <td>2023-11-30 00:00 ~ 2023-12-01 00:00</td>        <td>           <button type="button" name="button" class="weakblue del_booking_layer_btn" booking_no="150">삭제</button>          <span class="grey_bar">|</span>     <button type="button" name="button" class="weakblue booking_detail_view" booking_no="150">상세보기</button>    </td>   </tr></tbody>
					</table>
				</div>
				<div class="">
					<h4>대기 목록</h4>
					<table class="tableType01 rs-table">
						<colgroup>
							<col width="">
							<col width="">
							<col width="">
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">분류</th>
								<th scope="col">자원명</th>
								<th scope="col">예약 시간</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody id="booking_ready_list_tbody"><tr>    <td>법인 차량</td>    <td>차량(4인)</td>         <td>2023-11-29 14:30 ~ 2023-11-29 21:00</td>        <td>     <span class="point_color booking_detail_view cpointer" booking_no="151">승인 대기 중</span>    </td>   </tr>     <tr>    <td>사내 콘도</td>    <td>콘도1(제주)</td>         <td>2023-12-12 오전 ~ 2023-12-13 오후</td>        <td>     <span class="point_color booking_detail_view cpointer" booking_no="152">승인 대기 중</span>    </td>   </tr></tbody>
					</table>
				</div>
				<p class="pdt_20">* 대기 목록은 7일 후 자동 삭제됩니다.</p>
			</div>
		</div>
	</div>
	

	
	
	
	











