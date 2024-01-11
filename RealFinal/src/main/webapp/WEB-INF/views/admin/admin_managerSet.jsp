<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>
<script>

$(document).ready(function(){
	$("input#keyword").keyup(function(key){
		if(key.keyCode == 13) {
			$(location).attr('href','?searchWord='+ $("input#keyword").val().trim());
		}     
	});
	
	
	
	
	var addAdminList = new Array();
	
	var delAdminList = new Array();
	
	
	$("img.insertFullAdmin").click(function(){
		
		console.log("등록!!!!")
		
		if($("select#searchList").val() == ''){
			// 사원을 선택하지 않았을 경우
			alert("선택된 사원이 없습니다.")
		}else{
			
			if($("select#managerList option").length == 5){
				alert("전체 관리자 수는 최대 다섯명까지 가능합니다.")
			}else{
				// 사원 지우고 전체 관리자에 넣기
				
				
				if($("select#searchList option:selected").hasClass('empId')){
					// 기존 전체 관리자가 아님으로 등록
					
					//새로 넣을 사원
					addAdminList.push($("select#searchList option:selected").val());
				}
				
				
				$("select#managerList").append($("select#searchList option:selected").clone().wrapAll("<div />").parent().html());
				$("select#searchList option:selected").detach();
			}
			
		}
	})
	
	
	
	
	
	$("img.deleteFullAdmin").click(function(){
		
		console.log("삭제!!!!")
		
		if($("select#managerList").val() == ''){
			// 사원을 선택하지 않았을 경우
			alert("선택된 사원이 없습니다.")
		}else{
			
			// 전체 관리자 수 확인하고 지우기
			if($("select#managerList option").length > 1){
				// 전체 관리자에서 지우고 사원에 넣기
				
				
				if($("select#managerList option:selected").hasClass('adminId')){
					// 기존 전체 관리자임으로 등록
					
					// 지울 사원
					delAdminList.push($("select#managerList option:selected").val());
				}
				
				if($("select#managerList option:selected").hasClass('empId')){
					// 관리자 지우기
					
					const index = addAdminList.indexOf($("select#managerList option:selected").val());
					if (index !== -1) {
						addAdminList.splice(index, 1);
					}
				}
				
				$("select#searchList").append($("select#managerList option:selected").clone().wrapAll("<div />").parent().html());
				$("select#managerList option:selected").detach();
			}else{
				alert("전체 관리자 사원은 한 명 이상 다섯 명 이하여야 합니다.")
			}
			
			
		}
	})
	
	
	// 전체 관리자 확정	
	$("img.confirmFullAdmin").click(function(){
		
		
		for(let i = 0; i < addAdminList.length ; i++){
			console.log("add : ", addAdminList[i]);
		}
		
		for(let i = 0; i < delAdminList.length ; i++){
			console.log("del : ", delAdminList[i]);
		}
		
		
		$.ajax({
			url: "<%=ctxPath%>/approval/confirmFullAdmin.gw",
			data: { "addAdminList": addAdminList,
					"delAdminList" : delAdminList},
			type: "post",
			traditional: true,
			async: true,
			dataType: "json",
			success: function(text) {
				if(text.isUpdate){
					location.reload();
				}else{
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			},
			error: function(request, status, error) {
				alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
			}
		});
	})
	
})


function searchUser(){
	$(location).attr('href','?searchWord='+ $("input#keyword").val().trim());
}








</script>


<div id="contents">
	<div class="setting_title">
		<h3>관리자 설정</h3>
	</div>
	<div class="content_inbox">
		<div class="cont_box">
			<div class="setting_field office-api--page office-newmanage--page">
				<div class="office-manage-tab gt-tab" id="officeManageTab">
					<div class="office-manage-tab gt-tab" id="officeManageTab">
						<div class="gt-tab-nav gt-mb-30">
							<a href="수정필" target="_self" class="gt-nav-item gt-active">전체 관리자</a>
							<a href=수정필" target="_blank" class="gt-nav-item ">인사 관리자</a>
							<a href="<%=ctxPath %>/approval/settings/admin.gw" target="_blank" class="gt-nav-item ">전자결재 관리자</a>
							<a href="수정필" target="_blank" class="gt-nav-item ">예약 관리자</a>
						</div>
					</div>
					<!-- content -->
					<div id="outline" class="place1">
						<div id="df_container" class="place1">
							<div class="clearDiv"></div>
							<table class="outline_table" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td style="width: 100%; vertical-align: top;">
											<div id="df_content" class="place1">
												<!-- start content -->
												<div id="requestList">
													<table cellspacing="0" cellpadding="0" class="basic_info_table">
														<tbody>
															<tr>
																<td>
																	<div id="managerSetting">
																		<div class="setting_content">
																			<h3>이름 / 아이디 검색</h3>
																			<input type="text" id="keyword" class="keyword">
																			<img src="<%= ctxPath %>/resources/image/admin/btn_sear.gif" style="cursor: pointer; float: left;" onclick="searchUser()">
																			<select id="searchList" size="15">
																				<c:forEach var="employeeVo" items="${requestScope.noneFullAdminList}">
																					<option class="empId" value="${employeeVo.empId}">${employeeVo.empName} (${employeeVo.id}) - ${employeeVo.team}</option>
																				</c:forEach>
																			</select>
																			<p></p>
																		</div>
																		<div id="selectButton">
																			<img src="<%= ctxPath %>/resources/image/admin/lyr_select_btn.gif" class="insertFullAdmin" style="margin: 25px 2px 2px 2px; cursor: pointer;">
																			<img src="<%= ctxPath %>/resources/image/admin/lyr_del_btn.gif" class="deleteFullAdmin" style="margin: 2px; cursor: pointer;">
																		</div>
																		<div class="setting_content">
																			<h3 class="blue">전체 관리자 (최대 5명)</h3>
																			<select id="managerList" size="3">
																				<c:forEach var="adminVo" items="${requestScope.fullAdminList}">
																					<option class="adminId" value="${adminVo.adminId}">${adminVo.empName} (${adminVo.id}) - ${adminVo.team}</option>
																				</c:forEach>
																			</select>
																			<img src="<%= ctxPath %>/resources/image/admin/btn_confirm.gif" class="confirmFullAdmin" style="float: right; margin: 5px 0px; padding: 0px; display: inline; cursor: pointer;">

																			<table cellspacing="0" cellpadding="0" class="guideTable">
																				<tbody>
																					<tr>
																						<td style="height: 5px; width: 5px;">
																							<img height="5" width="5" class="backimg" src="./aaaaaaa_files/round1_01.gif">
																						</td>
																						<td style="height: 5px; width: auto; background: url(/static/images/common/bg/round1_02.gif) repeat-x left top;"></td>
																						<td style="height: 5px; width: 5px;">
																							<img height="5" width="5" class="backimg" src="./aaaaaaa_files/round1_03.gif">
																						</td>
																					</tr>
																					<tr>
																						<td style="width: 5px; background: url(/static/images/common/bg/round1_08.gif) repeat-y left top;"></td>
																						<td style="background-color: #f9f9f9; width: auto;">
																							<h4>이용안내</h4>
																							<ul class="guide">
																								<li class="guideLi">
																									[선택]버튼으로 사용자를 지정한 후,
																									<span class="orange">[확인] 버튼을 클릭</span>
																									하시기 바랍니다.
																								</li>
																								<li class="guideLi">
																									전체 관리자는
																									<span class="orange">최대 5명까지</span>
																									지정할 수 있습니다. (단, 최소 1명은 지정되어야 합니다.)
																								</li>
																							</ul>
																						</td>
																						<td style="width: 5px; background: url(/static/images/common/bg/round1_04.gif) repeat-y left top;"></td>
																					</tr>
																					<tr>
																						<td style="height: 5px; width: 5px; background: url(/static/images/common/bg/round1_07.gif) no-repeat left bottom;"></td>
																						<td style="height: 5px; width: auto; background: url(/static/images/common/bg/round1_06.gif) repeat-x left bottom;"></td>
																						<td style="height: 5px; width: 5px; background: url(/static/images/common/bg/round1_05.gif) no-repeat left bottom;"></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>

												<!-- end_content -->
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="clearDiv"></div>
						</div>
						<div class="minWidth"></div>
						<div class="clearDiv"></div>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>