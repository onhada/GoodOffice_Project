<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="contents" style="left: 276px;">
	<div class="setting_title">
		<h3 style="font-size: 22px;">인사관리자</h3>
	</div>

	<div class="content_inbox insa-new">
		<div class="cont_box">
			<div class="setting_field">
				<div class="btn_insa_top1">
					<a href="javascript:void(0)" class="weakblue"
						onclick="insamanager.addManager();"><span class="sms_plus"></span>
						관리자 추가</a>
				</div>

				<table class="tableType01 gon" id="managerTable">
					<caption>부서 결재선 관리표로 번호, 결재선 명, 생성일, 결재자 구분, 결재자 명, 관리로
						구성되어 있습니다.</caption>
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">이름</th>
							<th scope="row">아이디</th>
							<th scope="row">소속</th>
							<th scope="row">등록일</th>
							<th scope="row" class="C"></th>
						</tr>
						<tr id="managerAddBox" class="hide">
							<td><label><input type="text" class="input_basic"
									style="width: 120px" title="이름 입력" placeholder="이름 입력"
									id="manager_add" value=""></label></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td class="C">&nbsp;</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>대표이사</td>
							<td>ceo</td>
							<td>하이웍스산업</td>
							<td>&nbsp;</td>
							<td class="C">전체 관리자</td>
						</tr>
						<tr>
							<td>최사장</td>
							<td>choi</td>
							<td>인사팀</td>
							<td>&nbsp;</td>
							<td class="C">전체 관리자</td>
						</tr>
					</tbody>
				</table>
				<div class="listbottom bt0">
					<p class="number" style="left: 0;">
						총 인원 : <span id="managerCount">2</span>
					</p>
					<div class="paginate">
						<div class="paginate">
							<strong>1</strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
