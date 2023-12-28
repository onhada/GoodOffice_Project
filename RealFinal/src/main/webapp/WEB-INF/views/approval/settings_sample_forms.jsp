<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contents">
	<div class="setting_title">
		<h3>샘플양식</h3>
	</div>
	<div class="content_inbox approval-admin">
		<!-- Contents -->
		<div class="cont_box">
			<div class="approval-wrap">
				<p class="txt-line-height mgb_50">
					하이웍스에서 제공하는 문서 양식을 모아둔 곳입니다. <br>언제든지 회사 양식으로 이용할 수 있으며 새로운
					양식이 지속적으로 업데이트됩니다.
				</p>
				<div class="table-top after">
					<div class="select-list-wrap fl">
						<label><input type="checkbox" title="전체 체크"
							id="checkBoxApprovalCommonForms"></label> <span
							class="check-number" id="countApprovalCommonForms"></span>
						<button type="button" class="mgl_10"
							id="actionApprovalCommonForms"
							onclick="ApprovalSetting.setApprovalForm('checkbox')">양식함으로가져오기</button>
					</div>

					<div class="fr">
						<a href="javascript:void(0);"
							class="search_bt fl point_color hide"
							style="margin: 6px 10px 0 0;" id="resetSearchCommonForms"
							onclick="ApprovalSetting.resetSearchCommonForms();"><span
							class="sp_menu searchCancel"></span>검색 취소</a>
						<div class="data-search fl">
							<div class="search"
								style="background-position: 0px 0px; border-color: rgb(192, 197, 202);">
								<fieldset>
									<input type="text" id="textSearchCommonForms"
										placeholder="양식명, 약칭 검색" autocomplete="off" maxlength="30"
										value=""> <span class="btn_search"
										onclick="ApprovalSetting.searchCommonForms();"><span
										class="icon src"><em class="blind">검색</em></span></span>
								</fieldset>
							</div>
						</div>
					</div>
				</div>
				<table class="tableType01 listbox sapceT"
					id="tableApprovalCommonForm">
					<caption>샘플양식</caption>
					<colgroup>
						<col style="width: 50px">
						<col style="width: 300px;">
						<col style="width: 200px;">
						<col style="width: 60%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">양식명</th>
							<th scope="col">약칭</th>
							<th scope="col">설명</th>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="1"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/1"><a
								href="/gabia.biz/approval/settings/sample_form/1">품의서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/1">품의</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/1">품의서</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="2"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/2"><a
								href="/gabia.biz/approval/settings/sample_form/2">지출 결의서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/2">지결</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/2">지출
								결의서</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="3"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/3"><a
								href="/gabia.biz/approval/settings/sample_form/3">업무연락</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/3">업연</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/3">업무
								연락(사내 부서간 통신문)</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="4"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/4"><a
								href="/gabia.biz/approval/settings/sample_form/4">회람</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/4">회람</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/4">회람</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="141"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/141"><a
								href="/gabia.biz/approval/settings/sample_form/141">복직원</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/141">복직</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/141">[텍스트]
								복직원</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="142"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/142"><a
								href="/gabia.biz/approval/settings/sample_form/142">사직서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/142">사직</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/142">[표]
								사직서</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="143"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/143"><a
								href="/gabia.biz/approval/settings/sample_form/143">휴직원</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/143">휴직</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/143">[표]
								휴직원</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="144"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/144"><a
								href="/gabia.biz/approval/settings/sample_form/144">복직원</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/144">복직</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/144">[표]
								복직원</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="145"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/145"><a
								href="/gabia.biz/approval/settings/sample_form/145">회의록</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/145">회의</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/145">[표]
								회의록</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="146"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/146"><a
								href="/gabia.biz/approval/settings/sample_form/146">변경 공문</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/146">변경</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/146">변경
								사항이 있음을 알릴 때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="147"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/147"><a
								href="/gabia.biz/approval/settings/sample_form/147">일반 공문</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/147">공문</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/147">일반적인
								공문을 보낼때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="148"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/148"><a
								href="/gabia.biz/approval/settings/sample_form/148">구매기안서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/148">구매</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/148">구매가
								필요할 때 쓰는 기안서</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="149"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/149"><a
								href="/gabia.biz/approval/settings/sample_form/149">발주기안서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/149">발주</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/149">발주가
								필요할 때 사용하는 기안서</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="150"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/150"><a
								href="/gabia.biz/approval/settings/sample_form/150">월간업무계획표</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/150">업무계획</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/150">월간
								업무 계획을 보고할 때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="151"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/151"><a
								href="/gabia.biz/approval/settings/sample_form/151">업무실적보고서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/151">실적</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/151">월간
								업무 실적을 보고할 때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="152"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/152"><a
								href="/gabia.biz/approval/settings/sample_form/152">월간업무일정표</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/152">업무일정</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/152">월간
								업무 일정을 보고할 때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="153"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/153"><a
								href="/gabia.biz/approval/settings/sample_form/153">제작기안서</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/153">제작</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/153">제작이
								필요한 내용에 대해 작성하는 기안서</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="154"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/154"><a
								href="/gabia.biz/approval/settings/sample_form/154">회의록</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/154">회의</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/154">사내
								혹은 사외 회의가 있을 때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="155"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/155"><a
								href="/gabia.biz/approval/settings/sample_form/155">회의일지</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/155">회의</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/155">간단한
								회의 내용 보고할 때 사용</td>
						</tr>
						<tr>
							<td><label><input type="checkbox" title="리스트 체크"
									class="js-checkbox-approval-common-form" no="156"></label></td>
							<td data-href="/gabia.biz/approval/settings/sample_form/156"><a
								href="/gabia.biz/approval/settings/sample_form/156">회의록</a></td>
							<td class="center"
								data-href="/gabia.biz/approval/settings/sample_form/156">회의</td>
							<td data-href="/gabia.biz/approval/settings/sample_form/156">[텍스트]
								회의록</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

				<div class="listbottom bt0" id="pageApprovalCommonForm">
					<p class="number">
						양식 수 : <span>106</span>
					</p>
					<div class="paginate">
						<strong>1</strong><a href="javascript:void(0);"
							onclick="ApprovalSetting.getCommonFormsByPage(&quot;2&quot;);">2</a><a
							href="javascript:void(0);"
							onclick="ApprovalSetting.getCommonFormsByPage(&quot;3&quot;);">3</a><a
							href="javascript:void(0);"
							onclick="ApprovalSetting.getCommonFormsByPage(&quot;4&quot;);">4</a><a
							href="javascript:void(0);"
							onclick="ApprovalSetting.getCommonFormsByPage(&quot;5&quot;);">5</a>
						<a href="javascript:void(0);"
							onclick="ApprovalSetting.getCommonFormsByPage(&quot;6&quot;);"><span
							class="icon pagenav3"><em class="blind">NEXT PAGE</em></span></a> <a
							href="javascript:void(0);" class="space"
							onclick="ApprovalSetting.getCommonFormsByPage(&quot;6&quot;);"><span
							class="icon pagenav4"><em class="blind">NEXT PAGE</em></span></a>
					</div>
					<div class="page_select">
						<label class="blind" for="pageCurrent">SELECT CURRENT PAGE</label>
						<select
							onchange="ApprovalSetting.getCommonFormsByPage($j(this).val());"><option
								value="1" selected="">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option></select> / 6
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
var approvalCommonFormTable = new approvalTableClass( {table:"tableApprovalCommonForm", row : [["checkbox", ""], ["title", ""], ["acronym", "center"], ["comment", ""]]} );

