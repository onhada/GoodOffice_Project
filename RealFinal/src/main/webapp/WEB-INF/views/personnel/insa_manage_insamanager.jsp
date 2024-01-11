<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/style_tutorial.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/style_approval.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/new_lnb.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/contentsEditStyle.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/characterPicker.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/codemirror.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/editor_custom.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/synapeditor.min.css">
<!-- 예인추가 -->
<%-- <link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/approval/approval.css"> --%>


<script>



$(document).ready(function() {
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 관리자 추가 입력시
	
	let prev_autoComplete = $("ul.admin_autocomplete").html();
	$(document).on("focus", "input#inputPersonnelManager", function(){
		
		if($("input#inputPersonnelManager").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputPersonnelManager").val())
			
			$.ajax({
				url: "<%= ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputPersonnelManager").val().trim()},
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
	
	$(document).on("keyup", "input#inputPersonnelManager", function(){
		
		if($("input#inputPersonnelManager").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputPersonnelManager").val())
			
			$.ajax({
				url: "<%= ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputPersonnelManager").val().trim()},
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
	$(document).on("focusout", "input#inputPersonnelManager", function(){
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
			$("input#inputPersonnelManager").val('');
			
		}else{
			
			if(confirm("추가하시겠습니까?")){
				// yes일 경우
				$("ul.admin_autocomplete").html(prev_autoComplete);
				$("ul.admin_autocomplete").hide();
				
				
				
				// 다른 기능의 관리자인지 먼저 확인한다
				// 다른 기능의 관리자라면 추가하지 않는다
				
				let isAlreadyAdmin = false;
				
				$.ajax({
					url: "<%= ctxPath%>/approval/isAlreadyAdmin.gw",
					data: { "empId": empId },
					type: "post",
					async: false,
					dataType: "json",
					success: function(text) {
						console.log(JSON.stringify(text));
						if(text.isExist){
							alert("다른 기능의 관리자 입니다. 삭제 후 시도하여 주세요.")
							isAlreadyAdmin = true;
						}
					},
					error: function(request, status, error) {
						alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
					}
				});
				
				
				if(!isAlreadyAdmin){
					// 다른 기능의 관리자가 아닐 경우
					
					//ajax
					$.ajax({
						url: "<%= ctxPath%>/personnel/addPersonnelAdminManager.gw",
						data: { "empId": empId },
						type: "post",
						async: true,
						dataType: "json",
						success: function(text) {
							console.log(JSON.stringify(text));
							if(text.isAdd){
								$(location).attr('href', `<%= ctxPath %>/personnel/insaManager.gw`);
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
		}
	})
	
	
	
	
	
	
	
	
	
	
	
})

function addAdminManager(){
	$("tr.addAdminManager").show();
}

function deleteAdmin(adminId){
	if(confirm("삭제하시겠습니까?")){
		// yes일 경우
		
		//ajax
		$.ajax({
			url: "<%= ctxPath%>/personnel/deletePersonnelAdminManager.gw",
			data: { "adminId": adminId },
			type: "post",
			async: true,
			dataType: "json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isDelete){
					$(location).attr('href', `<%= ctxPath %>/personnel/insaManager.gw`);
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
	console.log('보여집니다')
	$("div#layerPersonnelManagerHistory").show();
	//ajax
	 $.ajax({
		url: "<%= ctxPath%>/personnel/getAdminHistory.gw",
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
					html += text[i]['empName'] + `(` + text[i]['id'] + `)의 인사 관리자 권한이 부여되었습니다.`;
				}else{
					// 삭제
					html += text[i]['empName'] + `(` + text[i]['id'] + `)의 인사 관리자 권한이 해제되었습니다.`;
				}
				
				html += `</div>
							</td>
							<td class="text-left">
								<div class="padding-10">`;
				
				html += text[i]['registerEmpName'] + `(` + text[i]['registerId'] + `)</div>
							</td>
						</tr>`;
			}
			
			$("div#layerPersonnelManagerHistory tbody").html(html);
			$("div#layerPersonnelManagerHistory").show();
		},
		error: function(request, status, error) {
			alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
		}
	}); 
	
	
	
	
}


</script>


<div id="contents">
	<div class="setting_title" style="height: 60px;">
		<h3 class="fl">인사 관리자</h3>
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
						<col style="width: 150px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">이름</th>
							<th scope="col">아이디</th>
							<th scope="col">소속</th>
							<th scope="col">등록일</th>
							<th scope="col"></th>
						</tr>

						<!-- 관리자 추가 버튼 클릭시 -->
						<tr class="addAdminManager" style="display:none">
							<td colspan="6" class="input-admin-name">
								<label>
									<input type="text" class="js-complete ui-autocomplete-input" id="inputPersonnelManager" placeholder="관리자 이름" title="관리자 이름" autocomplete="off">
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