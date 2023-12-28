<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>



<!DOCTYPE html>
<!-- saved from url=(0064)https://mail.office.hiworks.com/gabia.biz/mail/webmail/m_list/b0 -->
<html lang="ko">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<!-- 강사님 레이아웃제이에스피  태그 그대로 가져온 거 시작  -->


  <%-- Bootstrap CSS --%>
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css" >
 
  <%-- Font Awesome 6 Icons --%>
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> -->

  <%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/mail/mail.css" />

  <%-- Optional JavaScript --%>
  <script type="text/javascript" src="<%= ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>
  <script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script>
  <script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 

  <%-- 스피너 및 datepicker 를 사용하기 위해 jQueryUI CSS 및 JS --%>	
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
 <script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

  <%-- === ajax로 파일을 업로드 할때 가장 널리 사용하는 방법 : ajaxForm === --%> 
  <%-- <script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery.form.min.js"></script> 
 --%>

<!-- 강사님 레이아웃 태그 그대로 가져온 거 끝  -->


<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/new_lnb.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/mail.css">
<!-- 아래는 전체 레이아웃 안 무너지게 해줌... -->
<%-- <link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/reservation/style.css"> --%>
<!-- 메일쓰기관련 css 시작 -->
<%-- <link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/synapeditor.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/synapeditorCustomStyle.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/characterPicker.min.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/codemirror.min.css"> --%>
<!-- 메일쓰기관련 css 끝 -->


<script type="text/javascript">

	$(document).ready(function(){
	
		<%-- 받는사람, 참조, 숨은참조 자동완성 시작 --%>
	$("ul.autoEmpList").css("display", "none");
	<%-- 		
		$("textarea#incomeMail, textarea#referenceMail, textarea#hiddenReferenceMail").keyup(function(){
			
			const wordLength = $(this).val().trim().length; // 공백을 제거한 길이를 알아온다.
			console.log(wordLength);	
	
			
			var showEmpList;
			var searchEmpEmail;
			if( (this).isSameNode(document.querySelector("#incomeMail")) ){
				showEmpList = document.querySelector("#autoEmpList_income");
				searchEmpEmail = document.querySelector("#incomeMail").value; 
			}
			else if( (this).isSameNode(document.querySelector("#referenceMail")) ){
				showEmpList = document.querySelector("#autoEmpList_ref");
				searchEmpEmail = document.querySelector("#referenceMail").value; 
			}
			else if( (this).isSameNode(document.querySelector("#hiddenReferenceMail")) ){
				showEmpList = document.querySelector("#autoEmpList_hiddenRef");
				searchEmpEmail = document.querySelector("#hiddenReferenceMail").value; 
			}
			console.log(showEmpList);
			console.log(searchEmpEmail);
			
	
			if(wordLength == 0) {
				showEmpList.style.display = "none";
				// 검색어가 공백이거나 검색어 입력후 백스페이스키를 눌러서 검색어를 모두 지우면 검색된 내용이 안 나오도록 해야 한다.
			}
			else{
				
				$.ajax({
					url:"<%= ctxPath%>/mail/autoEmpListShow.gw",
					type:"post",
					data:{ "searchEmpEmail": searchEmpEmail } ,
				    dataType:"json",
				    success:function(json){
				    
				    },
				    error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});
				  	  
			}
			
		});// $("textarea#incomeMail, textarea#referenceMail, textarea#hiddenReferenceMail").keyup(function(){})------
		
		/* 
		<ul class="dropdown-menu address" id="autoEmpList" tabindex="0" style="display: none; top: 157px; left: 409px; min-width: 746px; width: auto;">
			---여기서부터
			<li my_name="김이사" my_email="kim" class="ui-menu-item" id="ui-id-22" tabindex="-1">
				<a href="javascript:void(0)">
					<span class="name">
						<nobr>
							김이사 &lt;<b>k</b>im&gt;
						</nobr>
					</span>
				</a>
			</li>
			---여기까지반복
			<li my_name="" my_email="" class="ui-menu-item" id="ui-id-24" tabindex="-1">
				<a onclick="javascript:void(0)" href="#">
					<span class="point_color">자동 완성 설정</span>
				</a>
			</li>
		</ul>
		 */
	 --%>	
	});// end of $(document).ready(function(){})-----------------

	
	//Function Declaration
	
	
	// === 휴지통으로 이동 === //
	function moveToTrashbox(mailId, fromMailbox){
		
		if( $('input:checkbox[name="mailId"]:checked').length > 0 ){	// 체크박스를 선택하여 삭제하는 경우 (하나이상의 메일)	
			var check_arr = new Array($('input:checkbox[name="mailId"]:checked').length);
			for (var i = 0; i < check_arr.length; i++) {
				check_arr[i] = new Array(2);
			}
		 //	console.log(check_arr);
		 //	console.log("배열길이"+check_arr.length);
			
			$('input:checkbox[name="mailId"]:checked').each((index, item) => {
				check_arr[index][0] = item.value;
		    });
			$('input:checkbox[name="mailId"]:checked').prev().each((index, item) => {
				check_arr[index][1] = item.value;
		    }); 
		}	
		else{	// 삭제아이콘을 눌려 삭제하는 경우 (하나의 메일)
			var check_arr = new Array(1);
			check_arr[0] = new Array(2);
			check_arr[0][0] = mailId;
			check_arr[0][1] = fromMailbox;
		}	
		
		
		check_arr.forEach(function(element, index){
			const check_one = element;
		 //	console.log("여기"+check_one);
		 //	console.log("[0] : "+check_one[0]);
		 //	console.log("[1] : "+check_one[1]);
			
			$.ajax({
	        	url : "<%=ctxPath%>/mail/moveToTrashbox.gw",
				type : "post",
				data : {"mailType" : $("input[name='mailType']").val(),
						"personalMailboxTypeId" : $("input[name='personalMailboxTypeId']").val(),
						"mailId" : check_one[0],
						"fromOrgMailbox" : check_one[1]},
				dataType : "json",
				async : false,
				success : function(json) {
					const mailType = $("input[name='mailType']").val();
					if(mailType != 6){ // 개인편지함이 아닐 경우 
						location.href = `<%= ctxPath%>/mail/mailList.gw?mailType=\${mailType}`;
					}
					else{ // 개인편지함일 경우 
						const personalMailboxTypeId = $("input[name='personalMailboxTypeId']").val();
						location.href = `<%= ctxPath%>/mail/mailList.gw?mailType=\${mailType}&personalMailboxTypeId=\${personalMailboxTypeId}`;
					}
				},
				error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});
			
		});
		
		alert("해당 메일을 휴지통으로 이동했습니다.");	
		 
	}// end of function moveToTrashbox(mailId)------------------------
	
	
	// === 메일 영구삭제하기 === // 
	function delPermanently(mailId, fromMailbox){
		
		if (confirm("메일을 완전히 삭제할 경우 복구할 수 없습니다. \n완전히 삭제하시겠습니까?") == true){ // 완전삭제 전 확인
				
			// check_arr.splice(0); // 수정필) 배열 비우기 안 해도 되는 걸까? 나중에 다시 봐.. 지금 머리 안 돌아감.. 일단은 이거 없이도 잘 돌아가는데..
			
			if( $('input:checkbox[name="mailId"]:checked').length > 0 ){	// 체크박스를 선택하여 삭제하는 경우 (하나이상의 메일)	
				var check_arr = new Array($('input:checkbox[name="mailId"]:checked').length);
				for (var i = 0; i < check_arr.length; i++) {
					check_arr[i] = new Array(2);
				}
			 //	console.log(check_arr);
			 //	console.log("배열길이"+check_arr.length);
				$('input:checkbox[name="mailId"]:checked').each((index, item) => {
					check_arr[index][0] = item.value;
			    });
				$('input:checkbox[name="mailId"]:checked').prev().each((index, item) => {
					check_arr[index][1] = item.value;
			    }); 
			}	
			else{	// 삭제아이콘을 눌려 삭제하는 경우 (하나의 메일)
				var check_arr = new Array(1);
				check_arr[0] = new Array(2);
				check_arr[0][0] = mailId;
				check_arr[0][1] = fromMailbox;
			}		
				
				
			check_arr.forEach(function(element, index){
				const check_one = element;
			//	console.log("여기"+check_one);
			//	console.log("[0] : "+check_one[0]);
			//	console.log("[1] : "+check_one[1]);
				
				$.ajax({
		        	url : "<%=ctxPath%>/mail/delPermanently.gw",
					type : "post",
					data : {"mailType" : $("input[name='mailType']").val(),
							"personalMailboxTypeId" : $("input[name='personalMailboxTypeId']").val(),
							"mailId" : check_one[0],
							"fromOrgMailbox" : check_one[1]},
					dataType : "json",
					async : false,
					success : function(json) {
						const mailType = $("input[name='mailType']").val();
						if(mailType != 6){ // 개인편지함이 아닐 경우 
							location.href = `<%= ctxPath%>/mail/mailList.gw?mailType=\${mailType}`;
						}
						else{ // 개인편지함일 경우 
							const personalMailboxTypeId = $("input[name='personalMailboxTypeId']").val();
							location.href = `<%= ctxPath%>/mail/mailList.gw?mailType=\${mailType}&personalMailboxTypeId=\${personalMailboxTypeId}`;
						}
					},
					error : function(request, status, error) {
						alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
					}
				});
				
			});
			
			alert("선택한 메일을 완전히 삭제했습니다.");
		}	
		
		else{ // 영구 삭제를 취소한 경우 
			alert("완전삭제를 취소했습니다.");
		}		
		
	}// end of function delPermanently()----------------
	
	
	
	// === 메일 개인편지함으로 이동 === // 
	function moveToPersonalMailbox(personalMailboxTypeId){
		
		if (confirm("개인편지함으로 이동할 경우 다시 기존메일함으로 이동할 수 없습니다. \n개인편지함으로 이동하시겠습니까?") == true){ // 완전삭제 전 확인
			
			// check_arr.splice(0); // 수정필) 배열 비우기 안 해도 되는 걸까? 나중에 다시 봐.. 지금 머리 안 돌아감.. 일단은 이거 없이도 잘 돌아가는데..
			
			if( $('input:checkbox[name="mailId"]:checked').length > 0 ){ // 체크박스를 통해 선택할 경우 (하나 이상의 메일)	
				var check_arr = new Array($('input:checkbox[name="mailId"]:checked').length);
				for (var i = 0; i < check_arr.length; i++) {
					check_arr[i] = new Array(2);
				}
			 //	console.log(check_arr);
			 //	console.log("배열길이"+check_arr.length);
				
				$('input:checkbox[name="mailId"]:checked').each((index, item) => {
					check_arr[index][0] = item.value;
			    });
				$('input:checkbox[name="mailId"]:checked').parent().parent().find('input[name="isImportant"]').each((index, item) => {
					check_arr[index][1] = item.value;
			    }); 
			}
			else{ // 메일 상세보기에서 선택할 경우 (하나의 메일)
				var check_arr = new Array(1);
				check_arr[0] = new Array(2);
				check_arr[0][0] = $("input[name='mailId']").val();
				check_arr[0][1] = $("input[name='isImportant']").val();
			}
			
			
			check_arr.forEach(function(element, index){
				const check_one = element;
				console.log("확인"+check_one);
				console.log("[0] : "+check_one[0]);
				console.log("[1] : "+check_one[1]);
				
				$.ajax({
		        	url : "<%=ctxPath%>/mail/moveToPersonalMailbox.gw",
					type : "post",
					data : {"mailType" : $("input[name='mailType']").val(),			// 현재 메일이 있는 메일함 
							"fromPersonalMailboxTypeId" : $("input[name='personalMailboxTypeId']").val(), 	// 현재의 개인메일함 
							"toPersonalMailboxTypeId" : personalMailboxTypeId, 		// 이동할 개인메일함 
							"mailId" : check_one[0],	
							"isImportant" : check_one[1]},
					dataType : "json",
					async : false,
					success : function(json) {
					 	console.log(json.n);
						if(json.n == 1){
							const mailType = $("input[name='mailType']").val();
							const personalMailboxTypeId = $("input[name='personalMailboxTypeId']").val();
							location.href = `<%= ctxPath%>/mail/mailList.gw?mailType=\${mailType}&personalMailboxTypeId=\${personalMailboxTypeId}`;
						}
					},
					error : function(request, status, error) {
						alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
					}
				});
			});
			alert("개인편지함으로 이동했습니다.");
		}
		
		else{
			alert("개인편지함 이동을 취소했습니다.");
		}
		
	}// end of function moveToPersonalMailbox()-------------------
	
	
	<%-- 모달창 닫기 --%>
	function mail_layer_close(){
		$("div#popupBase").css("display", "none");
		$("div#layer_m_write_memo_add").addClass("hide");
	}// end of function mail_layer_close()---------------------- 

	
	<%-- === 메모 관련 모달 시작 === --%>
	function showMemo(fk_empId){
		if($("div#layer_m_write_memo_add").hasClass("hide") === true) { 
			
			$("div#popupBase").css("display", "inline");
			$("div#layer_m_write_memo_add").removeClass("hide");
			
			$.ajax({
	        	url : "<%=ctxPath%>/mail/selectMemo.gw",
				type : "post",
				data : {
					"mailType" : $("input[name='mailType']").val(),
					/* "personalMailboxTypeId" : $("input[name='personalMailboxTypeId']").val(), */
					"mailId" : $("input[name='mailId']").val()
				},
				dataType : "json",
				async : false,
				success : function(json) {
					if(json.n == 1){
						$("div#spanMemoTitle").text("메모 수정");
						$("textarea#textareaMemo").val(json.memoContent);
					}
				},
				error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});
			
			
		}
		else{ 
			$("div#layer_m_write_memo_add").addClass("hide");
		}
	}// end of function showMemo(fk_empId)-----------
	
	function saveMemo(){
		
		$.ajax({
        	url : "<%=ctxPath%>/mail/saveMemo.gw",
			type : "post",
			data : {
				"mailType" : $("input[name='mailType']").val(),
				/* "personalMailboxTypeId" : $("input[name='personalMailboxTypeId']").val(), */
				"mailId" : $("input[name='mailId']").val(),
				"memoContent" : $("textarea#textareaMemo").val()
			},
			dataType : "json",
			async : false,
			success : function(json) {
			 	window.location.reload();
			},
			error : function(request, status, error) {
				alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
		});
	}
	
	// deleteMemo()
	<%-- === 메모 관련 모달 끝 === --%>
	
	
	<%-- 미리보기 모달 시작 				수정필) 안 할 거면 지워....--%>
	function mailPreview(){
	
		$("div#popupBase").css("display", "inline");	
		$("div#mailPreview").removeClass("hide");
		
		var incomeMail = $("textarea#incomeMail").val();
	console.log(incomeMail+"dd");	
		document.getElementById('ifMailPreview').src = '<%= ctxPath%>/mail/mailPreview.gw?incomeEmp=${incomeMail}';
		<%-- 'c_login_inner.jsp?flag='+'<%=flag%>';
		출처: https://junside.tistory.com/137 [I Should Be So Lucky!!!!! Please~!!!!!:티스토리]
		 --%>
	}
	<%-- 미리보기 모달 끝 --%>
	
