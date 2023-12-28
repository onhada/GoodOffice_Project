<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	$(document).ready(function(){
		
		// 이동 드롭다운 설정
		$("a#m_view_move_mbox").click(function(){ 
			
			if($("div#m_view_move_mbox_detail").hasClass("hide") === true) { // 옵션드롭다운이 보이지 않는 중일 경우
				$("div#m_view_move_mbox_detail").removeClass("hide");
			}
			else{ // 옵션드롭다운이 보이는 중일 경우 
				$("div#m_view_move_mbox_detail").addClass("hide");
			}
			
		});
	
		
		// 메일첨부파일의 총 크기 구하기 
		var list = document.querySelectorAll("a#mailFileSize");
		var fileTotalCount = 0;
		for(let i=0; i<list.length; i++){
			fileTotalCount += Number(list[i].text);
		}
		$("a#fileTotalSize").html(fileTotalCount);
		
		
		// 메일첨부파일 상세보기 토글 열고 닫기 
		$("a.hidecont").click(function(){
			if ($("div.filebox, a#btn_zip_all").is(':visible') == true) { // 보이는 상태 
				$("div.filebox, a#btn_zip_all").css("display", "none");
				$("a.hidecont").css("background-position", "-258px -38px");
		    } else { // 안 보이는 상태
		    	$("div.filebox, a#btn_zip_all").css("display", "block");
				$("a.hidecont").css("background-position", "-276px -38px");
		    }
		});
		
		
	});// end of $(document).ready(function(){})-----------------

	
	// Function Declaration
	function replyWrite(writeType, mailId){
		/* 
		console.log(writeType + ":" + mailId);
		
		if("reply" == writeType){
			console.log("답장");
		}
		 */
		
		// 폼(form)을 전송(submit)
	  	const frm = document.mailViewFrm;
	  	frm.method = "get";
	  	frm.action = "<%= ctxPath%>/mail/mailWrite.gw";
	  	frm.submit();
		
	}// end of function replyWrite()-----------
	
	
	
	
	
	

	
	
	
</script>





