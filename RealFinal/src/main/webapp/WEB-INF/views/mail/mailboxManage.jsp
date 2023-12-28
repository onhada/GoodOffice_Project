<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>



<script type="text/javascript">

	$(document).ready(function() {
	
		
		
	});
	
	
	// Function Declaration
	
	// ===== 개인편지함 만들기 ===== //
	function makePersonalMailbox(){
		$.ajax({
        	url : "<%=ctxPath%>/mail/makePersonalMailbox.gw",
			type : "post",
			data : { "personalMailboxTypeName" : $("input[id='newPersonalMailboxName']").val() },
			dataType : "json",
			async : false,
			success : function(json) {
			 	if(json.n == 1) {
					alert("개인편지함을 추가했습니다.");
					window.location.reload();
				}
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	}// end of function makePersonalMailbox()------------

	
	// ===== 개인편지함 삭제하기 ===== //
	function deletePersonalMailbox(personalMailboxTypeId){	
		if (confirm("삭제 시 복구할 수 없습니다. \n메일을 모두 삭제하시겠습니까?") == true){ 
			$.ajax({
	        	url : "<%=ctxPath%>/mail/deletePersonalMailbox.gw",
				type : "post",
				data : { "personalMailboxTypeId" : personalMailboxTypeId },
				dataType : "json",
				async : false,
				success : function(json) {
					if (json.n != 0) {
						alert("개인편지함을 삭제했습니다.");
						window.location.reload();
					}
				},
				error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
				}
			});
		}
	}// end of function deletePersonalMailbox(personalMailboxTypeId)----------------
	
	
	// ===== 편지함 비우기 ===== //
	function emptyMailbox(mailType, personalMailboxId){
		console.log("mailType : " + mailType);
		console.log("personalMailboxId : " + personalMailboxId);
		if (confirm("편지함을 비우면 삭제된 메일을 복구할 수 없습니다. \n비우시겠습니까?") == true){ 
			$.ajax({
	        	url : "<%=ctxPath%>/mail/emptyMailbox.gw",
				type : "post",
				data : { "mailType" : mailType,
						 "personalMailboxId" : personalMailboxId },
				dataType : "json",
				async : false,
				success : function(json) {
					if (json.n == 1) {
						alert("편지함을 비웠습니다.");
						window.location.reload();
					}
					else if(json.n == 0){
						alert("편지함에 메일이 존재하지 않습니다.");
						window.location.reload();
					}
				},
				error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
				}
			});
		}
	}// end of function emptyMailbox(mailType)-----------
	
	
</script>




<div id="contents">
<!-- 
	<input type="hidden" id="hid_empty_space_m" value="9999">
	<input type="hidden" id="hid_mail_limit_type" value="U">
 -->

	<div class="setting_title">
		<h3>편지함 관리</h3>
	</div>
	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box">
			<div class="setting_field">
			
				<ul class="set_note">
					<li>• 편지함 비우기를 할 수 있습니다.</li>
					<li>• 사용자는 개인 편지함을 설정할 수 있습니다.</li>
				</ul>
				
				<div class="table_top">
					<div class="right">
						<input type="text" id="newPersonalMailboxName" placeholder="새 편지함" onkeydown="if(event.keyCode == 13) makePersonalMailbox();">
						<label for="newLetterbox" class="blind">새 편지함 만들기</label>
						<a href="javascript:void(0);" onclick="makePersonalMailbox();" class="weakblue">만들기</a>
					</div>
				</div>

				<table class="tableType01 mgt_10" id="tMboxList">
					<caption>편지함 목록으로 편지함, 편지수로 구성되어 있습니다.</caption>
					<colgroup>
						<col width="13%">
						<col width="13%">
						<col width="45%">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">&nbsp;편지함</th>
							<th scope="row" class="ta_r">편지 수</th>
							<th scope="row"></th>
						</tr>
						<tr mbox_no="b0" mbox_name="받은 편지함">
							<td>받은 편지함</td>
							<td class="ta_r">0 / 1</td>
							<td>
								<a href="javascript:void(0);" class="weakblue" onclick="emptyMailbox('1')">비우기</a>
							</td>
						</tr>
						<tr mbox_no="b1" mbox_name="보낸 편지함">
							<td>보낸 편지함</td>
							<td class="ta_r">0 / 3</td>
							<td>
								<a href="javascript:void(0);" class="weakblue" onclick="emptyMailbox('2')">비우기</a>
							</td>
						</tr>
						<tr mbox_no="b2" mbox_name="보낼 편지함">
							<td>보낼 편지함</td>
							<td class="ta_r">0 / 1</td>
							<td>
								<a href="javascript:void(0);" class="weakblue" onclick="emptyMailbox('3')">비우기</a>
							</td>
						</tr>
						<tr mbox_no="b3" mbox_name="임시 보관함">
							<td>임시 보관함</td>
							<td class="ta_r">2 / 3</td>
							<td>
								<a href="javascript:void(0);" class="weakblue" onclick="emptyMailbox('4')">비우기</a>
							</td>
						</tr>
						<tr mbox_no="b5" mbox_name="휴지통">
							<td style="border-bottom: 1px solid rgb(204, 204, 204);">휴지통</td>
							<td class="ta_r" style="border-bottom: 1px solid rgb(204, 204, 204);">0 / 1</td>
							<td style="border-bottom: 1px solid rgb(204, 204, 204);">
								<a href="javascript:void(0);" class="weakblue" onclick="emptyMailbox('5')">비우기</a>
							</td>
						</tr>

						<!-- 개인편지함 -->
						<c:if test="${not empty requestScope.personalMailboxList || fn:length(requestScope.personalMailboxList) > 0}">
							<c:forEach var="personalMailbox" items="${requestScope.personalMailboxList}">
								<tr id="personalMailboxId" personalMailboxId="${personalMailbox.personalMailboxTypeId}" mbox_name="${personalMailbox.personalMailboxTypeName}">
									<td>${personalMailbox.personalMailboxTypeName}</td>
									<td class="ta_r">0 / 1</td>
									<td>
										<a href="javascript:void(0);" class="weakblue" onclick="emptyMailbox('6', '${personalMailbox.personalMailboxTypeId}')">비우기</a>
										<span class="grey_bar">|</span>
										<a href="javascript:void(0);" class="weakblue" onclick="deletePersonalMailbox('${personalMailbox.personalMailboxTypeId}');">편지함 삭제</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 
	<input type="hidden" id="USER_INFO_NO" value="2812">

	<div class="mailbox_manage_layer middle hide" id="mailbox-organize-info" style="display: none;">정리할 메일함 기간을 조회하여 한 번에 메일을 정리합니다.</div>

	<form name="gabia_mail" action="mail/mail_eml_down.php">
		<input type="hidden" name="mail_mbox" value="">
		<input type="hidden" name="gubun" value="all">
	</form>
 -->

</div>