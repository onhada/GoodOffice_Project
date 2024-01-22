<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String ctxPath = request.getContextPath();
%>



<!DOCTYPE html>
<html lang="ko">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css" >

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/css/mail/mail.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 

<%-- 스피너 및 datepicker 를 사용하기 위해 jQueryUI CSS 및 JS --%>	
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/common/inHTML.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/new_lnb.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/mail/mail.css">



<script type="text/javascript">

$(document).ready(function(){

});// end of $(document).ready(function(){})-----------------

	
// Function Declaration

// === 휴지통으로 이동 === //
function moveToTrashbox(mailId, fromMailbox){
	
	if( $('input:checkbox[name="mailId"]:checked').length > 0 ){	// 체크박스를 선택하여 삭제하는 경우 (하나이상의 메일)	
		var check_arr = new Array($('input:checkbox[name="mailId"]:checked').length);
		for (var i = 0; i < check_arr.length; i++) {
			check_arr[i] = new Array(2);
		}
		
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
			
		if( $('input:checkbox[name="mailId"]:checked').length > 0 ){	// 체크박스를 선택하여 삭제하는 경우 (하나이상의 메일)	
			var check_arr = new Array($('input:checkbox[name="mailId"]:checked').length);
			for (var i = 0; i < check_arr.length; i++) {
				check_arr[i] = new Array(2);
			}
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
		
		if( $('input:checkbox[name="mailId"]:checked').length > 0 ){ // 체크박스를 통해 선택할 경우 (하나 이상의 메일)	
			var check_arr = new Array($('input:checkbox[name="mailId"]:checked').length);
			for (var i = 0; i < check_arr.length; i++) {
				check_arr[i] = new Array(2);
			}
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
	$("div#mailPreview").css("display", "none");
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

<%-- === 메모 관련 모달 끝 === --%>


<%-- 미리보기 모달 시작--%>
function mailPreview(){

	$("div#popupBase").css("display", "inline");	
	$("div#mailPreview").removeClass("hide");
	
	var incomeMail = $("textarea#incomeMail").val();

	document.getElementById('ifMailPreview').src = '<%= ctxPath%>/mail/mailPreview.gw?incomeEmp=${incomeMail}';
	
}
<%-- 미리보기 모달 끝 --%>

</script>



<title>Good Office</title>
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
				<div id="drag" class="ui-draggable ui-draggable-handle" style="left: 0px;"></div>
			</div>

			<!-- 사이드바 시작  -->
			<tiles:insertAttribute name="side" />
			<!-- 사이드바 끝  -->

			<!-- 컨텐츠 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 컨텐츠 끝 -->

		</div>

		<div id="dimmed"></div>
		<div id="dimmed2"></div>
		
	</div>

	<div id="main_layer_div"></div>


	<!-- /////////// 모달 시작 ////////////// -->

	
	
	<div id="popupBase" style="display: none;">
	
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


		<%-- 미리보기 모달 시작 --%>
		<div id="mailPreview" class="layer_box external-mail hide popup21" style="margin-left: -501px; margin-top: -311px; display: none;">
			<div class="title_layer text_variables">미리보기</div>
			<div class="table_scrollbox" style="height: 462px; overflow: hidden">
				<iframe id="ifMailPreview" style="height: 462px; width: 100%;" border="0" frameborder="0" src="<%= ctxPath%>/mail/mailPreview.gw"></iframe>
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