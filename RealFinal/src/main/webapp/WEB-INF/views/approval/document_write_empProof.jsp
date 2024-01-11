<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>

<%-- 스피너 및 datepicker 를 사용하기 위해 jQueryUI CSS 및 JS --%>
<%--  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" /> --%>
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
<%-- 검색할 때 필요한 datepicker 의 색상을 기본값으로 사용하기 위한 것임 --%>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">  -->
<script>
$(document).ready(function() {
	
	
	$("select[name='formId']").change(function(){
		
		if($("select[name='formId'] option:selected").val() != ""){
			const frm = document.writeDocumentFrm;
			frm.method = "post";
			frm.action = "<%=ctxPath%>/approval/document/write/form.gw";
			frm.submit();
		}else{
			const frm = document.writeDocumentFrm;
			frm.method = "get";
			frm.action = "<%=ctxPath%>/approval/document/write/index.gw";
			frm.submit();
		}
		
	})
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   
	   /* 기안하기 버튼 클릭시 */
	   $("button#btnWrite").click(function(){
		
			let isCheck = true;
			
			/* 제목 내용 유효성 검사 */
		   	if($("input#approval_document_title").val().trim() == ""){
		   		alert("제목을 입력하세요.")
		   		isCheck = false;
		   	}
			
			
			
		   	/* 보안등급 체크 여부 */
			if($("select[name='security_level'] option:selected").val() == ""){
				alert("보안등급을 선택하세요.")
				isCheck = false;
			}
				
			
			
			
		    var formData = new FormData($("form[name='writeDocumentFrm']").get(0)); // $("form[name='addFrm']").get(0) 폼 에 작성된 모든 데이터 보내기 
		     
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
				       
				}
		     }
			
			
			
			
			if(isCheck){
				// 문제 없을 경우
				$.ajax({
					url : "<%=ctxPath%>/approval/insertDocumentWrite/empProof.gw",
					type : "post",
					data : formData,
					processData:false,  // 파일 전송시 설정 
					contentType:false,  // 파일 전송시 설정 
					dataType:"json",
					success:function(text){
						if(text.isSuccess) {
						/* contextPath를 ctxPath로 변경하기 */
						console.log("통과!")
						let type = '';
						if(text.viewType == 'list'){
							type = 'A';
						}else{
							type = 'all';
						}
						$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/` + text.viewType + `/` + type + `/view.gw?formId=109&approvalId=`+text.approvalId);
						}else {
							alert("기안하기가에 실패했습니다.");
						} 
					},
					error: function(request, status, error){
						alert("기안하기에 실패했습니다.");
				    }
				});
			}
			
			
			
				   
	   })
	   
	   
	   
	   //////////////////////////////////////////////////////////////////////////////////////////////////
	   /* 임시저장 버튼 클릭시 */
	   $("button#btnTemp").click(function(){
		
			let isCheck = true;
			
			/* 제목 내용 유효성 검사 */
		   	if($("input#approval_document_title").val().trim() == ""){
		   		alert("제목을 입력하세요.")
		   		isCheck = false;
		   	}
			
		   	/* 보안등급 체크 여부 */
			if($("select[name='security_level'] option:selected").val() == ""){
				alert("보안등급을 선택하세요.")
				isCheck = false;
			}
			
		    var formData = new FormData($("form[name='writeDocumentFrm']").get(0)); 
		     
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
				       
				}
		     }
			
			
			if(isCheck){
				// 문제 없을 경우
				$.ajax({
					url : "<%=ctxPath%>/approval/insertTempDocumentWrite/empProof.gw",
					type : "post",
					data : formData,
					processData:false,  // 파일 전송시 설정 
					contentType:false,  // 파일 전송시 설정 
					dataType:"json",
					success:function(text){
						if(text.isSuccess) {
							$(location).attr('href', `<%=ctxPath%>/approval/document/box/temp.gw`);
						}else {
							alert("임시저장에 실패했습니다.");
						} 
					},
					error: function(request, status, error){
						alert("임시저장에 실패했습니다.");
				    }
				});
			}
			
			
			
				   
	   })
		
	
	
	
	
	
	
	
	
	
	
	// 모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
         dateFormat: 'yy-mm-dd'  // Input Display Format 변경
        ,showOtherMonths: true   // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true        // 콤보박스에서 년 선택 가능
        ,changeMonth: true       // 콤보박스에서 월 선택 가능                
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        
        ,minDate: 0
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    });
	
    // input 을 datepicker로 선언
    $("input#issueDay").datepicker();                    

    // 발행일 초기설정
    <c:if test="${not empty requestScope.empProofDetail}">
    	console.log("일단 값은 있어요")
    	let dateArr = "${requestScope.empProofDetail.issueDay}".split(". ");
    	var x = new Date(dateArr[0], Number(dateArr[1])-1, dateArr[2], 0, 0, 0, 0);
    	console.log(x)
    	$('input#issueDay').datepicker('setDate', x); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
    </c:if>
    	
    <c:if test="${empty requestScope.empProofDetail}">
		$('input#issueDay').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
	</c:if>
    
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	        	console.log(file_arr);
	        	console.log(fileName)
        	
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
				$("div#approvalAttachText").hide();
				$("div#approvalAttachList").show();
        	}
        }// end of if(files != null && files != undefined)--------------------------
        
        $(this).css("background-color", "#fff");
    });
	
	
	
	
	
	
	
/* 첨부 파일로 첨부된 거 저장 시작 --------------------------------------------------------------*/
	
	var fileList = new Object();

	// 첨부파일
	$('input#fileApprovalAttachWriteForm').change(function(e) {
		console.log('hi')
		
		
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
	    $("div#approvalAttachText").hide();
		$("div#approvalAttachList").show();
	    $("table#tableApprovalAttach tbody").append(html);
	    
	    
	    
	});
	
	
	
	
	
	// 파일 모달에서 삭제 버튼 클릭시 ------------------------------------------------------------------------------
	$(document).on("click", "button.js-approval-attach-delete", function(e){
		var this_fileDetail = $(e.target).parent().find("span").html();
		console.log(this_fileDetail);
		for(var i=0;i < file_arr.length;i++){
			// file_arr에서 삭제하기 위해
			console.log('// file_arr에서 삭제하기 위해')
			
			var file = file_arr[i]; // 파일 정보 자체
			
			console.log('file : ',file)
			var fileName = file.name;
			var fileSize = file.size/1024/1024;
			fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1);
			
			var fileDetail = fileName.substring(fileName.lastIndexOf("\\") +1, fileName.length) + " (" + fileSize +"MB)";
			if(fileDetail == this_fileDetail){
				console.log("삭제!")
				file_arr.splice(i, 1);
				break;
			}
		 }
		$(e.target).parent().parent().parent().detach();
		
		if(file_arr.length == 0){
	    	$("div#approvalAttachText").show();
			$("div#approvalAttachList").hide();
	    }
	})
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	// 처리 + 버튼_사원명 입력시
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
		
		if(empId == `${sessionScope.loginUser.empId}`){
			isExist = true;
		}
		
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
		
		$("tr#appProcedureData_empName td").each(function(){
			// 신청자 중에 있는지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
	
		$("td#approvalThirdLine > span").each(function(){
			// 참조 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputApprovalLineSetting").val('');
		}else{
			html += `<li class="js-approval-line-setting processLine-li unsortable" id="processLineSettingEmpId_` + empId +`" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">
						<span>` + empName 
						+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(processLineSettingEmpId_` + empId + `)"></span>
						</span>
						<span style="display:none;">` + positionName + `</span></li>`;
			$("ul#sortApprovalLineSetting").html(html);
			$("input#inputApprovalLineSetting").val('');
			
		}
	});
	
	
	
	// 결재 td 부분 관리 시작------------------------------------------
	// 화면에 보여질 수 - 결재자 수 
	<c:if test="${not empty requestScope.approvalDetail}">
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
		
	</c:if>
	// 결재 td 부분 관리 끝------------------------------------------  
	
	
	
	
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
		
		if(empId == `${sessionScope.loginUser.empId}`){
			isExist = true;
		}
		
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
		
		$("tr#approvalProcedureData_empName td").each(function(){
			// 신청자 중에 있는지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
	
		$("td#approvalThirdLine > span").each(function(){
			// 참조 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputApplicationLineSetting").val('');
		}else{
			
			html += `<li class="js-approval-line-setting applicationLine-li unsortable" id="applicationLineSettingEmpId_` + empId +`" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">
						<span>` + empName 
						+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(applicationLineSettingEmpId_` + empId + `)"></span>
						</span>
					<span style="display:none;">` + positionName + `</span></li>`;
			$("ul#sortApplicationLineSetting").html(html);
			$("input#inputApplicationLineSetting").val('');
			
		}
	});
	
	
	
	
	
	
	// 신청 td 부분 관리 시작------------------------------------------
	// 화면에 보여질 수 - 신청자 수 
	<c:if test="${not empty requestScope.approvalDetail}">
		cnt = 4;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			<c:if test="${procedure.procedureType eq '신청'}">
				cnt--;
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
	</c:if>
	
	// 신청 td 부분 관리 끝------------------------------------------
	
	//////////////////////////////////////////////////////////////////////////////
	
		
		
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
						$("ul.reference_autocomplete").css('top','527px');
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
						
						
						$("ul.reference_autocomplete").css('top','527px');
						
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
		
		if(empId == `${sessionScope.loginUser.empId}`){
			isExist = true;
		}
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if(${procedure.empId} == empId){
				console.log("hi", ${procedure.empId});
				isExist = true;
				
			}
		</c:forEach>
		
		$("tr#approvalProcedureData_empName td").each(function(){
			// 신청자 중에 있는지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		$("tr#appProcedureData_empName td").each(function(){
			// 신청자 중에 있는지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
	
		$("td#approvalThirdLine > span").each(function(){
			// 참조 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		
		if(isExist){
			// 이미 존재한다면
			alert("이미 포함된 결재자는 중복으로 설정할 수 없습니다.")
			$("input#inputApprovalThirdLine").val('');
			
		}else{
			
			let html_reference = $("td#approvalThirdLine").html();
			html_reference += `<span class="refer-list" id="referEmpId_` + empId + `" user_no="3855" node_id="2816" type="F">`
										+		empName 
										+   `<input type="hidden" name="referEmpId" value="` + empId + `" />`
										+	`<span class="icon file_delete js-approval-line-delete" onclick="deleteThis(referEmpId_` + empId + `)" style="display: inline-block;"></span>`
										+ `</span>`;
			
			$("td#approvalThirdLine").html(html_reference);
		}
	})
	
		
	
	
	
		
	

	
	
		
		
		
	
	
	
	
 
 })
		





///////////////////////////////////////////////////////////////////////////////


/* 처리 + 버튼 눌렀을 경우 팝업 */
function approvalLineSetting(){
	
	$("input#inputApprovalLineSetting").val('');
	
	let html = '';
	<c:if test="${not empty requestScope.approvalDetail}">
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			<c:if test="${procedure.procedureType eq '처리'}">
				
				html += `<li class="js-approval-line-setting processLine-li unsortable" id ="processLineSettingEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
				        + `<span>${procedure.empName}`
						+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(processLineSettingEmpId_${procedure.empId})"></span></span>`
						+ `<span style="display:none;">${procedure.positionName}</span></li>`;
				
			</c:if>
			
		</c:forEach>
	</c:if>
	
	<c:if test="${empty requestScope.approvalDetail}">
		
		$("tr#approvalProcedureData_empName td").each(function(i){
			
			 if($(this).html() != ''){
				// 값이 비어있지않다면 넣어준다
				let id = $(this).attr('id');
				let empId = id.substring(id.indexOf('_') +1,id.length);
				let empName = $(this).text();
				let positionName = $($("tr#approvalProcedureData_position td")[i]).text();
				
				html += `<li class="js-approval-line-setting processLine-li unsortable" id ="processLineSettingEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName;
				if(empId != ${sessionScope.loginUser.empId}){
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(processLineSettingEmpId_` + empId +`)"></span>`;
				}else{
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(processLineSettingEmpId_` + empId +`)" style="display:none"></span>`;
				}
				
				html += `</span><span style="display:none;">` + positionName + `</span></li>`;
			 }
			 
		 })
	
	</c:if>
	
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
	
	
	 if($("li.processLine-li").length > 0  && $("li.processLine-li").length <= 4){
		 
		 $("li.processLine-li").each(function(index){
			
			let id = $(this).attr('id');
			let empId = id.substring(id.indexOf('_') +1,id.length);
			let empName = $(this).find('span:eq(0)').text();
			let positionName = $(this).find('span:eq(2)').html();
			console.log("이번엔 empName : " + empName)
			console.log("이번엔 positionName : " + positionName)
			 // 결재 table태그에 이름 넣기
			 
			 let classApproval = $($("tr#approvalProcedureData_empName td")[index]).attr("class");
			 if(classApproval.indexOf('approvalEmpId_') != -1){
				// 값이 있을 경우
				$($("tr#approvalProcedureData_empName td")[index]).removeClass(classApproval.substring(classApproval.indexOf('approvalEmpId_'), classApproval.length));
			}
			 
			 $($("tr#approvalProcedureData_position td")[index]).html(positionName)
			 $($("tr#approvalProcedureData_empName td")[index]).attr('id', 'approvalEmpId_'+empId)
			 $($("tr#approvalProcedureData_empName td")[index]).addClass('approvalEmpId_'+empId)
			 $($("tr#approvalProcedureData_empName td")[index]).html( `<input type="hidden" name="approvalEmpId" value="` + empId + `" />` + empName)
			 
		 })
		 
		for(i = 3; i >= $("li.processLine-li").length ; i--){
			let className = $($("tr#approvalProcedureData_empName td")[i]).attr("class");
			if(className.indexOf('approvalEmpId_') != -1){
				// 값이 있을 경우
				console.log(className.substring(className.indexOf('approvalEmpId_'), className.length));
				$($("tr#approvalProcedureData_empName td")[i]).removeClass(className.substring(className.indexOf('approvalEmpId_'), className.length));
			}
			
			
			 $($("tr#approvalProcedureData_position td")[i]).html('')
			 $($("tr#approvalProcedureData_empName td")[i]).attr('id', '')
			 $($("tr#approvalProcedureData_empName td")[i]).html('')
		}
		 
	 }
	 $("div#layerApprovalLineSetting").hide(); 
	 
} 





///////////////////////////////////////////////////////////////////////////////


/* 신청 + 버튼 눌렀을 경우 팝업 */
function applicationLineSetting(){
	
	$("input#inputApplicationLineSetting").val('');
	
	let html = '';
	
	<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
		<c:if test="${procedure.procedureType eq '신청'}">
		
			html += `<li class="js-approval-line-setting applicationLine-li unsortable" id ="applicationLineSettingEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
		        + `<span>${procedure.empName}`
				+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(applicationLineSettingEmpId_${procedure.empId})"></span></span>`
				+ `<span style="display:none;">${procedure.positionName}</span></li>`;
			
		</c:if>
		
		console.log(html);
	</c:forEach>
	
	
	<c:if test="${empty requestScope.approvalDetail}">
	
		$("tr#appProcedureData_empName td").each(function(i){
			
			 if($(this).html() != ''){
				// 값이 비어있지않다면 넣어준다
				let id = $(this).attr('id');
				let empId = id.substring(id.indexOf('_') +1,id.length);
				let empName = $(this).text();
				let positionName = $($("tr#appProcedureData_position td")[i]).text();
				
				html += `<li class="js-approval-line-setting applicationLine-li unsortable" id ="applicationLineSettingEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName;
				if(empId != ${sessionScope.loginUser.empId}){
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(applicationLineSettingEmpId_` + empId +`)"></span>`;
				}else{
					html += `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(applicationLineSettingEmpId_` + empId +`)" style="display:none"></span>`;
				}
				
				html += `</span><span style="display:none;">` + positionName + `</span></li>`;
			 }
			 
		 })
	
	</c:if>
	
	$("ul#sortApplicationLineSetting").html(html);
	
	$("div#layerApplicationLineSetting").show(); 

}



/* 신청 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateApplicationLineSetting(){
	 
	if($("li.applicationLine-li").length > 0  && $("li.applicationLine-li").length <= 4){
		 
		 $("li.applicationLine-li").each(function(index){
			
			let id = $(this).attr('id');
			let empId = id.substring(id.indexOf('_') +1,id.length);
			let empName = $(this).find('span:eq(0)').text();
			let positionName = $(this).find('span:eq(2)').html();
			console.log("이번엔 empName : " + empName)
			console.log("이번엔 positionName : " + positionName)
			 // 결재 table태그에 이름 넣기
			 
			 
			 $($("tr#appProcedureData_position td")[index]).html(positionName)
			 
			 
			 let classApplication = $($("tr#appProcedureData_empName td")[index]).attr("class");
			 if(classApplication.indexOf('approvalEmpId_') != -1){
				// 값이 있을 경우
				$($("tr#appProcedureData_empName td")[index]).removeClass(classApplication.substring(classApplication.indexOf('approvalEmpId_'), classApplication.length));
			}
		
			 $($("tr#appProcedureData_empName td")[index]).attr('id', 'applicationEmpId_'+empId)
			 $($("tr#appProcedureData_empName td")[index]).addClass('approvalEmpId_'+empId)
			 $($("tr#appProcedureData_empName td")[index]).html( `<input type="hidden" name="applicationEmpId" value="` + empId + `" />` + empName)
			 
		 })
		 
		for(i = 3; i >= $("li.applicationLine-li").length ; i--){
			let className = $($("tr#appProcedureData_empName td")[i]).attr("class");
			if(className.indexOf('approvalEmpId_') != -1){
				// 값이 있을 경우
				console.log(className.substring(className.indexOf('approvalEmpId_'), className.length));
				$($("tr#appProcedureData_empName td")[i]).removeClass(className.substring(className.indexOf('approvalEmpId_'), className.length));
			}
			
			
			 $($("tr#appProcedureData_position td")[i]).html('')
			 $($("tr#appProcedureData_empName td")[i]).attr('id', '')
			 $($("tr#appProcedureData_empName td")[i]).html('')
		}
		 
		 $("div#layerApplicationLineSetting").hide(); 
		 
	 }else{
			alert("신청자 수는 한 명 이상 네 명 이하로 존재하여야 합니다.")
	 }
	
}







//////////////////////////////////////////////////////////////////////////////////////////////
// 절차 + 버튼_사원명 삭제 버튼 클릭시

// 결재 리스트에서 지우기
function deleteThis(id) {
	$(id).detach();
}



/////////////////////////////////////////////////////////////////////////////////////////////
function clickTriggerToFileApprovalAttachWriteForm() {
	$("input#fileApprovalAttachWriteForm").trigger("click");
}

</script>










<div id="contents">
	<form name="writeDocumentFrm">
		<c:if test="${not empty requestScope.approvalDetail}">
			<input type="hidden" name="approvalId" value="${requestScope.approvalDetail.approvalId}" />
		</c:if>
		<!-- <input type="submit" style="display: none;" onclick="return false;"> -->


		<div class="content_title">
			<fieldset style="max-width: 969px;">
				<span class="detail_select" id="btnWriteSaveDocument">
					<button type="button" id="btnWrite">기안하기</button>
				</span>
				<span class="detail_select hide" id="btnTempSaveDocument" style="display: inline;">
					<button type="button" id="btnTemp">임시저장</button>
				</span>
			</fieldset>
		</div>

		<div class="content_inbox">
			<div class="cont_box write">
				<div class="approval-wrap write">
					<h4 style="display: inline-block">
						기본 설정
						<!-- <a href="수정필" class="mgl_20 weakblue hide" id="approvalFormRule" onclick="ApprovalDocument.showApprovalFormRule('');" style="display: none;">사내전자결재규정</a> -->
					</h4>
					<table class="tableType02">
						<caption>전자결재 기본 설정</caption>
						<colgroup>
							<col style="width: 12.15%;">
							<col style="width: 44.94%">
							<col style="width: 12.15%">
							<col style="width: 30.76%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">문서 종류</th>
								<td>
									<select name="formId" class="write-select" autocomplete="off">
										<option value="">선택</option>
										<c:forEach var="formVo" items="${requestScope.formList}">
											<c:if test="${formVo.formId eq 109}">
												<option value="${formVo.formId}" selected>${formVo.formName}</option>
											</c:if>
											<c:if test="${formVo.formId ne 109}">
												<option value="${formVo.formId}">${formVo.formName}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<th scope="row">작성자</th>
								<td>
									<input type="hidden" name="empId" value="${sessionScope.loginUser.empId}">
									[${sessionScope.loginUser.depName}] ${sessionScope.loginUser.teamName}
									<span>${sessionScope.loginUser.positionName} ${sessionScope.loginUser.empName}</span>
								</td>
							</tr>
							<tr>
								<th scope="row">보존 연한</th>
								<td>${requestScope.preservationYear}년</td>
								<th scope="row">보안 등급</th>
								<td>
									<select name="security_level" class="fl write-select mgl_10 view">
										<option value="">보안 등급</option>

										<c:forEach var="securityVo" items="${requestScope.securityLevelList}">

											<c:if test="${not empty requestScope.approvalDetail}">
												<c:if test="${requestScope.approvalDetail.securityId eq securityVo.securityId}">
													<option value="${securityVo.securityId}" selected>${securityVo.securityLevel}등급</option>
												</c:if>


												<c:if test="${requestScope.approvalDetail.securityId ne securityVo.securityId}">
													<option value="${securityVo.securityId}">${securityVo.securityLevel}등급</option>
												</c:if>
											</c:if>

											<c:if test="${empty requestScope.approvalDetail}">
												<option value="${securityVo.securityId}">${securityVo.securityLevel}등급</option>
											</c:if>

										</c:forEach>
									</select>


								</td>
							</tr>
						</tbody>
					</table>







					<div class="after">
						<h4 class="fl mgr_20">결재선</h4>
					</div>
					<div id="approvalDocumentLine">
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
											<span class="spr-approval set" title="신청" onclick="applicationLineSetting();"></span>
										</div>
									</th>
									<td class="confer vt" id="approvalFirstLine">
										<table>
											<colgroup>
												<col width="">
												<col width="">
												<col width="">
												<col width="">
											</colgroup>
											<tbody>
												<tr id="appProcedureData_position">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '신청'}">
																<td class="team name">${procedure.positionName}</td>
															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="team name">${sessionScope.loginUser.positionName}</td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
													</c:if>
												</tr>
												<tr id="appProcedureData_stamp">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '신청'}">
																<td class="stamp"></td>
															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
													</c:if>

												</tr>
												<tr id="appProcedureData_empName">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '신청'}">
																<td class="name gt-position-relative approvalEmpId_${procedure.empId}" id="applicationEmpId_${procedure.empId}">
																	<input type="hidden" name="applicationEmpId" value="${procedure.empId}" />
																	${procedure.empName}
																</td>

															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="name gt-position-relative approvalEmpId_${sessionScope.loginUser.empId}" id="applicationEmpId_${sessionScope.loginUser.empId}">
															<input type="hidden" name="applicationEmpId" value="${sessionScope.loginUser.empId}" />
															${sessionScope.loginUser.empName}
														</td>

														<%-- <td class="name gt-position-relative">${sessionScope.loginUser.empName}</td> --%>
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
													</c:if>
												</tr>
											</tbody>
										</table>
									</td>












									<th scope="row" class="confer">
										<div class="choice" style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
											처리
											<span class="spr-approval set" title="처리" onclick="approvalLineSetting();"></span>
										</div>
									</th>
									<td class="confer vt" id="approvalSecondLine">
										<table>
											<colgroup>
												<col width="">
												<col width="">
												<col width="">
												<col width="">
											</colgroup>
											<tbody>
												<tr id="approvalProcedureData_position">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '처리'}">
																<td class="team name">${procedure.positionName}</td>
															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
													</c:if>
												</tr>
												<tr id="approvalProcedureData_stamp">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '처리'}">
																<td class="stamp"></td>
															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
													</c:if>

												</tr>
												<tr id="approvalProcedureData_empName">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '처리'}">
																<td class="name gt-position-relative approvalEmpId_${procedure.empId}" id="approvalEmpId_${procedure.empId}">
																	<input type="hidden" name="approvalEmpId" value="${procedure.empId}" />
																	${procedure.empName}
																</td>

															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<%-- <td class="name gt-position-relative approvalEmpId_${sessionScope.loginUser.empId}" id="approvalEmpId_${sessionScope.loginUser.empId}">
														<input type="hidden" name="approvalEmpId" value="${sessionScope.loginUser.empId}" />
														${sessionScope.loginUser.empName}
													</td> --%>

														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
													</c:if>
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
									<th scope="row">참조</th>
									<td id="approvalThirdLine">
										<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalThirdLine" autocomplete="off">

										<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
											<c:if test="${procedure.procedureType eq '참조'}">
												<span class="refer-list" id="referEmpId_${procedure.empId}" user_no="3855" node_id="2816" type="F">
													${procedure.empName}
													<input type="hidden" name="referEmpId" value="${procedure.empId}" />
													<span class="icon file_delete js-approval-line-delete" onclick="deleteThis(referEmpId_${procedure.empId})" style="display: inline-block;"></span>
												</span>
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="write_input js-approval-input hide mgt_50" style="display: block;">
						<h4 class="fl">제목</h4>
						<div class="txt file" style="margin-right: 2px;">
							<div>
								<input type="text" name="approval_document_title" id="approval_document_title" placeholder="제목을 입력해 주세요." value="${requestScope.approvalDetail.title}" tabindex="1" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="write_input js-approval-input hide mgt_50" style="display: block;">
						<h4>본문</h4>
					</div>

					<h4 class="mgt_50 js-approval-input-guide" style="display: none;">상세 입력</h4>

					<div class="write_input js-approval-input-guide" style="display: none;">문서 종류 선택 시 상세 입력이 노출됩니다.</div>

					<div class="write_input hide" id="approvalEditorContent" style="display: none;">
						<div class="txt file">
							<div id="dexteditor_holder"></div>
							<textarea style="display: none" id="compose_contents"></textarea>
							<div id="new_compose_contents" class="se se-edit-mode se se-classic-editor se-blur" style="width: 100%; height: 500px;">
								<div class="se-container">
									<div class="se-dim-layer" style="height: 0px;">
										<div class="se-loader">
											<div></div>
											<div></div>
											<div></div>
											<span></span>
										</div>
									</div>
									<div class="se-balloon-container se-fold"></div>
									<div class="se-dialog-container"></div>
									<div class="se-calculate"></div>
									<input class="se-file-selector" type="file" name="file">
									<iframe class="se-print se-hide"></iframe>
									<div class="se-clipboard" contenteditable="true" tabindex="-1"></div>
								</div>
								<div class="se-header"></div>
								<div class="se-main se-horz-scroll" style="height: calc(100% + 0px);">
									<iframe class="se-contents-edit" tabindex="2"></iframe>
									<iframe class="se-contents-preview"></iframe>
									<div class="se-code-viewer"></div>
								</div>

								<div class="se-footer">
									<div class="se-editor-resizer">
										<div class="se-resizer-bar"></div>
										<svg class="se-resizer-knob" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="75px" height="21.512px" viewBox="0 0 75 21.512" enable-background="new 0 0 75 21.512" xml:space="preserve">
											<g>
											<g>
											<g>
											<polygon class="se-resizer-knob-bg" points="68.995,16.49 5.971,16.49 4.983,4.49 69.983,4.49"></polygon></g>
											<g>
											<path class="se-resizer-knob-border" d="M69.456,16.99H5.51l-1.07-13h66.086L69.456,16.99z M6.431,15.99h62.103l0.906-11H5.526L6.431,15.99z"></path></g></g>
											<g>
											<polygon class="se-resizer-knob-icon" points="37.483,13.862 33.573,8.276 34.393,7.703 37.483,12.118 40.574,7.703 41.392,8.276"></polygon></g></g></svg>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="js-approval-input hide" id="approvalDbContent" style="display: block;">
						<div class="approval-unit">
							<div id="write_db_unit" class="unit-box-contents detail-write gt-no-padding gt-d-table gt-w-100 write-page">
								<div id="lqxasxwf3gwk">
									<div class="df-wrap unit-row insa_jyqm70vn96e2" id="jyqm70vn96e2" df-type="insa" df-fieldtype="username">
										<div class="df-field-label unit-cell-head">
											<label>이름</label>
										</div>
										<div class="df-field unit-cell-body gt-d-table">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<span class="df-values">${sessionScope.loginUser.empName}</span>
											</span>
										</div>
									</div>
									<div class="df-wrap unit-row insa_jyqm70vn96e2" id="jyqm7pko76zn" df-type="insa" df-fieldtype="org">
										<div class="df-field-label unit-cell-head">
											<label>소속</label>
										</div>
										<div class="df-field unit-cell-body gt-d-table">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<span class="df-values">[${sessionScope.loginUser.depName}] ${sessionScope.loginUser.teamName}</span>
											</span>
										</div>
									</div>
									<div class="df-wrap unit-row insa_jyqm70vn96e2" id="jyqm7pkowplp" df-type="insa" df-fieldtype="birthday">
										<div class="df-field-label unit-cell-head">
											<label>생년월일</label>
										</div>
										<div class="df-field unit-cell-body gt-d-table">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<span class="df-values">${sessionScope.loginUser.birth}</span>
											</span>
										</div>
									</div>
									<div class="df-wrap unit-row insa_jyqm70vn96e2" id="jyqm7pkorbih" df-type="insa" df-fieldtype="joindate">
										<div class="df-field-label unit-cell-head">
											<label>입사일</label>
										</div>
										<div class="df-field unit-cell-body gt-d-table">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<span class="df-values">${sessionScope.loginUser.startWorkDay}</span>
											</span>
										</div>
									</div>
									<div class="df-wrap unit-row insa_jyqm70vn96e2" id="jyqm7pkpsr20" df-type="insa" df-fieldtype="address">
										<div class="df-field-label unit-cell-head">
											<label>주소</label>
										</div>
										<div class="df-field unit-cell-body gt-d-table">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<span class="df-values">${sessionScope.loginUser.postCode} ${sessionScope.loginUser.address} ${sessionScope.loginUser.detailAddress}</span>
											</span>
										</div>
									</div>
									<div class="df-wrap unit-row" id="jyqm7ruune38" df-type="text">
										<div class="df-field-label unit-cell-head">
											<label class="gt-align-middle">제출처 </label>
										</div>
										<div class="df-field unit-cell-body gt-d-table gt-h-auto">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<input type="text" class="hw-input-form type-text-width" name="toSubmit" value="${requestScope.empProofDetail.submit}" style="width: 50% !important;" minlength="0" maxlength="100">
											</span>
											<span class="gt-d-table-cell unit-btn-cell"></span>
										</div>
									</div>
									<div class="df-wrap unit-row" id="jyqm7s52nazl" df-type="text">
										<div class="df-field-label unit-cell-head">
											<label class="gt-align-middle">용도 </label>
										</div>
										<div class="df-field unit-cell-body gt-d-table gt-h-auto">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<input type="text" class="hw-input-form type-text-width" name="reason" value="${requestScope.empProofDetail.reason}" style="width: 80% !important;" minlength="0" maxlength="100">
											</span>
											<span class="gt-d-table-cell unit-btn-cell"></span>
										</div>
									</div>
									<div class="df-wrap unit-row" id="jzxgpuw5qgjv" df-type="date">
										<div class="df-field-label unit-cell-head">
											<label class="gt-align-middle">발행일 </label>
										</div>
										<div class="df-field unit-cell-body gt-d-table gt-h-auto">
											<span class="gt-d-table-cell gt-pr-10 gt-w-100">
												<span class="gt-position-relative gt-d-inline-block">
													<input type="text" class="hw-input-form type-date-width" name="issueDay" value="" id="issueDay" readonly="readonly" style="margin-right: 5px">
													<button type="button" class="input-suffix-btn hover-blue-text gt-p-5">
														<!-- <i class="fal fa-calendar-alt"></i> -->
													</button>
												</span>
											</span>
											<span class="gt-d-table-cell unit-btn-cell"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="js-approval-input hide" id="approvalModule" style="display: block;"></div>


					<div class="write_input js-approval-input mgt_15 hide" style="display: block;">
						<label for="write_txt3" class="blind">파일 첨부</label>
						<div class="txt file">
							<div class="position">
								<div class="top">
									<p class="left"></p>
									<h4 class="fl mgr_20 gt-bold viewAttachedFileArea">별첨</h4>

									<button type="button" class="addfile viewAttachedFileArea" style="color: #779ec0;" onclick="clickTriggerToFileApprovalAttachWriteForm()">파일 첨부</button>
									<input type="file" style="overflow: hidden; width: 0px; height: 0px;" name="approval_attach" id="fileApprovalAttachWriteForm" multiple="">


									<!-- <span class="right gt-float-right viewAttachedFileArea hide" id="approvalAttachSize" style="display: none;">
									<span id="attachAttachSum"></span>
									/ 50MB
								</span>
								 -->

									<p></p>
								</div>
								<div class="file-list mgt_15" id="dragZone" style="min-height: 66px;">
									<c:if test="${empty requestScope.approvalDetail.fvo}">
										<div class="center viewAttachedFileArea show" id="approvalAttachText">여기로 파일을 끌어놓으세요</div>
									</c:if>
									<c:if test="${not empty requestScope.approvalDetail.fvo}">
										<div class="center viewAttachedFileArea show" id="approvalAttachText" style="display: none;">여기로 파일을 끌어놓으세요</div>
									</c:if>
									<c:if test="${empty requestScope.approvalDetail.fvo}">
										<div class="list gt-mt-5" id="approvalAttachList" style="display: none;">
									</c:if>
									<c:if test="${not empty requestScope.approvalDetail.fvo}">
										<div class="list gt-mt-5" id="approvalAttachList">
									</c:if>

									<table id="tableApprovalRelated">
										<caption></caption>
										<colgroup>
											<col width="">
										</colgroup>
										<tbody></tbody>
									</table>
									<table id="tableApprovalAttach">
										<caption></caption>
										<colgroup>
											<col width="">
										</colgroup>
										<tbody>
											<c:forEach var="approvalFileVo" items="${requestScope.approvalDetail.fvo}">
												<tr>
													<td>
														<div class="filename js-approval-attach">
															<span>${approvalFileVo.fileRName}
																(
																<fmt:formatNumber value="${approvalFileVo.fileSize}" pattern="0.000" />
																MB)
															</span>
															<input type="hidden" name="orgFiles" value="${approvalFileVo.approvalFileId}" />
															<button type="button" class="icon file_delete js-approval-attach-delete">
																<span class="blind">파일 삭제</span>
															</button>
															<div></div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>