<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>
<style>
.hw-approval-docs {
	
}

.hw-approval-docs>section {
	margin-bottom: 30px;
}

.hw-approval-docs .section-title {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 10px;
	line-height: 1;
}

.hw-approval-docs .section-data {
	font-size: 14px;
}

.hw-approval-docs .setting-table {
	width: 100%;
	border-top: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
	border-collapse: collapse;
}

.hw-approval-docs .setting-table.center {
	text-align: center;
}

.hw-approval-docs .setting-table.left>tbody>tr>th, .hw-approval-docs .setting-table.left>tbody>tr>td
	{
	text-align: left;
}

.hw-approval-docs .text-center {
	text-align: center;
}

.hw-approval-docs .setting-table.calendar th {
	background: #fff;
}

.hw-approval-docs .setting-table.calendar td {
	height: 80px;
}

.hw-approval-docs .setting-table.calendar .calc {
	background: #f8f8f8;
}

.hw-approval-docs .setting-table.calendar .prev {
	color: #c4c4c4;
}

.hw-approval-docs .manage-divide {
	display: inline-block;
	width: 1px;
	height: 14px;
	background-color: #d6d6d6;
	vertical-align: middle;
}

.hw-approval-docs .setting-table.horizontal tr:last-child th {
	border-bottom: none;
}

.hw-approval-docs .setting-table tr {
	height: 45px;
}

.hw-approval-docs .setting-table tr th, .hw-approval-docs .setting-table tr td
	{
	font-size: 14px;
	padding: 0px 14px;
	border-top-color: #d6d6d6;
	border-left: 0;
}

.hw-approval-docs .setting-table tr th {
	background: #eff4fc;
	font-weight: normal;
	color: #333;
	border-right: 1px solid #d6d6d6;
	border-bottom: 1px solid #d6d6d6;
}

.hw-approval-docs .setting-table tr td {
	background: #fff;
	border-right: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
}

.hw-approval-docs .setting-table tr th:last-child, .hw-approval-docs .setting-table tr td:last-child
	{
	border-right: none;
}

.hw-approval-docs .setting-table>tbody>tr:last-child>td {
	border-bottom: none;
}

.hw-approval-docs .setting-table>tbody>tr>td.setting-table-child {
	padding: 0
}

.hw-approval-docs .setting-table>tbody>tr>td.setting-table-child .setting-table
	{
	border-top: 0;
	border-bottom: 0;
}

.hw-approval-docs .setting-table>tbody>tr>th.team-plan-table-head {
	border-top: 1px solid #d6d6d6;
	text-align: left;
}

.hw-approval-docs .setting-table>tbody>tr>th.team-plan-table-head.column-date:not(:nth-child(8))
	{
	border-right: 1px solid #ebebeb;
}

.hw-approval-docs .setting-table>tbody>tr>th.week-total-time-head {
	border-left: 1px solid #d6d6d6;
}

.hw-approval-docs .setting-table.team-plan-table>tbody>tr>td:nth-child(8)
	{
	border-right: 1px solid #d6d6d6;
}

.hw-approval-docs .setting-table>tbody>tr>td.week-total-time {
	background: #f8f8f8;
}

.hw-approval-docs .setting-table>tbody>tr>td.team-name-cell {
	border-right: 1px solid #d6d6d6;
}

