<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>



<div id="contents" style="left:276px;">
				<div class="setting_title">
	<h3 class="fl">자원 관리</h3>
	<select name="" id="category_list" class="fl mgl_20" onchange="bookingResource.getResource();">
		<option value="1982">회의실</option>
		<option value="1983">법인 차량</option>
		<option value="1985">사내 콘도</option>	</select>
</div>
<div class="content_inbox">
	<!-- Contents -->
	<div class="setting_field">
		<div class="cont_hidden">
			<h4 class="fl mgr_20">자원 목록</h4>
			<a href="/gabia.biz/booking/bookingManage/resourceManageAdd/1982" class="weakblue" id="resource_add_a"><span class="sms_plus"></span> 추가하기</a>
			<span class="detail_select fr">
				<a href="javascript:void(0);" class="point_color">목록 수 <img src="/static/ui/images/btn_drop.gif" alt="옵션 드롭다운 메뉴 열기" class="open_drop"></a>
			</span>
		</div>
		<div class="pdb_50">
			<table class="tableType01 rs-table">
				<colgroup>
					<col width="">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">자원 이름</th>
						<th scope="col">관리</th>
					</tr>
				</thead>
				<tbody id="resource_list_tbody"><tr no="2294">    <td><a href="javascript:void(0);" class="category_detail_view" no="2294" r_type="R">회의실 B2</a></td>    <td>     <button type="button" name="button" class="weakblue mod_resource_btn">수정</button>     <span class="grey_bar">|</span>     <button type="button" name="button" class="weakblue del_resource_btn">삭제</button>     <span class="grey_bar">|</span>     <span class="cpointer up_sort_resource_btn" sort_type="U"><img src="/static/ui/images/btn_drop.gif" alt="위" class="open_drop deg180"></span>     <span class="cpointer down_sort_resource_btn" sort_type="D"><img src="/static/ui/images/btn_drop.gif" alt="아래" class="open_drop"></span>    </td>   </tr>     <tr no="2297">    <td><a href="javascript:void(0);" class="category_detail_view" no="2297" r_type="R">회의실 A1</a></td>    <td>     <button type="button" name="button" class="weakblue mod_resource_btn">수정</button>     <span class="grey_bar">|</span>     <button type="button" name="button" class="weakblue del_resource_btn">삭제</button>     <span class="grey_bar">|</span>     <span class="cpointer up_sort_resource_btn" sort_type="U"><img src="/static/ui/images/btn_drop.gif" alt="위" class="open_drop deg180"></span>     <span class="cpointer down_sort_resource_btn" sort_type="D"><img src="/static/ui/images/btn_drop.gif" alt="아래" class="open_drop"></span>    </td>   </tr>     <tr no="2298">    <td><a href="javascript:void(0);" class="category_detail_view" no="2298" r_type="R">회의실 M5</a></td>    <td>     <button type="button" name="button" class="weakblue mod_resource_btn">수정</button>     <span class="grey_bar">|</span>     <button type="button" name="button" class="weakblue del_resource_btn">삭제</button>     <span class="grey_bar">|</span>     <span class="cpointer up_sort_resource_btn" sort_type="U"><img src="/static/ui/images/btn_drop.gif" alt="위" class="open_drop deg180"></span>     <span class="cpointer down_sort_resource_btn" sort_type="D"><img src="/static/ui/images/btn_drop.gif" alt="아래" class="open_drop"></span>    </td>   </tr></tbody>
			</table>
		</div>
	</div>
	<!-- Contents End-->
</div>

           </div>