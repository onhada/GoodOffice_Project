<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div id="contents">
	<div class="content_title">
		<form>
			<fieldset>
				<span class="detail_select"> <a href="javascript:void(0);"
					class="fl" onclick="ApprovalProcess.circulationDocument();">회람하기</a><a
					href="javascript:void(0)" class="icon question tipsIcon"
					style="position: relative; top: 0; margin-left: 10px"><span
						class="blind">세부 설명</span></a>
					<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
						<div class="tooltip-box" style="width: 360px;">
							<p>ㆍ수신된 문서를 관련자에게 회람할 수 있습니다.</p>
							<p>ㆍ회람하면 현재 문서의 내용과 첨부 파일이 원문으로 포함됩니다.</p>
						</div>
					</div>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					class="fl" onclick="ApprovalProcess.replyDocument();">답장하기</a><a
					href="javascript:void(0);" class="icon question tipsIcon"
					style="position: relative; top: 0; margin-left: 10px"><span
						class="blind">세부 설명</span></a>
					<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
						<div class="tooltip-box" style="width: 300px;">
							<p>ㆍ원 문서의 발신자와 기안자에게 답장할 수 있습니다.</p>
							<p>ㆍ답장 시 이 문서가 관련 문서로 포함됩니다.</p>
						</div>
					</div>
				</span> <span class="detail_select"> <a href="javascript:void(0);"
					onclick="ApprovalProcess.documentPrint();">인쇄</a>
				</span>
			</fieldset>
		</form>
		<div class="setting_box">
			<button type="button" class="hw-icon outlined list_bt"
				onclick="javascript:location.href='/gabia.biz/approval/document/lists/V/?&amp;list_mode=V'"
				title="목록보기">
				<i class="gi gi-list"></i>
			</button>
		</div>
	</div>

	<input type="hidden" name="approval_document_no" value="7585">
	<input type="hidden" name="approval_first_line" value="2815,2819">
	<input type="hidden" name="approval_second_line" value=""> <input
		type="hidden" name="approval_third_line" value="2812"> <input
		type="hidden" name="approval_fourth_line" value=""> <input
		type="hidden" name="approval_fifth_line" value=""> <input
		type="hidden" name="approval_preserved_term" value="5"> <input
		type="hidden" name="approval_security_level" value="A"> <input
		type="hidden" name="approval_list_view"
		value="/gabia.biz/approval/document/lists/V/?&amp;list_mode=V">

	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box view">
			<div class="approval-wrap write view">
				<h1>업무연락</h1>
				<table class="tableType02">
					<caption></caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 37.62%">
						<col style="width: 22.17%">
						<col style="width: 28.12%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">문서 종류</th>
							<td>공통 &gt; 업무연락</td>
							<th scope="row">문서 번호</th>
							<td>GA-업연-20231203-0002</td>
						</tr>
						<tr>
							<th scope="row">기안 부서</th>
							<td>생산부 &gt; 생산1팀</td>
							<th scope="row">기안자</th>
							<td>김이사</td>
						</tr>
						<tr>
							<th scope="row">보존 연한</th>
							<td>5년</td>
							<th scope="row">보안 등급</th>
							<td>A등급</td>
						</tr>
						<tr>
							<th scope="row">기안 일시</th>
							<td>2023-12-03 10:04:27</td>
							<th scope="row">완료 일시</th>
							<td>2023-12-03 10:11:16</td>
						</tr>
					</tbody>
				</table>

				<table class="tableType01 reception">
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><div class="choice"
									style="height: 18px; line-height: 18px;">수신</div></th>
							<td><span class="refer-list" user_no="2812" node_id="2256"
								type="G">대표이사<span
									class="icon file_delete js-approval-line-delete"
									style="display: none;"></span> <img
									src="/gabia.biz/approval/sign/approval/G/1" alt="열람"
									title="2023-12-03 10:19:04"
									class="vm js-approval-confirm-check"><span
									class="bt_left pdt_0 pdb_0 mgl_5"><button type="button"
											class="small-button"
											onclick="ApprovalProcess.getApprovalCheckLayer(&quot;7585&quot;, &quot;2812&quot;)">확인</button></span></span>
							</td>
						</tr>
						<tr>
							<th scope="row"><div class="choice"
									style="height: 17px; line-height: 17px;">참조</div></th>
							<td></td>
						</tr>
						<tr>
							<th scope="row"><div class="choice"
									style="height: 18px; line-height: 18px;">발신</div></th>
							<td><span class="refer-list">대리 양대리</span></td>
						</tr>
					</tbody>
				</table>

				<div class="docu-common-wrap">
					<h2>
						<a href="javascript:void(0)" class="icon impt " style="top: 57px;"
							onclick="Approval.setFavorites(this, '7585')"><span
							class="blind"></span></a> <span class="point_color"> </span> ㅇㅇ
					</h2>
					<div class="contents after">
						<div class="se-contents"
							style="box-sizing: content-box; font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.6; margin: 0px;"
							data-document-padding-top="18" data-document-padding-left="23"
							data-document-padding-right="23">
							<p
								style="margin: 0px; display: block; overflow-wrap: break-word;">
								<span>ㅇㅇㅇ</span>
							</p>
						</div>
					</div>

					<div class="file after hide">
						<div class="top">
							<span class="body-color mgr_20">별첨</span>
						</div>
						<div class="filebox"></div>
					</div>

				</div>
			</div>

		</div>
	</div>

	<script>
