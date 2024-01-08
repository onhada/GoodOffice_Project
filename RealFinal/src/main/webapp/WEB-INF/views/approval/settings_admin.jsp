<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>



<script>



$(document).ready(function() {
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 관리자 추가 입력시
	
	let prev_autoComplete = $("ul.admin_autocomplete").html();
	$(document).on("focus", "input#inputApprovalManager", function(){
		
		if($("input#inputApprovalManager").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalManager").val())
			
			$.ajax({
				url: "<%= ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalManager").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addAdminEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
					}
					
					if(text.length > 0){
						
						$("ul.admin_autocomplete").css({
							'top': '255px',
							'left': '316px',
							'width': '180px'
						});
						
						$("ul.admin_autocomplete").html(html);
						$("ul.admin_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.admin_autocomplete").show();
						
					}else{
						$("ul.admin_autocomplete").html(prev_autoComplete);
						$("ul.admin_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
				}
			});
		}else{
			$("ul.admin_autocomplete").html(prev_autoComplete);
			$("ul.admin_autocomplete").hide();
		}
		
	});
	
	$(document).on("keyup", "input#inputApprovalManager", function(){
		
		if($("input#inputApprovalManager").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalManager").val())
			
			$.ajax({
				url: "<%= ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalManager").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addAdminEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.admin_autocomplete").css({
							'top': '255px',
							'left': '316px',
							'width': '180px'
						});
						$("ul.admin_autocomplete").html(html);
						$("ul.admin_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.admin_autocomplete").show();
						
					}else{
						$("ul.admin_autocomplete").html(prev_autoComplete);
						$("ul.admin_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
				}
			});
		}else{
			$("ul.admin_autocomplete").html(prev_autoComplete);
			$("ul.admin_autocomplete").hide();
		}
		
	})
	
	// 입력하다가 다른 거 선택했을경우
	$(document).on("focusout", "input#inputApprovalManager", function(){
		$("ul.admin_autocomplete").html(prev_autoComplete);
		$("ul.admin_autocomplete").hide();
	}) 
	
	// 드롭다운 리스트에서 선택했을 경우
	$(document).on("mousedown", "ul.admin_autocomplete li", function() {
		
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		
		let isExist = false;
		
		<c:forEach var="adminVo" items="${requestScope.adminList}">
			if(${adminVo.empId} == empId){
				console.log("hi", ${adminVo.empId});
				isExist = true;
				
			}
		</c:forEach>
		
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 관리자는 중복으로 설정할 수 없습니다.")
			$("input#inputApprovalManager").val('');
			
		}else{
			
			if(confirm("추가하시겠습니까?")){
				// yes일 경우
				$("ul.admin_autocomplete").html(prev_autoComplete);
				$("ul.admin_autocomplete").hide();
				
				//ajax
				$.ajax({
					url: "<%= ctxPath%>/approval/addApprovalAdminManager.gw",
					data: { "empId": empId },
					type: "post",
					async: true,
					dataType: "json",
					success: function(text) {
						console.log(JSON.stringify(text));
						if(text.isAdd){
							$(location).attr('href', `<%= ctxPath %>/approval/settings/admin.gw`);
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
	
	
	
	$("input[name='checkRead']").change(function(){
		if($(this).is(':checked')){
			console.log("체크했쪄요")
			
			// 체크 하였을 경우
			if(confirm("열람 권한을 부여하시겠습니까?")){
				// yes일 경우
				
				//ajax
				$.ajax({
					url: "<%= ctxPath%>/approval/grantAdminRead.gw",
					data: { "adminId": $(this).val(), "isReadAble" : 1 },
					type: "post",
					async: true,
					dataType: "json",
					success: function(text) {
						console.log(JSON.stringify(text));
						if(text.isUpdate){
							$(location).attr('href', `<%= ctxPath %>/approval/settings/admin.gw`);
							alert("열람권한이 부여되었습니다.")
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
			console.log("체크해제")
			
			// 체크해제 하였을 경우
			if(confirm("열람 권한을 해제하시겠습니까?")){
				// yes일 경우
				
				//ajax
				$.ajax({
					url: "<%= ctxPath%>/approval/grantAdminRead.gw",
					data: { "adminId": $(this).val(), "isReadAble" : 0 },
					type: "post",
					async: true,
					dataType: "json",
					success: function(text) {
						console.log(JSON.stringify(text));
						if(text.isUpdate){
							$(location).attr('href', `<%= ctxPath %>/approval/settings/admin.gw`);
							alert("열람권한이 해제되었습니다.")
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
		
	
	
	
	
	
	
	
	
})

function addAdminManager(){
	$("tr.addAdminManager").show();
}

function deleteAdmin(adminId){
	if(confirm("삭제하시겠습니까?")){
		// yes일 경우
		
		//ajax
		$.ajax({
			url: "<%= ctxPath%>/approval/deleteApprovalAdminManager.gw",
			data: { "adminId": adminId },
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isDelete){
					$(location).attr('href', `<%= ctxPath %>/approval/settings/admin.gw`);
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



function showSettingHistory(){

	//ajax
	$.ajax({
		url: "<%= ctxPath%>/approval/getAdminHistory.gw",
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			console.log(JSON.stringify(text));
			
			let html = '';
			for(let i = 0 ; i < text.length ; i++){
				html += `<tr>
							<td class="gt-text-center">
								<div class="padding-10">` + text[i]['registerDay'] + `</div>
							</td>
							<td class="text-left">
								<div class="padding-10">`;
				
				if(text[i]['registerType'] == 1){
					// 등록
					html += text[i]['empName'] + `(` + text[i]['id'] + `)의 전자결재 관리자 권한이 부여되었습니다.`;
				}else{
					// 삭제
					html += text[i]['empName'] + `(` + text[i]['id'] + `)의 전자결재 관리자 권한이 해제되었습니다.`;
				}
				
				html += `</div>
							</td>
							<td class="text-left">
								<div class="padding-10">`;
				
				html += text[i]['registerEmpName'] + `(` + text[i]['registerId'] + `)</div>
							</td>
						</tr>`;
			}
			
			$("div#layerApprovalManagerHistory tbody").html(html);
			$("div#layerApprovalManagerHistory").show();
		},
		error: function(request, status, error) {
			alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
		}
	});
	
	
	
	
}


</script>


<div id="contents">
	<div class="setting_title">
		<h3 class="fl">전자결재 관리자</h3>
	</div>
	<div class="content_inbox approval-admin">
		<div class="cont_box">
			<div class="setting_field approval">
				<p>
					<button class="weakblue mgb_10" onclick="addAdminManager()">+ 관리자추가</button>
					<button type="button" onclick="showSettingHistory()" class="approval-manager-button ml-16 xs">설정이력</button>
				</p>
				<table class="tableType01 listbox mgb_10" id="tableApprovalManager">
					<caption>관리자 리스트</caption>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: 150px;">
						<col>
						<col style="width: 150px;">
						<c:if test="${sessionScope.loginUser.adminType eq 'All'}">
								<col style="width: 180px;">
						</c:if>
						
						<col style="width: 120px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">이름</th>
							<th scope="col">아이디</th>
							<th scope="col">소속</th>
							<th scope="col">등록일</th>
							<c:if test="${sessionScope.loginUser.adminType eq 'All'}">
								<th scope="col">전체 문서 열람</th>
							</c:if>
							<th scope="col"></th>
						</tr>

						<!-- 관리자 추가 버튼 클릭시 -->
						<tr class="addAdminManager" style="display:none">
							<td colspan="6" class="input-admin-name">
								<label>
									<input type="text" class="js-complete ui-autocomplete-input" id="inputApprovalManager" placeholder="관리자 이름" title="관리자 이름" autocomplete="off">
								</label>
							</td>
						</tr>

						<c:if test="${not empty requestScope.adminList}">
							<!-- c:for -->

							<c:forEach var="adminVo" items="${requestScope.adminList}">
								<tr>
									<td>${adminVo.empName}</td>
									<td>${adminVo.id}</td>
									<td class="title">
										<div title="${adminVo.team}">${adminVo.team}</div>
									</td>
									<td class="center">${adminVo.registerDay}</td>
									
									<c:if test="${sessionScope.loginUser.adminType eq 'All'}">
										<c:if test="${adminVo.isReadAllDocument eq '1'}">
											<td>
												<label>
													<input type="checkbox" name="checkRead" value = "${adminVo.adminId}" checked>
													허용
												</label>
											</td>
										</c:if>
										
										<c:if test="${adminVo.isReadAllDocument eq '0'}">
											<td>
												<label>
													<input type="checkbox" name="checkRead" value = "${adminVo.adminId}">
													허용
												</label>
											</td>
										</c:if>
									</c:if>




									<c:if test="${adminVo.isFullAdmin eq '1'}">
										<td class="center">전체 관리자</td>
									</c:if>

									<c:if test="${adminVo.isFullAdmin eq '0'}">
										<td class="center">
											<button type="button" class="cursor weakblue" onclick="deleteAdmin(${adminVo.adminId})">삭제</button>
										</td>
									</c:if>
								</tr>

							</c:forEach>
						</c:if>

					</thead>
					<tbody>
					</tbody>
				</table>

				<p style="margin-bottom: 30px">
					관리자 수 :
					<span id="countApprovalManager">${fn:length(adminList)}</span>
				</p>
			</div>
		</div>
	</div>
</div>