</script>











<title>하이웍스 오피스</title>
<meta name="viewport" content="width=1024">








</head>

<body class="vsc-initialized">
	<div id="wrap">


		<!-- 헤더 시작  -->
		<tiles:insertAttribute name="header" />
		<!-- 헤더 끝  -->


		<!-- Top End-->
		<div id="container">

			<div id="drag_wrap">
				<div id="drag" class="ui-draggable ui-draggable-handle"
					style="left: 0px;"></div>
			</div>



			<!-- 사이드바 시작  -->
			<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝  -->



			<!-- 컨텐츠 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->


<!-- 
			<table width="800" height="500px;" border="0" cellspacing="0"
				cellpadding="0" id="tableMailPreview" bgcolor="#FFFFFF"
				style="display: none; position: absolute; z-index: 3; border: 2px solid #555555; table-layout: fixed;">
				<tbody>
					<tr>
						<td style="padding: 5px 5px 5px 5px;" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td id="tableMailPreviewContent" valign="top" width="100%">

										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
 -->

			<!-- <table width="800" border="0" cellspacing="0" cellpadding="0" id=tableMailPreview style="display:none;position:absolute;z-index:3">
<tr>
	<td width="18" height="13"><img src="/static/images//common/bg/lyr_table_bg1.gif" width="18" height="13"></td>
	<td background="/static/images//common/bg/lyr_table_bg2.gif" width="100%"></td>
	<td width="15"><img src="/static/images//common/bg/lyr_table_bg3.gif" width="15" height="13"></td>
</tr>
<tr>
	<td background="/static/images//common/bg/lyr_table_bg4.gif" width="18" height="5"></td>
	<td bgcolor="#FFFFFF" style="padding:5">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td id=tableMailPreviewContent height=500 valign=top width=100%>
			
			</td>
		</tr>
		</table>
	</td>
	<td background="/static/images//common/bg/lyr_table_bg5.gif" width="15" height="5"></td>
</tr>
<tr>
	<td height="18"><img src="/static/images//common/bg/lyr_table_bg6.gif" width="18" height="18"></td>
	<td background="/static/images//common/bg/lyr_table_bg7.gif"></td>
	<td><img src="/static/images//common/bg/lyr_table_bg8.gif" width="15" height="18"></td>