ApprovalProcess._documentNo = '7585';
ApprovalProcess._firstLine = '2815,2819';
ApprovalProcess._secondLine = '';
ApprovalProcess._thirdLine = '2812';
ApprovalProcess._fourthLine = '';
ApprovalProcess._fifthLine = '';
ApprovalProcess._approvalMethod = 'AFGHI';
ApprovalProcess._registerNo = '2815';
ApprovalProcess._documentType = 'common';



var approvalRelatedDocumentTable = new approvalTableClass( {table:"tableRelatedDocument", row : [["action2", ""], ["star", ""], ["document_code", "docu-num"], ["none_link_title", "title"], ["register", "docu-register"]]} );

$j(document).ready(function(){
	autoComplete();
	Approval.settingDblClickForDeleteApprovalSelectUser();
	
    ApprovalDepartment.getOrgNodeList("view");
    orgtree.setTopNodeId('2256');
	
});

$j(document).on("click", '.js-approval-line-delete', function(){
	if($j(this).parent().attr("user_no") === undefined){
		alert("다시 시도해주시기 바랍니다.");
		return;
	}

	if(ApprovalProcess.deleteApprovalLinUser($j(this).parent().attr("user_no"), $j(this).parent().contents().eq(0).text(), $j(this).parent().attr("type"), $j(this).closest('td').attr('id'))){
		$j(this).parent().remove();
	}
});

$j(document).on("click", '.department_delete', function(){
    if($j(this).parent().attr("node_id") === undefined){
        alert("다시 시도해주시기 바랍니다.");
        return;
    }
    if(ApprovalDepartment.deleteApprovalDepartment($j(this).parent().attr("node_id"), $j(this).parent().children(".approval-group-name").text(), ApprovalProcess._documentNo)){
        $j(this).parent().remove();
    }
});

$j(document).on("click", '.js-approval-circulation', function(){
	$j(this).parent().remove();
});

$j(document).on("mousedown", '.js-approval-li-types', function(event){
	event.preventDefault();
	$j('.js-approval-li-forms').removeClass("active");
	$j(this).addClass("active");
	$j('#anchorApprovalType').html("보기: " +$j(this).text());
	$j("#menuApprovalTypeMode").toggleClass("show");
	ApprovalProcess._searchRelatedDocument['type'] = $j(this).attr("value");
	ApprovalProcess._searchRelatedDocument['page'] = '1';
	ApprovalProcess.getRelatedDocumentList();
});

$j(document).on("keydown", '#textSearchRelatedDocument', function(e){
	if(e.keyCode == 13){ // enter
		e.preventDefault();
		e.stopPropagation();

		ApprovalProcess.searchRelatedDocument();
	}
});

$j(document).on("click", '.js-approval-btn-box-mode', function(){
	if($j(this).parent().children("ul").hasClass("dropdown-menu")){
		$j(this).parent().children("ul").toggleClass("show");
		$j(".js-approval-li-types").removeClass("active");
	}
});

$j(document).on("click", '#anchorApprovalUserOrder', function(){
	var options = $j('#orderApprovalDropdown').find('a');
	var orderKey = getCookie('orderKey');

	if(!orderKey) {
		orderKey = 'name';
	}

	for(var i=0; i < options.length; i++) {
		var option = options[i];

		if(option.onclick.toString().includes(orderKey)) {
			option.style.fontWeight = 'bold';
		} else {
			option.style.fontWeight = '';
		}
	}

	$j('#orderApprovalDropdown').toggleClass("show");
});

$j('#m_view_more_menu').on('click', function(e){
	e.preventDefault();
	e.stopPropagation();
	$j('#m_view_more_menu_detail').show();
});

$j(document).on('click', function(){
    $j('button:focus').blur();
	$j('#m_view_more_menu_detail').hide();
});


ApprovalProcess._universalSetting = 'N';

</script>
</div>