.hw-approval-docs .setting-table>tbody>tr.last-team-row>td {
	border-bottom: 1px solid #d6d6d6;
}
</style>
<script>
$(document).ready(function() {
	///////////////////////////////////////////////////////////////////////////////////////////////
	// 결재 + 버튼_사원명 입력시
	let prev_autoComplete = $("ul.approval_autocomplete").html();
	$("input#inputApprovalLineSetting").focus(function(){
		
		if($("input#inputApprovalLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
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
			
			console.log($("input#inputApprovalLineSetting").val())
			
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
			if("${procedure.procedureType}" != '처리' && ${procedure.empId} == empId){
				console.log("hi", ${procedure.empId});
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
			html += `<li class="js-approval-line-setting processLine-li unsortable" id="processLineSettingEmpId_` + empId +`" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;"><span>` + empName + `<span class="icon file_delete js-approval-line-setting-delete"></span></span><span style="display:none;">` + positionName + `</span>`;
			$("ul#sortApprovalLineSetting").html(html);
			$("input#inputApprovalLineSetting").val('');
			
		}
	});
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	
	// 신청 + 버튼_사원명 입력시
	let prev_autoAppComplete = $("ul.application_autocomplete").html();
	$("input#inputApplicationLineSetting").focus(function(){
		
		if($("input#inputApplicationLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApplicationLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApplicationLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.application_autocomplete").html(html);
						$("ul.application_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.application_autocomplete").show();
						
					}else{
						$("ul.application_autocomplete").html(prev_autoAppComplete);
						$("ul.application_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.application_autocomplete").html(prev_autoAppComplete);
			$("ul.application_autocomplete").hide();
		}
		
	}).keyup(function(){
		
		if($("input#inputApplicationLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApplicationLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApplicationLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.application_autocomplete").html(html);
						$("ul.application_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.application_autocomplete").show();
						
					}else{
						$("ul.application_autocomplete").html(prev_autoAppComplete);
						$("ul.application_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.application_autocomplete").html(prev_autoAppComplete);
			$("ul.application_autocomplete").hide();
		}
		
	})
	
	
	
	$("input#inputApplicationLineSetting").focusout(function(){
		$("ul.application_autocomplete").html(prev_autoComplete);
		$("ul.application_autocomplete").hide();
	}) 
	
	$(document).on("mousedown", "ul.application_autocomplete li", function() {
		
		let html = $("ul#sortApplicationLineSetting").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		let positionName = $(this).find('span:eq(2)').html();
		
		let isExist = false;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '신청' && ${procedure.empId} == empId){
				console.log("hi", ${procedure.empId});
				isExist = true;
				
			}
			
		</c:forEach>
		
		$("ul#sortApplicationLineSetting li").each(function(){
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
			$("input#inputApplicationLineSetting").val('');
		}else{
			html += `<li class="js-approval-line-setting applicationLine-li unsortable" id="processLineSettingEmpId_` + empId +`" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;"><span>` + empName + `<span class="icon file_delete js-approval-line-setting-delete"></span></span><span style="display:none;">` + positionName + `</span>`;
			$("ul#sortApplicationLineSetting").html(html);
			$("input#inputApplicationLineSetting").val('');
			
		}
	});
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	// 결재 td 부분 관리 시작------------------------------------------
	// 화면에 보여질 수 - 결재자 수 
	let cnt = 4;
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '처리'}">
			cnt--;
			console.log("cnt : ", cnt);
		</c:if>
	</c:forEach>
	
	if(cnt > 0){
		let html_position = $("tr#approvalProcedureData_position").html();
		let html_stamp = $("tr#approvalProcedureData_stamp").html();
		console.log(html_stamp);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 신청 td 부분 관리 시작------------------------------------------
	// 화면에 보여질 수 - 신청자 수 
	cnt = 4;
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '신청'}">
			cnt--;
			console.log("cnt : ", cnt);
		</c:if>
	</c:forEach>
	
	if(cnt > 0){
		let html_position = $("tr#appProcedureData_position").html();
		let html_stamp = $("tr#appProcedureData_stamp").html();
		console.log(html_stamp);
		let html_empName = $("tr#appProcedureData_empName").html();
		
		while(cnt != 0){
			html_position += `<td class="team name"></td>`;
			html_stamp += `<td class="stamp"></td>`;
			html_empName += `<td class="name gt-position-relative"></td>`;
			cnt--;
		}
		
		$("tr#appProcedureData_position").html(html_position)
		$("tr#appProcedureData_stamp").html(html_stamp)
		$("tr#appProcedureData_empName").html(html_empName)
	}
	
	// 신청 td 부분 관리 끝------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

/* 파일 첨부 관련 시작 -------------------------------------------------------------------------------- */
	
	<%-- === jQuery 를 사용하여 드래그앤드롭(DragAndDrop)을 통한 파일 업로드 시작 === --%>
		let file_arr = []; // 첨부된어진 파일 정보를 담아 둘 배열
	
	    // == 파일 Drag & Drop 만들기 == //
	    $("div#dragZone").on("dragenter", function(e){ /* "dragenter" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 최초로 들어왔을 때 */ 
	        e.preventDefault();
	        <%-- 
	        	브라우저에 어떤 파일을 drop 하면 브라우저 기본 동작이 실행된다. 
	        	이미지를 drop 하면 바로 이미지가 보여지게되고, 만약에 pdf 파일을 drop 하게될 경우도 각 브라우저의 pdf viewer 로 브라우저 내에서 pdf 문서를 열어 보여준다. 
	            이것을 방지하기 위해 preventDefault() 를 호출한다. 
	            즉, e.preventDefault(); 는 해당 이벤트 이외에 별도로 브라우저에서 발생하는 행동을 막기 위해 사용하는 것이다.
	        --%>
	        
	        e.stopPropagation();
	        <%--
	            propagation 의 사전적의미는 전파, 확산이다.
	            stopPropagation 은 부모태그로의 이벤트 전파를 stop 중지하라는 의미이다.
	            즉, 이벤트 버블링을 막기위해서 사용하는 것이다. 
	            사용예제 사이트 https://devjhs.tistory.com/142 을 보면 이해가 될 것이다. 
	        --%>
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
	        <%--  
	            jQuery 에서 이벤트를 처리할 때는 W3C 표준에 맞게 정규화한 새로운 객체를 생성하여 전달한다.
	            이 전달된 객체는 jQuery.Event 객체 이다. 이렇게 정규화된 이벤트 객체 덕분에, 
	            웹브라우저별로 차이가 있는 이벤트에 대해 동일한 방법으로 사용할 수 있습니다. (크로스 브라우징 지원)
	            순수한 dom 이벤트 객체는 실제 웹브라우저에서 발생한 이벤트 객체로, 네이티브 객체 또는 브라우저 내장 객체 라고 부른다.
	        --%>
	        /*  Drag & Drop 동작에서 파일 정보는 DataTransfer 라는 객체를 통해 얻어올 수 있다. 
	            jQuery를 이용하는 경우에는 event가 순수한 DOM 이벤트(각기 다른 웹브라우저에서 해당 웹브라우저의 객체에서 발생되는 이벤트)가 아니기 때문에,
	            event.originalEvent를 사용해서 순수한 원래의 DOM 이벤트 객체를 가져온다.
	            Drop 된 파일은 드롭이벤트가 발생한 객체(여기서는 $("div#fileDrop")임)의 dataTransfer 객체에 담겨오고, 
	            담겨진 dataTransfer 객체에서 files 로 접근하면 드롭된 파일의 정보를 가져오는데 그 타입은 FileList 가 되어진다. 
	            그러므로 for문을 사용하든지 또는 [0]을 사용하여 파일의 정보를 알아온다. 
			*/
		//  console.log(typeof files); // object
	    //  console.log(files);
	        /*
				FileList {0: File, length: 1}
				0: File {name: 'berkelekle단가라포인트03.jpg', lastModified: 1605506138000, lastModifiedDate: Mon Nov 16 2020 14:55:38 GMT+0900 (한국 표준시), webkitRelativePath: '', size: 57641, …}
				         length:1
				[[Prototype]]: FileList
	        */
	        if(files != null && files != undefined){
	        <%-- console.log("files.length 는 => " + files.length);  
	             // files.length 는 => 1 이 나온다. 
	        --%>    
	        	
	        <%--
	        	for(let i=0; i<files.length; i++){
	                const f = files[i];
	                const fileName = f.name;  // 파일명
	                const fileSize = f.size;  // 파일크기
	                console.log("파일명 : " + fileName);
	                console.log("파일크기 : " + fileSize);
	            } // end of for------------------------
	        --%>
	            
	            let html = $("table#tableApprovalAttach tbody").html();
	            const f = files[0]; // 파일 정보 어차피 files.length 의 값이 1 이므로 위의 for문을 사용하지 않고 files[0] 을 사용하여 1개만 가져오면 된다. 
	        	let fileSize = f.size/1024/1024;  /* 파일의 크기는 MB로 나타내기 위하여 /1024/1024 하였음 */
	        	
	        	console.log("f 정보 ? : ", f)
	        	
	        	console.log("file Name : ", f.name)
	        	console.log("file Size : ", fileSize)
	        	
	        	
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
	                /* 
	                     numObj.toFixed([digits]) 의 toFixed() 메서드는 숫자를 고정 소수점 표기법(fixed-point notation)으로 표시하여 나타난 수를 문자열로 반환해준다. 
	                                     파라미터인 digits 는 소수점 뒤에 나타날 자릿수 로써, 0 이상 20 이하의 값을 사용할 수 있으며, 구현체에 따라 더 넓은 범위의 값을 지원할 수도 있다. 
	                     digits 값을 지정하지 않으면 0 을 사용한다.
	                     
	                     var numObj = 12345.6789;
	
						 numObj.toFixed();       // 결과값 '12346'   : 반올림하며, 소수 부분을 남기지 않는다.
						 numObj.toFixed(1);      // 결과값 '12345.7' : 반올림한다.
						 numObj.toFixed(6);      // 결과값 '12345.678900': 빈 공간을 0 으로 채운다.
	                */
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
			console.log(this_fileDetail);
			for(var i=0;i < file_arr.length;i++){
				// file_arr에서 삭제하기 위해
				console.log('// file_arr에서 삭제하기 위해')
				
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
		
		
		
		
		
		
		
		
		
	    /*  // == Drop 되어진 파일목록 제거하기 == // 
	    $(document).on("click", "span.delete", function(e){
	    	let idx = $("span.delete").index($(e.target));
	    //	alert("인덱스 : " + idx );
	    
	    	file_arr.splice(idx,1); // 드롭대상인 박스 안에 첨부파일을 드롭하면 파일들을 담아둘 배열인 file_arr 에서 파일을 제거시키도록 한다.
	    //	console.log(file_arr);
	    
	    /* 	배열명.splice() : 배열의 특정 위치에 배열 요소를 추가하거나 삭제하는데 사용한다. 
		    삭제할 경우 리턴값은 삭제한 배열 요소이다. 삭제한 요소가 없으면 빈 배열( [] )을 반환한다.
		
		    배열명.splice(start, 0, element);  // 배열의 특정 위치에 배열 요소를 추가하는 경우 
			start   - 수정할 배열 요소의 인덱스
	        0       - 요소를 추가할 경우
	        element - 배열에 추가될 요소
	
	     	배열명.splice(start, deleteCount); // 배열의 특정 위치의 배열 요소를 삭제하는 경우    
	        start   - 수정할 배열 요소의 인덱스
	        deleteCount - 삭제할 요소 개수 */
		
	    
	       /* $(e.target).parent().remove(); // <div class='fileList'> 태그를 삭제하도록 한다.	    
	    }); */
	<%-- === jQuery 를 사용하여 드래그앤드롭(DragAndDrop)을 통한 파일 업로드 끝 === --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* 첨부 파일로 첨부된 거 저장 시작 --------------------------------------------------------------*/
	
	var fileList = new Object();

	// 첨부파일
	$('input#fileApprovalAttach').change(function(e) {
	    fileList = $(this)[0].files;  //파일 대상이 리스트 형태로 넘어온다.
	    console.log("fileList : " , fileList)
	    
	    html = '';
	    for(var i=0;i < fileList.length;i++){
	    	
	    	
	        var file = fileList[i]; // 파일 정보 자체
	        
	        console.log("//////////////////////////////////")
	    	console.log("file : ", file)
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
	
	/* 파일 첨부 관련 끝 -------------------------------------------------------------------------------- */
	
	
	
	
	
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
					console.log(JSON.stringify(text));
					if(text.isDelete == true){
						$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
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
					console.log(JSON.stringify(text));
					if(text.isAdd == true){
						$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
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
					console.log(JSON.stringify(text));
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
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 참조 + 버튼_입력시
	
	let prev_refAutoComplete = $("ul.reference_autocomplete").html();
	console.log("prev_refAutoComplete", prev_refAutoComplete)
	$(document).on("focus", "input#inputApprovalThirdLine", function(){
		
		if($("input#inputApprovalThirdLine").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalThirdLine").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalThirdLine").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					
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
	
	$(document).on("keyup", "input#inputApprovalThirdLine", function(){
		
		if($("input#inputApprovalThirdLine").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalThirdLine").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalThirdLine").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					
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
						
						
						$("ul.reference_autocomplete").css(
						
						{
							'top': '560px', 
							'left': '426.5px', 
							'width': '360px'
						})
						
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
	$(document).on("focusout", "input#inputApprovalThirdLine", function(){
		$("ul.reference_autocomplete").html(prev_refAutoComplete);
		$("ul.reference_autocomplete").hide();
	}) 
	
	// 드롭다운 리스트에서 선택했을 경우
	$(document).on("mousedown", "ul.reference_autocomplete li", function() {
		
		let html = $("td#approvalThirdLine").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		
		let isExist = false;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if(${procedure.empId} == empId){
				console.log("hi", ${procedure.empId});
				isExist = true;
				
			}
		</c:forEach>
		
		$("td#approvalThirdLine > span").each(function(){
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
			$("input#inputApprovalThirdLine").val('');
			
		}else{
			
			if(confirm("추가하시겠습니까?")){
				// yes일 경우
				$("ul.reference_autocomplete").html(prev_refAutoComplete);
				$("ul.reference_autocomplete").hide();
				
				//ajax
				$.ajax({
				url: "<%=ctxPath%>/approval/add/reference.gw",
				data: { "empId": empId, "approvalId": ${requestScope.approvalDetail.approvalId}},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					console.log(JSON.stringify(text));
					if(text.isAdd == true){
						$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
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
	
	
	
	
	
	
	
	
	
	/* ? 박스 hover 시*/
	$("button.tipsIcon").hover(function(){
		$("div.tooltip").show();
	},
	function(){
		$("div.tooltip").hide();
	}
	);
	
	
	
	
	
	
})

/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////

/* 첨부 파일 모달에서 삭제버튼 눌렀을 경우 */
function deleteFile(event){
	$(event.target).parent().detach();
}


/* 첨부 파일칸에서 버튼 눌렀을 경우 */
function deleteSavedFile(fileId){
	
	console.log("fileId : ", fileId)
	
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
		url: "<%=ctxPath%>/approval/deleteSavedFile.gw",
		data: { "fileId": fileId},
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			console.log(JSON.stringify(text));
			if(text.isDelete == true){
				$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
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
	console.log('확인 눌렀ㄸ따')
	
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
			console.log("첨부파일 넣어주기")
			
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
					/* contextPath를 ctxPath로 변경하기 */
					$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
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
				/* contextPath를 ctxPath로 변경하기 */
				$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
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


///////////////////////////////////////////////////////////////////////////////
	






////////////////////////////////////////////////////////////
// 참조 + 버튼 클릭 시

// 참조 + 버튼 클릭 시
function showInputReference(){
	$("input#inputApprovalThirdLine").val('');
	$("input#inputApprovalThirdLine").toggle();
}

///////////////////////////////////////////////////////////
//참조 or 수신 or 수신참조 x 버튼 클릭시
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
				console.log(JSON.stringify(text));
				if(text.isDelete){
					$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
				}else{
					alert("삭제에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				// 수정필
				alert("삭제에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}
	
}




////////////////////////////////////////////////////////////////////////
//의견 등록

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
				console.log(JSON.stringify(text));
				if(text.isInsert){
					$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
				}else{
					alert("등록에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				// 수정필
				alert("등록에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}else{
		// 갑이 입력되어있지 않다면
		alert("의견 내용을 입력해주세요")
	}
}


//의견 삭제
function deleteOpinion(opinionId){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url: "<%=ctxPath%>/approval/deleteOpinion.gw",
			data: {"opinionId": opinionId},
			type: "post",
			async: true,
			dataType:"json",
			success: function(text) {
				console.log(JSON.stringify(text));
				if(text.isDelete){
					$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
				}else{
					alert("삭제에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				// 수정필
				alert("삭제에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}
	
}



////////////////////////////////////////////////////////////////////////////////
//

function showApprovalInsertModal(){
	// 기존 값 초기화
	$("#accept").prop("checked", true);
	changeActionOfApproval(2);
	$("div#layerActionOfApproval").show();
}

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


function enterActionOfApproval(){
	
	$.ajax({
		url: "<%=ctxPath%>/approval/updateActionOfApproval.gw",
		data: {"empId": ${sessionScope.loginUser.empId}, 
			"approvalId": ${requestScope.approvalDetail.approvalId},
			"approvalStatus" : $("input[name=approval_value]:checked").val(),
			"formId" : ${requestScope.approvalDetail.formId},
			"opinion" : $("textarea#approvalReasonMessage").val().trim()},
		type: "post",
		async: true,
		dataType:"json",
		success: function(text) {
			console.log(JSON.stringify(text));
			if(text.isUpdate){
				$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
			}else{
				alert("등록에 실패하였습니다. 다시 시도해주세요.")
			}
		},
		error: function(request, status, error) {
			// 수정필
			alert("등록에 실패하였습니다. 다시 시도해주세요.")
		}
	});
}


function updateRefRead(){
	$.ajax({
		url: "<%=ctxPath%>/approval/updateRefRead.gw",
		data: {"empId": ${sessionScope.loginUser.empId}, "approvalId": ${requestScope.approvalDetail.approvalId}},
		type: "post",
		async: true,
		dataType:"json",
		success: function(text) {
			console.log(JSON.stringify(text));
			if(text.isUpdate){
				$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
			}else{
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		},
		error: function(request, status, error) {
			// 수정필
			alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
		}
	});
}














//////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////


/* 처리 + 버튼 눌렀을 경우 팝업 */
function approvalLineSetting(){
	
	$("input#inputApprovalLineSetting").val('');
	
	let html = '';
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '처리'}">
			
			html += `<li class="js-approval-line-setting processLine-li unsortable" id ="processLineSettingEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;"><span>${procedure.empName}</span>`
	
				<c:if test="${procedure.status eq '대기'}">
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(processLineSettingEmpId_${procedure.empId})"></span>`;
				</c:if>
	
			html += `</li>`;
			
		</c:if>
		
		console.log(html);
	</c:forEach>
	
	$("ul#sortApprovalLineSetting").html(html);
	
	$("div#layerApprovalLineSetting").show(); 

}



/* 처리 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateApprovalLineSetting(){
	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */
	
	 let approvalList = [];
	 let listdata;
	 
	
	 $("li.processLine-li").each(function(index){
		 let id = $(this).attr('id');
		 console.log("processLine-li : ", id)
		 let empId = id.substring(id.indexOf('_') +1,id.length);
		
		 listdata = {"empId" : empId, "sequence" : index+1, "approvalId": ${requestScope.approvalDetail.approvalId}, "procedureType" : 4};
		 approvalList.push(listdata);
	 })
	 
	 console.log(approvalList)
	if(approvalList.length > 0 && approvalList.length <= 4){
		$.ajax({
			url: "<%=ctxPath%>/approval/updateApprovalLineSetting.gw",
			data: JSON.stringify(approvalList),
			type: "post",
			async: true,
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success: function(text) {
				console.log(approvalList)
				console.log(JSON.stringify(text));
				console.log(text.isSuccess);
				if(text.isSuccess){
					$(location).attr('href', contextPath +`/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
				}else{
					alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				// 수정필
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		}); 
	}else{
		alert("처리자 수는 한 명 이상 네 명 이하로 존재하여야 합니다.")
		$(location).attr('href', contextPath +`/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
	}
	
}








///////////////////////////////////////////////////////////////////////////////


/* 신청 + 버튼 눌렀을 경우 팝업 */
function applicationLineSetting(){
	
	$("input#inputApplicationLineSetting").val('');
	
	let html = '';
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '신청'}">
			
			html += `<li class="js-approval-line-setting applicationLine-li unsortable" id ="applicationLineSettingEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;"><span>${procedure.empName}</span>`
	
				<c:if test="${procedure.status eq '대기'}">
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(applicationLineSettingEmpId_${procedure.empId})"></span>`;
				</c:if>
	
			html += `</li>`;
			
		</c:if>
		
		console.log(html);
	</c:forEach>
	
	$("ul#sortApplicationLineSetting").html(html);
	
	$("div#layerApplicationLineSetting").show(); 

}



/* 신청 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateApplicationLineSetting(){
	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */
	
	 let approvalList = [];
	 let listdata;
	 
	
	 $("li.applicationLine-li").each(function(index){
		 let id = $(this).attr('id');
		 let empId = id.substring(id.indexOf('_') +1,id.length);

		 listdata = {"empId" : empId, "sequence" : index+1, "approvalId": ${requestScope.approvalDetail.approvalId}, "procedureType" : 2};
		 approvalList.push(listdata);
	 })
	 
	   console.log(approvalList)
	if(approvalList.length > 0 && approvalList.length <= 4){
		$.ajax({
			url: "<%=ctxPath%>/approval/updateApprovalLineSetting.gw",
			data: JSON.stringify(approvalList),
			type: "post",
			async: true,
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success: function(text) {
				console.log(JSON.stringify(text));
				console.log(text.isSuccess);
				if(text.isSuccess){
					$(location).attr('href', contextPath +`/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
				}else{
					alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
				}
			},
			error: function(request, status, error) {
				// 수정필
				alert("업데이트에 실패하였습니다. 다시 시도해주세요.")
			}
		});
	}else{
		alert("신청자 수는 한 명 이상 네 명 이하로 존재하여야 합니다.")
		$(location).attr('href', contextPath +`/approval/documentDetail/${requestScope.viewType}/view.gw?formId=${requestScope.approvalDetail.formId}&approvalId=${requestScope.approvalDetail.approvalId}`);
	}
}









function deleteThis(id) {
	$(id).detach();
}
</script>




















<div id="contents">
	<div class="content_title">
		<!-- <form >
			<fieldset> -->
				<c:if test="${not empty requestScope.isDraftEmp && requestScope.isDraftEmp eq 1}">
					<span class="detail_select">
						<a href="수정필" class="fl" onclick="수정필">기안취소</a>
						<a href="수정필" class="icon question tipsIcon" style="position: relative; top: 0; margin-left: 10px">
							<span class="blind">세부 설명</span>
						</a>
						<div class="tooltip hide" style="left: 0; top: 0; color: #676767;">
							<div class="tooltip-box" style="width: 360px;">
								<p>ㆍ기안자가 기안 자체를 삭제하고 싶을 때 사용할 수 있습니다.</p>
								<p>ㆍ기존 결재 내역 뿐만 아니라 문서 번호 자체가 없어지게 됩니다.</p>
								<p>ㆍ관리자 설정에 따라 반려 처리될 수 있습니다.</p>
							</div>
						</div>
					</span>
				</c:if>
			<!-- </fieldset>
		</form> -->
		<div class="setting_box">
			<button type="button" class="hw-icon outlined list_bt" onclick="history.go(-1)" title="목록보기">
				<i class="gi gi-list"></i>
			</button>
		</div>
	</div>

	<!-- <input type="hidden" name="approval_document_no" value="27862">
	<input type="hidden" name="approval_first_line" value="3848,3847">
	<input type="hidden" name="approval_second_line" value="3880">
	<input type="hidden" name="approval_third_line" value="">
	<input type="hidden" name="approval_fourth_line" value="">
	<input type="hidden" name="approval_fifth_line" value="">
	<input type="hidden" name="approval_preserved_term" value="3">
	<input type="hidden" name="approval_security_level" value="B">
	<input type="hidden" name="approval_list_view" value="/tempfinal.onhiworks.com/approval/document/lists/W/?&amp;list_mode=W">
 -->
	<div class="content_inbox">
		<!-- Contents -->
		<div class="cont_box view">
			<div class="approval-wrap write view">
				<c:if test="${requestScope.workApplication.workType eq '9'}">
					<h1>휴일근무 신청서</h1>
				</c:if>
					
				<c:if test="${requestScope.workApplication.workType eq '8'}">
					<h1>연장근무 신청서</h1>
				</c:if>
				<table class="tableType02">
					<caption>전자결재 문서보기</caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 37.62%">
						<col style="width: 22.17%">
						<col style="width: 28.12%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">문서 종류</th>
							<!-- 수정필!!!!!!!!! 8 을 2로 9를 1로 -->
							<c:if test="${requestScope.workApplication.workType eq '9'}">
								<td>휴일근무 신청</td>
							</c:if>
								
							<c:if test="${requestScope.workApplication.workType eq '8'}">
								<td>연장근무 신청</td>
							</c:if>
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
											/ ${securityVo.securityLevel}등급
										</c:if>
									</c:forEach>
								</c:if>
								<button type = "button" class="icon question tipsIcon" style="position: relative; top: 4px; margin-left: 10px;">
									<span class="blind">세부 설명</span>
								</button>
								<div class="tooltip" style="left: -290px; top: 0; display: none;">
									<div class="tooltip-box" style="width: 570px;">
										<p>보안 등급</p>
										<p>ㆍS등급: 기안 상에 설정된 관련자들만 문서를 볼 수 있으며, 결재자와 합의자만 참조자를 추가할 수 있음.</p>
										<p>ㆍA등급: 기안 상에 설정된 관련자들과 관리자가 설정한 5등급(부장)등급 이상인 사람이 문서를 볼 수 있음. 결재자와 합의자는 참조자를 추가할 수 있음.</p>
										<p>ㆍB등급: 기안 상에 설정된 관련자들과 관리자가 설정한 7등급(과장)등급 이상인 사람이 문서를 볼 수 있음. 결재자, 합의자, 참조자 모두 참조자를 추가할 수 있음.</p>
										<p>ㆍC등급: 모든 임직원이 문서를 열람할 수 있지만, 기안 상에 설정된 관련자들만 참조자를 추가할 수 있음.</p>
									</div>
								</div>

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
					<caption>신청, 처리</caption>
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 37.62%;">
						<col style="width: 12.09%;">
						<col style="width: 38.02%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="agree">
								<div class="choice" style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									신청
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 2 || requestScope.userProcedureType eq 4)}">
										<span class="spr-approval set" title="신청" onclick="applicationLineSetting();"></span>
									</c:if>								</div>
							</th>
							<td class="confer vt" id="approvalFirstLine">
								<table style="height: 163px;">
									<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									</colgroup>
									<tbody>
										<tr id="appProcedureData_position">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '신청'}">
													<td class="team name">${procedure.positionName}</td>
												</c:if>
											</c:forEach>
										</tr>
										<tr id="appProcedureData_stamp">

											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '신청'}">
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
															<c:if test="${procedure.empId eq sessionScope.loginUser.empId}">
																<span class="bt_left pdt_0 pdb_0">
																	<button type="button" onclick="showApprovalInsertModal()">결재</button>
																</span>
															</c:if>
														</td>

													</c:if>

												</c:if>
											</c:forEach>
										</tr>
										<tr id="appProcedureData_empName">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '신청'}">
													<td class="name gt-position-relative approvalEmpId_${procedure.empId}">
														<span class="stamp-step-num" style="display: none;">0</span>
														${procedure.empName}
													</td>
												</c:if>
											</c:forEach>
										</tr>
									</tbody>
								</table>
							</td>
							<th scope="row" class="confer">
								<div class="choice" style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									처리
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 2 || requestScope.userProcedureType eq 4)}">
										<span class="spr-approval set" title="처리" onclick="approvalLineSetting();"></span>
									</c:if>
								</div>
							</th>
							<td class="confer vt" id="approvalSecondLine">
								<table style="height: 163px;">
									<colgroup>
										<col width="">
										<col width="">
										<col width="">
										<col width="">
									</colgroup>
									<tbody>
										<tr id="approvalProcedureData_position">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '처리'}">
													<td class="team name">${procedure.positionName}</td>
												</c:if>
											</c:forEach>
										</tr>
										<tr id="approvalProcedureData_stamp">
											<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
												<c:if test="${procedure.procedureType eq '처리'}">
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
																<c:if test="${procedure.empId eq sessionScope.loginUser.empId}">
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
												<c:if test="${procedure.procedureType eq '처리'}">
													<td class="name gt-position-relative approvalEmpId_${procedure.empId}">
														<span class="stamp-step-num" style="display: none;">0</span>
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
				<table class="cal_table1 approve-write refer">
					<colgroup>
						<col style="width: 12.09%;">
						<col style="width: 87.91%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<div class="choice" style="min-height: 45px; height: 44px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
									참조
									<c:if test="${requestScope.viewType eq 'list' && requestScope.isReturn eq false && (requestScope.userProcedureType eq 2 || requestScope.userProcedureType eq 4)}">
										<span class="spr-approval set" title="참조" onclick="showInputReference()"></span>
									</c:if>
								</div>
							</th>
							<td id="approvalThirdLine">
								<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalThirdLine" style="display: none;" approval_type="F" autocomplete="off">
								
								<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
									<c:if test="${procedure.procedureType eq '참조'}">
									
										<c:if test="${procedure.status eq '확인'}">
											<span class="refer-list" id="referEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" type="F">
												${procedure.empName}
												<img src="<%= ctxPath %>/resources/image/approval/readCheck.png" alt="확인" title="${procedure.registerDay}" class="vm js-approval-confirm-check">
											</span>
										</c:if>
										
										<c:if test="${procedure.status eq '미확인'}">
											
											<span class="refer-list" id="referEmpId_${procedure.empId}" user_no="3855" node_id="2816" type="F">
												${procedure.empName}
												<c:if test="${requestScope.userProcedureType eq 2 || requestScope.userProcedureType eq 4}">
													<span class="icon file_delete js-approval-line-delete" onclick="deleteRefOrIncOrIncR(referEmpId_${procedure.empId})" style="display: inline-block;"></span>
												</c:if>

												<c:if test="${procedure.empId eq sessionScope.loginUser.empId}">
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
								<button type="button" class="icon impt on" style="top:57px;"><span class="blind"></span></button>
							</c:if>
							<c:if test="${requestScope.approvalDetail.isImportant eq 0}">
								<button type="button" class="icon impt" style="top:57px;"><span class="blind"></span></button>
							</c:if>
						</c:if>
						<span class="point_color"> </span>
						${requestScope.approvalDetail.title}
					</h2>
					<div class="contents after">
						<div class="hw-approval-docs">
							
							<table class="setting-table" style="margin-top:50px;margin-bottom:50px">
								<colgroup>
									<col style="width: 160px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>근무일</th>
										<td>${requestScope.workApplication.workDay}</td>
									</tr>
									<tr>
										<th>적용대상</th>
										<td>${requestScope.approvalDetail.empName}</td>
									</tr>
									
									<!-- 수정필!!!!!!!!! 8 을 2로 9를 1로 -->
									<c:if test="${requestScope.workApplication.workType eq '9'}">
										<tr>
											<th>근무시간</th>
											<td>
												09:00~18:00 <br>
											</td>
										</tr>
									</c:if>
										
									<c:if test="${requestScope.workApplication.workType eq '8'}">
										<tr>
											<th>연장근무시간</th>
											<td>${requestScope.workApplication.overTimeStart} ~ ${requestScope.workApplication.overTimeEnd}</td>
										</tr>
									</c:if>
									
									
									<tr>
										<th>사유</th>
										<td>${requestScope.approvalDetail.content}</td>
									</tr>
								</tbody>
							</table>
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
									(<fmt:formatNumber value="${approvalFileVo.fileSize}" pattern="0.000" />MB)
									<button type = "button" class="icon file_delete" onclick="deleteSavedFile(${approvalFileVo.approvalFileId})">
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
					<a href="수정필" class="gt-nav-item gt-active approval-comments-tab1" data-id="tab1-1" onclick="수정필">의견</a>
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
									<img class="myphoto" src="<%= ctxPath %>${opinionVo.profileImage}" alt="">
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

