<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contents">
	<div class="content_title">
		<form>
			<fieldset>
				<span class="detail_select"> <a
					href="javascript:dbUnitCreate.saveData();">저장</a>
				</span>
			</fieldset>
		</form>
	</div>
	<div class="content_inbox">
		<div class="cont_box">
			<div class="approval-wrap approval-unit" style="width: 970px;">
				<table class="tableType02 gt-mb-25">
					<caption>유닛설명</caption>
					<colgroup>
						<col style="width: 119px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">유닛명</th>
							<td><input type="text" class="hw-input-form" placeholder=""
								id="db_unit_title" value="" maxlength="10" style="width: 500px;"></td>
						</tr>
						<tr>
							<th scope="row">설명</th>
							<td><input type="text" class="hw-input-form" placeholder=""
								id="db_unit_comment" value="" maxlength="100"
								style="width: 500px;"></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="db_unit_no" value="">
				<div class="unit-box">
					<div class="unit-box-menu">
						<div class="menu-title">제공 입력 항목</div>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertInsaInfo();">
							<i class="spr-approval-unit spr-approval-unit-human gt-mr-10"></i>인사정보
						</button>
						<div class="menu-title">입력 항목</div>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertText();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-text"></i></span><span
								class="gt-d-inline-block align-middle">텍스트</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertNumber();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-number"></i></span><span
								class="gt-d-inline-block align-middle">숫자</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertDate();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-calendar"></i></span><span
								class="gt-d-inline-block align-middle">날짜</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertTime();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-clock"></i></span><span
								class="gt-d-inline-block align-middle">시간</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertRadio();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-radio"></i></span><span
								class="gt-d-inline-block align-middle">라디오 버튼</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertSelect();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-dropdown"></i></span><span
								class="gt-d-inline-block align-middle">드롭 다운</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertTextarea();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-longtext"></i></span><span
								class="gt-d-inline-block align-middle">긴 텍스트</span>
						</button>
						<button type="button" class="menu-item"
							onclick="dbUnitCreate.InsertEditor();">
							<span class="spr-wrap gt-mr-10"><i
								class="spr-approval-unit spr-approval-unit-editor"></i></span><span
								class="gt-d-inline-block align-middle">에디터</span>
						</button>
					</div>

					<div id="formDiv" class="unit-box-contents ui-sortable"></div>
				</div>
			</div>
			<div id="propDiv" class="layer_box large address hide"></div>
			<p id="output"></p>
			<p id="saveOutput"></p>
		</div>
	</div>

</div>