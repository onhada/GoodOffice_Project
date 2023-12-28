<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>



<style type="text/css">
.listbottom {
	position: relative;
	left: 0;
	height: 60px;
	padding: 16px 0;
	right: 0;
	min-width: 733px;
	border-top: 1px solid #ebebeb;
	text-align: center;
	background: #fff;
	overflow: hidden;
	z-index: 10;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		// 이동 드롭다운 설정
		$("a#m_list_move_mbox").click(function(){ 
			
			if($("div#m_list_move_mbox_detail").hasClass("hide") === true) { // 옵션드롭다운이 보이지 않는 중일 경우
				$("div#m_list_move_mbox_detail").removeClass("hide");
			}
			else{ // 옵션드롭다운이 보이는 중일 경우 
				$("div#m_list_move_mbox_detail").addClass("hide");
			}
			
		});
		
		
		// 보기 드롭다운 설정 (수정필!!!!!!!!!안 먹음 ㅋ 왜 안 먹냐 고....)
		$("a#m_list_view_option").click(function(){
			
			if($("div#m_list_view_option_detail").hasClass("hide") === true) { // 옵션드롭다운이 보이지 않는 중일 경우
				$("div#m_list_view_option_detail").addClass("show");
			}
			else{ // 옵션드롭다운이 보이는 중일 경우 
				$("div#m_list_view_option_detail").removeClass("show");
			}
			
		});
		
		
		// 메일의 체크박스 선택할 경우
		$('input[name="mailId"], input#chkAll').change(function(){
console.log("hey");
			if( $('input:checkbox[name="mailId"]:checked').length > 0 || $("input[id='chkAll']").is(':checked') ){ // 메일이 하나 이상 선택되었을 경우 
				
				$("a#m_list_view_option").css("display", "none"); 
		    	$("span#m_list_checked_action, div#m_list_checked_menu").css("display", "inline"); 
		    	$("label#m_list_checked_cnt").text( $('input:checkbox[name="mailId"]:checked').length );
		    	
		    	if( $('input:checkbox[name="mailId"]:checked').length == $('input:checkbox[name="mailId"]').length ){
		    		$("input[id='chkAll']").prop('checked',true);
		    	}
		    	else{
		    		$("input[id='chkAll']").prop('checked',false);
		    	}
			}
			else{ // 메일이 하나도 선택되지 않았을 경우
				$("a#m_list_view_option").css("display", "inline"); 
		    	$("span#m_list_checked_action, div#m_list_checked_menu").css("display", "none");
			}
			
		}); 
		
		
	});// end of $(document).ready(function(){})-----------------
	
	
	// Function Declaration
	
	function checkAll(){
		if($("input[id='chkAll']").is(':checked')){ // 전체선택에 체크된 경우 
			$('input[name="mailId"]').prop('checked',true);
			console.log("dddd");
		}
		else{ // 전체선택에 체크되지 않은 경우
			$('input[name="mailId"]').prop('checked',false);
		}
	}
	
	// === 중요메일 여부 업데이트 === //
	function updateImportant(mailId){
		//console.log( $("input[id='mailId_'"+mailId+"]").parent().parent().find('input[name="isImportant"]').val() );
		$.ajax({
        	url : "<%=ctxPath%>/mail/updateImportant.gw",
			type : "post",
			data : {
				"mailType" : $("input[name='mailType']").val(),
				"personalMailboxTypeId" : $("input[name='personalMailboxTypeId']").val(),
				"mailId" : mailId,
				"isImportant" : $("input[id='mailId_"+mailId+"']").parent().parent().find('input[name="isImportant"]').val()		
			},
			dataType : "json",
			async : false,
			success : function(json) {
				
			 //	console.log(json.n);
				
			 	if($("a#importantStar"+mailId).hasClass("on") === true) {// 중요메일인 경우
					$("a#importantStar"+mailId).removeClass("on");
					alert("중요메일을 해제했습니다");	
				}
				else{ // 중요메일이 아닌 경우 
					$("a#importantStar"+mailId).addClass("on");	
					alert("중요메일을 설정했습니다");	
				}
				
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});

	}
	
	
	
	 
	 
	
	
	
	
	
	
</script>





<div id="contents">
	<!-- 메일잠금 확인 -->
	<div class="content_title" style="margin-left: 4px">
		<!-- Title -->
		<fieldset>
		
			<div id="m_list_default_menu">
				<span class="detail_select">
					<input type="checkbox" id="chkAll" onclick="checkAll();">
					<a href="javascript:void(0)" id="m_list_view_option" style="display: inline;">
						보기:
						<span id="special_search_label">모두</span>
						<img src="<%=ctxPath%>/resources/image/icon/btn_drop.gif" alt="모두보기" class="open_drop">
					</a>
					<span id="m_list_checked_action" style="display: none;">
						<label id="m_list_checked_cnt"></label>
					</span>
					<!-- Drop Down -->
					<div id="m_list_view_option_detail" class="dropdown hide">
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:void(0)" onclick="MailList.SpecialSearch('');">모두</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="MailList.SpecialSearch('star');">별 표시</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="MailList.SpecialSearch('attach');">첨부 있음</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="MailList.SpecialSearch('unread');">안 읽은 메일</a>
							</li>
							<blockquote></blockquote>
							<li>
								<a href="javascript:void(0)" onclick="MailList.SpecialSearch('read');">읽은 메일</a>
							</li>
						</ul>
					</div>
					<!-- // Drop Down -->
				</span>
			</div>

			<div id="m_list_checked_menu" style="display: none;">
				<c:if test="${requestScope.paraMap.mailType != 5}">
				<span class="detail_select" id="m_list_checked_menu_delete">
					<a href="javascript:void(0)" onclick="moveToTrashbox();">삭제</a>
				</span>
				</c:if>
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="delPermanently();">완전삭제</a>
				</span>
				<span class="detail_select" id="m_list_checked_menu_resend" style="display: none;">
					<a href="javascript:void(0)" onclick="MailList.ResendSelected(event);">재발송</a>
				</span>
				
				<c:if test="${(not empty requestScope.personalMailboxList || fn:length(requestScope.personalMailboxList) > 0)
							&& (requestScope.paraMap.mailType == 1 || requestScope.paraMap.mailType == 2 || requestScope.paraMap.mailType == 6)}">
				<span class="detail_select">
					<a href="javascript:void(0)" id="m_list_move_mbox">
						이동<img src="<%=ctxPath%>/resources/image/icon/btn_drop.gif" alt="이동 드롭다운 메뉴 열기" class="open_drop">
					</a>
					<div class="dropdown hide" id="m_list_move_mbox_detail">
						<div class="dropscroll-menu">
							<ul style="min-width: 220px; border-color: #2985db">
							<c:forEach var="personalMailbox" items="${requestScope.personalMailboxList}">
								<li>
									<a href="javascript:void(0)" id="personal_${personalMailbox.personalMailboxTypeId}" onclick="moveToPersonalMailbox('${personalMailbox.personalMailboxTypeId}')" >${personalMailbox.personalMailboxTypeName}</a>
								</li>
								<!-- 
								<li>
									<a href="javascript:void(0)" id="move_1" onclick="MailList.moveTo('1')"> 개인용 </a>
								</li>
								<li>
									<a href="javascript:void(0)" id="move_2" onclick="MailList.moveTo('2')"> 업무용 </a>
								</li>
								 -->
							</c:forEach>	
							</ul>
						</div>
					</div>
				</span>
				</c:if>
				
			</div>
		</fieldset>

		<div class="setting_box">
			<!-- 수정필 시간되면... -->
			<!-- <a class="icon order" href="javascript:void(0)" id="m_list_setting_menu" title="정렬">
				<span class="blind">설정</span>
			</a> -->
		</div>
		<div class="gradient" style="display: none"></div>

		<div class="dropdown hide" style="position: absolute; top: 36px; right: 158px" id="m_list_setting_menu_detail">
			<ul class="dropdown-menu">
				<li class="dropdown-header">정렬</li>
				<li class="active" id="m_list_orderby_received_li" onclick="MailList.ChangeOrderBy('received');">
					<a href="javascript:void(0)">
						날짜
						<span id="m_list_orderby_received_icon" class="icon down"></span>
						<em class="blind">날짜 열기</em>
					</a>
				</li>
				<li id="m_list_orderby_from_addr_li">
					<a href="javascript:void(0)" onclick="MailList.ChangeOrderBy('from_addr');">
						보낸 사람
						<span id="m_list_orderby_from_addr_icon" class="icon"></span>
						<em class="blind">보낸사람 열기</em>
					</a>
				</li>
				<li id="m_list_orderby_subject_li">
					<a href="javascript:void(0)" onclick="MailList.ChangeOrderBy('subject');">
						제목
						<span id="m_list_orderby_subject_icon" class="icon"></span>
						<em class="blind">제목 열기</em>
					</a>
				</li>
				<li id="m_list_orderby_mail_size_li">
					<a href="javascript:void(0)" onclick="MailList.ChangeOrderBy('mail_size');">
						메일 크기
						<span id="m_list_orderby_mail_size_icon" class="icon"></span>
						<em class="blind">메일 크기 열기</em>
					</a>
				</li>
			</ul>
		</div>
		<!-- Title End -->
	</div>


	<div class="content_inbox mail_inbox" id="content_inbox" style="top: 61px;">
		<div class="cont_box">
			<form name="frmMain" id="frmMain" style="display: inline" method="post">
				<input type="hidden" name="chkMailNumStr">
				<input type="hidden" name="my_mail_addr" id="my_mail_addr" value="admin">
				<input type="hidden" name="count_per_page" id="count_per_page" value="30">
				<div id="tdMailList">
					<table class="listbox" id="tableMailList">
						<tbody></tbody>
						<colgroup>
							<col width="45">
							<col width="20">
							<col width="20">
							<col width="16%">
							<col width="59">
							<col width="84%">
							<col width="14">
							<%-- <col width="86"> --%>
							<col width="160">
						</colgroup>

						<tbody>
							<input type="hidden" name="mailType" value="${requestScope.paraMap.mailType}" />
							<input type="hidden" name="personalMailboxTypeId" value="${requestScope.paraMap.personalMailboxTypeId}" />
							<c:if test="${not empty requestScope.mailList || fn:length(requestScope.mailList) > 0}">
								<c:forEach var="mailvo" items="${requestScope.mailList}">
									<tr oncontextmenu="return false;">
										<td>		
											<!-- 개인편지함의 경우, 어떤 메일함에서 이동했는지를 알기 위한 것 -->
											<c:if test="${requestScope.paraMap.mailType == 6}">
												<input type="hidden" name="fromMailbox" value="${mailvo.fromMailbox}" />
											</c:if>
											<%-- 휴지통에서 영구삭제 할 경우 시작 --%> 
											<c:if test="${requestScope.paraMap.mailType == 5}">
												<input type="hidden" name="fromOrgMailbox" id="fromOrgMailbox" value="${mailvo.fromMailbox}"  />
											</c:if>
											<%-- 휴지통에서 영구삭제 할 경우 끝 --%> 
											<input type="checkbox" name="mailId" id="mailId_${mailvo.mailId}" value="${mailvo.mailId}" />
											<label for="mailId" class="blind">메일 선택</label>
										</td>
										<td>
											<c:if test="${requestScope.paraMap.mailType != 5}"> <!-- 수정필) 휴지통도 하실??  -->
												<input type="hidden" name="isImportant" value="${mailvo.isImportant}" />
												<c:if test="${mailvo.isImportant eq 0}">
													<a id="importantStar${mailvo.mailId}" href="javascript:void(0)" onclick="updateImportant('${mailvo.mailId}');" star="N" class="sp_menu impt ">
												</c:if>
												<c:if test="${mailvo.isImportant eq 1}">
													<a id="importantStar${mailvo.mailId}" href="javascript:void(0)" onclick="updateImportant('${mailvo.mailId}');" star="N" class="sp_menu impt on">
												</c:if>
												<span class="blind">중요 메일 표시</span>
												</a>
											</c:if>
										</td>
										<td>
											<!-- 수정필 : 다 하고 이것도 해 아마도 원메일 컬럼 관련해서 만들면 될ㄷ스  -->
											<!-- <span class="icon reply" title="회신 메일 표시"></span> -->
										</td>
										<td class="name">
											<div class="in">
												<%-- <a href="/tempfinal.onhiworks.com/officemail/main/m_write/new/mail/from_addr/93" title="관리자 <admin>">관리자</a> --%>
												<a href="#;" title="${mailvo.empName}">${mailvo.empName}<%-- 수정필) &nbsp;${mailvo.email} --%></a>
											</div>
										</td>
										<td class="ta_r hoverIcon">
											<button type="button" class="icon h_del" href="javascript:void(0)" onclick="moveToTrashbox('${mailvo.mailId}'); " title="휴지통으로 이동">
												<span class="blind">삭제</span>
											</button>
											<c:if test="${requestScope.paraMap.mailType != 4 && requestScope.paraMap.mailType != 6}">
												<button type="button" class="icon h_new" onclick="window.open('<%= ctxPath%>/mail/mailView.gw?mailId=${mailvo.mailId}&mailType=${requestScope.paraMap.mailType}&personalMailboxTypeId=${requestScope.paraMap.personalMailboxTypeId}')" title="새 창에서 메일 보기"></button>
											</c:if>
											<c:if test="${requestScope.paraMap.mailType == 4}">
												<button type="button" class="icon h_new" onclick="window.open('<%= ctxPath%>/mail/mailWrite.gw?mailId=${mailvo.mailId}&mailType=${requestScope.paraMap.mailType}')" title="새 창에서 메일 보기"></button>
											</c:if>	
											<c:if test="${requestScope.paraMap.mailType == 6}">
												<button type="button" class="icon h_new" onclick="window.open('<%= ctxPath%>/mail/mailView.gw?mailId=${mailvo.mailId}&mailType=${requestScope.paraMap.mailType}&personalMailboxTypeId=${requestScope.paraMap.personalMailboxTypeId}&fromMailbox=${mailvo.fromMailbox}')" title="새 창에서 메일 보기"></button>
											</c:if>
											
										</td>
										<td class="title ">
											<div class="in">
												<c:if test="${requestScope.paraMap.mailType != 4 && requestScope.paraMap.mailType != 6}">
													<a href="<%= ctxPath%>/mail/mailView.gw?mailId=${mailvo.mailId}&mailType=${requestScope.paraMap.mailType}&personalMailboxTypeId=${requestScope.paraMap.personalMailboxTypeId}" title="${mailvo.subject}"> ${mailvo.subject} </a>
												</c:if>
												<c:if test="${requestScope.paraMap.mailType == 4}">
													<a href="<%= ctxPath%>/mail/mailWrite.gw?mailId=${mailvo.mailId}&mailType=${requestScope.paraMap.mailType}" title="${mailvo.subject}"> ${mailvo.subject} </a>
												</c:if>	
												<c:if test="${requestScope.paraMap.mailType == 6}">
													<a href="<%= ctxPath%>/mail/mailView.gw?mailId=${mailvo.mailId}&mailType=${requestScope.paraMap.mailType}&personalMailboxTypeId=${requestScope.paraMap.personalMailboxTypeId}&fromMailbox=${mailvo.fromMailbox}" title="${mailvo.subject}"> ${mailvo.subject} </a>
												</c:if>
												
												
											</div>
										</td>
										<td>
											<c:if test="${mailvo.hasFile == 1}">
												<a href="javascript:void(0)" onclick="MailList.showAttachedFileLayer('93',event);" class="icon file">
													<span class="blind">첨부 파일 표시</span>
												</a>
											</c:if>
										</td>
										<!-- <td class="byte">4.5K</td> -->
										<td class="date" title="">${mailvo.sendDay}</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty requestScope.mailList || fn:length(requestScope.mailList) == 0}">
								<tr>
									<td colspan="9" align="center" height="30">현재 편지함에 메일이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>

					</table>
				</div>
			</form>
		</div>







		<div class="listbottom">
			<p class="number">
				편지 수:
				<span id="spMTotCnt">${requestScope.totalCount}</span>
			</p>

			<%-- === 페이지바 보여주기 === --%>
			<div class="paginate" id="divMainPaging">${requestScope.pageBar}</div>

			<!-- 
			<div class="page_select">
				<label for="pageCurrent" class="blind">현재 페이지 선택</label>
				<select align="absmiddle" id="pageCurrent" onchange="MailList.MovePage(this.value);" name="selPageSelectBox">
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				/
				<span id="spPageTotalPage">2</span>
			</div>
			 -->
			
		</div>
	</div>
	<!-- <iframe name="ifMailListHistory" id="ifMailListHistory" src="" style="width: 0px; height: 0px; display: none;"></iframe>
 -->
	<!-- <script language="JavaScript">
		MailList.EnterInitData('b0');
	</script> -->
</div>