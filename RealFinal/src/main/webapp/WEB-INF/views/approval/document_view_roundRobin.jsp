<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>
<script>
$(document).ready(function() {
	
	
	
	
	//////////////////////////////////////////////////////////////////////////
	// 기안 취소
	$("button#cancelApproval").click(function(){
		
		if(confirm("기안한 문서를 취소하시겠습니까? 문서는 삭제처리되며, 복구되지 않습니다.")){
			// yes일 경우
			
			//ajax
			$.ajax({
			url: "<%= ctxPath%>/approval/cancleApproval.gw",
			data: { "empId": ${sessionScope.loginUser.empId}, "approvalId": ${requestScope.approvalDetail.approvalId}},
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				if(text.isDelete){
					// 이전 페이지로 돌아간다
					window.location = document.referrer;
				}else{
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
			});
			
		}
		
	})
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 결재 td 부분 관리 시작------------------------------------------
	
	// 화면에 보여질 수 - 결재자 수 
	let cnt = 7;
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '결재'}">
			cnt--;
		</c:if>
	</c:forEach>
	
	if(cnt > 0){
		let html_position = $("tr#approvalProcedureData_position").html();
		let html_stamp = $("tr#approvalProcedureData_stamp").html();
		let html_empName = $("tr#approvalProcedureData_empName").html();
		
		while(cnt != 0){
			html_position += `<td class="team name"></td>`;
			html_stamp += `<td class="stamp"></td>`;
			html_empName += `<td class="name gt-position-relative"></td>`;
			cnt--;
		}
		
		$("tr#approvalProcedureData_position").html(html_position)
		$("tr#approvalProcedureData_stamp").html(html_stamp)
		$("tr#approvalProcedureData_empName").html(html_empName)
	}
	
	// 결재 td 부분 관리 끝------------------------------------------
	
	// 재무합의 td 부분 관리 시작------------------------------------------
	
	// 화면에 보여질 수 - 결재자 수 
	cnt = 4;
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '재무합의'}">
			cnt--;
		</c:if>
	</c:forEach>
	
	if(cnt > 0){
		let html_fiPosition = $("tr#fiAgreeProcedureData_position").html();
		let html_fiStamp = $("tr#fiAgreeProcedureData_stamp").html();
		let html_fiEmpName = $("tr#fiAgreeProcedureData_empName").html();
		
		while(cnt != 0){
			html_fiPosition += `<td class="team name"></td>`;
			html_fiStamp += `<td class="stamp"></td>`;
			html_fiEmpName += `<td class="name gt-position-relative"></td>`;
			cnt--;
		}
		
		$("tr#fiAgreeProcedureData_position").html(html_fiPosition)
		$("tr#fiAgreeProcedureData_stamp").html(html_fiStamp)
		$("tr#fiAgreeProcedureData_empName").html(html_fiEmpName)
	}
	
	// 재무합의 td 부분 관리 끝------------------------------------------
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/* 보안등급 변경 ------------------------------------------------------ */
	let prev_val;
	$("select[name=security_level]").focus(function() {
		prev_val = $(this).val();
	}).change(function(){
		$(this).blur(); 
		if(confirm($("select[name=security_level] option:selected").html() + "으로 변경하시겠습니까?")){
			// 확인 버튼 눌렀을 경우
			$.ajax({
				url: "<%=ctxPath%>/approval/updateSecurity.gw",
				data: { "securityId": $("select[name=security_level] option:selected").val(),
						"approvalId" : "${requestScope.approvalDetail.approvalId}"},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isUpdate == true){
						alert("변경되었습니다!")
						$("select[name=security_level]").val(text.securityId).prop("selected", true);
					}else{
						alert("변경에 실패하였습니다!");
						$("select[name=security_level]").val(prev_val).prop("selected", true);
					}
				},
				error: function(request, status, error) {
					alert("변경에 실패하였습니다!");
					$("select[name=security_level]").val(prev_val).prop("selected", true);
				}
			});
		}else{
			$("select[name=security_level]").val(prev_val).prop("selected", true);
		}
	})
	/* 보안등급 변경 끝 --------------------------------------------------------------------------- */
	
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	// 결재 + 버튼_사원명 입력시
	let prev_autoComplete = $("ul.approval_autocomplete").html();
	$("input#inputApprovalLineSetting").focus(function(){
		
		if($("input#inputApprovalLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.approval_autocomplete").html(html);
						$("ul.approval_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.approval_autocomplete").show();
						
					}else{
						$("ul.approval_autocomplete").html(prev_autoComplete);
						$("ul.approval_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.approval_autocomplete").html(prev_autoComplete);
			$("ul.approval_autocomplete").hide();
		}
		
	}).keyup(function(){
		
		if($("input#inputApprovalLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.approval_autocomplete").html(html);
						$("ul.approval_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.approval_autocomplete").show();
						
					}else{
						$("ul.approval_autocomplete").html(prev_autoComplete);
						$("ul.approval_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.approval_autocomplete").html(prev_autoComplete);
			$("ul.approval_autocomplete").hide();
		}
		
	})
	
	
	
	$("input#inputApprovalLineSetting").focusout(function(){
		$("ul.approval_autocomplete").html(prev_autoComplete);
		$("ul.approval_autocomplete").hide();
	}) 
	
	$(document).on("mousedown", "ul.approval_autocomplete li", function() {
		
		let html = $("ul#sortApprovalLineSetting").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		let positionName = $(this).find('span:eq(2)').html();
		
		
		let isExist = false;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '결재' && ${procedure.empId} == empId){
				isExist = true;
				
			}
			
		</c:forEach>
		
		$("ul#sortApprovalLineSetting li").each(function(){
			// 리스트 안에도 있는 지 확인
			let liId = $(this).attr('id');
			let liEmpId = liId.substring(liId.indexOf('_') +1,liId.length);
			
			if(liEmpId == empId){
				isExist = true;
				return false;
			}
		})
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputApprovalLineSetting").val('');
		}else{
			html += `<li class="js-approval-line-setting unsortable" id="approvalLineSettingEmpId_` + empId +`" style="cursor: auto;"><span>` + empName + `<span class="icon file_delete js-approval-line-setting-delete"></span></span><span style="display:none;">` + positionName + `</span></li>`;
			$("ul#sortApprovalLineSetting").html(html);
			$("input#inputApprovalLineSetting").val('');
			
		}
	});
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	// 합의 + 버튼_사원명 입력시
	let prev_autoAgreeComplete = $("ul.agree_autocomplete").html();
	$("input#inputAgreeLineSetting").focus(function(){
		
		if($("input#inputAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputAgreeLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.agree_autocomplete").html(html);
						$("ul.agree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.agree_autocomplete").show();
						
					}else{
						$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
						$("ul.agree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
			$("ul.agree_autocomplete").hide();
		}
		
	}).keyup(function(){
		
		if($("input#inputAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputAgreeLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.agree_autocomplete").html(html);
						$("ul.agree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.agree_autocomplete").show();
						
					}else{
						$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
						$("ul.agree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
			$("ul.agree_autocomplete").hide();
		}
		
	})
	
	
	
	$("input#inputAgreeLineSetting").focusout(function(){
		$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
		$("ul.agree_autocomplete").hide();
	}) 
	
	$(document).on("mousedown", "ul.agree_autocomplete li", function() {
		
		let html = $("ul#sortAgreeLineSetting").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		let positionName = $(this).find('span:eq(2)').html();
		
		let isExist = false;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '합의' && ${procedure.empId} == empId){
				isExist = true;
				
			}
			
		</c:forEach>
		
		$("ul#sortAgreeLineSetting li").each(function(){
			// 리스트 안에도 있는 지 확인
			let liId = $(this).attr('id');
			let liEmpId = liId.substring(liId.indexOf('_') +1,liId.length);
			
			if(liEmpId == empId){
				isExist = true;
				return false;
			}
		})
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputAgreeLineSetting").val('');
		}else{
			html += `<li class="js-approval-line-setting agreeLine-li unsortable" id="agreeLineSettingEmpId_` + empId +`" style="cursor: auto;"><span>` + empName + `<span class="icon file_delete js-approval-line-setting-delete"></span></span><span style="display:none;">` + positionName + `</span>`;
			$("ul#sortAgreeLineSetting").html(html);
			$("input#inputAgreeLineSetting").val('');
			
		}
	});
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////
	// 재무합의 + 버튼_사원명 입력시
	let prev_autoFiAgreeComplete = $("ul.fiAgree_autocomplete").html();
	$("input#inputFiAgreeLineSetting").focus(function(){
		
		if($("input#inputFiAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputFiAgreeLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.fiAgree_autocomplete").html(html);
						$("ul.fiAgree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.fiAgree_autocomplete").show();
						
					}else{
						$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
						$("ul.fiAgree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
			$("ul.fiAgree_autocomplete").hide();
		}
		
	}).keyup(function(){
		
		if($("input#inputFiAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputFiAgreeLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.fiAgree_autocomplete").html(html);
						$("ul.fiAgree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.fiAgree_autocomplete").show();
						
					}else{
						$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
						$("ul.fiAgree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
			$("ul.fiAgree_autocomplete").hide();
		}
		
	})
	
	
	
	$("input#inputFiAgreeLineSetting").focusout(function(){
		$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
		$("ul.fiAgree_autocomplete").hide();
	}) 
	
	$(document).on("mousedown", "ul.fiAgree_autocomplete li", function() {
		
		let html = $("ul#sortFiAgreeLineSetting").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		let positionName = $(this).find('span:eq(2)').html();
		
		let isExist = false;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '재무합의' && ${procedure.empId} == empId){
				isExist = true;
				
			}
			
		</c:forEach>
		
		$("ul#sortFiAgreeLineSetting li").each(function(){
			// 리스트 안에도 있는 지 확인
			let liId = $(this).attr('id');
			let liEmpId = liId.substring(liId.indexOf('_') +1,liId.length);
			
			if(liEmpId == empId){
				isExist = true;
				return false;
			}
		})
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputFiAgreeLineSetting").val('');
		}else{
			html += `<li class="js-approval-line-setting fiAgreeLine-li unsortable" id="fiAgreeLineSettingEmpId_` + empId +`" style="cursor: auto;"><span>` + empName + `<span class="icon file_delete js-approval-line-setting-delete"></span></span><span style="display:none;">` + positionName + `</span>`;
			$("ul#sortFiAgreeLineSetting").html(html);
			$("input#inputFiAgreeLineSetting").val('');
			
		}
	});
	
	
	
	
	
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 참조 + 버튼_입력시
	
	let prev_refAutoComplete = $("ul.reference_autocomplete").html();
	$(document).on("focus", "input#inputApprovalFourthLine", function(){
		
		if($("input#inputApprovalFourthLine").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%= ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalFourthLine").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addRefEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.reference_autocomplete").html(html);
						$("ul.reference_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.reference_autocomplete").css({"top": "723px"});
						$("ul.reference_autocomplete").show();
						
					}else{
						$("ul.reference_autocomplete").html(prev_refAutoComplete);
						$("ul.reference_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
				}
			});
		}else{
			$("ul.reference_autocomplete").html(prev_refAutoComplete);
			$("ul.reference_autocomplete").hide();
		}
		
	});
	
	$(document).on("keyup", "input#inputApprovalFourthLine", function(){
		
		if($("input#inputApprovalFourthLine").val().trim() != ''){
			// 검색값이 있을 경우
			
			
			$.ajax({
				url: "<%= ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalFourthLine").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addRefEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.reference_autocomplete").html(html);
						$("ul.reference_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.reference_autocomplete").css({"top": "723px"});
						$("ul.reference_autocomplete").show();
						
					}else{
						$("ul.reference_autocomplete").html(prev_refAutoComplete);
						$("ul.reference_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
				}
			});
		}else{
			$("ul.reference_autocomplete").html(prev_refAutoComplete);
			$("ul.reference_autocomplete").hide();
		}
		
	})
	
	// 입력하다가 다른 거 선택했을경우
	$(document).on("focusout", "input#inputApprovalFourthLine", function(){
		$("ul.reference_autocomplete").html(prev_refAutoComplete);
		$("ul.reference_autocomplete").hide();
	}) 
	
	// 드롭다운 리스트에서 선택했을 경우
	$(document).on("mousedown", "ul.reference_autocomplete li", function() {
		
		let html = $("td#approvalFourthLine").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		
		let isExist = false;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if(${procedure.empId} == empId){
				isExist = true;
				
			}
		</c:forEach>
		
		$("td#approvalFourthLine > span").each(function(){
			// 리스트 안에도 있는 지 확인
			let sId = $(this).attr('id');
			let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
			
			if(sEmpId == empId){
				isExist = true;
				return false;
			}
		})
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputApprovalFourthLine").val('');
			
		}else{
			
			if(confirm("추가하시겠습니까?")){
				// yes일 경우
				$("ul.reference_autocomplete").html(prev_refAutoComplete);
				$("ul.reference_autocomplete").hide();
				
				//ajax
				$.ajax({
				url: "<%= ctxPath%>/approval/add/reference.gw",
				data: { "empId": empId, "approvalId": ${requestScope.approvalDetail.approvalId}},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isAdd == true){
						location.reload()
					}else{
						alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
					}
					
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
			}
		}
	})
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	<%-- === jQuery 를 사용하여 드래그앤드롭(DragAndDrop)을 통한 파일 업로드 시작 === --%>
	let file_arr = []; // 첨부된어진 파일 정보를 담아 둘 배열

    // == 파일 Drag & Drop 만들기 == //
    $("div#dragZone").on("dragenter", function(e){ /* "dragenter" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 최초로 들어왔을 때 */ 
        e.preventDefault();
        e.stopPropagation();
        
    }).on("dragover", function(e){ /* "dragover" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 머물러 있는 중일 때. 필수이벤트이다. dragover 이벤트를 적용하지 않으면 drop 이벤트가 작동하지 않음 */ 
        e.preventDefault();
        e.stopPropagation();
        $(this).css("background-color", "#e8ecee");
    }).on("dragleave", function(e){ /* "dragleave" 이벤트는 Drag 한 파일이 드롭대상인 박스 밖으로 벗어났을 때  */
        e.preventDefault();
        e.stopPropagation();
        $(this).css("background-color", "");
    }).on("drop", function(e){      /* "drop" 이벤트는 드롭대상인 박스 안에서 Drag 한것을 Drop(Drag 한 파일(객체)을 놓는것) 했을 때. 필수이벤트이다. */
        e.preventDefault();

        var files = e.originalEvent.dataTransfer.files;  

        if(files != null && files != undefined){
            
            let html = $("table#tableApprovalAttach tbody").html();
            const f = files[0]; // 파일 정보 어차피 files.length 의 값이 1 이므로 위의 for문을 사용하지 않고 files[0] 을 사용하여 1개만 가져오면 된다. 
        	let fileSize = f.size/1024/1024;  /* 파일의 크기는 MB로 나타내기 위하여 /1024/1024 하였음 */
        	
        	
        	if(fileSize >= 10) {
        		alert("10MB 이상인 파일은 업로드할 수 없습니다.!!");
        		$(this).css("background-color", "#fff");
        		return;
        	}else {
        		// 10MB 미만일 경우
        		
        		file_arr.push(f); //  드롭대상인 박스 안에 첨부파일을 드롭하면 파일들을 담아둘 배열인 file_arr 에 파일들을 저장시키도록 한다.
	        	const fileName = f.name; // 파일명	
        	
        	    fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1);
        	    // fileSize 가 1MB 보다 작으면 소수부는 반올림하여 소수점 3자리까지 나타내며, 
                // fileSize 가 1MB 이상이면 소수부는 반올림하여 소수점 1자리까지 나타낸다. 만약에 소수부가 없으면 소수점은 0 으로 표시한다.
        	   html += 
                    `<tr>
						<td>
							<div class="filename js-approval-attach">
								<span>` + fileName + ` (` + fileSize + `MB)</span>
								<button type="button" class="icon file_delete js-approval-attach-delete">
									<span class="blind">파일 삭제</span>
								</button>
								<div></div>
							</div>
						</td>
					</tr>`;
				$("table#tableApprovalAttach tbody").html(html);
        	}
        }// end of if(files != null && files != undefined)--------------------------
        
        $(this).css("background-color", "#fff");
    });
	
	
	
	
	
	// 파일 모달에서 삭제 버튼 클릭시 ------------------------------------------------------------------------------
	$(document).on("click", "button.js-approval-attach-delete", function(e){
		var this_fileDetail = $(e.target).parent().find("span").html();
		for(var i=0;i < file_arr.length;i++){
			// file_arr에서 삭제하기 위해
			
			var file = file_arr[i]; // 파일 정보 자체
			var fileName = file.name;
			var fileSize = file.size/1024/1024;
			fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1);
			
			var fileDetail = fileName.substring(fileName.lastIndexOf("\\") +1, fileName.length) + " (" + fileSize +"MB)";
			if(fileDetail == this_fileDetail){
				file_arr.splice(i, 1);
				break;
			}
		 }
		$(e.target).parent().detach();
		
		
	})
	// -------------------------------------------------------------------------------------------------		
	
	
	<%-- === jQuery 를 사용하여 드래그앤드롭(DragAndDrop)을 통한 파일 업로드 끝 === --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* 첨부 파일로 첨부된 거 저장 시작 --------------------------------------------------------------*/
	
	var fileList = new Object();
	
	// 첨부파일
	$('input#fileApprovalAttach').change(function(e) {
	    fileList = $(this)[0].files;  //파일 대상이 리스트 형태로 넘어온다.
	    
	    html = '';
	    for(var i=0;i < fileList.length;i++){
	    	
	    	
	        var file = fileList[i]; // 파일 정보 자체
	        
	        let fileSize = file.size/1024/1024; // 파일 사이즈 (MB로 변환)
	        
	        if(fileSize >= 10) {
	    		alert("10MB 이상인 파일은 업로드할 수 없습니다.!!");
	    		return;
	    		
	    	}else{
	    		
	    		file_arr.push(file); //  드롭대상인 박스 안에 첨부파일을 드롭하면 파일들을 담아둘 배열인 file_arr 에 파일들을 저장시키도록 한다.
	        	const fileName = file.name; // 파일명	
	    	
	    	    fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1); // 화면에 보여주기용 반올림
	    	    
	    	    html += 
	                `<tr>
						<td>
							<div class="filename js-approval-attach">
								<span>` + fileName + ` (` + fileSize + `MB)</span>
								<button type="button" class="icon file_delete js-approval-attach-delete">
									<span class="blind">파일 삭제</span>
								</button>
								<div></div>
							</div>
						</td>
					</tr>`;
				
	    	}
	    }
	    $("table#tableApprovalAttach tbody").append(html);
	    
	});
	
	
	
	
	$("button#updateAttachedFile").click(function(){
		updateApprovalFile(file_arr);
	})
	
	
	$("button#showFileModal").click(function(){
		// 파일 첨부 모달 보여질 때마다 파일 첨부 되어있던거 초기화
		let html = '';
		
		
		if(${fn:length(requestScope.approvalDetail.fvo)} > 0){
			<c:forEach var="approvalFileVo" items="${requestScope.approvalDetail.fvo}">
				html += `<tr>
							<td>
								<div class="filename js-approval-attach">
									<input type="hidden" name = "orgFiles" value="${approvalFileVo.approvalFileId}">
									<span>${approvalFileVo.fileRName} (<fmt:formatNumber value="${approvalFileVo.fileSize}" pattern="0.000" />MB)</span>
									<button type="button" class="icon file_delete js-approval-attach-delete">
										<span class="blind">파일 삭제</span>
									</button>
									<div></div>
								</div>
							</td>
						</tr>`;
						
			</c:forEach>
		}else{
			$("div#approvalAttachList").css("margin-top","0px");
		}
		
		
		$("table#tableApprovalAttach tbody").html(html);
		
		
		if(${fn:length(requestScope.approvalDetail.fvo)} > 0){
			// 파일 첨부된 게 있다면 여기로 끌어오세요는 지운다
			$("div#approvalAttachText").hide();
		}else{
			$("div#approvalAttachText").show();
		}
		
		$("div#layerAttachedFile").show();
		
		
	})
	
	
	
	/* 첨부 파일로 첨부된 거 저장 끝 --------------------------------------------------------------*/
	
	
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	/* 중요 등록, 삭제하기 시작-----------------------------------------------------------------------------------------------------------------*/
	$("button.impt").click(function(){
		
		
		
		if($(this).hasClass("on")){
			// 이미 중요에 등록되어 있어 삭제하려고 누른 경우
			
			if(confirm("중요문서에서 지우시겠습니까?")){
				//ajax
				$.ajax({
				url: "<%=ctxPath%>/approval/deleteImportant.gw",
				data: { "empId": ${sessionScope.loginUser.empId}, "approvalId": ${requestScope.approvalDetail.approvalId}},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isDelete == true){
						location.reload()
					}else{
						alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
					}
					
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
			}
			
		}else{
			// 등록되어있지 않아 등록하려고 누른 경우
			
			if(confirm("중요문서로 등록하시겠습니까?")){
				//ajax
				$.ajax({
				url: "<%=ctxPath%>/approval/insertImportant.gw",
				data: { "empId": ${sessionScope.loginUser.empId}, "approvalId": ${requestScope.approvalDetail.approvalId}},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					if(text.isAdd == true){
						location.reload()
					}else{
						alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
			}
			
		}
		
		
		
	});
	
	/* 중요 등록, 삭제하기 끝 -----------------------------------------------------------------------------------------------------------------*/	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})

// end of document.ready-----------------------------------------------------------------------








////////////////////////////////////////////////////////

/* 첨부 파일 모달에서 삭제버튼 눌렀을 경우 */
function deleteFile(event){
	$(event.target).parent().detach();
}


/* 첨부 파일칸에서 버튼 눌렀을 경우 */
function deleteSavedFile(fileId){
	
	
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
		url: "<%=ctxPath%>/approval/deleteSavedFile.gw",
		data: { "fileId": fileId},
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if(text.isDelete == true){
				location.reload()
			}else{
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
			
		},
		error: function(request, status, error) {
			alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
		}
	});
	}
}



