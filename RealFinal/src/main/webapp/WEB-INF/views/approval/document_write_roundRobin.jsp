<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>


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
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   
	   /* 기안하기 버튼 클릭시 */
	   $("button#btnWrite").click(function(){
		   
		
			let isCheck = true;
			
			<%-- === 스마트 에디터 구현 시작 === --%>
			// id가 content인 textarea에 에디터에서 대입
			     obj.getById["compose_contents"].exec("UPDATE_CONTENTS_FIELD", []);
			<%-- === 스마트 에디터 구현 끝 === --%>
			
			
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
					url : "<%=ctxPath%>/approval/insertDocumentWrite/roundRobin.gw",
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
						$(location).attr('href', `<%=ctxPath%>/approval/documentDetail/` + text.viewType + `/` + type + `/view.gw?formId=108&approvalId=`+text.approvalId);
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
		
			<%-- === 스마트 에디터 구현 시작 === --%>
			// id가 content인 textarea에 에디터에서 대입
			     obj.getById["compose_contents"].exec("UPDATE_CONTENTS_FIELD", []);
			<%-- === 스마트 에디터 구현 끝 === --%>
			
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
					url : "<%=ctxPath%>/approval/insertTempDocumentWrite/roundRobin.gw",
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
	
	
	
	
	<%-- === #166. 스마트 에디터 구현 시작 === --%>
 	//전역변수
    var obj = [];
    
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "compose_contents", // id가 content인 textarea에 에디터를 넣어준다.
        sSkinURI: "<%=ctxPath%>/resources/smarteditor/SmartEditor2Skin_noImage.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
   <%-- === 스마트 에디터 구현 끝 === --%>
	
	
	
   
   
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 결재 td 부분 관리 시작------------------------------------------
	
	// 화면에 보여질 수 - 결재자 수 
   <c:if test="${not empty requestScope.approvalDetail}">
		let cnt = 7;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			<c:if test="${procedure.procedureType eq '결재'}">
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
	
	
	// 재무합의 td 부분 관리 시작------------------------------------------
	 <c:if test="${not empty requestScope.approvalDetail}">
		// 화면에 보여질 수 - 결재자 수 
		cnt = 4;
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			<c:if test="${procedure.procedureType eq '재무합의'}">
				cnt--;
			</c:if>
		</c:forEach>
		
		if(cnt > 0){
			let html_fiPosition = $("tr#fiAgreeProcedureData_position").html();
			let html_fiStamp = $("tr#fiAgreeProcedureData_stamp").html();
			let html_fiEmpName = $("tr#fiAgreeProcedureData_empName").html();
			
			while(cnt != 0){
				html_fiPosition += `<td class="team name"></td>`;
				html_fiStamp += `<td class="stamp"></td>`;
				html_fiEmpName += `<td class="name gt-position-relative"></td>`;
				cnt--;
			}
			
			$("tr#fiAgreeProcedureData_position").html(html_fiPosition)
			$("tr#fiAgreeProcedureData_stamp").html(html_fiStamp)
			$("tr#fiAgreeProcedureData_empName").html(html_fiEmpName)
		}
	</c:if>
	// 재무합의 td 부분 관리 끝------------------------------------------
	
	
	///////////////////////////////////////////////////////////////////////////////////////
	
	// 합의 + 버튼_사원명 입력시
	let prev_autoAgreeComplete = $("ul.agree_autocomplete").html();
	$("input#inputAgreeLineSetting").focus(function(){
		
		if($("input#inputAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputAgreeLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputAgreeLineSetting").val().trim()},
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
						$("ul.agree_autocomplete").html(html);
						$("ul.agree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.agree_autocomplete").show();
						
					}else{
						$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
						$("ul.agree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
			$("ul.agree_autocomplete").hide();
		}
		
	}).keyup(function(){
		
		if($("input#inputAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputAgreeLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputAgreeLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.agree_autocomplete").html(html);
						$("ul.agree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.agree_autocomplete").show();
						
					}else{
						$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
						$("ul.agree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
			$("ul.agree_autocomplete").hide();
		}
		
	})
	
	
	
	$("input#inputAgreeLineSetting").focusout(function(){
		$("ul.agree_autocomplete").html(prev_autoAgreeComplete);
		$("ul.agree_autocomplete").hide();
	}) 
	
	$(document).on("mousedown", "ul.agree_autocomplete li", function() {
		
		let html = $("ul#sortAgreeLineSetting").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		
		let isExist = false;
		
		if(empId == `${sessionScope.loginUser.empId}`){
			isExist = true;
		}
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '합의' && ${procedure.empId} == empId){
				console.log("hi", ${procedure.empId});
				isExist = true;
				
			}
			
		</c:forEach>
		
		$("ul#sortAgreeLineSetting li").each(function(){
			// 리스트 안에도 있는 지 확인
			let liId = $(this).attr('id');
			let liEmpId = liId.substring(liId.indexOf('_') +1,liId.length);
			
			if(liEmpId == empId){
				isExist = true;
				return false;
			}
		})
		
		
		$("tr#approvalProcedureData_empName td").each(function(){
			// 결재 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		
		
		$("td#approvalFourthLine span").each(function(){
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
		
		$("tr#fiAgreeProcedureData_empName td").each(function(){
			// 재무합의 안에도 있는 지 확인
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
			$("input#inputAgreeLineSetting").val('');
		}else{
			
			html += `<li class="js-approval-line-setting agreeLine-li unsortable" id ="agreeEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName
							+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(agreeEmpId_` + empId +`)"></span>`
						+ `</span>`
					+`</li>`;
		
			$("ul#sortAgreeLineSetting").html(html);
			$("input#inputAgreeLineSetting").val('');
			
		}
	});
	
	
	
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
		
		console.log("html : ", html);
		
		let isExist = false;
		
		if(empId == `${sessionScope.loginUser.empId}`){
			isExist = true;
		}
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '결재' && ${procedure.empId} == empId){
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
		
		
		/* $("tr#approvalProcedureData_empName td").each(function(){
			// 결재 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		}) */
		
		
		$("td.agreeData").each(function(){
			// 합의 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		
		$("td#approvalFourthLine span").each(function(){
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
		
		$("tr#fiAgreeProcedureData_empName td").each(function(){
			// 재무합의 안에도 있는 지 확인
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
			html += `<li class="js-approval-line-setting approvalLine-li unsortable" id ="approvalLineSettingEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName
							+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(approvalLineSettingEmpId_` + empId +`)"></span>`
						+ `</span>
							<span style="display:none;">` + positionName + `</span>
					</li>`;
			$("ul#sortApprovalLineSetting").html(html);
			$("input#inputApprovalLineSetting").val('');
			
		}
	});
	
	
	
	
	
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////
	// 재무합의 + 버튼_사원명 입력시
	let prev_autoFiAgreeComplete = $("ul.fiAgree_autocomplete").html();
	$("input#inputFiAgreeLineSetting").focus(function(){
		
		if($("input#inputFiAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputFiAgreeLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputFiAgreeLineSetting").val().trim()},
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
						$("ul.fiAgree_autocomplete").html(html);
						$("ul.fiAgree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.fiAgree_autocomplete").show();
						
					}else{
						$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
						$("ul.fiAgree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
			$("ul.fiAgree_autocomplete").hide();
		}
		
	}).keyup(function(){
		
		if($("input#inputFiAgreeLineSetting").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputFiAgreeLineSetting").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputFiAgreeLineSetting").val().trim()},
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {
					let html = '';
					for(let i = 0 ; i < text.length ; i++){
						html += `<li class="ui-menu-item" id="ui-id-11" tabindex="-1"><div><span class="team-membername" id="addEmpId_` + text[i]['empId'] +`">` + text[i]['empName'] + `</span><span class="team-name">` + [text[i]['depName']] + ` ` +  text[i]['teamName'] + `</span><span style="display:none;">` + text[i]['positionName'] +`</span></div></li>`;
					}
					
					if(text.length > 0){
						$("ul.fiAgree_autocomplete").html(html);
						$("ul.fiAgree_autocomplete li").hover(function(){
							$(this).css('background', '#e8ecee');
						},
						function(){
							$(this).css('background','');
						}
						);
						$("ul.fiAgree_autocomplete").show();
						
					}else{
						$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
						$("ul.fiAgree_autocomplete").hide();
					}
				},
				error: function(request, status, error) {
					alert("문제가 발생하였습니다. 다시 시도하여 주세요.")
				}
			});
		}else{
			$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
			$("ul.fiAgree_autocomplete").hide();
		}
		
	})
	
	
	
	$("input#inputFiAgreeLineSetting").focusout(function(){
		$("ul.fiAgree_autocomplete").html(prev_autoFiAgreeComplete);
		$("ul.fiAgree_autocomplete").hide();
	}) 
	
	$(document).on("mousedown", "ul.fiAgree_autocomplete li", function() {
		
		let html = $("ul#sortFiAgreeLineSetting").html();
		let id = $(this).find('span:eq(0)').attr('id');
		let empId = id.substring(id.indexOf('_') +1,id.length);
		let empName = $(this).find('span:eq(0)').html();
		let positionName = $(this).find('span:eq(2)').html();
		
		let isExist = false;
		
		
		if(empId == `${sessionScope.loginUser.empId}`){
			isExist = true;
		}
		
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			if("${procedure.procedureType}" != '재무합의' && ${procedure.empId} == empId){
				console.log("hi", ${procedure.empId});
				isExist = true;
				
			}
			
		</c:forEach>
		
		$("ul#sortFiAgreeLineSetting li").each(function(){
			// 리스트 안에도 있는 지 확인
			let liId = $(this).attr('id');
			let liEmpId = liId.substring(liId.indexOf('_') +1,liId.length);
			
			if(liEmpId == empId){
				isExist = true;
				return false;
			}
		})
		
		$("tr#approvalProcedureData_empName td").each(function(){
			// 결재 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		
		$("td.agreeData").each(function(){
			// 합의 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		$("td#approvalFourthLine span").each(function(){
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
			$("input#inputFiAgreeLineSetting").val('');
		}else{
			html += `<li class="js-approval-line-setting fiAgreeLine-li unsortable" id ="fiAgreeEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName
							+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(fiAgreeEmpId_` + empId +`)"></span>`
						+ `</span>`
						+ `<span style="display:none;">` + positionName + `</span>`
					+`</li>`;
			
			
			$("ul#sortFiAgreeLineSetting").html(html);
			$("input#inputFiAgreeLineSetting").val('');
			
		}
	});
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 참조 + 버튼_입력시
	
	let prev_refAutoComplete = $("ul.reference_autocomplete").html();
	console.log("prev_refAutoComplete", prev_refAutoComplete)
	$(document).on("focus", "input#inputApprovalFourthLine", function(){
		
		if($("input#inputApprovalFourthLine").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalFourthLine").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalFourthLine").val().trim()},
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
						$("ul.reference_autocomplete").css('top', '690px');
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
	
	$(document).on("keyup", "input#inputApprovalFourthLine", function(){
		
		if($("input#inputApprovalFourthLine").val().trim() != ''){
			// 검색값이 있을 경우
			
			console.log($("input#inputApprovalFourthLine").val())
			
			$.ajax({
				url: "<%=ctxPath%>/approval/searchEmpName.gw",
				data: { "empName": $("input#inputApprovalFourthLine").val().trim()},
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
						
						
						$("ul.reference_autocomplete").css('top', '690px');
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
	$(document).on("focusout", "input#inputApprovalFourthLine", function(){
		$("ul.reference_autocomplete").html(prev_refAutoComplete);
		$("ul.reference_autocomplete").hide();
	}) 
	
	// 드롭다운 리스트에서 선택했을 경우
	$(document).on("mousedown", "ul.reference_autocomplete li", function() {
		
		let html = $("td#approvalFourthLine").html();
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
		
		$("td#approvalFourthLine > span").each(function(){
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
		
		$("tr#approvalProcedureData_empName td").each(function(){
			// 결재 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		
		$("td.agreeData").each(function(){
			// 합의 안에도 있는 지 확인
			let sId = $(this).attr('id');
			if(typeof sId != "undefined" && sId != "" && sId != null){
				let sEmpId = sId.substring(sId.indexOf('_') +1, sId.length);
				
				if(sEmpId == empId){
					isExist = true;
					return false;
				}
			}
		})
		
		$("tr#fiAgreeProcedureData_empName td").each(function(){
			// 재무합의 안에도 있는 지 확인
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
			$("input#inputApprovalFourthLine").val('');
			
		}else{
			
			let html_reference = $("td#approvalFourthLine").html();
			html_reference += `<span class="refer-list" id="referEmpId_` + empId + `">`
							+		empName 
							+   `<input type="hidden" name="referEmpId" value="` + empId + `" />`
							+	`<span class="icon file_delete js-approval-line-delete" onclick="deleteThis(referEmpId_` + empId + `)" style="display: inline-block;"></span>`
							+ `</span>`;
			
			$("td#approvalFourthLine").html(html_reference);
		}
	})
	
	
	
	
	
	
	
})




///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////


/* 결재 + 버튼 눌렀을 경우 팝업 */
function approvalLineSetting(){
	
	$("input#inputApprovalLineSetting").val('');
	
	let html = '';
	<c:if test="${not empty requestScope.approvalDetail}">
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			<c:if test="${procedure.procedureType eq '결재'}">
				
				html += `<li class="js-approval-line-setting approvalLine-li unsortable" id ="approvalLineSettingEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
				        + `<span>${procedure.empName}`
						+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(approvalLineSettingEmpId_${procedure.empId})"></span></span>`
						+ `<span style="display:none;">${procedure.positionName}</span></li>`;
				
			</c:if>
			
			console.log(html);
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
				
				
				html += `<li class="js-approval-line-setting approvalLine-li unsortable" id ="approvalLineSettingEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName
							+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(approvalLineSettingEmpId_` + empId +`)"></span>`
						+ `</span>`
						+	`<span style="display:none;">` + positionName + `</span>`
						+`</li>`;
			 }
			 
		 })
	
	</c:if>
	
	$("ul#sortApprovalLineSetting").html(html);
	
	$("div#layerApprovalLineSetting").show(); 

}



/* 결재 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateApprovalLineSetting(){
	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */
	
	
	if($("li.approvalLine-li").length > 0  && $("li.approvalLine-li").length <= 7){
	 
	 $("li.approvalLine-li").each(function(index){
		
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
		 $($("tr#approvalProcedureData_empName td")[index]).html(`<input type="hidden" name="approvalEmpId" value="` + empId + `" />` + empName)
		 
	 })
	 
	for(i = 6; i >= $("li.approvalLine-li").length ; i--){
		let className = $($("tr#approvalProcedureData_empName td")[i]).attr("class");
		if(className.indexOf('approvalEmpId_') != -1){
			// 값이 있을 경우
			console.log("값 있따")
			console.log(className.substring(className.indexOf('approvalEmpId_'), className.length));
			$($("tr#approvalProcedureData_empName td")[i]).removeClass(className.substring(className.indexOf('approvalEmpId_'), className.length));
		}
		
		
		 $($("tr#approvalProcedureData_position td")[i]).html('')
		 $($("tr#approvalProcedureData_empName td")[i]).attr('id', '')
		 $($("tr#approvalProcedureData_empName td")[i]).html('')
	}
	 $("div#layerApprovalLineSetting").hide(); 
	 
	}else{
	 alert("결재자는 1명 이상 7명 이하로 설정해야합니다.")
	}
} 





//////////////////////////////////////////////////////////////////////////////////////////////


/* 합의 + 버튼 눌렀을 경우 팝업 */
function agreeLineSetting(){
	
	$("input#inputAgreeLineSetting").val('');
	
	let html = '';
	
	
	console.log("으이이잉이이이이 ?? ")
	$("td.agreeData").each(function(i){
		
		if(typeof $(this).attr('id') != 'undefined' && $(this).attr('id') != null && $(this).attr('id') != ''){
			// 값이 비어있지않다면 넣어준다
			console.log("들어왔음")
			
			let id = $(this).attr('id');
			let empId = id.substring(id.indexOf('_') +1,id.length);
			let empName = $(this).text();
	
			html += `<li class="js-approval-line-setting agreeLine-li unsortable" id ="agreeLineSettingEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
					+ `<span>` + empName
						+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(agreeLineSettingEmpId_` + empId +`)"></span>`
					+ `</span>`
					+`</li>`;
		}	
			
					
		 
	 })
	
	
	$("ul#sortAgreeLineSetting").html(html);
	
	$("div#layerAgreeLineSetting").show(); 

}



/* 합의 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateAgreeLineSetting(){
	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */
	
	
	
	if($("li.agreeLine-li").length > 0  && $("li.agreeLine-li").length <= 6){
		 
		 $("li.agreeLine-li").each(function(index){
			
			let id = $(this).attr('id');
			let empId = id.substring(id.indexOf('_') +1,id.length);
			let empName = $(this).find('span:eq(0)').text();
			
			console.log(empId)
			
			 // 결재 table태그에 이름 넣기
			 
			 let classApproval = $($("td.agreeData")[index]).attr("class");
			 if(typeof classApproval != "undefined" && classApproval.indexOf('agreeEmpId_') != -1){
				// 값이 있을 경우
				
				console.log("값이 있을 경우")
				console.log($($("td.agreeData")[index]).html())
				
				$($("td.agreeData")[index]).removeClass(classApproval.substring(classApproval.indexOf('agreeEmpId_'), classApproval.length));
			}
			 
			 $($("td.agreeData")[index]).attr('id', 'agreeEmpId_'+empId)
			 $($("td.agreeData")[index]).addClass('agreeEmpId_'+empId)
			 
			 /* 1을 수정필 시퀀스로 */
			 $($("td.agreeData")[index]).html(`<span class="">` + empName + `</span>`
											+`<input type="hidden" name="agreeEmpId" value="` + empId + `" />`)
			 
		 })
		 
		for(i = 5; i >= $("li.agreeLine-li").length ; i--){
			let className = $($("td.agreeData")[i]).attr("class");
			if(typeof className != "undefined" && className.indexOf('agreeEmpId_') != -1){
				// 값이 있을 경우
				console.log("값 있따")
				console.log(className.substring(className.indexOf('agreeEmpId_'), className.length));
				$($("td.agreeData")[i]).removeClass(className.substring(className.indexOf('agreeEmpId_'), className.length));
			}
			
			
			 $($("td.agreeData")[i]).attr('id', '')
			 $($("td.agreeData")[i]).html('')
		}
		 $("div#layerAgreeLineSetting").hide(); 
		 
		}
	
	
}
















//////////////////////////////////////////////////////////////////////////////////////////////


/* 재무합의 + 버튼 눌렀을 경우 팝업 */
function fiAgreeLineSetting(){
	
	$("input#inputFiAgreeLineSetting").val('');
	
	let html = '';
	
	<c:if test="${not empty requestScope.approvalDetail}">
		<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
			<c:if test="${procedure.procedureType eq '재무합의'}">
				
				html += `<li class="js-approval-line-setting fiAgreeLine-li unsortable" id ="fiAgreeLineSettingEmpId_${procedure.empId}" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
				        + `<span>${procedure.empName}`
						+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(fiAgreeLineSettingEmpId_${procedure.empId})"></span></span>`
						+ `<span style="display:none;">${procedure.positionName}</span></li>`;
				
			</c:if>
			
			console.log(html);
		</c:forEach>
	</c:if>
	
	<c:if test="${empty requestScope.approvalDetail}">
	
		
		$("tr#fiAgreeProcedureData_empName td").each(function(i){
			
			 if($(this).html() != ''){
				// 값이 비어있지않다면 넣어준다
				let id = $(this).attr('id');
				let empId = id.substring(id.indexOf('_') +1,id.length);
				let empName = $(this).text();
				let positionName = $($("tr#fiAgreeProcedureData_position td")[i]).text();
				
				html += `<li class="js-approval-line-setting fiAgreeLine-li unsortable" id ="fiAgreeLineSettingEmpId_`+ empId + `" user_no="수정필" node_id="수정필" old_new="old" style="cursor: auto;">`
						+ `<span>` + empName
							+ `<span class="icon file_delete js-approval-line-setting-delete" onclick ="deleteThis(fiAgreeLineSettingEmpId_` + empId +`)"></span>`
						+ `</span>`
						+	`<span style="display:none;">` + positionName + `</span>`
						+`</li>`;
			 }
			 
		 })
	
	</c:if>
	
	$("ul#sortFiAgreeLineSetting").html(html);
	
	$("div#layerFiAgreeLineSetting").show(); 

}



/* 재무합의 + 버튼 눌러 모달창에서 확인 버튼 눌렀을 경우 */
function updateFiAgreeLineSetting(){
	
	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */
	
	
	if($("li.fiAgreeLine-li").length > 0  && $("li.fiAgreeLine-li").length <= 4){
	 
		 $("li.fiAgreeLine-li").each(function(index){
			
			let id = $(this).attr('id');
			let empId = id.substring(id.indexOf('_') +1,id.length);
			let empName = $(this).find('span:eq(0)').text();
			let positionName = $(this).find('span:eq(2)').html();
			console.log("이번엔 empName : " + empName)
			console.log("이번엔 positionName : " + positionName)
			 // 결재 table태그에 이름 넣기
			 
			 
			 let classApproval = $($("tr#fiAgreeProcedureData_empName td")[index]).attr("class");
			 if(classApproval.indexOf('fiAgreeEmpId_') != -1){
				// 값이 있을 경우
				$($("tr#fiAgreeProcedureData_empName td")[index]).removeClass(classApproval.substring(classApproval.indexOf('fiAgreeEmpId_'), classApproval.length));
			}
			 
			 $($("tr#fiAgreeProcedureData_position td")[index]).html(positionName)
			 $($("tr#fiAgreeProcedureData_empName td")[index]).attr('id', 'fiAgreeEmpId_'+empId)
			 $($("tr#fiAgreeProcedureData_empName td")[index]).addClass('fiAgreeEmpId_'+empId)
			 
			 $($("tr#fiAgreeProcedureData_empName td")[index]).html( `<input type="hidden" name="fiAgreeEmpId" value="` + empId + `" />` + empName)
			 
		 })
		 
		for(i = 3; i >= $("li.fiAgreeLine-li").length ; i--){
			let className = $($("tr#fiAgreeProcedureData_empName td")[i]).attr("class");
			if(className.indexOf('fiAgreeEmpId_') != -1){
				// 값이 있을 경우
				console.log("값 있따")
				console.log(className.substring(className.indexOf('fiAgreeEmpId_'), className.length));
				$($("tr#fiAgreeProcedureData_empName td")[i]).removeClass(className.substring(className.indexOf('fiAgreeEmpId_'), className.length));
			}
			
			
			 $($("tr#fiAgreeProcedureData_position td")[i]).html('')
			 $($("tr#fiAgreeProcedureData_empName td")[i]).attr('id', '')
			 $($("tr#fiAgreeProcedureData_empName td")[i]).html('')
		}
	 	$("div#layerFiAgreeLineSetting").hide(); 
	 
	}else{
		alert("재무합의자 수는 한 명 이상 네 명 이하로 존재하여야 합니다.")
	}
	
}





//////////////////////////////////////////////////////////////////////////////////////////////
// 결재 + 버튼_사원명 삭제 버튼 클릭시

// 결재 리스트에서 지우기
function deleteThis(id) {
	$(id).detach();
}



/////////////////////////////////////////////////////////////////////////////////////////////
function clickTriggerToFileApprovalAttachWriteForm() {
	$("input#fileApprovalAttachWriteForm").trigger("click");
}






</script>


<script type="text/javascript" src="<%=ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>


<div id="contents">
	<form name="writeDocumentFrm">
		<c:if test="${not empty requestScope.approvalDetail}">
			<input type="hidden" name="approvalId" value="${requestScope.approvalDetail.approvalId}" />
		</c:if>
		<input type="submit" style="display: none;" onclick="return false;">


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
									<!-- <form name="selectFormFrm"> -->
									<select name="formId" class="write-select" autocomplete="off">
										<option value="">선택</option>
										<c:forEach var="formVo" items="${requestScope.formList}">
											<c:if test="${formVo.formId eq 108}">
												<option value="${formVo.formId}" selected>${formVo.formName}</option>
											</c:if>
											<c:if test="${formVo.formId ne 108}">
												<option value="${formVo.formId}">${formVo.formName}</option>
											</c:if>
										</c:forEach>
									</select>
									<!-- </form> -->
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
							<caption>결재선</caption>
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="sign">
										<div style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
											결재
											<span class="spr-approval set" title="결재" onclick="approvalLineSetting();"></span>
										</div>
									</th>
									<td class="sign vt" id="approvalFirstLine">
										<table style="width: 100%; table-layout: fixed">
											<colgroup>
												<col>
												<col>
												<col>
												<col>
												<col>
												<col>
												<col>
											</colgroup>
											<tbody>
												<tr id="approvalProcedureData_position">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '결재'}">
																<td class="team name">${procedure.positionName}</td>
															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
													</c:if>
												</tr>
												<tr id="approvalProcedureData_stamp">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '결재'}">
																<td class="stamp"></td>
															</c:if>
														</c:forEach>
													</c:if>

													<c:if test="${empty requestScope.approvalDetail}">
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
													</c:if>

												</tr>
												<tr id="approvalProcedureData_empName">
													<c:if test="${not empty requestScope.approvalDetail}">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '결재'}">
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
						<table class="cal_table1 approve-write js-approval-line">
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 37.62%;">
								<col style="width: 9.02%;">
								<col style="width: 41.27%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="agree">
										<div style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
											합의
											<span class="spr-approval set" title="합의" onclick="agreeLineSetting();"></span>
										</div>
									</th>
									<td class="agree vt" id="approvalSecondLine">
										<table>
											<colgroup>
												<col style="width: 12.54%;">
												<col style="width: 12.54%;">
											</colgroup>
											<tbody>

												<c:if test="${not empty requestScope.agreeList}">
													<c:set var="cnt" value="0" />
													<c:forEach var="i" begin="0" end="2">
														<tr>
															<c:forEach var="j" begin="0" end="1">
																<c:if test="${not empty requestScope.agreeList[cnt].empId}">
																	<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData agreeEmpId_${requestScope.agreeList[cnt].empId}" id="agreeEmpId_${requestScope.agreeList[cnt].empId}">
																		<span class="">${requestScope.agreeList[cnt].empName}</span>
																		<input type="hidden" name="agreeEmpId" value="${requestScope.agreeList[cnt].empId}" />
																	</td>
																</c:if>

																<c:if test="${empty requestScope.agreeList[cnt].empId}">
																	<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
																</c:if>

																<c:set var="cnt" value="${cnt + 1}" />

															</c:forEach>
														</tr>
													</c:forEach>
												</c:if>


												<%-- <c:if test="${not empty requestScope.agreeList && fn:length(requestScope.agreeList) < 3}">
													<c:forEach var="procedure" items="${requestScope.agreeList}" varStatus="status">
														<tr>
															<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData agreeEmpId_${procedure.empId}" id="agreeEmpId_${requestScope.agreeList[cnt].empId}">
																<span class="">${procedure.empName}</span>
																<input type="hidden" name="agreeEmpId" value="${procedure.empId}" />
															</td>
														</tr>
													</c:forEach>
												</c:if> --%>



												<c:if test="${empty requestScope.agreeList}">
													<tr>
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
													</tr>
													<tr>
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
													</tr>
													<tr>
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
														<td class="gt-ph-20 gt-align-left gt-border-0 gt-position-relative agreeData"></td>
													</tr>
												</c:if>

											</tbody>
										</table>
									</td>
									<th scope="row" class="confer">
										<div class="choice" style="height: 162px; display: table-cell; width: 116px; vertical-align: middle; text-align: center;">
											재무 합의
											<span class="spr-approval set" title="재무합의" onclick="fiAgreeLineSetting();"></span>
										</div>
									</th>
									<td class="confer vt" id="approvalThirdLine">
										<table>
											<colgroup>
												<col width="">
												<col width="">
												<col width="">
												<col width="">
											</colgroup>
											<tbody>
												<c:if test="${not empty requestScope.approvalDetail.apvo}">
													<tr id="fiAgreeProcedureData_position">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '재무합의'}">
																<td class="team name">${procedure.positionName}</td>
															</c:if>
														</c:forEach>
													</tr>

													<tr id="fiAgreeProcedureData_stamp">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '재무합의'}">
																<td class="stamp"></td>
															</c:if>
														</c:forEach>
													</tr>
													<tr id="fiAgreeProcedureData_empName">
														<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
															<c:if test="${procedure.procedureType eq '재무합의'}">
																<td class="name gt-position-relative fiAgreeEmpId_${procedure.empId}" id="fiAgreeEmpId_${procedure.empId}">
																	<input type="hidden" name="fiAgreeEmpId" value="${procedure.empId}" />
																	<%-- <span class="stamp-step-num" style="">${procedure.sequence}</span> --%>
																	${procedure.empName}
																</td>
															</c:if>
														</c:forEach>
													</tr>
												</c:if>



												<c:if test="${empty requestScope.approvalDetail.apvo}">
													<tr id="fiAgreeProcedureData_position">
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
														<td class="team name"></td>
													</tr>
													<tr id="fiAgreeProcedureData_stamp">
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
														<td class="stamp"></td>
													</tr>
													<tr id="fiAgreeProcedureData_empName">
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
														<td class="name gt-position-relative"></td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="cal_table1  approve-write refer js-approval-line">
							<colgroup>
								<col style="width: 12.09%;">
								<col style="width: 87.91%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">참조</th>
									<td id="approvalFourthLine" style="height: 28px;">
										<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFourthLine" autocomplete="off">



										<c:forEach var="procedure" items="${requestScope.approvalDetail.apvo}">
											<c:if test="${procedure.procedureType eq '참조'}">

												<c:if test="${procedure.status eq '미확인'}">
													<span class="refer-list" id="referEmpId_${procedure.empId}" user_no="3855" node_id="2816" type="F">
														${procedure.empName}
														<span class="icon file_delete js-approval-line-delete" onclick="deleteThis(referEmpId_${procedure.empId})" style="display: inline-block;"></span>
													</span>
												</c:if>

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


					<div class="write_input" id="approvalEditorContent" style="display: block;">
						<div class="txt file">
							<div id="dexteditor_holder"></div>
							<textarea name="content" id="compose_contents" style="width: 100%; height: 612px;">${requestScope.approvalDetail.content}</textarea>
						</div>
					</div>










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