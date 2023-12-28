<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="contents" style="left: 276px;">
				<div class="setting_title">
	<h3>예약 관리자</h3>
</div>
<div class="content_inbox">
	<!-- Contents -->
	<div class="setting_field">
		<a href="javascript:void(0)" onclick="bookingAdmin.openGroupTreeLayer();" class="weakblue"><span class="sms_plus"></span> 관리자 추가</a>
		<div class="pdt_20">
			<table class="tableType01 rs-table">
				<colgroup>
					<col width="">
					<col width="">
					<col width="">
					<col width="">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">아이디</th>
						<th scope="col">소속</th>
						<th scope="col">등록일</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody id="booking_admin_list"><tr no="86914">    <td>대표이사</td>    <td>ceo</td>    <td>하이웍스산업</td>    <td>2023-12-01 00:00</td>    <td>         </td>   </tr>     <tr no="86915">    <td>최사장</td>    <td>choi</td>    <td>인사팀</td>    <td>2023-12-01 00:00</td>    <td>         </td>   </tr></tbody>
			</table>
		</div>
		<div class="pdt_20">
			<p>총 <span id="total_cnt">2</span>명</p>
		</div>
	</div>
	<!-- Contents End-->
</div>         </div>