/* 파일 첨부 확인 버튼 눌렀을 경우 */
function updateApprovalFile(file_arr){
	
	 var formData = new FormData($("form[name='addFrm']").get(0)); // $("form[name='addFrm']").get(0) 폼 에 작성된 모든 데이터 보내기 
     
     if(file_arr.length > 0) { // 파일첨부가 있을 경우 
      
		// 첨부한 파일의 총합의 크기가 10MB 이상 이라면 메일 전송을 하지 못하게 막는다.
   	  	let sum_file_size = 0;
     	for(let i=0; i<file_arr.length; i++) {
     		sum_file_size += file_arr[i].size;
     	}// end of for---------------
            
		if( sum_file_size >= 10*1024*1024 ) { // 첨부한 파일의 총합의 크기가 10MB 이상 이라면 
		    alert("첨부한 파일의 총합의 크기가 10MB 이상이라서 파일을 첨부할 수 없습니다!");
		 return; // 종료
		 
		}else { // formData 속에 첨부파일 넣어주기
			
			file_arr.forEach(function(item){
			       formData.append("file_arr", item);  // 첨부파일 추가하기. // "file_arr" 이 키값이고  item 이 밸류값인데 file_arr 배열속에 저장되어진 배열요소인 파일첨부되어진 파일이 되어진다.
			                                           // 같은 key를 가진 값을 여러 개 넣을 수 있다.(덮어씌워지지 않고 추가가 된다.)
			});
		       
			$.ajax({
				url : "<%=ctxPath%>/approval/updateApprovalFile.gw",
				type : "post",
				data : formData,
				processData:false,  // 파일 전송시 설정 
				contentType:false,  // 파일 전송시 설정 
				dataType:"json",
				success:function(text){
				if(text.isUpdate == true) {
					location.reload()
					}else {
						alert("파일 첨부가 실패했습니다.");
					}
				},
				error: function(request, status, error){
					alert("파일 첨부가 실패했습니다.");
			    }
			});
		}
     }else{
    	 $.ajax({
			url : "<%=ctxPath%>/approval/updateApprovalFile.gw",
			type : "post",
			data : formData,
			processData:false,  // 파일 전송시 설정 
			contentType:false,  // 파일 전송시 설정 
			dataType:"json",
			success:function(text){
			if(text.isUpdate == true) {
				location.reload()
				}else {
					alert("파일 첨부가 실패했습니다.");
				}
			},
			error: function(request, status, error){
				alert("파일 첨부가 실패했습니다.");
		    }
		});
     }
}







