<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">

	$(document).ready(function(){
			
		<%-- === #166. 스마트 에디터 구현 시작 === --%>
	    //전역변수
	    var obj = [];
	      
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	    	oAppRef: obj,
	        elPlaceHolder: "mailContent", // id가 mailContent인 textarea에 에디터를 넣어준다.
	        sSkinURI: "<%=ctxPath%>/resources/smarteditor/SmartEditor2Skin.html",
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
	    
	    
	    <%-- === jQuery 를 사용하여 드래그앤드롭(DragAndDrop)을 통한 파일 업로드 시작 === --%>
		let file_arr = []; // 첨부된어진 파일 정보를 담아 둘 배열

        // == 파일 Drag & Drop 만들기 == //
	    $("div#fileDrop").on("dragenter", function(e){ /* "dragenter" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 최초로 들어왔을 때 */ 
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
	        $(this).css("border", "2px dashed #558ed5"); 
	       /*  $(this).addClass("file-list.drag"); */
	    }).on("dragleave", function(e){ /* "dragleave" 이벤트는 Drag 한 파일이 드롭대상인 박스 밖으로 벗어났을 때  */
	        e.preventDefault();
	        e.stopPropagation();
	        $(this).css("background-color", "#fff");
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
	        	
	        	console.log("files.length 는 => " + files.length);  
	            // files.length 는 => 1 이 나온다. 
	             
	        	let html = "";
	        	
	        	for(let i=0; i<files.length; i++){
	        		
	            	let f = files[i];
	            	let fileName = f.name;  // 파일명
	            	let fileSize = f.size/1024;  // 파일크기	/* 파일의 크기는 MB로 나타내기 위하여 /1024/1024 하였음 */
	              	console.log("파일명 : " + fileName);
	              	console.log("파일크기 : " + fileSize);
	             
	             	if(fileSize >= 10) {
		        		alert("10MB 이상인 파일은 업로드할 수 없습니다.!!");
		        		$(this).css("background-color", "#fff");
		        		return;
		        	}
		        	else {
		        		file_arr.push(f); //  드롭대상인 박스 안에 첨부파일을 드롭하면 파일들을 담아둘 배열인 file_arr 에 파일들을 저장시키도록 한다.
			        //	const fileName = f.name; // 파일명	
		        //	console.log("hey7878"+fileSize);
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
		              
		                arrLength = file_arr.length; // 수정필 :이거 아니고 나중에 tr id='' 조회해서 name 추가해 야할듯? 
		                html += 
		                    "<tr id='fileList' name='file_"+(arrLength)+"' >" + 
		                        "<td>" + 
		                        	"<div class='fileName'>" + 
		                        		"<img src='/static/images/common/icon/xlsx.png' alt=''>" + fileName + " (" + fileSize + "KB)" +
		                        		"<a href='#' class='icon file_delete'></a>" +
				                    	"<input type='hidden' id='file_"+(arrLength)+"' value='normal'>" +
				                    "</div>" +
				                "</td>" +
			                    "<td>" +
			                    	"<span class='bt_left_txt'></span>" +
			                    "</td>" +
		                    "</tr>";
		                    
		                    
		               /*      
		                    <div>
			            		<input type='file' style='float: left;' name='file_"+(fileIndex++)+"'>
			            		"+"
			            		</button>
			            		"+"
			            		<button type='button' style='float: right;' id='fileDelBtn'>"+"삭제"+"</button>
			            	</div>
		            	 */
		            	
			            $("tbody").append(html);
		        	}
	             
	            } // end of for ------------------------
	        
	        }// end of if(files != null && files != undefined)--------------------------
	        
	        $(this).css("background-color", "#fff");
	        
	        $(this).find("div#m_fileupload_drag_txt").css("display", "none");
	    	$(this).find("div#div_m_attach_file_list").css("display", "block");
	        
	    });
		
		
	    // == Drop 되어진 파일목록 제거하기 == // 
	    $(document).on("click", "a.file_delete", function(e){
	    	let idx = $("a.file_delete").index($(e.target));
	    //	alert("인덱스 : " + idx );
	    
	    	file_arr.splice(idx,1); // 드롭대상인 박스 안에 첨부파일을 드롭하면 파일들을 담아둘 배열인 file_arr 에서 파일을 제거시키도록 한다.
	    //	console.log(file_arr);
	    <%-- 
	    	배열명.splice() : 배열의 특정 위치에 배열 요소를 추가하거나 삭제하는데 사용한다. 
		    삭제할 경우 리턴값은 삭제한 배열 요소이다. 삭제한 요소가 없으면 빈 배열( [] )을 반환한다.
		
		    배열명.splice(start, 0, element);  // 배열의 특정 위치에 배열 요소를 추가하는 경우 
			start   - 수정할 배열 요소의 인덱스
            0       - 요소를 추가할 경우
            element - 배열에 추가될 요소

         	배열명.splice(start, deleteCount); // 배열의 특정 위치의 배열 요소를 삭제하는 경우    
            start   - 수정할 배열 요소의 인덱스
            deleteCount - 삭제할 요소 개수
		--%>
	    
            $(e.target).parent().parent().parent().remove(); // <tr id='fileList'> 태그를 삭제하도록 한다.	 
            
            if(file_arr.length == 0){
            	$("div#m_fileupload_drag_txt").css("display", "");
            	$("div#div_m_attach_file_list").css("display", "none");
    	    }
	    });
	    <%-- === jQuery 를 사용하여 드래그앤드롭(DragAndDrop)을 통한 파일 업로드 끝 === --%>
	    
	    
	 	// 글쓰기 버튼
		$("a#sendMail").click(function(){
			
			<%-- === 스마트 에디터 구현 시작 === --%>
		    // id가 content인 textarea에 에디터에서 대입
		    obj.getById["mailContent"].exec("UPDATE_CONTENTS_FIELD", []);
		    <%-- === 스마트 에디터 구현 끝 === --%>
			
			mailWrite();
		 	
		});// end of $("a#sendMail").click(function(){})--------------
	
		
		// 저장하기 버튼
		$("a#tempMail").click(function(){
			
			<%-- === 스마트 에디터 구현 시작 === --%>
		    // id가 content인 textarea에 에디터에서 대입
		    obj.getById["mailContent"].exec("UPDATE_CONTENTS_FIELD", []);
		    <%-- === 스마트 에디터 구현 끝 === --%>
			
		    $("input:hidden[name='isTemporary']").val("1");
		   	console.log($("input:hidden[name='isTemporary']").val()); // 수정필 이거랑 바로윗줄코드 필요한가?
		    
			mailWrite();
			
		});// end of $("a#tempMail").click(function(){})--------------
		

		var formData = new FormData($("form[name='addFrm']").get(0)); // $("form[name='addFrm']").get(0) 폼 에 작성된 모든 데이터 보내기 
	      
		if(file_arr.length > 0) { // 파일첨부가 있을 경우 
        	
			// 첨부한 파일의 총합의 크기가 10MB 이상 이라면 메일 전송을 하지 못하게 막는다.
      	  	let sum_file_size = 0;
          	for(let i=0; i<file_arr.length; i++) {
            	sum_file_size += file_arr[i].size;
          	}// end of for---------------
            
          	if( sum_file_size >= 10*1024*1024 ) { // 첨부한 파일의 총합의 크기가 10MB 이상 이라면 
            	alert("첨부한 파일의 총합의 크기가 10MB 이상이라서 파일을 업로드할 수 없습니다.!!");
        	  	return; // 종료
          	}
          	else { // formData 속에 첨부파일 넣어주기
        		file_arr.forEach(function(item){
                	formData.append("file_arr", item);  // 첨부파일 추가하기. // "file_arr" 이 키값이고  item 이 밸류값인데 file_arr 배열속에 저장되어진 배열요소인 파일첨부되어진 파일이 되어진다.
                                                      // 같은 key를 가진 값을 여러 개 넣을 수 있다.(덮어씌워지지 않고 추가가 된다.)
              });
          }
        }
	    
		
	    
		
	  
		
		
	});// end of $(document).ready(function(){})-----------------

	
	
	// Function Declaration
	function mailWrite(){
		
	 	// 받는사람 유효성 검사
		const incomeMail = $("textarea[name='incomeMail']").val().trim();
		if(incomeMail == "") {
			alert("받는사람을 입력하세요!");
		  	return; // 종료
		}
		else{
			
            var result;    
                
			$.ajax({
            	url : "<%=ctxPath%>/mail/isExistMail.gw",
                type : "post",
                data : {"email":$("textarea[name='incomeMail']").val().trim()},
            	dataType:"json",
            	async : false,
                success:function(json){
                 //	console.log(json.n);
                	if(json.n == 0){
                		alert("받는 사람 리스트에 올바르지 않은 사내 메일 주소가 포함되어 있습니다.");
                		$("textarea[name='incomeMail']").val("");
                		result = json.n;
                	}
                	else{
                	//	console.log(json.empId);
                		$("input:hidden[name='incomeEmpId']").val(json.empId);
                	}
                },
                error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
			
			if(result == 0){
				return;
			}
		}
			
		
		// 참조 유효성 검사
		const reference = $("textarea[name='reference']").val().trim();
		if(reference != "") {
			
			var result; 
			
			$.ajax({
            	url : "<%=ctxPath%>/mail/isExistMail.gw",
                type : "post",
                data : {"email":$("textarea[name='reference']").val().trim()},
            	dataType:"json",
            	async : false,
                success:function(json){
                 //	console.log(json.n);
                	if(json.n == 0){
                		alert("참조 리스트에 올바르지 않은 사내 메일 주소가 포함되어 있습니다.");
                		$("textarea[name='reference']").val("");
                		result = json.n;
                	}
                	else{
                	//	console.log(json.empId);
                		$("input:hidden[name='referenceEmpId']").val(json.empId);
                	}
                },
                error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
			
			if(result == 0){
				return;
			}
			
		}
		

		// 숨은참조 유효성 검사
		const hiddenReference = $("textarea[name='hiddenReference']").val().trim();
		if(hiddenReference != "") {
			
			var result; 
			
			$.ajax({
            	url : "<%=ctxPath%>/mail/isExistMail.gw",
                type : "post",
                data : {"email":$("textarea[name='hiddenReference']").val().trim()},
            	dataType:"json",
            	async : false,
                success:function(json){
                 //	console.log(json.n);
                	if(json.n == 0){
                		alert("숨은참조 리스트에 올바르지 않은 사내 메일 주소가 포함되어 있습니다.");
                		$("textarea[name='hiddenReference']").val("");
                		result = json.n;
                	}
                	else{
                	//	console.log(json.empId);
                		$("input:hidden[name='hiddenReferenceEmpId']").val(json.empId);
                	}
                },
                error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			}); 
			
			if(result == 0){
				return;
			}
			
		}
		
		
	 	// 메일제목 유효성 검사
		const subject = $("input:text[name='subject']").val().trim();
		if(subject == "") {
			alert("메일제목을 입력하세요!");
		  	return; // 종료
		} 
      
		
		<%-- === 메일내용 유효성 검사(스마트 에디터 사용 할 경우) 시작 === --%>
		let mailContent = $("textarea#mailContent").val();
		  
		// 메일내용 유효성 검사 하기 
	    // alert(contentval); // content에 공백만 여러개를 입력하여 쓰기할 경우 알아보는것.
	    // <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p> 이라고 나온다.
	       
	    mailContent = mailContent.replace(/&nbsp;/gi, ""); // 공백을 "" 으로 변환
	    /*    
			대상문자열.replace(/찾을 문자열/gi, "변경할 문자열");
			==> 여기서 꼭 알아야 될 점은 나누기(/)표시안에 넣는 찾을 문자열의 따옴표는 없어야 한다는 점입니다. 
			    그리고 뒤의 gi는 다음을 의미합니다.
			
			   g : 전체 모든 문자열을 변경 global
			   i : 영문 대소문자를 무시, 모두 일치하는 패턴 검색 ignore
		*/ 
	    // alert(contentval);
	    // <p>             </p>
	       
	    mailContent = mailContent.substring(mailContent.indexOf("<p>")+3);
	    mailContent = mailContent.substring(0, mailContent.indexOf("</p>"));
	                
	    if(mailContent.trim().length == 0) {
	    	alert("메일내용을 입력하세요!");
	        return;
	    }
		<%-- === 메일내용 유효성 검사(스마트 에디터 사용 할 경우) 끝 === --%> 
		
		
		
		$.ajax({
            url : "<%= ctxPath%>/mail/mailWriteEnd.gw",
            type : "post",
            data : formData,
            processData:false,  // 파일 전송시 설정 
            contentType:false,  // 파일 전송시 설정 
            dataType:"json",
            success:function(json){
          	  // console.log("~~~ 확인용 : " + JSON.stringify(json));
                // ~~~ 확인용 : {"result":1}
                if(json.result == 1) {
          	    <%--  location.href="<%= ctxPath%>/emailWrite/done.action";  --%>
          	  alert("메일보내기가 ssssss실패했습s니다.");
                }
                else {
              	  alert("메일보내기가 실패했습니다.");
                }
            },
            error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		      }
        });
		<%--  
	  	// 폼(form)을 전송(submit)
		const frm = document.mailFrm;
	 	frm.method = "post"; 
	 	frm.action = "<%=ctxPath%>/mail/mailWriteEnd.gw";
	 	frm.submit();
		 --%>
	 	
	}// end of function mailWrite(){}---------------------
	
	
	function showHiddenReference(){
		$("div#hiddenReference").css("display","");
		$("a#referencePlus").css("display","none");
	}
	
/* 	
	function fn_addFile(){
		var fileIndex = 2;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
	 */
</script>





<div id="contents">
	
	<form name="mailFrm" enctype="multipart/form-data">
	
		<input type="hidden" name="fk_empId" value="${sessionScope.loginUser.empId}">
		<input type="hidden" name="mailId" value="${requestScope.mailId}">
		<%-- 		
<!-- <form name="frmMain" id="frmMain" enctype="multipart/form-data" method="post" target="hiddenFrame" style="display: inline"> -->
		<input type="hidden" name="font_family" id="font_family" value="맑은 고딕">
		<input type="hidden" name="font_size" id="font_size" value="16px">
		<input type="hidden" name="cert_key" value="231203145400_939252_gabiabiz_ceo">
		<input type="hidden" name="mail_gubun" value="reply">
		<input type="hidden" name="resend_flag" value="0">
		<input type="hidden" id="sendLimit" value="500">
		<input type="hidden" name="mail_no" value="3316125">
		<input type="hidden" id="temp_mail_delete" name="temp_mail_delete" value="N">
		<input type="hidden" id="content_type" name="content_type" value="H">
		<input type="hidden" id="return_path" name="return_path" value="ceo@gabia.biz">
		<input type="hidden" id="content" name="content" value="">
		<input type="hidden" id="text_content" name="text_content" value="">
--%>

		<div class="content_title" id="content_title">
			<!-- Title -->
			<fieldset>
				<span class="detail_select">
					<a href="javascript:void(0)" id="sendMail">보내기</a>
				</span>
				<span id="sTimeReserveMail" style="float: left; margin-left: -15px; padding-right: 26px;"></span>
				<span class="detail_select">
					<a href="javascript:void(0)" onclick="MailWrite.Preview();">미리보기</a>
				</span>
				<span class="detail_select">
					<a href="javascript:void(0)" id="tempMail">저장하기</a>
					<input type="hidden" name="isTemporary" value="0" />
				</span>
				<span class="detail_select">
					<a href="javascript:void(0)" id="m_write_option">
						옵션<img src="<%=ctxPath%>/resources/image/icon/btn_drop.gif" alt="옵션 드롭다운 메뉴 열기" class="open_drop">
					</a>
					<%-- 
					<div class="dropdown hide" style="z-index: 100; min-width: 300px" id="m_write_option_detail">
						<dl class="dropdown-box option">
							<dt style="padding-bottom: 8px">발송 예약</dt>
							<dd>
								<input type="checkbox" title="예약 체크" value="Y" name="reserve_mail" id="reserve_mail" onclick="MailWrite.toggleReserveOption()">
								<!--<input type="text" name="send_date" id="send_date" style="width:82px" class="text-box" value='2023-12-06' title="년월일">-->
								<input type="text" class="w100 cal_date hasDatepicker" id="send_date" name="send_date" value="2023-12-06" readonly="" disabled="">
								<select name="send_hour" id="send_hour" style="width: 63px;" disabled="">
									<c:forEach var="hour" begin="0" end="23" step="1">
										<option value="${hour}">${hour}시</option>
									</c:forEach>
									<!-- 수정필 : 공식웹 긁어올 때 이렇게 되어있는데 이게 발송시간 인지 나중에 확인해 <option value="18" selected="">18 시</option> -->
								</select>
								<select name="send_minute" id="send_minute" style="width: 63px;" disabled="">
									<c:forEach var="minute" begin="0" end="59" step="1">
										<option value="${minute}">${minute}분</option>
									</c:forEach>
								</select>
							</dd>
							<dd class="blue_color" style="padding: 5px 0 0 18px">GMT+9:00</dd>
							<dt style="padding-bottom: 8px">서명</dt>
							<dd>
								<select style="width: 238px" title="서명" id="selSignList" name="selSignList" onchange="MailWrite.changeSign()">
									<option value="">서명사용안함</option>
									<option value="SET">[서명 설정]</option>
								</select>

							</dd>
							<dt>보내기 옵션</dt>
							<dd>
								<input type="checkbox" value="Y" onclick="if(this.checked &amp;&amp; $j('#reserve_mail').is(':checked')){alert('예약발송과 함께 사용하실수 없습니다.');this.checked=false;}" name="send_separate" id="send_separate">
								<label for="send_separate" style="width: 118px; padding-bottom: 7px">개인별 보내기</label>
								<input type="checkbox" value="Y" name="important_mail" id="chk_important_mail">
								<label for="chk_important_mail">중요!</label>
							</dd>
							<dd>
								<input type="checkbox" value="Y" name="send_mail_save" id="chk_send_mail_save" checked="" onclick="MailWrite.CheckMailSave();">
								<label for="chk_send_mail_save" style="width: 118px">보낸 편지 저장</label>
								<input type="checkbox" value="Y" name="receipt_confirm" id="chk_rcpt_cfrm" checked="" onclick="MailWrite.CheckMailSave();">
								<label for="chk_rcpt_cfrm">수신확인</label>
							</dd>
							<dt>작성 모드</dt>
							<dd>
								<input type="radio" id="rdo_wmode_editor" name="selWritingMode" value="H" onclick="MailWrite.ChangeWritingMode(this.value);" checked="">
								<label for="rdo_wmode_editor" style="margin-right: 13px">에디터</label>
								<input type="radio" id="rdo_wmode_text" name="selWritingMode" onclick="MailWrite.ChangeWritingMode(this.value);" value="T">
								<label for="rdo_wmode_text">텍스트</label>
							</dd>
							<dt>인코딩</dt>
							<dd>
								<input type="radio" id="rdo_enc_utf8" name="selEncoding" value="U" checked="" onchange="MailWrite.ChangeCharset(this.value);">
								<label for="rdo_enc_utf8" style="margin-right: 13px">UTF-8</label>
								<input type="radio" id="rdo_enc_euckr" name="selEncoding" value="K" onchange="MailWrite.ChangeCharset(this.value);">
								<label for="rdo_enc_euckr">EUC-KR</label>
							</dd>
							<dt>
								<a href="javascript:void(0)" class="blue_color" onclick="MailWrite.writeOptionConfirm();">확인</a>
							</dt>
						</dl>
					</div>
					 --%>
				</span>
				<span id="sTimeMailSaved" style="margin-right: 127px; float: right;"></span>
			</fieldset>
			<!-- Title End -->
		</div>

		<div class="content_inbox">
			<!-- Contents -->
			<div class="cont_box">
				<fieldset>
					<div class="write_field">

						<div class="write_input">
							<p>받는 사람</p>
							<div class="txt">
								<div class="position">
									<textarea class="cc_addr autocomplete ui-autocomplete-input" name="incomeMail" id="to_addr" placeholder="메일 주소 사이에 ,(콤마) 또는 ;(세미콜론)으로 구분하여 입력하세요." autocomplete="off" tabindex="1"></textarea>
									<input type="hidden" name="incomeEmpId" />
									<!-- <a href="#" class="addaddr icon" onclick=";addressbook.getAddressbook(FROM_MAIL, 'MW_Address.EnterInitialAddress', 'MW_Address.applyAddress');"></a> -->
								</div>
								<!-- predictive text input -->
								<div class="dropdown" style="display: none">
									<ul class="dropdown-menu address2">
										<li>
											<a href="#">
												<span class="point_color">자동 완성 설정</span>
											</a>
										</li>
									</ul>
								</div>

								<!-- //predictive text input -->
								<!-- all receivers -->

								<!-- //all receivers -->
							</div>
						</div>

						<div class="write_input">
							<p>
								참조
								<a href="#" id="referencePlus" onclick="showHiddenReference()">
									<span class="add-sendlist">+</span>
								</a>
							</p>
							<div class="txt">
								<div class="position">
									<textarea class="cc_addr" name="reference" autocomplete="off" tabindex="2" onkeydown="if(event.keyCode==13)return false;"></textarea>
									<input type="hidden" name="referenceEmpId" />
									<!-- <a href="#" class="addaddr icon" onclick=";addressbook.getAddressbook(FROM_MAIL, 'MW_Address.EnterInitialAddress', 'MW_Address.applyAddress');"></a> -->
								</div>
							</div>
						</div>

						<div class="write_input" style="display: none" id="hiddenReference">
							<p>숨은 참조</p>
							<div class="txt">
								<div class="position">
									<textarea class="cc_addr" name="hiddenReference" autocomplete="off" tabindex="3" onkeydown="if(event.keyCode==13)return false;"></textarea>
									<input type="hidden" name="hiddenReferenceEmpId" />
									<!-- <a href="#" class="addaddr icon" onclick=";addressbook.getAddressbook(FROM_MAIL, 'MW_Address.EnterInitialAddress', 'MW_Address.applyAddress');"></a> -->
								</div>
							</div>
						</div>

						<div class="write_input">
							<label for="write_txt3">제목</label>
							<div class="txt title">
								<div class="position">
									<%-- == 원메일쓰기 인 경우 == --%>
									<%-- <c:if test='${requestScope.orgMailId eq "0" }'> --%>
									<input name="subject" type="text" value="" tabindex="4" maxlength="180">
									<%-- </c:if> --%>
									<%-- == 답장메일쓰기 인 경우 == --%>
									<%-- 	<c:if test='${requestScope.orgMailId ne "0" }'>
				     					<input name="subject" type="text" value="${requestScope.subject}" tabindex="4" maxlength="180">
								    </c:if> --%>
								</div>
							</div>
						</div>

						<!-- filebox area-->
						<div class="write_input" style="display: block">
							<div class="txt file">
								<div class="position">
									<div class="file-list" id="fileDrop">
										<div class="top">

											
											<div class="left">
												<a href="javascript:void(0)" for="fileAttach" class="addfile" onclick="HiworksMailUploader.selectFiles()">
													
												</a> 
											</div>

											<!-- 
											<div class="left">
												<a href="javascript:void(0)" class="addfile" onclick="HiworksMailUploader.selectFiles()">파일 첨부</a>
												<a href="javascript:void(0)" class="icon hidecont hide" style="background-position: -258px -38px;" id="m_write_attach_file"></a>
												<div class="dropdown hide show" id="m_write_attach_file_detail">
													<ul class="dropdown-menu">
														<li>
															<a href="javascript:void(0)" onclick="HiworksMailUploader.selectFiles()">내 컴퓨터에서 파일 선택</a>
														</li>
														<li>
															<a href="javascript:void(0)" onclick="HiworksMailUploader.showFileBox()">파일박스에서 파일 선택</a>
														</li>
														<li><a href="#">웹하드에서 파일 선택</a></li>
														<input type="file" id="m_attach_file" multiple="" style="display: none" onchange="HiworksMailUploader.readfiles(this.files)">
													</ul>
												</div>
											</div> -->

											<!-- 
											<p class="right">	수정필 이거 있어야함?
												<span id="spn_filebox_status" style="display: none">
													대용량 첨부
													<span id="sp_fb_attached_size">0 KB</span>
													/
													<span id="sp_fb_total_size">0MB</span>
													&nbsp;&nbsp;
												</span>
												<span id="sp_wrap_attached_size" style="display: none">
													<span id="sp_attached_size">0 KB</span>
													/ 10MB
												</span>
											</p>
											 -->
										</div>
										<div class="center" style="display: block" id="m_fileupload_drag_txt">여기로 파일을 끌어놓으세요.</div>

										<div class="list" style="display: none" id="div_m_attach_file_list">
											<table id="tbl_m_attach_file_list">
												<caption>파일 첨부 목록으로 파일명, 위치, 기간, 삭제선택으로 구성되어 있습니다.</caption>
												<colgroup>
													<col width="">
													<col width="208">
													<col width="115">
												</colgroup>
												<tbody>







												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- filebox area end-->




						<!-- 스마트에디터 시작 -->
						<div class="write_input">
							<div class="txt edit">
								<div class="position">
									<textarea name="mailContent" id="mailContent" style="width: 100%; height: 500px; outline: none; box-sizing: border-box; padding: 18px 23px; resize: vertical; border: 1px solid #d6d6d6; font-size: 16px; line-height: 1.6; color: #333; display: none"></textarea>
								</div>
							</div>
						</div>
						<!-- 스마트에디터 끝 -->

					</div>
				</fieldset>
			</div>
		</div>

		<%-- === 답장메일인 경우 시작 === --%>
		<input type="hidden" name="orgMailId" value="${requestScope.orgMailId}" />
		<%-- === 답장메일인 경우 끝 === --%>

		<%-- === 임시저장인 경우 시작 === --%>
		<%-- 	<input type="hidden" name="isTemporary" value="${requestScope.isTemporary}" /> --%>
		<%-- === 임시저장인 경우 끝 === --%>


	</form>


	<%-- 
<!-- 여기부터 끝까지는 무슨 html인지 몰겟음  -->
	<input type="hidden" name="movecheck">
	<input type="hidden" name="mail_mode">
	<input type="hidden" name="mail_content">
	<input type="hidden" name="mail_send_key" value="">
	<input type="hidden" name="serial" value="{serial}">
	<input type="hidden" id="AutoRoot" value="">
	<input type="hidden" id="AutoFileList" value="">
	<input type="hidden" name="webhard_no" value="">
	<input type="hidden" name="default_sender_name" id="default_sender_name" value="대표이사 <ceo@gabia.biz>">
	<iframe name="hiddenFrame" id="hiddenFrame" src="" style="width: 0px; height: 0px" frameborder="0"></iframe>
	<textarea style="display: none" id="compose_contents">&lt;br&gt;&lt;BLOCKQUOTE style="PADDING: 0 0 0 5px; MARGIN: 0 0 0 5px; BORDER-LEFT: #000000 2px solid;"&gt;&lt;div&gt;&lt;p style="font-size:10pt;line-height:1.6em"&gt;------------Original Message------------&lt;/p&gt;&lt;p style="font-size:10pt;line-height:1.6em"&gt;&lt;b&gt;Subject :&lt;/b&gt; 안녕하세요. 프로젝트 지옥이 시작되었어요.&lt;/p&gt; &lt;p style="font-size:10pt;line-height:1.6em" &gt;&lt;b&gt;Date :&lt;/b&gt; 2023-12-03 13:47:29&lt;/p&gt; &lt;p style="font-size:10pt;line-height:1.6em"&gt;&lt;b&gt;From :&lt;/b&gt; 대표이사 &amp;lt;ceo@gabia.biz&amp;gt;&lt;/p&gt; &lt;p style="font-size:10pt;line-height:1.6em"&gt;&lt;b&gt;To :&lt;/b&gt; "김체리 대표" &amp;lt;cherrykim@cherryhongsam.kr&amp;gt;&lt;/p&gt; &lt;p style="font-size:10pt;line-height:1.6em"&gt;&lt;b&gt;Cc :&lt;/b&gt; &lt;/p&gt; &lt;/div&gt;&lt;div&gt;&lt;/div&gt;&lt;div style="font-size:16px; line-height:1.6em; font-family:맑은 고딕; margin:0px 0px 0px 0px;"&gt;&lt;div class="se-contents" style="box-sizing: content-box; font-family: &amp;quot;맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.6;" data-document-padding-top="18" data-document-padding-left="23" data-document-padding-right="23"&gt;&lt;p style="margin: 0px;"&gt;&lt;span&gt;집에 보내줘&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;
&lt;/BLOCKQUOTE&gt;</textarea>
	<form name="f1">
		<input type="hidden" name="td_cnt" value="0">
	</form>

	<div class="dropdown" style="position: absolute; left: 300px; display: none" id="tableAutoComplete">
		<ul class="dropdown-menu address" style="min-width: 746px;" id="tableAutoCompleteContent">
		</ul>
	</div>

	<table width="667" cellpadding="0" cellspacing="0" id="filebox_view" style="display: block; position: fixed; top: -1111px; left: -1111px;">
		<tbody>
			<tr>
				<td>
					<table width="100%" height="250" cellpadding="0" cellspacing="1" bgcolor="#5D8BA0">
						<tbody>
							<tr>
								<td align="center" bgcolor="#FFFFFF" width="100%">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td width="667"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="482" cellpadding="0" cellspacing="0" id="fileupload_view" style="display: block; position: fixed; top: -1110px; left: -1000px;">
		<tbody>
			<tr>
				<td>
					<table width="482" height="370" cellpadding="0" cellspacing="1" bgcolor="#5D8BA0">
						<tbody>
							<tr>
								<td align="center" bgcolor="#FFFFFF" width="100%">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td width="482"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="482" cellpadding="0" cellspacing="0" id="fileupload_manager_view" style="display: block; position: fixed; top: -1110px; left: -1000px;">
		<tbody>
			<tr>
				<td>
					<table width="482" height="370" cellpadding="0" cellspacing="1" bgcolor="#5D8BA0">
						<tbody>
							<tr>
								<td align="center" bgcolor="#FFFFFF" width="100%">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td width="482"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
--%>






</div>