<div id="contents">
	<div class="content_title">
		<!-- Title -->
		<form>
			<fieldset>
				<c:if test="${requestScope.paraMap.mailType != 5}">
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="replyWrite('reply', '${requestScope.paraMap.mailId}');">답장</a>
				</span>
				</c:if>
				<%-- 
				<c:if test="${requestScope.paraMap.mailType != 5}">
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="replyWrite('replyall','${requestScope.paraMap.mailId}');">전체답장</a>
				</span>
				</c:if>
				 --%>
				<%-- 
				<c:if test="${requestScope.paraMap.mailType != 5}">
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="replyWrite('forward','${requestScope.paraMap.mailId}');">전달</a>
				</span> 
				</c:if>
				--%>
				<c:if test="${requestScope.paraMap.mailType != 5}">
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="moveToTrashbox('${requestScope.paraMap.mailId}', '${requestScope.paraMap.mailType}');">삭제</a>
				</span>
				</c:if>
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="delPermanently('${requestScope.paraMap.mailId}', '${requestScope.paraMap.mailType}');">완전삭제</a>
				</span>
				
				<%-- 이동은 유저의 개인메일함으로만 가능하다. 즉, 개인메일함이 있는 유저가 로그인 했을 때만 보여줘야함. --%>
				<c:if test="${requestScope.paraMap.mailType != 5 && (not empty requestScope.personalMailboxList || fn:length(requestScope.personalMailboxList) > 0)}">
				<span class="detail_select">
					<a href="javascript:void(0)" id="m_view_move_mbox">
						이동<img src="<%=ctxPath%>/resources/image/icon/btn_drop.gif" alt="이동 드롭다운 메뉴 열기" class="open_drop">
					</a>
					<div class="dropdown hide" id="m_view_move_mbox_detail">
						<div class="dropscroll-menu">
							<ul style="min-width: 220px; border-color: #2985db">
							<c:forEach var="personalMailbox" items="${requestScope.personalMailboxList}">
								<li>
									<a href="javascript:void(0)" id="${personalMailbox.personalMailboxTypeId}" onclick="moveToPersonalMailbox('${personalMailbox.personalMailboxTypeId}')" >${personalMailbox.personalMailboxTypeName}</a>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</span>
				</c:if>
				
			</fieldset>
		</form>

		<div class="setting_box">
			<c:if test="${requestScope.paraMap.mailType != 6}">
			<a class="icon list_bt" href="<%= ctxPath%>/mail/mailList.gw?mailType=${requestScope.paraMap.mailType}" title="목록">
			</c:if>
			<c:if test="${requestScope.paraMap.mailType == 6}">
			<a class="icon list_bt" href="<%= ctxPath%>/mail/mailList.gw?mailType=${requestScope.paraMap.mailType}&personalMailboxTypeId=${requestScope.paraMap.personalMailboxTypeId}" title="목록">
			</c:if>
				<span class="blind">목록보기</span>
			</a>
			<!-- 
			<a class="icon next_bt deg90" href="/tempfinal.onhiworks.com/officemail/main/m_view/b0/205/" title="sdf">
				<span class="blind">다음으로 이동</span>
			</a>
			 -->
		</div>
		<!-- Title End -->
	</div>
	<input type="hidden" name="hidCondition" id="hidCondition" value="">

	<div class="content_inbox">
		<!-- Contents -->

		<div class="cont_box mailview" style="max-width: 100%">
			<form name="mailViewFrm">
				<div class="view_field" id="view_field">
					<h3>
						<input type="hidden" name="mailType" value="${requestScope.paraMap.mailType}" />
						<input type="hidden" name="personalMailboxTypeId" value="${requestScope.paraMap.personalMailboxTypeId}" />
						<input type="hidden" name="mailId" value="${requestScope.paraMap.mailId}" />
						
					<c:if test="${requestScope.paraMap.mailType != 5}">	
						<c:if test="${requestScope.isImportant eq 0}">
							<a href="javascript:void(0)" onclick="updateImportant('${mailvo.mailId}');" star="N" class="icon impt " id="aStar">
						</c:if>	
						<c:if test="${requestScope.isImportant eq 1}">
							<a href="javascript:void(0)" onclick="updateImportant('${mailvo.mailId}');" star="N" class="icon impt on " id="aStar">
						</c:if>	
							<span class="blind">중요 메일 표시</span>
							<input type="hidden" name="isImportant" value="${requestScope.isImportant}" />
							</a>
					</c:if>		
							
						<span class="title">${requestScope.mailInfo.subject}</span>
						<a href="javascript:void(0)" id="spMemoDisplay" onclick="showMemo('${requestScope.mailId}');" class="memo">
							<c:if test="${empty fn:trim(requestScope.mailInfo.memoContent)}">
							메모 추가
							</c:if>
							<c:if test="${not empty fn:trim(requestScope.mailInfo.memoContent)}">
							메모 수정 
							</c:if>
						</a>	
						<!-- <a href="javascript:void(0)" id="spMemoDisplay" onclick="Memo.showMemo(217);" class="memo">메모 수정</a> -->
					</h3>
					<p class="date">${requestScope.mailInfo.sendDay}</p>
					<div class="top_link">
						<c:if test="${not empty fn:trim(requestScope.mailInfo.memoContent)}">
							<a href="javascript:void(0)" id="spMemoDisplayOrigin" onclick="showMemo('${requestScope.mailId}');" class="memo">${fn:trim(requestScope.mailInfo.memoContent)}</a>
						</c:if>
					</div>
					<div class="sender">
						보낸 사람: ${requestScope.sendEmp_str}
						<!-- <span id="from_addr" name="관리자" &lt="">관리자 &lt;admin&gt;</span> --> <!-- 지워도될듯..? -->
					</div>
					<div class="addressee">
						받는 사람: ${requestScope.incomeEmp_str}
						<c:if test="${not empty requestScope.referenceEmp_str}">
						<br>
						참조 : ${requestScope.referenceEmp_str}
						</c:if>
					</div>
					<c:if test="${not empty requestScope.mailFileList || fn:length(requestScope.mailFileList) > 0}">
						<div class="addFiles">
							<p>
								<a href="javascript:void(0)" class="icon hidecont hide">
									<span class="blind">내용 열고 닫기 토글</span>
								</a>
								첨부 파일:
								<span>${fn:length(requestScope.mailFileList)}</span>
								개 (
								<span>
								<a id="fileTotalSize"></a>MB
								</span>
								)
							</p>
							<div class="filebox" style="display: block;">
									<c:forEach var="mailFile" items="${requestScope.mailFileList}">
										<span class="cont_file">
											<!-- 수정필) 파일타입별 아이콘 넣을 거임? --> 
											<img src="<%= ctxPath%>/resources/image/icon/txt.png">
											<a href="javascript:Common.Download('/tempfinal.onhiworks.com/officemail/main/m_download_attached/217/1.2',this)">${mailFile.orgFileName}</a>
											(<a id="mailFileSize">${mailFile.fileSize}</a>MB)
										</span>
									</c:forEach>
							</div>
							<a class="icon submit" id="btn_zip_all" href="javascript:Common.Download('/tempfinal.onhiworks.com/officemail/main/m_download_attached_zip/216',$('btn_zip_all'))" title="첨부파일 모두 저장" style="display: block;">
								<span class="blind">첨부 파일 다운로드</span>
							</a>
						</div>
					</c:if>
					<!-- tnef start -->

					<!-- tnef -->
					<div class="mailbody" id="mailbody" style="padding-right: 30px;">
						${requestScope.mailInfo.mailContent}
						<%-- <iframe src="<%=ctxPath%>/mail/mailView.gw?mailId=${mailId}" height="300px" style="width: 100%; height: 300px;" scrolling="no" frameborder="0" id="ifMailContent" name="ifMailContent"> </iframe> --%>
					</div>

				</div>
			</form>
		</div>
		<!-- Contents End-->
		<input type="hidden" name="origin_msg" value="">
		<input type="hidden" name="mail_no" id="mail_no" value="217">
		
	</div>
</div>