////////////////////////////////////////////////////////////
//참조 + 버튼 클릭 시

//참조 + 버튼 클릭 시
function showInputReference(){
	$("input#inputApprovalFourthLine").val('');
	$("input#inputApprovalFourthLine").toggle();
}



///////////////////////////////////////////////////////////
//참조 x 버튼 클릭시
function deleteRefOrIncOrIncR(id){
	
	
	let eId = $(id).attr('id');
	let empId = eId.substring(eId.indexOf('_') +1,eId.length);
	
	if(confirm("삭제하시겠습니까?")){
		
		$.ajax({
			url: "<%=ctxPath%>/approval/del/refOrIncOrIncR.gw",
			data: {"empId": empId, "approvalId": ${requestScope.approvalDetail.approvalId}},
			type: "post",
			async: true,
			dataType:"json",
			success: function(text) {
				if(text.isDelete){
					location.reload()
				}else{
					alert("삭제에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				alert("삭제에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}
	
}





////////////////////////////////////////////////////////////////////////
// 의견 등록

function insertOpinion(){
	if ($("textarea#approvalDocumentComment").val().trim() != ''){
		// 값이 입력되어 있다면
		
		$.ajax({
			url: "<%=ctxPath%>/approval/insertOpinion.gw",
			data: {"opinion": $("textarea#approvalDocumentComment").val().trim(), "approvalId": ${requestScope.approvalDetail.approvalId}},
			type: "post",
			async: true,
			dataType:"json",
			success: function(text) {
				if(text.isInsert){
					location.reload()
				}else{
					alert("등록에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				alert("등록에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}else{
		// 갑이 입력되어있지 않다면
		alert("의견 내용을 입력해주세요")
	}
}


// 의견 삭제
function deleteOpinion(opinionId){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url: "<%=ctxPath%>/approval/deleteOpinion.gw",
			data: {"opinionId": opinionId},
			type: "post",
			async: true,
			dataType:"json",
			success: function(text) {
				if(text.isDelete){
					location.reload()
				}else{
					alert("삭제에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				alert("삭제에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}
	
}






////////////////////////////////////////////////////////////////////////////////
//결재 버튼 클릭시
function showApprovalInsertModal(){
	// 기존 값 초기화
	$("#accept").prop("checked", true);
	changeActionOfApproval(2);
	$("div#layerActionOfApproval").show();
}

// 승인 or 반려 클릭시
function changeActionOfApproval(val){
	if(val == 2){
		// 승인을 클릭하였을 경우
		$("textarea#approvalReasonMessage").attr("placeholder", "의견을 입력하세요.");
		$("textarea#approvalReasonMessage").val('');
		$("p#approvalMessage").html("승인하시겠습니까?");
		$("p#approvalMessage").show();
	}else{
		// 반려를 클릭하였을 경우
		$("textarea#approvalReasonMessage").attr("placeholder", "반려 사유를 입력하세요.");
		$("textarea#approvalReasonMessage").val('');
		$("p#approvalMessage").hide();
	}
}

// 결재 승인 or 반려 버튼 눌렀을 경우
function enterActionOfApproval(){
	
	$.ajax({
		url: "<%=ctxPath%>/approval/updateActionOfApproval.gw",
		data: {"empId": ${sessionScope.loginUser.empId}, 
			"approvalId": ${requestScope.approvalDetail.approvalId},
			"formId" : ${requestScope.approvalDetail.formId},
			"approvalStatus" : $("input[name=approval_value]:checked").val(),
			"opinion" : $("textarea#approvalReasonMessage").val().trim()},
		type: "post",
		async: true,
		dataType:"json",
		success: function(text) {
			if(text.isUpdate){
				location.reload()
			}else{
				alert("등록에 실패하였습니다. 다시 시도해주세요.")
			}
		},
		error: function(request, status, error) {
			alert("등록에 실패하였습니다. 다시 시도해주세요.")
		}
	});
}


// 참조 확인 버튼 눌렀을 경우
function updateRefRead(){
	$.ajax({
		url: "<%=ctxPath%>/approval/updateRefRead.gw",
		data: {"empId": ${sessionScope.loginUser.empId}, "approvalId": ${requestScope.approvalDetail.approvalId}},
		type: "post",
		async: true,
		dataType:"json",
		success: function(text) {
			if(text.isUpdate){
				location.reload()
			}else{
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		},
		error: function(request, status, error) {
			alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
		}
	});
}





///////////////////////////////////////////////////////////////////////////////


/* 결재 + 버튼 눌렀을 경우 팝업 */
function approvalLineSetting(){
	
	$("input#inputApprovalLineSetting").val('');
	
	let html = '';
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '결재'}">
			
			html += `<li class="js-approval-line-setting unsortable" id ="approvalLineSettingEmpId_${procedure.empId}" style="cursor: auto;"><span>${procedure.empName}</span>`
	
				<c:if test="${procedure.status eq '대기'}">
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(approvalLineSettingEmpId_${procedure.empId})"></span>`;
				</c:if>
	
			html += `</li>`;
			
		</c:if>
		
	</c:forEach>
	
	$("ul#sortApprovalLineSetting").html(html);
	
	$("div#layerApprovalLineSetting").show(); 

}



/* 결재 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateApprovalLineSetting(){
	
	 let approvalList = [];
	 let listdata;
	 
	
	 $("li.js-approval-line-setting").each(function(index){
		 let id = $(this).attr('id');
		 let empId = id.substring(id.indexOf('_') +1,id.length);

		 listdata = {"empId" : empId, "sequence" : index+1, "approvalId": ${requestScope.approvalDetail.approvalId}, "procedureType" : 3};
		 approvalList.push(listdata);
	 })
	 
	  
	if(approvalList.length > 0 && approvalList.length <= 7){
		$.ajax({
			url: "<%=ctxPath%>/approval/updateRoundRobinApprovalLineSetting.gw",
			data: JSON.stringify(approvalList),
			type: "post",
			async: true,
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success: function(text) {
				if(text.isSuccess){
					location.reload()
				}else{
					alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}else{
		alert("결재자 수는 한 명 이상 일곱 명 이하로 존재하여야 합니다.")
		location.reload()
	}
}



//////////////////////////////////////////////////////////////////////////////////////////////


/* 합의 + 버튼 눌렀을 경우 팝업 */
function agreeLineSetting(){
	
	$("input#inputAgreeLineSetting").val('');
	
	let html = '';
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '합의'}">
			
			html += `<li class="js-approval-line-setting agreeLine-li unsortable" id ="agreeLineSettingEmpId_${procedure.empId}" style="cursor: auto;"><span>${procedure.empName}</span>`
	
				<c:if test="${procedure.status eq '대기'}">
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(agreeLineSettingEmpId_${procedure.empId})"></span>`;
				</c:if>
	
			html += `</li>`;
			
		</c:if>
		
	</c:forEach>
	
	$("ul#sortAgreeLineSetting").html(html);
	
	$("div#layerAgreeLineSetting").show(); 

}



/* 합의 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateAgreeLineSetting(){
	 let approvalList = [];
	 let listdata;
	 
	
	 $("li.agreeLine-li").each(function(index){
		 let id = $(this).attr('id');
		 let empId = id.substring(id.indexOf('_') +1,id.length);

		 listdata = {"empId" : empId, "sequence" : index+1, "approvalId": ${requestScope.approvalDetail.approvalId}, "procedureType" : 8};
		 approvalList.push(listdata);
	 })
	 
	if(approvalList.length > 0 && approvalList.length <= 6){
		$.ajax({
			url: "<%=ctxPath%>/approval/updateRoundRobinApprovalLineSetting.gw",
			data: JSON.stringify(approvalList),
			type: "post",
			async: true,
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success: function(text) {
				if(text.isSuccess){
					location.reload()
				}else{
					alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}else{
		alert("합의자 수는 한 명 이상 여섯 명 이하로 존재하여야 합니다.")
	}
}



//////////////////////////////////////////////////////////////////////////////////////////////


/* 재무합의 + 버튼 눌렀을 경우 팝업 */
function fiAgreeLineSetting(){
	
	$("input#inputFiAgreeLineSetting").val('');
	
	let html = '';
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '재무합의'}">
			
			html += `<li class="js-approval-line-setting fiAgreeLine-li unsortable" id ="fiAgreeLineSettingEmpId_${procedure.empId}" style="cursor: auto;"><span>${procedure.empName}</span>`
	
				<c:if test="${procedure.status eq '대기'}">
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(fiAgreeLineSettingEmpId_${procedure.empId})"></span>`;
				</c:if>
	
			html += `</li>`;
			
		</c:if>
		
	</c:forEach>
	
	$("ul#sortFiAgreeLineSetting").html(html);
	
	$("div#layerFiAgreeLineSetting").show(); 

}



/* 재무합의 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateFiAgreeLineSetting(){
	
	 let approvalList = [];
	 let listdata;
	 
	
	 $("li.fiAgreeLine-li").each(function(index){
		 let id = $(this).attr('id');
		 let empId = id.substring(id.indexOf('_') +1,id.length);

		 listdata = {"empId" : empId, "sequence" : index+1, "approvalId": ${requestScope.approvalDetail.approvalId}, "procedureType" : 9};
		 approvalList.push(listdata);
	 })
	 
	   
	if(approvalList.length > 0 && approvalList.length <= 4){
		$.ajax({
			url: "<%=ctxPath%>/approval/updateRoundRobinApprovalLineSetting.gw",
			data: JSON.stringify(approvalList),
			type: "post",
			async: true,
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success: function(text) {
				if(text.isSuccess){
					location.reload()
				}else{
					alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}else{
		alert("재무합의자 수는 한 명 이상 네 명 이하로 존재하여야 합니다.")
	}
}







//////////////////////////////////////////////////////////////////////////////////////////////
// 결재 + 버튼_사원명 삭제 버튼 클릭시

// 결재 리스트에서 지우기
function deleteThis(id) {
	$(id).detach();
}


</script>









<div id="contents">
	<div class="content_title">
		<style>
		.content_title .detail_select>button {
		    color: #2985db;
		}
		</style>
			
				<c:if test="${not empty requestScope.isDraftEmp && requestScope.isDraftEmp eq 1}">
					<span class="detail_select">
						<button class="fl" id="cancelApproval" style="font-size: 16px">기안취소</button>
					</span>
				</c:if>
		<div class="setting_box">
			<button type="button" class="hw-icon outlined list_bt" onclick="history.go(-1)" title="목록보기">
				<i class="gi gi-list"></i>
			</button>
		</div>

	</div>

	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box view">
			<div class="approval-wrap write view">
				<h1>품의서</h1>
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
							<td>품의서</td>
							<th scope="row">문서 번호</th>
							<td>${requestScope.approvalDetail.approvalId}</td>
						</tr>
						<tr>
							<th scope="row">기안 부서</th>
							<td>${requestScope.approvalDetail.team}</td>
							<th scope="row">기안자</th>
							<td>${requestScope.approvalDetail.empName}</td>
						</tr>
						<tr>
							<th scope="row">보존 연한</th>
							<td>${requestScope.approvalDetail.preservationYear}년</td>
							<th scope="row">보안 등급</th>
							<td>
								<c:if test="${requestScope.userProcedureType ne 5 && requestScope.userProcedureType ne 6 && requestScope.userProcedureType ne 7}">
									<select name="security_level" class="fl write-select mgl_10 view">

										<c:forEach var="securityVo" items="${requestScope.securityLevelList}">
											<c:if test="${requestScope.approvalDetail.securityId eq securityVo.securityId}">
												<option value="${securityVo.securityId}" selected>${securityVo.securityLevel}등급</option>
											</c:if>


											<c:if test="${requestScope.approvalDetail.securityId ne securityVo.securityId}">
												<option value="${securityVo.securityId}">${securityVo.securityLevel}등급</option>
											</c:if>
										</c:forEach>


									</select>
								</c:if>
								<c:if test="${requestScope.userProcedureType eq 5 || requestScope.userProcedureType eq 6 || requestScope.userProcedureType eq 7}">
									<c:forEach var="securityVo" items="${requestScope.securityLevelList}">
										<c:if test="${requestScope.approvalDetail.securityId eq securityVo.securityId}">
											${securityVo.securityLevel}등급
										</c:if>
									</c:forEach>
								</c:if>

							</td>
						</tr>
						<tr>
							<th scope="row">기안 일시</th>
							<td>${requestScope.approvalDetail.draftDay}</td>
							<th scope="row">완료 일시</th>
							<td>${requestScope.approvalDetail.completeDay}</td>
						</tr>
					</tbody>
				</table>

				<table class="cal_table1 approve-write js-approval-line">
					<caption>결재선</caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="sign">
								<div style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									결재
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 1 || requestScope.userProcedureType eq 3 || requestScope.userProcedureType eq 8 || requestScope.userProcedureType eq 9)}">
										<span class="spr-approval set" title="결재" onclick="approvalLineSetting();"></span>
									</c:if>
								</div>
							</th>
							<td class="sign vt" id="approvalFirstLine">
								<table style="width: 100%; table-layout: fixed">
									<colgroup>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr id="approvalProcedureData_position">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '결재'}">
													<td class="team name">${procedure.positionName}</td>
												</c:if>
											</c:forEach>
										</tr>
										<tr id="approvalProcedureData_stamp">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '결재'}">
													<c:if test="${procedure.status eq '승인'}">
														<td class="stamp">
															<img src="<%=ctxPath%>/resources/image/approval/approval.png" alt="결재">
															<p class="date" title="${procedure.registerDay}">${fn:substring(procedure.registerDay, 0, 10)}</p>
														</td>
													</c:if>
													<c:if test="${procedure.status eq '반려'}">
														<td class="stamp">
															<img src="<%=ctxPath%>/resources/image/approval/return.png" alt="반려">
															<p class="date" title="${procedure.registerDay}">${fn:substring(procedure.registerDay, 0, 10)}</p>
														</td>
													</c:if>

													<c:if test="${procedure.status eq '대기'}">

														<td class="stamp">
															<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && procedure.empId eq sessionScope.loginUser.empId}">
																<span class="bt_left pdt_0 pdb_0">
																	<button type="button" onclick="showApprovalInsertModal()">결재</button>
																</span>
															</c:if>
														</td>

													</c:if>

												</c:if>
											</c:forEach>
										</tr>
										<tr id="approvalProcedureData_empName">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '결재'}">
													<td class="name gt-position-relative approvalEmpId_${procedure.empId}">
														<span class="stamp-step-num" style="">${procedure.sequence}</span>
														${procedure.empName}
													</td>
												</c:if>
											</c:forEach>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="cal_table1 approve-write js-approval-line">
					<caption>합의, 재무 합의</caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 37.62%;">
						<col style="width: 9.02%;">
						<col style="width: 41.27%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="agree">
								<div style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									합의
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 1 || requestScope.userProcedureType eq 3 || requestScope.userProcedureType eq 8 || requestScope.userProcedureType eq 9)}">
										<span class="spr-approval set" title="합의" onclick="agreeLineSetting();"></span>
									</c:if>
								</div>
							</th>
							<td class="agree vt" id="approvalSecondLine">
								<table>
									<colgroup>
										<col style="width: 12.54%;">
										<col style="width: 12.54%;">
									</colgroup>
									<tbody>

										<c:if test="${fn:length(requestScope.agreeList) >= 3}">
											<c:set var="cnt" value="0" />
											<c:forEach var="i" begin="0" end="2">
												<tr>
													<c:forEach var="j" begin="0" end="1">
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeEmpId_${requestScope.agreeList[cnt].empId}">
															<span class="stamp-step-num" style="">${requestScope.agreeList[cnt].sequence}</span>
															<span class="">${requestScope.agreeList[cnt].empName}</span>

															<c:if test="${requestScope.agreeList[cnt].status eq '승인'}">
																<img src="<%=ctxPath%>/resources/image/approval/approval.png" style="width: 25px; height: 25px" alt="승인" title="${requestScope.agreeList[cnt].registerDay}" class="gt-vertical-middle">

															</c:if>
															<c:if test="${requestScope.agreeList[cnt].status eq '반려'}">
																<img src="<%=ctxPath%>/resources/image/approval/return.png" style="width: 25px; height: 25px" alt="반려" title="${requestScope.agreeList[cnt].registerDay}" class="gt-vertical-middle">

															</c:if>
															<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && requestScope.agreeList[cnt].status eq '대기'}">
																<c:if test="${requestScope.agreeList[cnt].empId eq sessionScope.loginUser.empId}">
																	<span class="bt_left pdt_0 pdb_0">
																		<button type="button" class="small-button">결재</button>
																	</span>
																</c:if>
															</c:if>
														</td>

														<c:set var="cnt" value="${cnt + 1}" />

													</c:forEach>
												</tr>
											</c:forEach>
										</c:if>


										<c:if test="${fn:length(requestScope.agreeList) < 3}">
											<c:forEach var="procedure" items="${requestScope.agreeList}" varStatus="status">
												<tr>
													<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeEmpId_${procedure.empId}">
														<span class="stamp-step-num" style="">${procedure.sequence}</span>
														<span class="">${procedure.empName}</span>
														<c:if test="${procedure.status eq '승인'}">
															<img src="<%=ctxPath%>/resources/image/approval/approval.png" style="width: 25px; height: 25px" alt="승인" title="${procedure.registerDay}" class="gt-vertical-middle">

														</c:if>
														<c:if test="${procedure.status eq '반려'}">
															<img src="<%=ctxPath%>/resources/image/approval/return.png" style="width: 25px; height: 25px" alt="승인" title="${procedure.registerDay}" class="gt-vertical-middle">

														</c:if>
														<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && procedure.status eq '대기'}">
															<c:if test="${procedure.empId eq sessionScope.loginUser.empId}">
																<span class="bt_left pdt_0 pdb_0">
																	<button type="button" class="small-button" onclick="showApprovalInsertModal()">결재</button>
																</span>
															</c:if>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
							</td>
							<th scope="row" class="confer">
								<div class="choice" style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									재무 합의
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 1 || requestScope.userProcedureType eq 3 || requestScope.userProcedureType eq 8 || requestScope.userProcedureType eq 9)}">
										<span class="spr-approval set" title="재무합의" onclick="fiAgreeLineSetting();"></span>
									</c:if>
								</div>
							</th>
							<td class="confer vt" id="approvalThirdLine">
								<table style="height: 163px;">
									<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									</colgroup>
									<tbody>
										<tr id="fiAgreeProcedureData_position">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '재무합의'}">
													<td class="team name">${procedure.positionName}</td>
												</c:if>
											</c:forEach>
										</tr>

										<tr id="fiAgreeProcedureData_stamp">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '재무합의'}">
													<c:if test="${procedure.status eq '승인'}">
														<td class="stamp">
															<img src="<%=ctxPath%>/resources/image/approval/approval.png" alt="결재">
															<p class="date" title="${procedure.registerDay}">${fn:substring(procedure.registerDay, 0, 10)}</p>
														</td>
													</c:if>
													<c:if test="${procedure.status eq '반려'}">
														<td class="stamp">
															<img src="<%=ctxPath%>/resources/image/approval/return.png" alt="반려">
															<p class="date" title="${procedure.registerDay}">${fn:substring(procedure.registerDay, 0, 10)}</p>
														</td>
													</c:if>

													<c:if test="${procedure.status eq '대기'}">

														<td class="stamp">
															<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && procedure.empId eq sessionScope.loginUser.empId}">
																<span class="bt_left pdt_0 pdb_0">
																	<button type="button" onclick="showApprovalInsertModal()">결재</button>
																</span>
															</c:if>
														</td>

													</c:if>

												</c:if>
											</c:forEach>
										</tr>
										<tr id="fiAgreeProcedureData_empName">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '재무합의'}">
													<td class="name gt-position-relative fiAgreeEmpId_${procedure.empId}">
														<span class="stamp-step-num" style="">${procedure.sequence}</span>
														${procedure.empName}
													</td>
												</c:if>
											</c:forEach>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="cal_table1 approve-write refer js-approval-line">
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="choice" style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									참조
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 1 || requestScope.userProcedureType eq 3 || requestScope.userProcedureType eq 8 || requestScope.userProcedureType eq 9)}">
										<span class="spr-approval set" title="참조" onclick="showInputReference()"></span>
									</c:if>
								</div>
							</th>
							<td id="approvalFourthLine">
								<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFourthLine" style="display: none;" approval_type="F" autocomplete="off">

								<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
									<c:if test="${procedure.procedureType eq '참조'}">

										<c:if test="${procedure.status eq '확인'}">
											<span class="refer-list" id="referEmpId_${procedure.empId}">
												${procedure.empName}
												<img src="<%= ctxPath %>/resources/image/approval/readCheck.png" alt="확인" title="${procedure.registerDay}" class="vm js-approval-confirm-check">
											</span>
										</c:if>

										<c:if test="${procedure.status eq '미확인'}">
											<span class="refer-list" id="referEmpId_${procedure.empId}">
												${procedure.empName}
												<c:if test="${requestScope.userProcedureType eq 1 || requestScope.userProcedureType eq 3 || requestScope.userProcedureType eq 8 || requestScope.userProcedureType eq 9}">
													<span class="icon file_delete js-approval-line-delete" onclick="deleteRefOrIncOrIncR(referEmpId_${procedure.empId})" style="display: inline-block;"></span>
												</c:if>

												<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && procedure.empId eq sessionScope.loginUser.empId}">
													<span class="bt_left pdt_0 pdb_0 mgl_5">
														<button type="button" class="small-button" onclick="updateRefRead();">확인</button>
													</span>

												</c:if>
											</span>
										</c:if>

									</c:if>
								</c:forEach>

							</td>
						</tr>
					</tbody>
				</table>

				<div class="docu-common-wrap">
					<h2>
						<c:if test="${requestScope.viewType eq 'box'}">
							<c:if test="${requestScope.approvalDetail.isImportant eq 1}">
								<button type="button" class="icon impt on" style="top: 57px;">
									<span class="blind"></span>
								</button>
							</c:if>
							<c:if test="${requestScope.approvalDetail.isImportant eq 0}">
								<button type="button" class="icon impt" style="top: 57px;">
									<span class="blind"></span>
								</button>
							</c:if>
						</c:if>
						<span class="point_color"> </span>
						${requestScope.approvalDetail.title}
					</h2>
					<div class="contents after">
						<div class="se-contents" style="box-sizing: content-box; font-family: &amp; amp; amp; amp; quot; 맑은 고딕&amp;amp; amp; amp; quot;; font-size: 16px; line-height: 1.6; margin: 0px;" data-document-padding-top="18" data-document-padding-left="23" data-document-padding-right="23">
							<p style="margin: 0px; display: block; overflow-wrap: break-word;">
								<span>${requestScope.approvalDetail.content}</span>
							</p>
						</div>
					</div>

					<div class="file after">
						<div class="top">
							<span class="body-color mgr_20">별첨</span>
							<button type="button" class="addfile" id="showFileModal">파일 첨부</button>
						</div>
						<div class="filebox">
							<c:forEach var="approvalFileVo" items="${requestScope.approvalDetail.fvo}">
								<!-- 파일첨부 -->
								<span class="cont_file" style="float: left;">
									<%-- <img src="${approvalFileVo.fileName}" style="width:20px"> --%>
									<a href="<%= ctxPath%>/approval/fileDownload.gw?fileId=${approvalFileVo.approvalFileId}">${approvalFileVo.fileRName}</a>
									(<fmt:formatNumber value="${approvalFileVo.fileSize}" pattern="0.000"/>MB)
									<button type="button" class="icon file_delete" onclick="deleteSavedFile(${approvalFileVo.approvalFileId})">
										<span class="blind"></span>
									</button>
								</span>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>

			<!-- 의견 -->
			<c:if test="${requestScope.userProcedureType ne 6 && requestScope.userProcedureType ne 7}">

				<div class="approval-comment-tab" id="approvalCommentsTab">
					<a href="javascript:void(0)" class="gt-nav-item gt-active approval-comments-tab1" data-id="tab1-1">의견</a>
				</div>


				<div id="divApprovalComments" class="approval-comment approval" style="display: block;">
					<p class="top number_comments">
						<span class="point_color bold" id="approvalCommentsCount">${fn:length(requestScope.opinionList)}</span>
						개의 의견
					</p>
					<ul id="approvalComments">

						<c:forEach var="opinionVo" items="${requestScope.opinionList}">
							<li>
								<div class="profile">
									<img class="myphoto" src="<%= ctxPath %>/resources/image/icon/defaultProfile.png" alt="">
								</div>
								<div class="txt">
									<div class="hidden after">
										<p class="name bold">${opinionVo.empName}</p>
										<p class="date">${opinionVo.registerDay}</p>
										<c:if test="${sessionScope.loginUser.empId eq opinionVo.empId}">
											<span class="icon btn_del_comment" style="cursor: pointer;" onclick="deleteOpinion(${opinionVo.opinionId})"></span>
										</c:if>
									</div>
									<p>${opinionVo.content}</p>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="comment_write">
						<label for="commentInput" class="blind">댓글 입력란</label>
						<textarea id="approvalDocumentComment" placeholder="댓글을 남겨주세요." title="댓글을 남겨주세요." class="comment-texarea" style="overflow: hidden; overflow-wrap: break-word; height: 36px;"></textarea>
						<button type="button" class="bt_left" onclick="insertOpinion()">등록</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>