$j(function(){
	var History = window.History;
	var pageUrl = window.location.search.substring(0);

	if (History.enabled) {
		ApprovalSetting.getCommonForms();
	}else{
		return false;
	}

	History.Adapter.bind(window, 'statechange', function() {
		ApprovalSetting.getCommonForms();
	});
});

$j(document).on("click", "*[data-href]", function(e){
	e.stopPropagation();
	window.document.location = $j(this).data('href');
	return false;
});

$j(document).on("change", "#checkBoxApprovalCommonForms", function(){
	$j('.js-checkbox-approval-common-form').prop("checked", $j(this).prop("checked") ? true : false);

	if($j(this).prop("checked")){
		$j("#countApprovalCommonForms").html($j('.js-checkbox-approval-common-form').length).show();
	}else{
		$j("#countApprovalCommonForms").hide();
	}
});

$j(document).on("change", ".js-checkbox-approval-common-form", function(){
	if($j('.js-checkbox-approval-common-form:checked').length){
		$j("#countApprovalCommonForms").html($j('.js-checkbox-approval-common-form:checked').length).show();
	}else{
		$j("#countApprovalCommonForms").hide();
	}
});

$j(document).on('keyup', '#textSearchCommonForms', function(e){
	if(e.keyCode === 13){
		ApprovalSetting.searchCommonForms();
	}
});
</script>
</div>