</tr>
</table> -->
		</div>

		<div id="dimmed"></div>

		<!-- [D] 자동 로그아웃 안내 레이어 -->
		<div id="dimmed2"></div>
	</div>


	<%-- 
	<!-- 서명 미리보기 모달 시작  -->
	<div id="layer_m_preview_iframe_view"
		class="layer_box external-mail hide popup21"
		style="margin-left: -501px; margin-top: -311px; z-index: 1020; display: block;">
		<div class="title_layer text_variables">미리보기</div>
		<div class="table_scrollbox" style="height: 462px; overflow: hidden">
			<iframe id="ifPreviewSrc" style="height: 462px; width: 100%;"
				border="0" frameborder="0"
				src="/gabia.biz/mail/webmail/s_sign_preview/324"></iframe>
		</div>
		<div class="layer_button">
			<button class="btn_variables doublelayer" type="button"
				onclick="$('ifPreviewSrc').src = ''; $j('#layer_m_preview_iframe_view').hidePopup(true);">닫기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer doublelayer"
			onclick="$('ifPreviewSrc').src = ''; $j('#layer_m_preview_iframe_view').hidePopup(true);"
			title="레이어 닫기"><span class="blind">레이어 닫기</span></a>
	</div>
	<!-- 서명 미리보기 모달 끝  -->
	--%>


	<div id="main_layer_div"></div>

	<div class="layer_box small alarm hide popup1 " style="" id="HWA_MAIN">
		<p class="text" id="HWA_MSG"
			style="padding-top: 10px; padding-left: 30px; padding-right: 30px;"></p>
		<div class="layer_button">
			<button class="btn_variables" type="button" onclick="hidePopup();"
				id="HWA_MAIN_OK">확인</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>

	<div class="layer_box large hide dns_intro_layer" style="width: 550px;">
		<div class="title_layer text_variables">메일 서비스 이용 안내</div>
		<p class="bold body_bold">메일 서비스를 이용하시려면 하이웍스용 DNS 정보 설정이 필요합니다.</p>
		<p class="mgt_15">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			가비아 등록 도메인은 자동 설정을 지원합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open(&#39;https://domain.gabia.com/api/hiworksdns/domainsetting?domain=gabia.biz&#39;)">가비아
				도메인 자동 설정하기</button>
		</div>
		<p class="pdt_20">
			<span
				style="display: inline-block; width: 3px; height: 3px; vertical-align: middle; background: #676767;"></span>
			타사 등록 도메인은 DNS 정보를 직접 설정해야 합니다.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open(&#39;https://customer.gabia.com/manuals_pop/manual_set.php?service=webmail_hosting&amp;fact=mailzine&amp;seq_no=2221&#39;)">설정
				방법 보기</button>
		</div>
		<p class="bold body_bold mgt_50">
			※ 하이웍스용 DNS 정보 설정을 완료하셨다면 메일 용량을 할당한 후 메일 서비스를<br> 이용할 수 있습니다.
			‘오피스 관리’에서 계정별 메일 용량을 설정해주세요.
		</p>
		<div class="layer_button mgt_10 ta_l">
			<button type="button" class="btn_variables"
				onclick="location:href=window.open(&#39;/gabia.biz/admin/Orgmain&#39;)">오피스관리
				페이지 가기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="hidePopup();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
	</div>



	<!-- dhlhljljlk -->
	<!-- 
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="position: absolute; top: 167px; left: 499px; z-index: 101; display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전달"><span class="ui-icon ui-icon-circle-triangle-w">이전달</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음달"><span class="ui-icon ui-icon-circle-triangle-e">다음달</span></a><div class="ui-datepicker-title"><select class="ui-datepicker-year" data-handler="selectYear" data-event="change"><option value="2023" selected="selected">2023</option><option value="2024">2024</option><option value="2025">2025</option><option value="2026">2026</option></select>년<select class="ui-datepicker-month" data-handler="selectMonth" data-event="change"><option value="0">1월</option><option value="1">2월</option><option value="2">3월</option><option value="3">4월</option><option value="4">5월</option><option value="5">6월</option><option value="6">7월</option><option value="7">8월</option><option value="8">9월</option><option value="9">10월</option><option value="10">11월</option><option value="11" selected="selected">12월</option></select></div></div><table class="ui-datepicker-calendar"><thead><tr><th scope="col" class="ui-datepicker-week-end"><span title="일">일</span></th><th scope="col"><span title="월">월</span></th><th scope="col"><span title="화">화</span></th><th scope="col"><span title="수">수</span></th><th scope="col"><span title="목">목</span></th><th scope="col"><span title="금">금</span></th><th scope="col" class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023"><a class="ui-state-default ui-priority-secondary" href="#">26</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023"><a class="ui-state-default ui-priority-secondary" href="#">27</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023"><a class="ui-state-default ui-priority-secondary" href="#">28</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023"><a class="ui-state-default ui-priority-secondary" href="#">29</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="10" data-year="2023"><a class="ui-state-default ui-priority-secondary" href="#">30</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">30</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="11" data-year="2023"><a class="ui-state-default" href="#">31</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024"><a class="ui-state-default ui-priority-secondary" href="#">1</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024"><a class="ui-state-default ui-priority-secondary" href="#">2</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024"><a class="ui-state-default ui-priority-secondary" href="#">3</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024"><a class="ui-state-default ui-priority-secondary" href="#">4</a></td><td class=" ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024"><a class="ui-state-default ui-priority-secondary" href="#">5</a></td><td class=" ui-datepicker-week-end ui-datepicker-other-month " data-handler="selectDay" data-event="click" data-month="0" data-year="2024"><a class="ui-state-default ui-priority-secondary" href="#">6</a></td></tr></tbody></table></div>
	-->
	<!-- jhlkjjljkl -->


	<%-- 받는사람, 참조, 숨은참조 자동완성 시작 --%>
	<ul class="dropdown-menu autoEmpList" id="autoEmpList_income" tabindex="0" style="display: block; top: 157px; left: 409px; min-width: 746px; width: auto;">
		
		<li my_name="김이사" my_email="kim" class="ui-menu-item" id="ui-id-22" tabindex="-1">
			<a href="javascript:void(0)">
				<span class="name">
					<nobr>
						김이사 &lt;<b>k</b>im&gt;
					</nobr>
				</span>
			</a>
		</li>
		<!-- 
		<li my_name="김이사" my_email="kim" class="ui-menu-item" id="ui-id-22" tabindex="-1">
			<a href="javascript:void(0)">
				<span class="name">
					<nobr>
						김이사 &lt;<b>k</b>im&gt;
					</nobr>
				</span>
			</a>
		</li>
		<li my_name="박상무" my_email="park" class="ui-menu-item" id="ui-id-23" tabindex="-1">
			<a href="javascript:void(0)">
				<span class="name">
					<nobr>
						박상무 &lt;par<b>k</b>&gt;
					</nobr>
				</span>
			</a>
		</li>
		 -->
		<li my_name="" my_email="" class="ui-menu-item" id="ui-id-24" tabindex="-1">
			<a onclick="javascript:void(0)" href="#">
				<span class="point_color">자동 완성 설정</span>
			</a>
		</li>
	</ul>
	<%-- 받는사람, 참조, 숨은참조 자동완성 끝 --%>

	<ul class="dropdown-menu autoEmpList" id="autoEmpList_ref" tabindex="0" style="display: block; top: 192px; left: 409px; min-width: 746px; width: auto;">
		<li my_name="김이사" my_email="kim" class="ui-menu-item" id="ui-id-7" tabindex="-1">
			<a href="javascript:void(0)">
				<span class="name">
					<nobr>
						김이사 &lt;<b>ki</b>m&gt;
					</nobr>
				</span>
			</a>
		</li>
		<li my_name="" my_email="" class="ui-menu-item" id="ui-id-8" tabindex="-1">
			<a onclick="javascript:void(0)" href="#">
				<span class="point_color">자동 완성 설정</span>
			</a>
		</li>
	</ul>


	<ul class="dropdown-menu autoEmpList" id="autoEmpList_hiddenRef" tabindex="0" style="display: block; width: auto; top: 240px; left: 409px; min-width: 746px;">
		<li my_name="김이사" my_email="kim" class="ui-menu-item" id="ui-id-9" tabindex="-1">
			<a href="javascript:void(0)">
				<span class="name">
					<nobr>
						김이사 &lt;<b>k</b>im&gt;
					</nobr>
				</span>
			</a>
		</li>
		<li my_name="박상무" my_email="park" class="ui-menu-item" id="ui-id-10" tabindex="-1">
			<a href="javascript:void(0)">
				<span class="name">
					<nobr>
						박상무 &lt;par<b>k</b>&gt;
					</nobr>
				</span>
			</a>
		</li>
		<li my_name="" my_email="" class="ui-menu-item" id="ui-id-11" tabindex="-1">
			<a onclick="javascript:void(0)" href="#">
				<span class="point_color">자동 완성 설정</span>
			</a>
		</li>
	</ul>






	<deepl-input-controller>
	<template shadowrootmode="open">
		<link rel="stylesheet"
			href="chrome-extension://cofdbpoegempjloogbagkncekinflcnj/build/content.css">
		<div>
			<div class="dl-input-translation-container svelte-ju4595">
				<div></div>
			</div>
		</div>
	</template>
	</deepl-input-controller>

	<!-- /////////// 모달 시작 ////////////// -->

	
	
	<div id="popupBase" style="display: none;">
	<%--
		<!-- 받을 사람 주소록에서 찾기 모달 시작 -->
		<div class="layer_box large address hide popup8"
			id="div_mail_address_view_new"
			style="margin-left: -411px; margin-top: -310.5px; display: block;">
			<div class="title_layer text_variables">주소록 선택</div>
			<ul class="tab_box after" id="selectorTab">
				<li><a href="#" class="on" onclick="addressbook.setTab('0');">개인주소록</a></li>
				<li><a href="#" onclick="addressbook.setTab('1');">공유주소록</a></li>
				<li><a href="#" onclick="addressbook.setTab('2');">조직</a></li>
			</ul>
			<div class="search-address" id="searchP">
				<span id="spnSearchCtl"> <input type="radio" value="name"
					name="searchField" id="rdo_sch_name"
					onclick="$('keyword').focus();" checked=""><label
					for="rdo_sch_name">이름 , 주소</label>&nbsp;&nbsp; <input type="radio"
					value="tag" name="searchField" id="rdo_sch_tag"
					onclick="$('keyword').focus();"><label for="rdo_sch_tag">태그</label>&nbsp;&nbsp;

				</span> <input type="text" style="height: 21px" class="text-box"
					title="검색어 입력"
					onkeypress="if(event.keyCode == 13){$('addrCancelSearch').show(); addressbook.click_searchBtn();}"
					id="keyword"> <a href="#" class="btn-search"
					onclick="addressbook.click_searchBtn();$('addrCancelSearch').show()">검색</a>
				<a href="#" id="addrCancelSearch" style="display: none"
					onclick="addressbook.setTab(addressbook.currentTab);$('addrCancelSearch').hide()"
					class="search_bt weakblue"><span class="sp_menu searchCancel"></span>검색
					취소</a>
				<div style="display: none">
					<div class="title"
						style="display: none; width: 100%; font-weight: normal;"
						id="searchMessage">
						<span id="searchKeyword"></span> 검색결과 : <span id="searchCount"></span>
						<a class="btn-search"
							onclick="addressbook.setTab(addressbook.currentTab);">검색초기화</a>
					</div>
				</div>
			</div>

			<div class="address-choice-form after">
				<div class="fl mail">
					<div class="category_list" id="divAddressCategoryList">
						<select id="leftList" multiple=""
							onclick="addressbook.click_leftList(this)">
							<option value="all" title="" selected="">전체 주소 (2)</option>
							<option value="notag" title="">미지정 (1)</option>
							<option value="415" title="">CEO (1)</option>
						</select>
						<div id="treeDiv" style="white-space: nowrap; display: none;"
							class="treeDiv OrgTree"></div>
						<div id="leftProgressDiv" style="display: none;"
							class="progressDiv">
							<img src="/assets/images/common/icon/progress_big.gif">
						</div>
					</div>

					<div class="list">
						<select id="rightList" multiple=""
							ondblclick="addressbook.copyOption('selTO');">
							<option value="32851" title="" 김체리="" 대표"="" (cherrykim
								@cherryhongsam.kr)"="">"김체리 대표"
								(cherrykim@cherryhongsam.kr)</option>
							<option value="32852" title="" 이테크="" 대표"="" (techlee
								@gabiatech.com)"="">"이테크 대표" (techlee@gabiatech.com)</option>
						</select>
						<div id="rightProgressDiv" style="display: none;"
							class="progressDiv">
							<img src="/assets/images/common/icon/progress_big.gif">
						</div>
						<div class="add-btn mail">
							<a href="#none" class="blind icon btn-to"
								onclick="addressbook.copyOption('selTO');">받는 사람 추가</a> <a
								href="#none" class="blind icon btn-see"
								onclick="addressbook.copyOption('selCC');">참조 추가</a> <a
								href="#none" class="blind icon btn-bcc"
								onclick="addressbook.copyOption('selBCC');">숨은 참조 추가</a>
						</div>
						<div class="choice-area">
							<a href="#none" class="text_variables"
								onclick="addressbook.click_rightSelect('select');">전체</a> <a
								href="#" class="text_variables"
								onclick="addressbook.click_rightSelect('deselect');">선택안함</a>
							<div class="after page_select_wrap mail" id="pagingP"></div>

						</div>
					</div>
				</div>

				<div class="to-item mail">
					<h5>
						받는 사람 <span id="spselTO">1</span>
					</h5>
					<div class="to">
						<select multiple="" id="selTO"
							ondblclick="addressbook.removeOption('selTO');"
							onkeyup="if(event.keyCode ==46) addressbook.removeOption('selTO');">

							<option>"대표이사" (ceo@gabia.biz)</option>
						</select>
						<div class="del-btn">
							<a href="#none" class="blind icon btn-to"
								onclick="addressbook.removeOption('selTO');">받는 사람 삭제</a>
						</div>
					</div>
					<h5>
						참조 <span id="spselCC">0</span>
					</h5>
					<div class="see">
						<select multiple="" id="selCC"
							ondblclick="addressbook.removeOption('selCC');"
							onkeyup="if(event.keyCode ==46) addressbook.removeOption('selCC');">

						</select>
						<div class="del-btn">
							<a href="#none" class="blind icon btn-see"
								onclick="addressbook.removeOption('selCC');">참조 삭제</a>
						</div>
					</div>
					<h5>
						숨은 참조 <span id="spselBCC">0</span>
					</h5>
					<div class="bcc">
						<select multiple="" id="selBCC"
							ondblclick="addressbook.removeOption('selBCC');"
							onkeyup="if(event.keyCode ==46) addressbook.removeOption('selBCC');">

						</select>
						<div class="del-btn">
							<a href="#none" class="blind icon btn-bcc"
								onclick="addressbook.removeOption('selBCC');">숨은 참조 삭제</a>
						</div>
					</div>
				</div>
			</div>
			<div class="layer_button">
				<button class="btn_variables" type="button"
					onclick="addressbook.closeApply();hidePopup();">추가</button>
				<button type="button" onclick="hidePopup();">닫기</button>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer"
				onclick="hidePopup();return false;" title="레이어 닫기"><span
				class="blind">레이어 닫기</span></a>
		</div>
	</div>
	<!-- 받을 사람 주소록에서 찾기 모달 끝 -->
 	--%>

	<%-- 
	<!-- 서명설정_서명목록만들기/수정 모달 시작 -->
	<div class="layer_box large signature"
		style="margin-left: -501px; margin-top: -209px;"
		id="layer_m_sign_view">
		<div class="title_layer text_variables">서명 만들기</div>
		<div class="table_rowspan">
			<table cellspacing="0" cellpadding="0" class="make-signature">
				<colgroup>
					<col width="24%">
					<col width="76%">
				</colgroup>
				<tbody>
					<tr>
						<th>서명 제목</th>
						<td><input id="txtSubject" class="text-box"
							style="width: 243px;" type="text"><input
							id="chkBasicSign" type="checkbox" class="label-blankL" value="Y">
							<label for="chkBasicSign">기본 서명으로 설정</label></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="se se-edit-mode editer-area se-classic-editor se-blur"
			id="synapEditor" style="width: 100%; height: 300px;">
			<div class="se-container">
				<div class="se-dim-layer" style="height: 302px;">
					<div class="se-loader">
						<div></div>
						<div></div>
						<div></div>
						<span></span>
					</div>
				</div>
				<div class="se-balloon-container"></div>
				<div class="se-dialog-container"></div>
				<div class="se-calculate"></div>
				<input class="se-file-selector" type="file" name="file">
				<iframe class="se-print se-hide"></iframe>
				<div class="se-clipboard" contenteditable="true" tabindex="-1"></div>
				<div class="se-tooltip-layer">
					<div class="se-tooltip se-hide">
						<div class="se-tooltip-arrow se-hide"></div>
						<span class="se-label"></span>
					</div>
				</div>
			</div>
			<div class="se-header">
				<div class="se-toolbar">
					<div class="se-component-row se-use-navi">
						<div class="se-prev se-clickable se-rotate-180 se-shrink">
							<div class="se-navi-icon"
								style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div>
						</div>
						<div class="se-component-wrapper" style="width: calc(100% + 0px);">
							<div class="se-dropdown" tabindex="-1" name="fontFamilyWithText"
								style="width: 85px;">
								<button type="button"
									class="se-dropdown-btn-wrapper se-single-btn se-clickable"
									value="text" aria-label="글꼴" aria-haspopup="true">
									<div class="se-dropdown-btn" value="main">
										<span class="se-label">맑은 고딕</span>
									</div>
									<div class="se-dropdown-btn" value="sub">
										<span class="se-arrow se-rotate-180"></span>
									</div>
								</button>
								<div class="se-dropdown-menu-wrapper">
									<ul class="se-dropdown-menu" role="menu">
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="기본값">
												<span class="se-label">기본값</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable se-active" role="menuitem"
												aria-label="맑은 고딕">
												<span class="se-label" style="font-family: &amp; amp;">맑은
													고딕</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="돋움">
												<span class="se-label" style="font-family: 돋움;">돋움</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="돋움체">
												<span class="se-label" style="font-family: 돋움체;">돋움체</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="굴림">
												<span class="se-label" style="font-family: 굴림;">굴림</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="굴림체">
												<span class="se-label" style="font-family: 굴림체;">굴림체</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="바탕">
												<span class="se-label" style="font-family: 바탕;">바탕</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="바탕체">
												<span class="se-label" style="font-family: 바탕체;">바탕체</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Arial">
												<span class="se-label" style="font-family: Arial;">Arial</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem"
												aria-label="Arial Black">
												<span class="se-label" style="font-family: &amp; amp;">Arial
													Black</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Tahoma">
												<span class="se-label" style="font-family: Tahoma;">Tahoma</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Verdana">
												<span class="se-label" style="font-family: Verdana;">Verdana</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Sans-serif">
												<span class="se-label" style="font-family: Sans-serif;">Sans-serif</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Serif">
												<span class="se-label" style="font-family: Serif;">Serif</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Monospace">
												<span class="se-label" style="font-family: Monospace;">Monospace</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Cursive">
												<span class="se-label" style="font-family: Cursive;">Cursive</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Fantasy">
												<span class="se-label" style="font-family: Fantasy;">Fantasy</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem"
												aria-label="Times New Roman">
												<span class="se-label" style="font-family: &amp; amp;">Times
													New Roman</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem"
												aria-label="Century Gothic">
												<span class="se-label" style="font-family: &amp; amp;">Century
													Gothic</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem"
												aria-label="Courier New">
												<span class="se-label" style="font-family: &amp; amp;">Courier
													New</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="Georgia">
												<span class="se-label" style="font-family: Georgia;">Georgia</span>
											</button></li>
									</ul>
								</div>
							</div>
							<div class="se-dropdown" tabindex="-1" name="fontSizeWithText"
								style="width: 85px;">
								<button type="button"
									class="se-dropdown-btn-wrapper se-single-btn se-clickable"
									value="text" aria-label="크기" aria-haspopup="true">
									<div class="se-dropdown-btn" value="main">
										<span class="se-label">16px</span>
									</div>
									<div class="se-dropdown-btn" value="sub">
										<span class="se-arrow se-rotate-180"></span>
									</div>
								</button>
								<div class="se-dropdown-menu-wrapper">
									<ul class="se-dropdown-menu" role="menu">
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="기본값">
												<span class="se-label">기본값</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="9px">
												<span class="se-label" style="font-size: 9px;">9px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="10px">
												<span class="se-label" style="font-size: 10px;">10px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="11px">
												<span class="se-label" style="font-size: 11px;">11px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="12px">
												<span class="se-label" style="font-size: 12px;">12px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="13px">
												<span class="se-label" style="font-size: 13px;">13px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="14px">
												<span class="se-label" style="font-size: 14px;">14px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable se-active" role="menuitem"
												aria-label="16px">
												<span class="se-label" style="font-size: 16px;">16px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="18px">
												<span class="se-label" style="font-size: 18px;">18px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="24px">
												<span class="se-label" style="font-size: 24px;">24px</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="32px">
												<span class="se-label" style="font-size: 32px;">32px</span>
											</button></li>
									</ul>
								</div>
							</div>
							<div class="se-dropdown" tabindex="-1" name="lineHeight">
								<button type="button"
									class="se-dropdown-btn-wrapper se-single-btn se-clickable"
									value="icon" aria-label="줄간격" aria-haspopup="true">
									<div class="se-dropdown-btn" value="main">
										<div class="se-icon"
											style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpolygon%20points%3D%225.268%2C4.831%205.952%2C4.147%202.979%2C1.171%200%2C4.15%200.685%2C4.833%202.089%2C4.03%202.084%2C12.154%200.685%2C11.291%200%2C11.977%202.976%2C14.951%205.952%2C11.975%205.268%2C11.289%204.036%2C12.137%204.031%2C4.031%20%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%222.092%22%20width%3D%228.053%22%20height%3D%222.035%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%227.019%22%20width%3D%228.053%22%20height%3D%222.036%22%2F%3E%3Crect%20x%3D%227.947%22%20y%3D%2212.053%22%20width%3D%228.053%22%20height%3D%222.035%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
									</div>
									<div class="se-dropdown-btn" value="sub">
										<span class="se-arrow se-rotate-180"></span>
									</div>
								</button>
								<div class="se-dropdown-menu-wrapper">
									<ul class="se-dropdown-menu" role="menu">
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="기본값">
												<span class="se-label">기본값</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="1">
												<span class="se-label">1</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="1.2">
												<span class="se-label">1.2</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="1.4">
												<span class="se-label">1.4</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable se-active" role="menuitem"
												aria-label="1.6">
												<span class="se-label">1.6</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="1.8">
												<span class="se-label">1.8</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="2">
												<span class="se-label">2</span>
											</button></li>
									</ul>
								</div>
							</div>
							<button type="button" class="se-button se-clickable" name="bold"
								aria-label="굵게">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M8.48%2C1.043c3.928%2C0%2C5.341%2C1.469%2C5.341%2C3.476c0%2C1.508-1.004%2C2.419-4.276%2C2.976%20c3.684%2C0.357%2C5.176%2C1.728%2C5.176%2C3.792c0%2C1.945-1.432%2C3.71-6.957%2C3.71H1.016v-0.675l1.997-0.179%20c0.062-2.086%2C0.071-3.81%2C0.071-5.953V7.475c0-2.025-0.01-3.592-0.071-5.597L1.016%2C1.717V1.043H8.48z%20M7.039%2C1.964%20c-0.06%2C1.945-0.06%2C3.062-0.06%2C5.106h0.377c2.107%2C0%2C3.15-0.926%2C3.15-2.892c0-1.808-0.858-2.214-2.925-2.214H7.039z%20M7.662%2C14.047%20c2.21%2C0%2C3.521-0.517%2C3.521-2.701c0-2.302-1.168-3.336-3.644-3.336H6.979c0%2C2.363%2C0%2C3.912%2C0.06%2C6.037H7.662z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable"
								name="italic" aria-label="기울임꼴">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpath%20d%3D%22M10.912%2C1.992c-0.537%2C1.922-1.058%2C3.502-1.593%2C5.502L9.048%2C8.506c-0.52%2C1.942-1.05%2C3.61-1.551%2C5.551%20l1.985%2C0.22l-0.191%2C0.712H2.796l0.19-0.712l2.081-0.22c0.556-1.921%2C1.08-3.569%2C1.61-5.551l0.271-1.012%20C7.47%2C5.554%2C8%2C3.934%2C8.481%2C1.992L6.517%2C1.774l0.191-0.713h6.369l-0.192%2C0.713L10.912%2C1.992z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable"
								name="underline" aria-label="밑줄">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%2214.031%22%20width%3D%2216%22%20height%3D%220.946%22%2F%3E%3C%2Fg%3E%3Cpath%20d%3D%22M13.053%2C1.016H10V2h1.017l0.032%2C5.648c0.016%2C3.052-0.488%2C4.212-2.551%2C4.212%20c-1.885%2C0-2.549-1.002-2.549-3.989V6.425c0-1.501%2C0.003-2.969%2C0.032-4.425h1.04V1.016H2.984V2h1.022%20c0.042%2C1.477%2C0.044%2C2.964%2C0.044%2C4.425v1.811c0%2C3.432%2C1.354%2C4.783%2C4.021%2C4.783c2.604%2C0%2C3.895-1.494%2C3.912-5.069L12.015%2C2h1.038%20V1.016z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable"
								name="strike" aria-label="취소선">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M8.729%2C7.118c2.568%2C1.01%2C3.521%2C2.052%2C3.521%2C3.82c0%2C2.172-1.82%2C4.006-4.632%2C4.006%20c-1.438%2C0-2.846-0.439-3.766-0.992l0.105-2.93H4.91l0.591%2C2.39c0.606%2C0.305%2C1.162%2C0.422%2C1.96%2C0.422%20c1.805%2C0%2C2.969-0.927%2C2.969-2.392c0-1.176-0.644-1.783-2.291-2.406l-0.746-0.32C5.327%2C7.875%2C4.062%2C6.797%2C4.062%2C4.929%20c0-2.188%2C1.856-3.879%2C4.354-3.879c1.301%2C0%2C2.326%2C0.371%2C3.191%2C0.977l-0.104%2C2.966h-0.971L9.941%2C2.604%20c-0.45-0.236-0.901-0.32-1.457-0.32c-1.545%2C0-2.62%2C0.726-2.62%2C2.124c0%2C1.179%2C0.747%2C1.852%2C2.083%2C2.374L8.729%2C7.118z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%220.004%22%20y%3D%228.031%22%20width%3D%2215.992%22%20height%3D%220.946%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-color-button se-clickable"
								name="fontColor" aria-label="글자색">
								<div class="se-color-button-wrapper">
									<div class="se-icon"
										style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2012%22%3E%3Cg%3E%3Cpath%20d%3D%22M8.985%2C0.991C8.956%2C2.359%2C8.956%2C3.443%2C8.956%2C4.838v0.77c0%2C1.368%2C0%2C3.061%2C0.029%2C4.43l2.004%2C0.17v0.785%20H5.043v-0.785l1.983-0.17c0.029-1.354%2C0.029-3.033%2C0.029-4.43v-0.77c0-1.396%2C0-2.479-0.029-3.847H4.713L4.271%2C2.979H3.463%20l0.134-2.984h8.836l0.104%2C2.983h-0.779l-0.455-1.987H8.985z%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
									<div class="se-color-view">
										<svg xmlns="http://www.w3.org/2000/svg" version="1.1"
											viewBox="0 0 12 3" focusable="false">
                        <g>
                            <rect x="0" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="2" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="4" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="6" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="8" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="10" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="0" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="2" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="4" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="6" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="8" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="10" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="1" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="3" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="5" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="7" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="9" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="11" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                        </g>
                    </svg>
										<div class="se-current-color"></div>
									</div>
								</div>
							</button>
							<button type="button" class="se-color-button se-clickable"
								name="fontBackgroundColor" aria-label="글자배경색">
								<div class="se-color-button-wrapper">
									<div class="se-icon"
										style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2012%22%3E%3Cg%3E%3Cpath%20d%3D%22M2%2C0.031v11.032h11.969V0.031H2z%20M10.496%2C4.048l-0.381-1.073H8.981c-0.02%2C0.929-0.02%2C1.453-0.02%2C2.408%20v0.455c0%2C0.927%2C0%2C1.617%2C0.02%2C2.55l1.099%2C0.083v0.566H5.943V8.471l1.096-0.083c0.01-0.917%2C0.01-1.604%2C0.01-2.55V5.383%20c0-0.938%2C0-1.47-0.01-2.408H5.915L5.524%2C4.048h-0.52l0.065-1.885h5.892l0.057%2C1.885H10.496z%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
									<div class="se-color-view">
										<svg xmlns="http://www.w3.org/2000/svg" version="1.1"
											viewBox="0 0 12 3" focusable="false">
                        <g>
                            <rect x="0" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="2" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="4" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="6" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="8" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="10" y="0" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="0" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="2" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="4" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="6" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="8" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="10" y="2" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="1" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="3" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="5" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="7" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="9" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                            <rect x="11" y="1" fill="#C9C9C9" width="1"
												height="1"></rect>
                        </g>
                    </svg>
										<div class="se-current-color"></div>
									</div>
								</div>
							</button>
							<div class="se-separator-vert"></div>
							<div class="se-dropdown" tabindex="-1" name="bulletList">
								<div class="se-dropdown-btn-wrapper se-dual-btn" value="icon">
									<button type="button" class="se-dropdown-btn se-clickable"
										value="main" aria-label="글머리 기호">
										<div class="se-icon"
											style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%222.035%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%228.021%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.012%22%20y%3D%2214.03%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%222.521%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%228.501%22%20r%3D%221.49%22%2F%3E%3Ccircle%20cx%3D%221.499%22%20cy%3D%2214.511%22%20r%3D%221.49%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
									</button>
									<button type="button" class="se-dropdown-btn se-clickable"
										value="sub" aria-label="글머리 기호" aria-haspopup="true">
										<span class="se-arrow se-rotate-180"></span>
									</button>
								</div>
								<div class="se-dropdown-menu-wrapper">
									<ul class="se-dropdown-menu" role="menu">
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="검은색 원">
												<span class="se-label">●</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="흰색 원">
												<span class="se-label">○</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="검은색 네모">
												<span class="se-label">■</span>
											</button></li>
									</ul>
								</div>
							</div>
							<div class="se-dropdown" tabindex="-1" name="numberedList">
								<div class="se-dropdown-btn-wrapper se-dual-btn" value="icon">
									<button type="button" class="se-dropdown-btn se-clickable"
										value="main" aria-label="글머리 번호">
										<div class="se-icon"
											style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%222.016%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%228.001%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.011%22%20y%3D%2214.011%22%20width%3D%2210.889%22%20height%3D%220.963%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Crect%20width%3D%222.021%22%20height%3D%221.002%22%2F%3E%3Crect%20x%3D%221.042%22%20width%3D%220.979%22%20height%3D%224.002%22%2F%3E%3Crect%20y%3D%223.002%22%20width%3D%223.021%22%20height%3D%221%22%2F%3E%3Cpolygon%20points%3D%220%2C5.003%200%2C6.023%202.021%2C6.023%202.021%2C6.982%200%2C6.982%200%2C7.731%200%2C8.001%200%2C9.045%200%2C9.314%200%2C10.064%203.021%2C10.064%203.021%2C9.045%201%2C9.045%201%2C8.001%203.021%2C8.001%203.021%2C7.419%203.021%2C6.982%203.021%2C6.023%203.021%2C5.835%203.021%2C5.003%20%22%2F%3E%3Cpolygon%20points%3D%220%2C11.043%200%2C12.002%202.063%2C12.002%202.063%2C13.021%200%2C13.021%200%2C13.98%202.063%2C13.98%202.063%2C15.041%200%2C15.041%200%2C16%202.063%2C16%203.021%2C16%203.021%2C15.041%203.021%2C13.98%203.021%2C13.021%203.021%2C12.002%203.021%2C11.314%203.021%2C11.043%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
									</button>
									<button type="button" class="se-dropdown-btn se-clickable"
										value="sub" aria-label="글머리 번호" aria-haspopup="true">
										<span class="se-arrow se-rotate-180"></span>
									</button>
								</div>
								<div class="se-dropdown-menu-wrapper">
									<ul class="se-dropdown-menu" role="menu">
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="1.">
												<span class="se-label">1.</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="A.">
												<span class="se-label">A.</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="a.">
												<span class="se-label">a.</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="I.">
												<span class="se-label">I.</span>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="i.">
												<span class="se-label">i.</span>
											</button></li>
									</ul>
								</div>
							</div>
							<button type="button" class="se-button se-clickable se-disable"
								name="decreaseIndent" aria-label="내어쓰기">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%220.041%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%223.093%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%227.099%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%2211.113%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20y%3D%2215.035%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%223.91%2C11.934%20-0.001%2C8.061%203.91%2C4.184%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable"
								name="increaseIndent" aria-label="들여쓰기">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20y%3D%220.041%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%223.093%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%227.099%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%226.031%22%20y%3D%2211.113%22%20width%3D%229.969%22%20height%3D%221.922%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20y%3D%2215.035%22%20width%3D%2216%22%20height%3D%221.025%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%220%2C4.184%203.911%2C8.057%200%2C11.934%20%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<div class="se-separator-vert"></div>
							<div class="se-dropdown" tabindex="-1" name="align">
								<button type="button"
									class="se-dropdown-btn-wrapper se-single-btn se-clickable"
									value="icon" aria-label="정렬" aria-haspopup="true">
									<div class="se-dropdown-btn" value="main">
										<div class="se-icon"
											style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
									</div>
									<div class="se-dropdown-btn" value="sub">
										<span class="se-arrow se-rotate-180"></span>
									</div>
								</button>
								<div class="se-dropdown-menu-wrapper">
									<ul class="se-dropdown-menu" role="menu" value="icon">
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="왼쪽 정렬">
												<div class="se-icon"
													style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="가운데 정렬">
												<div class="se-icon"
													style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%223%22%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%223%22%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="오른쪽 정렬">
												<div class="se-icon"
													style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%226%22%20y%3D%225.092%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20x%3D%226%22%20y%3D%2213.029%22%20width%3D%2210%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
											</button></li>
										<li role="none"><button type="button"
												class="se-clickable" role="menuitem" aria-label="양쪽 정렬">
												<div class="se-icon"
													style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Crect%20y%3D%221.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%225.03%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%2213.006%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3Crect%20y%3D%229.061%22%20width%3D%2216%22%20height%3D%222.031%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
											</button></li>
									</ul>
								</div>
							</div>
							<div class="se-separator-vert"></div>
							<button type="button" class="se-button se-clickable" name="image"
								aria-label="이미지">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cpath%20d%3D%22M0.021%2C1.001v13.968h16V1.001H0.021z%20M15.064%2C2.055v7.968l-1.959-2.034L10%2C10.252L6.02%2C5.015L1.078%2C9%20V2.055H15.064z%20M1.078%2C14.043v-3.916l4.806-3.894l4.002%2C5.261l3.135-2.285l2.043%2C2.115v2.719H1.078z%22%2F%3E%3Cpath%20d%3D%22M10.982%2C7.017c1.098%2C0%2C1.988-0.892%2C1.988-1.987c0-1.095-0.891-1.987-1.988-1.987%20c-1.094%2C0-1.987%2C0.892-1.987%2C1.987C8.996%2C6.125%2C9.889%2C7.017%2C10.982%2C7.017z%20M10.982%2C3.949c0.598%2C0%2C1.082%2C0.485%2C1.082%2C1.081%20c0%2C0.596-0.484%2C1.08-1.082%2C1.08c-0.596%2C0-1.078-0.484-1.078-1.08C9.904%2C4.434%2C10.387%2C3.949%2C10.982%2C3.949z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable"
								name="specialCharacter" aria-label="특수문자">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M14.711%2C8.949c-0.248%2C0.689-0.578%2C1.309-0.992%2C1.857c-0.428%2C0.549-0.916%2C1.02-1.465%2C1.416%20c-0.549%2C0.391-1.133%2C0.688-1.75%2C0.885v0.887h3.604v1.982H9.809c-0.359%2C0-0.574-0.106-0.643-0.317%20c-0.07-0.211-0.105-0.442-0.105-0.694v-1.898c0-0.185%2C0.021-0.344%2C0.064-0.476c0.041-0.135%2C0.1-0.243%2C0.166-0.327%20c0.055-0.1%2C0.104-0.168%2C0.156-0.213c0.051-0.039%2C0.086-0.068%2C0.104-0.083c1.252-0.239%2C2.207-0.809%2C2.867-1.71%20c0.66-0.9%2C0.992-2.089%2C0.992-3.566c0-1.617-0.494-2.911-1.479-3.882c-0.988-0.97-2.287-1.457-3.899-1.457%20c-0.789%2C0-1.51%2C0.134-2.162%2C0.4C5.22%2C2.022%2C4.655%2C2.388%2C4.174%2C2.852C3.711%2C3.329%2C3.351%2C3.9%2C3.094%2C4.561%20C2.835%2C5.223%2C2.707%2C5.953%2C2.707%2C6.756c0%2C1.378%2C0.279%2C2.471%2C0.837%2C3.282c0.558%2C0.81%2C1.403%2C1.422%2C2.534%2C1.844%20c0.311%2C0.03%2C0.536%2C0.132%2C0.684%2C0.308c0.146%2C0.179%2C0.242%2C0.361%2C0.295%2C0.563c0.053%2C0.209%2C0.078%2C0.402%2C0.078%2C0.579%20c0%2C0.176%2C0%2C0.271%2C0%2C0.285c0%2C0.026%2C0%2C0.137%2C0%2C0.325c0%2C0.189-0.01%2C0.397-0.025%2C0.621c0%2C0.24-0.01%2C0.459-0.025%2C0.654%20c-0.019%2C0.197-0.035%2C0.311-0.051%2C0.338c-0.053%2C0.129-0.121%2C0.229-0.207%2C0.307c-0.084%2C0.078-0.205%2C0.115-0.361%2C0.115h-4.47%20v-1.98h3.623v-0.822c-1.358-0.406-2.472-1.152-3.348-2.236c-0.873-1.084-1.31-2.462-1.31-4.139%20c0-0.915%2C0.171-1.779%2C0.514-2.594C1.815%2C3.386%2C2.304%2C2.668%2C2.939%2C2.05C3.573%2C1.432%2C4.324%2C0.939%2C5.19%2C0.572%20c0.866-0.364%2C1.813-0.549%2C2.845-0.549c1.028%2C0%2C1.975%2C0.174%2C2.842%2C0.519c0.865%2C0.345%2C1.607%2C0.82%2C2.227%2C1.424%20s1.102%2C1.311%2C1.453%2C2.119c0.354%2C0.811%2C0.527%2C1.686%2C0.527%2C2.628C15.084%2C7.516%2C14.959%2C8.262%2C14.711%2C8.949z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable" name="link"
								aria-label="링크">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M10.76%2C9.406L6.615%2C5.262l5.256-5.255l4.145%2C4.143L10.76%2C9.406z%20M8.455%2C5.262l2.305%2C2.306l3.418-3.418%20l-2.307-2.305L8.455%2C5.262z%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpath%20d%3D%22M4.171%2C15.993L0.027%2C11.85l5.24-5.24l4.145%2C4.145L4.171%2C15.993z%20M1.866%2C11.85l2.305%2C2.308l3.403-3.4%20L5.267%2C8.449L1.866%2C11.85z%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%227.485%22%20y%3D%224.296%22%20transform%3D%22matrix(0.7007%200.7135%20-0.7135%200.7007%208.1429%20-3.4098)%22%20width%3D%221.3%22%20height%3D%227.409%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable se-disable"
								name="unlink" aria-label="링크 해제">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cpolygon%20points%3D%2210.982%2C9.141%2010.063%2C8.22%2014.084%2C4.201%2011.818%2C1.938%207.8%2C5.958%206.88%2C5.039%2011.818%2C0.101%2015.92%2C4.201%20%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Cpolygon%20points%3D%224.221%2C15.898%200.121%2C11.798%205.06%2C6.859%205.979%2C7.778%201.959%2C11.798%204.221%2C14.063%208.242%2C10.041%209.162%2C10.961%20%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%225.992%22%20y%3D%221.923%22%20width%3D%221%22%20height%3D%222.151%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%222.799%22%20y%3D%223.336%22%20transform%3D%22matrix(0.7071%200.7071%20-0.7071%200.7071%203.8472%20-1.6152)%22%20width%3D%222.149%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%221.868%22%20y%3D%226.039%22%20width%3D%222.151%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%229.068%22%20y%3D%2211.998%22%20width%3D%221%22%20height%3D%222.15%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%2211.107%22%20y%3D%2211.535%22%20transform%3D%22matrix(0.7071%200.7071%20-0.7071%200.7071%2012.0781%20-5.0887)%22%20width%3D%222.149%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3Cg%3E%3Crect%20x%3D%2212.039%22%20y%3D%228.989%22%20width%3D%222.15%22%20height%3D%221%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable"
								name="horizontalLine" aria-label="가로줄">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Crect%20x%3D%220.021%22%20y%3D%226.044%22%20width%3D%2216%22%20height%3D%224.013%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable" name="table"
								aria-label="표">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cpath%20d%3D%22M10.973%2C0.029h-0.855H5.925H5.069H0.021v5.03v0.856v4.17v0.856v5.029h5.048h0.856h4.192h0.855h5.049%20v-5.029v-0.856v-4.17V5.059v-5.03H10.973z%20M6.026%2C0.985h4.091v3.974H6.026V0.985z%20M10.117%2C9.984H6.026V5.915h4.091V9.984z%20M0.978%2C0.985h4.091v3.974H0.978V0.985z%20M0.978%2C5.915h4.091v4.069H0.978V5.915z%20M5.069%2C15.016H0.978v-4.072h4.091V15.016z%20M10.117%2C15.016H6.026v-4.072h4.091V15.016z%20M15.064%2C15.016h-3.99v-4.072h3.99V15.016z%20M15.064%2C9.984h-3.99V5.915h3.99V9.984z%20M11.074%2C4.959V0.985h3.99v3.974H11.074z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<div class="se-separator-vert"></div>
							<button type="button" class="se-button se-clickable se-disable"
								name="undo" aria-label="실행취소">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M9.903%2C4.253C9.268%2C4.107%2C8.488%2C4.062%2C8.084%2C4.086V1.832L3.063%2C5.368l5.022%2C3.539V6.417%20c2.462%2C0.298%2C2.889%2C2.689%2C1.54%2C5.195c-0.563%2C1.048-1.434%2C1.924-2.441%2C2.556c1.707-0.53%2C4.448-1.602%2C5.315-3.213%20C13.904%2C8.348%2C12.561%2C4.867%2C9.903%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<button type="button" class="se-button se-clickable se-disable"
								name="redo" aria-label="다시 실행">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cpath%20display%3D%22inline%22%20d%3D%22M6.224%2C4.253c0.636-0.146%2C1.415-0.191%2C1.819-0.167V1.832l5.022%2C3.536L8.042%2C8.906V6.417%20c-2.462%2C0.298-2.889%2C2.689-1.54%2C5.195c0.564%2C1.048%2C1.434%2C1.924%2C2.441%2C2.556c-1.707-0.53-4.447-1.602-5.315-3.213%20C2.223%2C8.348%2C3.566%2C4.867%2C6.224%2C4.253z%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
							<div class="se-separator-vert"></div>
							<button type="button" class="se-button se-clickable"
								name="source" aria-label="소스 보기">
								<div class="se-icon"
									style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2016%2016%22%3E%3Cg%3E%3Cg%20display%3D%22inline%22%3E%3Cg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M-0.093%2C8.561v-0.98l5.095-3.459V5.41L1.434%2C8.065l3.568%2C2.667v1.287L-0.093%2C8.561z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M9.51%2C2.037L6.885%2C14.178H5.973L8.588%2C2.037H9.51z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3Cg%3E%3Cg%3E%3Cpath%20d%3D%22M16%2C8.561l-4.994%2C3.458v-1.285l3.566-2.668L11.006%2C5.41V4.122L16%2C7.581V8.561z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E') no-repeat center;"></div>
							</button>
						</div>
						<div class="se-next se-clickable se-shrink">
							<div class="se-navi-icon"
								style="background: url('data:image/svg+xml,%3Csvg%20fill%3D%22%233C3C3C%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20version%3D%221.1%22%20viewBox%3D%220%200%2010%2010%22%3E%3Cpath%20d%3D%22M1.109%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C1.018%2C2.32%2C1.012%2C2.262%2C1.012%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.037-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.17%2C3.331C4.5%2C4.531%2C4.525%2C4.566%2C4.534%2C4.589%20c0.008%2C0.024%2C0.012%2C0.069%2C0.012%2C0.134v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C4.525%2C5.418%2C4.5%2C5.451%2C4.457%2C5.499l-3.17%2C3.332%20C1.179%2C8.944%2C1.106%2C8.998%2C1.069%2C8.993c-0.038-0.006-0.057-0.075-0.057-0.21V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.038-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L1.109%2C2.459z%22%2F%3E%3Cpath%20d%3D%22M5.117%2C2.459c-0.043-0.043-0.07-0.08-0.081-0.109C5.025%2C2.32%2C5.02%2C2.262%2C5.02%2C2.176v-0.97%20c0-0.135%2C0.02-0.205%2C0.057-0.21c0.038-0.005%2C0.11%2C0.048%2C0.218%2C0.162l3.169%2C3.331c0.044%2C0.043%2C0.069%2C0.078%2C0.078%2C0.101%20C8.55%2C4.614%2C8.554%2C4.658%2C8.554%2C4.723v0.566c0%2C0.06-0.004%2C0.097-0.012%2C0.114C8.533%2C5.418%2C8.508%2C5.451%2C8.464%2C5.499L5.294%2C8.831%20C5.187%2C8.944%2C5.114%2C8.998%2C5.076%2C8.993C5.039%2C8.987%2C5.02%2C8.918%2C5.02%2C8.783V7.813c0-0.087%2C0.006-0.145%2C0.017-0.174%20s0.037-0.066%2C0.081-0.109l2.402-2.474c0.032-0.039%2C0.032-0.079%2C0-0.122L5.117%2C2.459z%22%2F%3E%3C%2Fsvg%3E') no-repeat center;"></div>
						</div>
					</div>
				</div>
				<div class="se-ruler se-hide">
					<div class="se-ruler-container">
						<div class="se-ruler-background"
							style="left: 23px; right: 23px; width: calc(100% - 46px);"></div>
						<div class="se-ruler-division-container"></div>
						<div class="se-handler-container">
							<div class="se-handler se-margin-left"
								style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC&quot;); left: 19.5px;">
								<div class="se-handler se-both"
									style="background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAFCAIAAAAYMVE8AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QjYxNjE3NzVDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QjYxNjE3NzZDODVDMTFFODlCODlDMUNDODk3RUE2Q0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCNjE2MTc3M0M4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCNjE2MTc3NEM4NUMxMUU4OUI4OUMxQ0M4OTdFQTZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsXs/bMAAAAnSURBVHjaYpk2bRoDDsACxHFxcZgSixYtYmLADfDJsUC0Y5UDCDAAPYIGueXq3bYAAAAASUVORK5CYII=);"></div>
							</div>
							<div class="se-handler se-margin-right"
								style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QzZGQ0RGQjVDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QzZGQ0RGQjZDODVDMTFFODgxQjVEODUxMjc4QkIxOTgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpDNkZDREZCM0M4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDNkZDREZCNEM4NUMxMUU4ODFCNUQ4NTEyNzhCQjE5OCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ply5mV8AAACySURBVHjaYvz//z8DDEyfPp0FSM0E4vTMzMw/MHEmBlRQysjImASikQWZkEzRYGVlrXN3d2cA0SA+iiKgAIiebWRkxCEmJsYAokF8qDhEEdCKbKCkjbq6OlgniAbxQeIgPrO4uLgCMzPzWhcXFzZ2dna4O0Am3r592/bs2bPLQSad0dfX5+Hj40PxAYgPEv/79+8ZkCJhbW1tBmwAKi4McxNWRTBxUOAxLFq0iAEfAAgwALUhKXm2ShKQAAAAAElFTkSuQmCC&quot;); left: 898.5px;"></div>
							<div class="se-handler se-text-indent"
								style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAKCAYAAABmBXS+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6OTA2NDlGQzlDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6OTA2NDlGQ0FDODVDMTFFODgxOEZDMkMzN0Q1OUQ5OTEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5MDY0OUZDN0M4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5MDY0OUZDOEM4NUMxMUU4ODE4RkMyQzM3RDU5RDk5MSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PhG6GaUAAACjSURBVHjahJAxDgIhEEWBeBSPoNehsuEKa62FvWzPXdySUJFQaU2yDbGwQZxv2ASSNVIw89+8EIBrrQv7szbYpJQ/BWMME2hKWT9s4ZBm7/2qVPkMae+ce6aUOgEZnNqdUErdc87DNE2dhAxO84eo7BpjvIUQvgEVGXy5EyP7TeVgrX3RkKEiV854+7JxHAfO+YnYkYRz90/NupCwRW3hR4ABAOmdWnwZN/JjAAAAAElFTkSuQmCC&quot;); left: 19.5px;"></div>
						</div>
					</div>
					<div class="se-ruler-guide se-hide"></div>
				</div>
				<div class="se-notification-wrapper"></div>
			</div>
			<div class="se-main se-horz-scroll"
				style="height: calc(100% - 39px);">
				<iframe class="se-contents-edit"></iframe>
				<iframe class="se-contents-preview"></iframe>
				<div class="se-code-viewer"></div>
			</div>

			<div class="se-footer">
				<div class="se-editor-resizer">
					<div class="se-resizer-bar"></div>
					<svg class="se-resizer-knob" version="1.1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						width="75px" height="21.512px" viewBox="0 0 75 21.512"
						enable-background="new 0 0 75 21.512" xml:space="preserve">
						<g>
						<g>
						<g>
						<polygon class="se-resizer-knob-bg"
							points="68.995,16.49 5.971,16.49 4.983,4.49 69.983,4.49"></polygon></g>
						<g>
						<path class="se-resizer-knob-border"
							d="M69.456,16.99H5.51l-1.07-13h66.086L69.456,16.99z M6.431,15.99h62.103l0.906-11H5.526L6.431,15.99z"></path></g></g>
						<g>
						<polygon class="se-resizer-knob-icon"
							points="37.483,13.862 33.573,8.276 34.393,7.703 37.483,12.118 40.574,7.703 41.392,8.276"></polygon></g></g></svg>
				</div>
			</div>
		</div>
		<div class="layer_button">
			<button class="btn_variables" type="button"
				onclick="Sign.SaveSign();">저장</button>
			<button type="button" onclick="mail_layer_close();">닫기</button>
		</div>
		<a href="javascript:void(0)" class="icon btn_closelayer"
			onclick="mail_layer_close();" title="레이어 닫기"><span class="blind">레이어
				닫기</span></a>
		<textarea name="content" id="compose_content" class="box"
			style="width: 99%; height: 300px; display: none;" height="200"></textarea>
	
	<!-- 서명설정_서명목록만들기/수정 모달 끝 -->
	--%>

		

		<%-- 메모 추가/수정 모달 시작 --%>
		<div class="layer_box middle hide popup3" style="margin-left: -175px; margin-top: -126px; display: block;" id="layer_m_write_memo_add">
			<div class="title_layer text_variables" id="spanMemoTitle">
				메모 추가
			</div>
			<textarea style="height: 93px;" class="layer_textarea btn_under" title="메모쓰기" id="textareaMemo" onkeyup="return Memo.checkMemoContent();" onkeydown="if(event.keyCode==13){return false;}" maxlength="100"></textarea>
			<div class="layer_button">
				<button class="btn_variables" type="button" onclick="saveMemo();">확인</button>
				<button type="button" onclick="deleteMemo();">삭제</button>
				<button onclick="mail_layer_close();">취소</button>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer" onclick="mail_layer_close();" title="레이어 닫기">
				<span class="blind">레이어 닫기</span>
			</a>
		</div>
		<%-- 메모 추가/수정 모달 끝 --%>


		<%-- 미리보기 모달 시작 			수정필) 안 할 거면 지우....... --%>
		<div id="mailPreview" class="layer_box external-mail hide popup21" style="margin-left: -501px; margin-top: -311px; display: block;">
			<div class="title_layer text_variables">미리보기</div>
			<div class="table_scrollbox" style="height: 462px; overflow: hidden"><!-- 
				<iframe id="ifPreviewSrc" style="height: 462px; width: 100%;" border="0" frameborder="0" src="/tempfinal.onhiworks.com/officemail/main/m_write_preview"></iframe>
				 --><iframe id="ifMailPreview" style="height: 462px; width: 100%;" border="0" frameborder="0" src="<%= ctxPath%>/mail/mailPreview.gw"></iframe>
			</div>
			<div class="layer_button">
				<button class="btn_variables doublelayer" type="button" onclick="mail_layer_close();">닫기</button>
			</div>
			<a href="javascript:void(0)" class="icon btn_closelayer doublelayer" onclick="mail_layer_close();" title="레이어 닫기">
				<span class="blind">레이어 닫기</span>
			</a>
		</div>
		<%-- 미리보기 모달 끝 --%>


	</div>
	

	<!-- /////////// 모달 끝 ////////////// -->


</body>
</html>