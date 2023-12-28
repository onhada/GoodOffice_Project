<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>





<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3>카테고리 관리</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="setting_field">
			<div class="cont_hidden">
				<h4 class="fl mgr_20">카테고리 목록</h4>
				<a href="/gabia.biz/booking/bookingManage/categoryManageAdd"
					class="weakblue mgr_20"><span class="sms_plus"></span> 추가하기</a> <a
					href="javascript:void(0)" class="weakblue change_order_btn"><span
					class="gi gi-sort"></span> <!--  순서 편집 --> </a>
			</div>
			<div class="pdb_50">
				<table class="tableType01 rs-table">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">카테고리 이름</th>
							<th scope="col">자원수</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<tbody id="category_list_tbody">
						<tr no="1982">
							<td><a href="javascript:void(0);"
								class="category_detail_view" no="1982" r_type="C">회의실</a></td>
							<td>3</td>
							<td>
								<button type="button" name="button"
									class="weakblue mod_category_btn">수정</button> <span
								class="grey_bar">|</span>
								<button type="button" name="button"
									class="weakblue del_category_btn">삭제</button>
							</td>
						</tr>
						<tr no="1983">
							<td><a href="javascript:void(0);"
								class="category_detail_view" no="1983" r_type="C">법인 차량</a></td>
							<td>2</td>
							<td>
								<button type="button" name="button"
									class="weakblue mod_category_btn">수정</button> <span
								class="grey_bar">|</span>
								<button type="button" name="button"
									class="weakblue del_category_btn">삭제</button>
							</td>
						</tr>
						<tr no="1985">
							<td><a href="javascript:void(0);"
								class="category_detail_view" no="1985" r_type="C">사내 콘도</a></td>
							<td>2</td>
							<td>
								<button type="button" name="button"
									class="weakblue mod_category_btn">수정</button> <span
								class="grey_bar">|</span>
								<button type="button" name="button"
									class="weakblue del_category_btn">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- Contents End-->
	</div>
</div>