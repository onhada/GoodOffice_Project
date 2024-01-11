<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    String ctxPath = request.getContextPath();
%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$(document).ready(function(){
////참조
 
	///참조
	 $("input#referj").keyup(function(){
	 		
	 	//alert("Dfsd");
	 	$("div#referjdiv").show();
	 	
	 		if($("input#referj").val().trim() != ''){
	 			
	 			
	 			//alert($("input#inputApprovalLineSetting").val().trim());
	 			
	 			   $.ajax({
	 		          url : "<%= ctxPath%>/personnel/search_name.gw",
	 				type : "post",
	 				data : {"empName" : $("input#referj").val().trim()},
	 				dataType : "json",
	 				success : function(json) {
	 					//$("div#ac-serach-result").show();
						let v_html ="";

						if (json.length > 0) {
							
							//let v_html = $("div#referjdiv").html();
							 
							$.each(json,function(index,item) {

								
								//alert(index);
										let id = item.empId;
										let name = item.empName;

										/* <div data-v-147fd5e4='' index='0' class='result-box clearfix hover'>
										  <div data-v-147fd5e4='' class='search-keyword clearfix w-100'>
										  
										  
										차은우 (하이웍스오피스)</div> '
										</div> */
										v_html += " <div data-v-147fd5e4='' index='"+ index +"' class='result-box clearfix hover'><div data-v-147fd5e4='' class='search-keyword clearfix w-100' onclick='push_resultRef( "
												+ item.empId
												+ ")'>"
												+ item.empName
												+ "("
												+ item.teamName
												+ ")"
												+" </div></div>";
												//+ " </div>";

										//v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' id='keyclick' class='search-keyword clearfix w-100' onclick='push_result('dd','www')'>"+item.empName+"("+item.teamName+")"+"</div></div>";

										//v_html += `<div data-v-147fd5e4="" index="0" class="result-box clearfix hover"  ><div data-v-147fd5e4="" id="keyclick" class="search-keyword clearfix w-100"  onclick="push_result(${item.empId})" >` +item.empName+ `(`+item.teamName+`)` + `</div></div>`;
										console.log("~~~ 확인용 : "+ item.empId);
										console.log("~~~ 확인용 2: "+ item.empName);
										console.log("~~~ 확인용 3: "+ item.teamName);
											});
							}

													/* v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' class='search-keyword clearfix w-100'>은우(하이웍스오피스)</div></div>";
													 */
													// v_html += " </div>";
									$("div#referjdiv").html(v_html);
	 					  
	 					},
	 				error : function(request, status,error) {
	 									alert("code: " + request.status+ "\n" + "message: "+ request.responseText+ "\n" + "error: "+ error);
	 						}
	 				});
	 	}
	 });

/////참조끝
	
 
 $('input#datepicker').bind("change", (e) => {
	 
	 
	 if( $(e.target).val() != "" ) {
		// alert($(e.target).val());
		 $(e.target).next().hide();
		 
		 $.ajax({
	          url : "<%= ctxPath%>/personnel/workstatus_day_select.gw",
	          type : "post",
	          data : { "date": $(e.target).val()  },
	         
	          dataType:"json",
	          success:function(json){
	              
	              let v_html = "";
	              
	              
	 			 if(json.length > 0) {
	 				 
	 				v_html+="<input type='hidden' value='' id ='editvalId'>";
	 				v_html+="<input type='hidden' value='' id ='editvalhour'>";
	 				v_html+="<input type='hidden' value='' id ='editvalmin'>";
	 				v_html+="<input type='hidden' value='' id ='delval'>";
	 				v_html+="<input type='hidden' value='' id ='addval'>";
	 					
	 				 $.each(json, function(index, item){
	 					  
	 					 v_html+="<tr data-v-de07ea7a=''><td data-v-de07ea7a=''> " + item.resisterdaytime +"</td><td data-v-de07ea7a=''> "+ item.worktype +"<span data-v-de07ea7a=''></span></td>";
	 					 
	 						
	 					 v_html+="<td data-v-de07ea7a=''  id='"+ item.workhistoryid+"' ><div data-v-de07ea7a='' class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					 v_html+="<input type='text'  autocomplete='off' id='"+item.workhistoryid+"hour'";
	 					v_html+="placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>시</span>";
	 								
	 								
	 					v_html+=" <div data-v-de07ea7a=''class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					v_html+=" <input type='text'  autocomplete='off' id='"+item.workhistoryid+"minute'";
	 					v_html+="	 placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>분</span></td>";
	 								


	 						
	 					v_html+="	<td data-v-de07ea7a=''><p data-v-de07ea7a=''class='manage-panel'><button data-v-f8d3258e='' data-v-de07ea7a='' type='button'  class='hw-button secondary sm'>";
	 									
	 					v_html+=" <span data-v-f8d3258e='' class='label' onclick='push_edit("+ item.workhistoryid+");' >수정</span>";
	 									
	 					v_html+="</button><button data-v-f8d3258e='' data-v-de07ea7a='' type='button'class='hw-button info sm'>";
	 									
	 					v_html+="<span data-v-f8d3258e='' class='label' onclick='push_delete("+ item.workhistoryid+");'>삭제</span>";
	 									
	 					v_html+="			</button></p></td></tr>";
	 					
				 });      
				 
	 			 }
	 			 else {
	 				 
	 			 }
	 			 
	 			 //$("ol#statusOL").html(v_html);
	 			 $("tbody#work_list").html(v_html);
	          
	          },
	          error: function(request, status, error){
	          alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
	      });
		 //////////////////////////
		 
	 }
	
	
	  
	 
 });// 생년월일에 마우스로 달력에 있는 날짜를 선택한 경우 이벤트 처리 한것 
 
 
 
 
});// end of $(document).ready(function(){})------------

function push_edit(id){
	//alert(rr);
	//alert($("input#"+rr+"hour").val());
	let idval=$("input#editvalId").val();
	
	idval+=","+id;
	
	$("input#editvalId").val(idval);
	/////////////////////
	let editvalhourval=$("input#editvalhour").val();
	
	editvalhourval+=","+$("input#"+ id +"hour").val();
	
	$("input#editvalhour").val(editvalhourval);
	/////////////////////
	let editvalminval=$("input#editvalmin").val();
	
	editvalminval+=","+$("input#"+ id +"minute").val();
	
	$("input#editvalmin").val(editvalminval);
	/////////////////////
	//alert($("input#editvalId").val()  );
	//alert($("input#editvalhour").val()  );
	//alert($("input#editvalmin").val()  );
	
	
	 let v_html = "";
	 let hour=$("input#"+id+"hour").val();
	 let minute=$("input#"+id+"minute").val();
	 //v_html+=" <div data-v-de07ea7a='' class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					 v_html+="<span data-v-de07ea7a='' class='ml-5 mr-5'>"+hour+"시 "+ minute +"분</span>";
	 					/* v_html+="placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>시</span>";
	 								
	 								
	 					v_html+=" <div data-v-de07ea7a=''class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					v_html+=" <input type='text'  autocomplete='off' id='"+item.workhistoryid+"minute'";
	 					v_html+="	 placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>분</span> ";
	 					 */			

	$("td#"+id).html(v_html);
}
 

function push_delete(id){
	
	//alert(id);
	
	
	let deleteidval=$("input#deleteid").val();
	
	deleteidval += ","+id;
	
	$("input#deleteid").val(deleteidval);
	//alert( $("input#deleteid").val() ) ;
	
	//alert($("input#"+rr+"minute").val());
	 let v_html = "";
	 
	 //v_html+=" <div data-v-de07ea7a='' class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					 v_html+="<span data-v-de07ea7a='' class='ml-5 mr-5'>삭제</span>";
	 					/* v_html+="placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>시</span>";
	 								
	 								
	 					v_html+=" <div data-v-de07ea7a=''class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					v_html+=" <input type='text'  autocomplete='off' id='"+item.workhistoryid+"minute'";
	 					v_html+="	 placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>분</span> ";
	 					 */			

	$("td#"+id).html(v_html);
}

function work_add(){
	
	//alert("dd");
	
	let seq= $("input#addseq").val();
	
	alert(seq);
	
	////
	 let v_html=$("tbody#work_list").html();
	v_html+="<tr data-v-de07ea7a=''><td data-v-de07ea7a=''> </td><td data-v-de07ea7a='' id='"+seq+"types'>  <span data-v-de07ea7a=''>";
	///
						 
	 v_html+="<input type='text'  autocomplete='off' id='"+seq+"type'";
	v_html+=" class='el-input__inner' value=''>";
	
	 v_html+="</span></td>";
	 
		
	 v_html+="<td data-v-de07ea7a=''  id='"+ seq+"' ><div data-v-de07ea7a='' class='el-select hour-select'><div class='el-input el-input--suffix'>";
						 
	 v_html+="<input type='text'  autocomplete='off' id='"+seq+"hour'";
	v_html+="placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>시</span>";
				
				
	v_html+=" <div data-v-de07ea7a=''class='el-select hour-select'><div class='el-input el-input--suffix'>";
						 
	v_html+=" <input type='text'  autocomplete='off' id='"+seq+"minute'";
	v_html+="	 placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>분</span></td>";
				


		
	v_html+="	<td data-v-de07ea7a=''><p data-v-de07ea7a=''class='manage-panel'><button data-v-f8d3258e='' data-v-de07ea7a='' type='button'  class='hw-button secondary sm'>";
					
	v_html+=" <span data-v-f8d3258e='' class='label' onclick='push_add_save("+ seq+");' >저장</span>";
					
	v_html+="</button> ";
					
	//v_html+="<span data-v-f8d3258e='' class='label' onclick='push_delete();'>삭제</span>";
					
	v_html+="			 </p></td></tr>";
	 $("tbody#work_list").html(v_html);
	 
	 ////
	 seq=Number(seq)+1;
	 $("input#addseq").val(seq);
}

function push_add_save(seq){
	
	let addtypeval=$("input#addtype").val();
		
	addtypeval+=","+$("input#"+ seq +"type").val();
	
	$("input#addtype").val(addtypeval);
	/////////////////////
	let addhourval=$("input#addhour").val();
	
	addhourval+=","+$("input#"+ seq +"hour").val();
	
	$("input#addhour").val(addhourval);
	/////////////////////
	let addminval=$("input#addmin").val();
	
	addminval+=","+$("input#"+ seq +"minute").val();
	
	$("input#addmin").val(addminval);
	/////////////////////
	//alert($("input#addtype").val()  );
	//alert($("input#addhour").val()  );
	//alert($("input#addmin").val()  );
	
	
	 let v_html = "";
	 let hour=$("input#"+seq+"hour").val();
	 let minute=$("input#"+seq+"minute").val();
	 //v_html+=" <div data-v-de07ea7a='' class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					 v_html+="<span data-v-de07ea7a='' class='ml-5 mr-5'>"+hour+"시 "+ minute +"분</span>";
	 					/* v_html+="placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>시</span>";
	 								
	 								
	 					v_html+=" <div data-v-de07ea7a=''class='el-select hour-select'><div class='el-input el-input--suffix'>";
	 										 
	 					v_html+=" <input type='text'  autocomplete='off' id='"+item.workhistoryid+"minute'";
	 					v_html+="	 placeholder='선택' class='el-input__inner' value=''></div></div><span data-v-de07ea7a='' class='ml-5 mr-5'>분</span> ";
	 					 */			

	$("td#"+seq).html(v_html);
	 					 //////
	 					 let ty=$("input#"+ seq +"type").val();
	 let u_html="";
	u_html+=" <span data-v-de07ea7a=''>"+ty+"</span></td>";
	///
	 
	 $("td#"+seq+"types").html(u_html);
	
	
	
}
////////////////////////////////////////////////////////////////////
function subgi(){
	
	//삭제
	let deleteidval=$("input#deleteid").val();

	//추가
	let addtypeval=$("input#addtype").val();
	let addhourval=$("input#addhour").val();
	let addminval=$("input#addmin").val();

	//수정
	let idval=$("input#editvalId").val();
	let editvalhourval=$("input#editvalhour").val();
	let editvalminval=$("input#editvalmin").val();
	//let vtype=   $('input[name=vactype]:checked').val();
	
	let datepi = $("input#datepicker").val();
	
	let empidList=$("input#empidcheck").val();
	
	let empnameList=$("input#empnamecheck").val();
	
	let empidListh=$("input#empidcheckh").val();
	
	let empnameListh=$("input#empnamecheckh").val();
	
	let reason = $("textarea#reason").val()
	
	let empidListRef=$("input#empidcheckRef").val();
	
	let empnameListRef=$("input#empnamecheckRef").val();
	
	
	//$("textarea#reason").val();
	
	//alert(vtype  );
	

	  $.ajax({
        url : "<%= ctxPath%>/personnel/workmodi_insert.gw",
        type : "post",
        data : { "datepi": datepi, "empidList": empidList,   "empnameList": empnameList,
        	"reason":reason, "empidListh":empidListh ,"empnameListh":empnameListh,
        	"empidListRef":empidListRef,  "empnameListRef":empnameListRef,
        	"deleteidval": deleteidval , "addtypeval":addtypeval, "addhourval":addhourval,
        	"addminval":addminval, "idval":idval, "editvalhourval":editvalhourval,
        	"editvalminval":editvalminval,
        },		        
        dataType:"json",
        success:function(json){
      	   
      		
      		 alert("신청이 완료되었습니다.");
      		$(location).attr("href", `<%=ctxPath%>/personnel/personal_index.gw`)
			
   
        },
        error: function(request, status, error){
        	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        }
    });  
	
	
}	
//////////////////////////////////////////////////////////


function push_resultRef(empid){
	
	
	$("div#referjdiv").hide();
	//$("div#ac-serach-result").hide(); 
	//alert("ddddpush");
	//let name=""; $("div#referjdiv").show();
	//alert(empid);
	
	  $.ajax({
          url : "<%= ctxPath%>/personnel/selct_empid.gw",
          type : "post",
          data : { "empid": empid },		        
          dataType:"json",
          success:function(json){
        	  // console.log("~~~ 확인용 : " + JSON.stringify(json));
        	  //alert( json.empname);
        	    //name+="dddd";
        	  /*   <div data-v-5dded26b='' class='name'>
												<span data-v-5dded26b=''>
												
												차은우
												
												
												</span></div> */
        	    
        	    let v_html = $("div#refresult").html();
        		
        		v_html +="<div data-v-5dded26b='' class='name'><span data-v-5dded26b=''>"+json.empname +"</span></div> ";
        		
        		
        		//--------------
        		let in_html=$("input#empidcheckRef").val();
        		
        		in_html+=","+empid;
        		
        		$("input#empidcheckRef").val(in_html);
        		
        		//alert($("input#empidcheck").val());
        		//--------------name
        		let name_html=$("input#empnamecheckRef").val();
        		name_html+=","+json.empname;
        		
        		$("input#empnamecheckRef").val(name_html);
        		
        		//alert($("input#empnamecheck").val());
        		
        		$("div#refresult").html(v_html);
     
          },
          error: function(request, status, error){
          	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
      });    
	  
	
}
//////////////////////////////////

function btncancel(){
	
	$("div#layerApplicationLineSetting").hide(); 
	//alert("dcnlth");
}


function btncheck(){
	
	//alert( $("input#empidcheck").val() );
	
	let empidList=$("input#empidcheck").val();
	
	empidList=empidList.split(",");
	
	for( let i =0; i<empidList.length; i++){
		
		//alert(empidList[i]);
	}
	
	let empnameList=$("input#empnamecheck").val();
	
	empnameList=empnameList.split(",");
	
	for( let i =0; i<empnameList.length; i++){
		
		
		if(empnameList[i]=="" ){
			continue;
		}
		
		let in_html="<span >"+ empnameList[i]  +"</span>";
			
		let in_div="div#agree"+i;
		$("div#agree"+i).html(in_html);
		
		//in_html+=","+empid;
		
		//$("input#empidcheck").val(in_html);
		
		
		
		
		//alert(empnameList[i]);
	}
	
	$("div#layerApplicationLineSetting").hide();
}

function push_result(empid){
	
	$("div#ac-serach-result").hide(); 
	//alert("ddddpush");
	//let name="";
	//alert(empid);
	
	  $.ajax({
          url : "<%= ctxPath%>/personnel/selct_empid.gw",
          type : "post",
          data : { "empid": empid },		        
          dataType:"json",
          success:function(json){
        	  // console.log("~~~ 확인용 : " + JSON.stringify(json));
        	  //alert( json.empname);
        	    //name+="dddd";
        	    
        	    let v_html = $("div#b-content").html();
        		
        		v_html +="<div data-v-38b211a8='' class='line-box draggableFlag'><span data-v-38b211a8=''>"+json.empname +"</span><i data-v-38b211a8=''class='fal fa-times-circle ml-5'></i></div> ";
        		
        		
        		//--------------
        		let in_html=$("input#empidcheck").val();
        		
        		in_html+=","+empid;
        		
        		$("input#empidcheck").val(in_html);
        		
        		//alert($("input#empidcheck").val());
        		//--------------name
        		let name_html=$("input#empnamecheck").val();
        		name_html+=","+json.empname;
        		
        		$("input#empnamecheck").val(name_html);
        		
        		//alert($("input#empnamecheck").val());
        		
        		$("div#b-content").html(v_html);
     
          },
          error: function(request, status, error){
          	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
      });  
	  
	  
	  //alert(name);
	  
	/* let v_html = "";
	
	v_html +="<div data-v-38b211a8='' class='line-box draggableFlag'><span data-v-38b211a8=''>"+empName +"</span><i data-v-38b211a8=''class='fal fa-times-circle ml-5'></i></div> ";
	
	$("div#b-content").html(v_html); */
}

 

/* 처리 + 버튼 눌렀을 경우 팝업 */
function applicationLineSetting(){
	//alert("dd");
	
   

  $("div#layerApplicationLineSetting").show(); 

  $("input#inputApprovalLineSetting").keyup(function(){
		
		
		if($("input#inputApprovalLineSetting").val().trim() != ''){
			
			//alert($("input#inputApprovalLineSetting").val().trim());
			
			   $.ajax({
		          url : "<%= ctxPath%>/personnel/search_name.gw",
				type : "post",
				data : {"empName" : $("input#inputApprovalLineSetting").val().trim()},
	dataType : "json",
success : function(json) {

					$("div#ac-serach-result").show();
					let v_html = "";

					if (json.length > 0) {
						$.each(json,function(index,item) {

							
							
									let id = item.empId;
									let name = item.empName;

									v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' id='keyclick' class='search-keyword clearfix w-100' onclick='push_result("
											+ item.empId
											+ ")'>"
											+ item.empName
											+ "("
											+ item.teamName
											+ ")"
											+ "</div></div>";

									//v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' id='keyclick' class='search-keyword clearfix w-100' onclick='push_result('dd','www')'>"+item.empName+"("+item.teamName+")"+"</div></div>";

									//v_html += `<div data-v-147fd5e4="" index="0" class="result-box clearfix hover"  ><div data-v-147fd5e4="" id="keyclick" class="search-keyword clearfix w-100"  onclick="push_result(${item.empId})" >` +item.empName+ `(`+item.teamName+`)` + `</div></div>`;
									console.log("~~~ 확인용 : "+ item.empId);
									console.log("~~~ 확인용 2: "+ item.empName);
									console.log("~~~ 확인용 3: "+ item.teamName);
										});
						}

												/* v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' class='search-keyword clearfix w-100'>은우(하이웍스오피스)</div></div>";
												 */
								$("div#ac-serach-result").html(v_html);
					},
							error : function(request, status,error) {
												alert("code: " + request.status+ "\n" + "message: "+ request.responseText+ "\n" + "error: "+ error);
									}
								});
							}
						});
	}
	
	///////////////////////////////
		 
///////////////////////////////////////////////////////////////////////////////

function btncancelh(){
	
	$("div#layerApplicationLineSettingh").hide(); 
	//alert("dcnlth");
}


function btncheckh(){
	
	//alert( $("input#empidcheck").val() );
	
	let empidList=$("input#empidcheckh").val();
	
	empidList=empidList.split(",");
	
	for( let i =0; i<empidList.length; i++){
		
		//alert(empidList[i]);
	}
	
	let empnameList=$("input#empnamecheckh").val();
	
	//alert(empnameList.length);
	/* if(empnameList.length==3){
		let in_html="<span >"+ empnameList  +"</span>";
		$("div#agreeh0").html(in_html);
	} */
	//let in_html="<span >"+ empnameList  +"</span>";
	//$("div#agreeh0").html(in_html);
	//alert(empnameList);
	empnameList=empnameList.split(",");
	
	//alert('ddd');
	for( let i =1; i<empnameList.length; i++){
		
		//alert(empnameList[i]);
		/* if(empnameList[i]=="" ){
			continue;
		} */
		
		let in_html="<span >"+ empnameList[i]  +"</span>";
			
		let in_div="div#agreeh"+i;
		$("div#agreeh"+i).html(in_html);
		
		//in_html+=","+empid;
		
		//$("input#empidcheck").val(in_html);
		
		
		
		
		//alert(empnameList[i]);
	}
	
	$("div#layerApplicationLineSettingh").hide();
}

function push_resulth(empid){
	
	$("div#ac-serach-resulth").hide(); 
	//alert("ddddpush");
	//let name="";
	//alert(empid);
	
	  $.ajax({
          url : "<%= ctxPath%>/personnel/selct_empid.gw",
          type : "post",
          data : { "empid": empid },		        
          dataType:"json",
          success:function(json){
        	  // console.log("~~~ 확인용 : " + JSON.stringify(json));
        	  //alert( json.empname);
        	    //name+="dddd";
        	    
        	    let v_html = $("div#b-contenth").html();
        		
        		v_html +="<div data-v-38b211a8='' class='line-box draggableFlag'><span data-v-38b211a8=''>"+json.empname +"</span><i data-v-38b211a8=''class='fal fa-times-circle ml-5'></i></div> ";
        		
        		
        		//--------------
        		let in_html=$("input#empidcheckh").val();
        		
        		in_html+=","+empid;
        		
        		$("input#empidcheckh").val(in_html);
        		
        		//alert($("input#empidcheck").val());
        		//--------------name
        		let name_html=$("input#empnamecheckh").val();
        		name_html+=","+json.empname;
        		
        		$("input#empnamecheckh").val(name_html);
        		
        		//alert($("input#empnamecheck").val());
        		
        		$("div#b-contenth").html(v_html);
     
          },
          error: function(request, status, error){
          	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
          }
      });  
	  
	  
	  //alert(name);
	  
	/* let v_html = "";
	
	v_html +="<div data-v-38b211a8='' class='line-box draggableFlag'><span data-v-38b211a8=''>"+empName +"</span><i data-v-38b211a8=''class='fal fa-times-circle ml-5'></i></div> ";
	
	$("div#b-content").html(v_html); */
}

 

/*신청 + 버튼 눌렀을 경우 팝업 */
function applicationLineSettingh(){
	//alert("dd");
	
   

  $("div#layerApplicationLineSettingh").show(); 

  $("input#inputApprovalLineSettingh").keyup(function(){
		
		
		if($("input#inputApprovalLineSettingh").val().trim() != ''){
			
			//alert($("input#inputApprovalLineSetting").val().trim());
			
			   $.ajax({
		          url : "<%= ctxPath%>/personnel/search_name.gw",
				type : "post",
				data : {"empName" : $("input#inputApprovalLineSettingh").val().trim()},
	dataType : "json",
success : function(json) {

					$("div#ac-serach-resulth").show();
					let v_html = "";

					if (json.length > 0) {
						$.each(json,function(index,item) {

							
							
									let id = item.empId;
									let name = item.empName;

									v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' id='keyclick' class='search-keyword clearfix w-100' onclick='push_resulth("
											+ item.empId
											+ ")'>"
											+ item.empName
											+ "("
											+ item.teamName
											+ ")"
											+ "</div></div>";

									//v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' id='keyclick' class='search-keyword clearfix w-100' onclick='push_result('dd','www')'>"+item.empName+"("+item.teamName+")"+"</div></div>";

									//v_html += `<div data-v-147fd5e4="" index="0" class="result-box clearfix hover"  ><div data-v-147fd5e4="" id="keyclick" class="search-keyword clearfix w-100"  onclick="push_result(${item.empId})" >` +item.empName+ `(`+item.teamName+`)` + `</div></div>`;
									console.log("~~~ 확인용 : "+ item.empId);
									console.log("~~~ 확인용 2: "+ item.empName);
									console.log("~~~ 확인용 3: "+ item.teamName);
										});
						}

												/* v_html += "<div data-v-147fd5e4='' index='0' class='result-box clearfix hover'  ><div data-v-147fd5e4='' class='search-keyword clearfix w-100'>은우(하이웍스오피스)</div></div>";
												 */
								$("div#ac-serach-resulth").html(v_html);
					},
							error : function(request, status,error) {
												alert("code: " + request.status+ "\n" + "message: "+ request.responseText+ "\n" + "error: "+ error);
									}
								});
							}
						});
	}
	
///////////////////////////////////////////////////////////////////////////////
//=== jQuery UI 의 datepicker === //
$('input#datepicker').datepicker({
         dateFormat: 'yy-mm-dd'  //Input Display Format 변경
        ,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true        //콤보박스에서 년 선택 가능
        ,changeMonth: true       //콤보박스에서 월 선택 가능                
    //  ,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
    //  ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
    //  ,buttonImageOnly: true   //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    //  ,buttonText: "선택"       //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년"         //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    //  ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    //  ,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)                
 });
 
 // 초기값을 오늘 날짜로 설정
// $('input#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
 
 
 // === 전체 datepicker 옵션 일괄 설정하기 ===  
 //     한번의 설정으로 $("input#fromDate"), $('input#toDate')의 옵션을 모두 설정할 수 있다.
 $(function() {
     //모든 datepicker에 대한 공통 옵션 설정
     $.datepicker.setDefaults({
          dateFormat: 'yy-mm-dd' //Input Display Format 변경
         ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
         ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
         ,changeYear: true //콤보박스에서 년 선택 가능
         ,changeMonth: true //콤보박스에서 월 선택 가능                
      // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시됨. both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시됨.  
      // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
      // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
      // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
         ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
         ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
         ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
         ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
         ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
      // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
      // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
     });

     // input을 datepicker로 선언
     $("input#fromDate").datepicker();                    
     $("input#toDate").datepicker();
     
     // From의 초기값을 오늘 날짜로 설정
     $('input#fromDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
     
     // To의 초기값을 3일후로 설정
     $('input#toDate').datepicker('setDate', '+3D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
  });
 
 ///////////////////////////////////////////////////////////////////////
</script>


<div id="router_split_item" class="split-item right"
	style="width: calc(100% - 276px);">
	<div id="contents" class="contents-wrap">
		<div data-v-5f302e69="">
			<div data-v-5f302e69="" class="sticky-area">
				<button data-v-cde747bc="" data-v-5f302e69="" type="button"
					class="hu-button text">
					<!---->
					<span data-v-cde747bc="" class="label" onclick="subgi()">기안하기</span>
					<!---->
				</button>
			</div>
			<div data-v-de07ea7a="" data-v-5f302e69=""
				class="approval-page work-modify">
				<div data-v-de07ea7a="" class="content-div">
					<div data-v-5dded26b="" data-v-de07ea7a=""
						approvaldata="[object Object]" orgoption="[object Object]"
						orgnodeid="2256">
						<div data-v-5dded26b="" class="basic-approval-div">
							<h1 data-v-5dded26b="">기본설정</h1>
							<table data-v-5dded26b="" class="approval-table basic-setting">
								<colgroup data-v-5dded26b="">
									<col data-v-5dded26b="" style="width: 12%;">
									<col data-v-5dded26b="">
									<col data-v-5dded26b="" style="width: 12%;">
									<col data-v-5dded26b="">
								</colgroup>
								<tbody data-v-5dded26b="">
									<tr data-v-5dded26b="">
										<th data-v-5dded26b="" scope="row">문서 종류</th>
										<td data-v-5dded26b="" class="basic-setting-td">근무체크 수정
											요청서</td>
										<th data-v-5dded26b="" scope="row">작성자</th>
										<td data-v-5dded26b=""><span data-v-5dded26b="">${sessionScope.loginUser.empName}</span>
										<!-- <span
											data-v-5dded26b="" class="ml-5">대표이사</span> -->
											</td>
									</tr>
									<tr data-v-5dded26b="">
										<th data-v-5dded26b="" scope="row">보존 연한</th>
										<td data-v-5dded26b="" class="basic-setting-td">3년</td>
										<th data-v-5dded26b="" scope="row">보안 등급</th>
										<td data-v-5dded26b="">B 등급</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div data-v-5dded26b="" class="approval-document-line-div">
								<div data-v-5dded26b="" class="title-div">
									<h1 data-v-5dded26b="">
										결재선
										<!-- <button data-v-f8d3258e="" data-v-5dded26b="" type="button"
											class="hw-button ml-20 text">
											
											<span data-v-f8d3258e="" class="label">결재선 설정</span>
											
										</button> -->
									</h1>
								</div>
								<table data-v-5dded26b="" class="approval-table line-setting">
									<colgroup data-v-5dded26b="">
										<col data-v-5dded26b="" style="width: 116px;">
										<col data-v-5dded26b="">
										<col data-v-5dded26b="" style="width: 116px;">
										<col data-v-5dded26b="">
									</colgroup>
									<tbody data-v-5dded26b="">
										<tr data-v-5dded26b="">
											<th data-v-5dded26b="" class="agree" style="height: 162px;"><div
													data-v-5dded26b="" class="choice">
													신청<span data-v-5dded26b="" title="신청"
														class="spr-approval set"></span>
												</div>
												<div data-v-5dded26b="" class="set-line">
													<button data-v-21506c5c="" data-v-5dded26b="" tabindex="-1"
														class="el-tooltip hw-icon md" onclick="applicationLineSettingh();"
														aria-describedby="el-tooltip-6604">
														<i data-v-21506c5c="" class="fal fa-plus-circle"></i>
													</button>
												</div></th>
											<td data-v-5dded26b="" class="agree-td"><div
													data-v-5dded26b="" class="line-area">
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agreeh0">
															 <span>${sessionScope.loginUser.empName}</span>
														</div>
													</div>
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agreeh1" ></div>
													</div>
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agreeh2" ></div>
													</div>
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agreeh3"></div>
													</div>
												</div></td>
											<th data-v-5dded26b="" class="agree"
												style="border-left: 1px solid rgb(214, 214, 214); height: 162px;"><div
													data-v-5dded26b="" class="choice">
													처리<span data-v-5dded26b="" title="처리"
														class="spr-approval set"></span>
												</div>
												<div data-v-5dded26b="" class="set-line">
													<button data-v-21506c5c="" data-v-5dded26b=""
														class="el-tooltip hw-icon md"
														onclick="applicationLineSetting();">
														<!-- tabindex="-1"   aria-describedby="el-tooltip-744"  -->
														<i data-v-21506c5c="" class="fal fa-plus-circle"></i>
													</button>
												</div></th>
											<td data-v-5dded26b="" class="agree-td"><div
													data-v-5dded26b="" class="line-area">
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agree1"></div>
													</div>
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agree2"></div>
													</div>
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agree3"></div>
													</div>
													<div data-v-5dded26b="" class="line-box">
														<div data-v-5dded26b="" class="position"></div>
														<div data-v-5dded26b="" class="stamp"></div>
														<div data-v-5dded26b="" class="name" id="agree4"></div>
													</div>
												</div></td>
										</tr>
									</tbody>
								</table>
								<table data-v-5dded26b="" class="approval-table refer">
									<colgroup data-v-5dded26b="">
										<col data-v-5dded26b="" style="width: 116px;">
										<col data-v-5dded26b="">
									</colgroup>
									<tbody data-v-5dded26b="">
										<tr data-v-5dded26b="">
											<th data-v-5dded26b="">참조</th>
											<input type="hidden" id="empidcheckRef" value="" />
					<input type="hidden" id="empnamecheckRef" value="" />
											<td data-v-5dded26b="" class="ref-div"  id ="refresult"><div
													data-v-147fd5e4="" data-v-5dded26b=""
													class="position-relative" style="width: 180px;">
													<input data-v-147fd5e4="" placeholder="클릭후 입력하세요"
														class="hw-input" id="referj">
													<div data-v-147fd5e4="" class="ac-serach-result-wrap"
														style="top: 36px; display: none;" id="referjdiv">
														<!---->
														<!-- <div data-v-147fd5e4="" index="0" class="result-box clearfix hover">
														  <div data-v-147fd5e4="" class="search-keyword clearfix w-100">
														차은우 (하이웍스오피스)</div> 
														</div> -->
													</div>
												</div>
												
												  <div id ="refresult" style="display: flex;">
												
												
												</div>  
												<!-- <div data-v-5dded26b="" class="name">
												<span data-v-5dded26b="">차은우</span>
												<button data-v-21506c5c="" data-v-5dded26b="" tabindex="-1" class="el-tooltip hw-icon sm" aria-describedby="el-tooltip-1309">
												<i data-v-21506c5c="" class="fal fa-times-circle"></i></button>
												</div> -->
												
												
												</td>
										</tr>
									</tbody>
								</table>
							</div>
						<!-- <div data-v-5dded26b="" class="approval-document-line-div">
							<div data-v-5dded26b="" class="title-div">
								<h1 data-v-5dded26b="">
									결재선
									<button data-v-f8d3258e="" data-v-5dded26b="" type="button"
										class="hw-button ml-20 text">
										
										<span data-v-f8d3258e="" class="label">결재선 설정</span>
										
									</button>
								</h1>
							</div>
							<table data-v-5dded26b="" class="approval-table line-setting">
								<colgroup data-v-5dded26b="">
									<col data-v-5dded26b="" style="width: 116px;">
									<col data-v-5dded26b="">
									<col data-v-5dded26b="" style="width: 116px;">
									<col data-v-5dded26b="">
								</colgroup>
								<tbody data-v-5dded26b="">
									<tr data-v-5dded26b="">
										<th data-v-5dded26b="" class="agree" style="height: 162px;"><div
												data-v-5dded26b="" class="choice">
												신청<span data-v-5dded26b="" title="신청"
													class="spr-approval set"></span>
											</div>
											<div data-v-5dded26b="" class="set-line">
												<button data-v-21506c5c="" data-v-5dded26b="" tabindex="-1"
													class="el-tooltip hw-icon md"
													aria-describedby="el-tooltip-5033">
													<i data-v-21506c5c="" class="fal fa-plus-circle"></i>
												</button>
											</div></th>
										<td data-v-5dded26b="" class="agree-td"><div
												data-v-5dded26b="" class="line-area">
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name">
														<span data-v-5dded26b="">대표이사</span>
													</div>
												</div>
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
											</div></td>
										<th data-v-5dded26b="" class="agree"
											style="border-left: 1px solid rgb(214, 214, 214); height: 162px;"><div
												data-v-5dded26b="" class="choice">
												처리<span data-v-5dded26b="" title="처리"
													class="spr-approval set"></span>
											</div>
											<div data-v-5dded26b="" class="set-line">
												<button data-v-21506c5c="" data-v-5dded26b="" tabindex="-1"
													class="el-tooltip hw-icon md"
													aria-describedby="el-tooltip-4541">
													<i data-v-21506c5c="" class="fal fa-plus-circle"></i>
												</button>
											</div></th>
										<td data-v-5dded26b="" class="agree-td"><div
												data-v-5dded26b="" class="line-area">
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
												<div data-v-5dded26b="" class="line-box">
													<div data-v-5dded26b="" class="position"></div>
													<div data-v-5dded26b="" class="stamp"></div>
													<div data-v-5dded26b="" class="name"></div>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
							<table data-v-5dded26b="" class="approval-table refer">
								<colgroup data-v-5dded26b="">
									<col data-v-5dded26b="" style="width: 116px;">
									<col data-v-5dded26b="">
								</colgroup>
								<tbody data-v-5dded26b="">
									<tr data-v-5dded26b="">
										<th data-v-5dded26b="">참조</th>
										<td data-v-5dded26b="" class="ref-div"><div
												data-v-147fd5e4="" data-v-5dded26b=""
												class="position-relative" style="width: 180px;">
												<input data-v-147fd5e4="" placeholder="클릭후 입력하세요"
													class="hw-input">
												<div data-v-147fd5e4="" class="ac-serach-result-wrap"
													style="top: 36px; display: none;">
													
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div> -->
						<div data-v-5abcbcd2="" data-v-5dded26b=""
							class="el-dialog__wrapper" ondragstart="return false"
							onselectstart="return false" style="display: none;">
							<div role="dialog" aria-modal="true" aria-label="dialog"
								class="el-dialog xl addressbook" style="margin-top: 15vh;">
								<div class="el-dialog__header">
									<div data-v-5abcbcd2="" class="modal-title">결재선 선택</div>
									<button type="button" aria-label="Close"
										class="el-dialog__headerbtn">
										<i class="el-dialog__close el-icon el-icon-close"></i>
									</button>
								</div>
								<!---->
								<div class="el-dialog__footer">
									<span data-v-5abcbcd2="" class="dialog-footer"><button
											data-v-f8d3258e="" data-v-5abcbcd2="" type="button"
											class="hw-button secondary">
											<!---->
											<span data-v-f8d3258e="" class="label">취소</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-5abcbcd2="" type="button"
											class="hw-button primary">
											<!---->
											<span data-v-f8d3258e="" class="label">확인</span>
											<!---->
										</button></span>
								</div>
							</div>
						</div>
						<div data-v-38b211a8="" data-v-5dded26b=""
							class="el-dialog__wrapper" style="display: none;">
							<div role="dialog" aria-modal="true" aria-label="dialog"
								class="el-dialog sm-title" style="margin-top: 15vh;">
								<div class="el-dialog__header">
									<div data-v-38b211a8="" class="modal-title">신청 설정</div>
									<button type="button" aria-label="Close"
										class="el-dialog__headerbtn">
										<i class="el-dialog__close el-icon el-icon-close"></i>
									</button>
								</div>
								<!---->
								<div class="el-dialog__footer">
									<span data-v-38b211a8="" class="dialog-footer"><button
											data-v-f8d3258e="" data-v-38b211a8="" type="button"
											class="hw-button secondary">
											<!---->
											<span data-v-f8d3258e="" class="label">취소</span>
											<!---->
										</button>
										<button data-v-f8d3258e="" data-v-38b211a8="" type="button"
											class="hw-button primary">
											<!---->
											<span data-v-f8d3258e="" class="label">확인</span>
											<!---->
										</button></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div data-v-de07ea7a="">
					<section data-v-de07ea7a="">
						<h4 data-v-de07ea7a="" class="section-title">제목</h4>
						<p data-v-de07ea7a="" class="section-content">근무체크 수정(${sessionScope.loginUser.empName}) 
							<!-- 2023년 12월 3일 --></p>
					</section>
					<section data-v-de07ea7a="">
						<h4 data-v-de07ea7a="" class="section-title">근무일</h4>
						<div data-v-de07ea7a="" class="section-content"
							style="width: 120px;">
							<div data-v-de07ea7a=""
								class="el-date-editor hw-calendar el-input el-input--prefix el-input--suffix el-date-editor--date">
								<!---->
								<input type="date" name="birthday" id="datepicker" maxlength="10" /><!-- 
						
								<!-- 
								<input type="text" readonly="readonly" autocomplete="off"
									name="" placeholder="날짜 선택" class="el-input__inner"><span
									class="el-input__prefix"><i
									class="el-input__icon gi gi-calendar"></i>
								</span><span class="el-input__suffix"><span
									class="el-input__suffix-inner"><i class="el-input__icon"></i>
									
										
										
										</span>
								</span>
								
								 -->
								
								
								<!---->
								<!---->
							</div>
						</div>
					</section>
					<section data-v-de07ea7a="">
						<h4 data-v-de07ea7a="" class="section-title">적용대상</h4>
						<p data-v-de07ea7a="" class="section-content">${sessionScope.loginUser.empName}</p>
					</section>
					<section data-v-de07ea7a="" class="hr-modify-table">
						<h4 data-v-de07ea7a="" class="section-title">근무체크 수정 요청</h4>
						<div data-v-de07ea7a=""
							class="d-flex justify-content-between align-items-center">
							<p data-v-de07ea7a="" class="section-content">수정할 상태값을 체크한 후,
								삭제 버튼 클릭 또는 수정할 시간을 입력하세요.</p>
								<!--  -->
								<input type="hidden" id="addseq" value="1">
								<input type="hidden" id="addhour" value="">
								<input type="hidden" id="addmin" value="">
								<input type="hidden" id="addtype" value="">
								<!--  -->
								<input type="hidden" id="deleteid" value="">
							<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
								class="hw-button text">
								<i data-v-f8d3258e="" class="icon left gis gi-plus font-size-14"></i><span
									data-v-f8d3258e="" class="label" onclick="work_add();">근무체크 추가 </span>
								<!---->
							</button>
						</div>
						<table data-v-de07ea7a="" class="setting-table center mt-20">
							<colgroup data-v-de07ea7a="">
								<col data-v-de07ea7a="" style="width: 120px;">
								<col data-v-de07ea7a="" style="width: 20%;">
								<col data-v-de07ea7a="">
								<!---->
								<col data-v-de07ea7a="" style="width: 155px;">
							</colgroup>
							<thead data-v-de07ea7a="">
								<tr data-v-de07ea7a="">
									<th data-v-de07ea7a="">기존 체크시간</th>
									<th data-v-de07ea7a="">근무 상태</th>
									<th data-v-de07ea7a="">수정 요청시간</th>
									<!---->
									<th data-v-de07ea7a="">수정/삭제</th>
								</tr>
							</thead>
							<tbody data-v-de07ea7a="" id="work_list">
<!-- <td data-v-de07ea7a=""><div data-v-de07ea7a=""
										class="el-select hour-select">
										
										<div class="el-input el-input--suffix">
											
											<input type="text" readonly="readonly" autocomplete="off"
												placeholder="선택" class="el-input__inner">
											
										</div>
										
									</div>
									<span data-v-de07ea7a="" class="ml-5 mr-5">시</span>
								<div data-v-de07ea7a="" class="el-select">
										
										<div class="el-input el-input--suffix">
											
											<input type="text" readonly="readonly" autocomplete="off"
												placeholder="선택" class="el-input__inner">
											
											<span class="el-input__suffix"><span
												class="el-input__suffix-inner"><i
													class="el-select__caret el-input__icon el-icon-arrow-up"></i>
												
													
													
													
													</span>
											</span>
											
											
										</div>
										<div class="el-select-dropdown el-popper"
											style="display: none; min-width: 60px;">
											<div class="el-scrollbar" style="">
												<div class="el-select-dropdown__wrap el-scrollbar__wrap"
													style="margin-bottom: -8px; margin-right: -8px;">
													 
												</div>
												<div class="el-scrollbar__bar is-horizontal">
													<div class="el-scrollbar__thumb"
														style="transform: translateX(0%);"></div>
												</div>
												<div class="el-scrollbar__bar is-vertical">
													<div class="el-scrollbar__thumb"
														style="transform: translateY(0%);"></div>
												</div>
											</div>
											
										</div>
									</div>
									<span data-v-de07ea7a="" class="ml-5 mr-5">분</span>
								<div data-v-de07ea7a="" class="el-select">
										
										<div class="el-input el-input--suffix">
											
											<input type="text" readonly="readonly" autocomplete="off"
												placeholder="선택" class="el-input__inner">
											
											<span class="el-input__suffix"><span
												class="el-input__suffix-inner"><i
													class="el-select__caret el-input__icon el-icon-arrow-up"></i>
												
													
													
													
													</span>
											</span>
											
											
										</div>
										<div class="el-select-dropdown el-popper"
											style="display: none; min-width: 60px;">
											<div class="el-scrollbar" style="">
												<div class="el-select-dropdown__wrap el-scrollbar__wrap"
													style="margin-bottom: -8px; margin-right: -8px;">
													 
												</div>
												<div class="el-scrollbar__bar is-horizontal">
													<div class="el-scrollbar__thumb"
														style="transform: translateX(0%);"></div>
												</div>
												<div class="el-scrollbar__bar is-vertical">
													<div class="el-scrollbar__thumb"
														style="transform: translateY(0%);"></div>
												</div>
											</div>
											
										</div>
									</div>
									<span data-v-de07ea7a="" class="ml-5 mr-5">초</span></td>
								 -->
								<!-- <tr data-v-de07ea7a="">
									<td data-v-de07ea7a="">13:15:18</td>
									<td data-v-de07ea7a="">출근 <span data-v-de07ea7a="">
											/ 웹</span></td>
									
									<td data-v-de07ea7a=""></td>
									
									<td data-v-de07ea7a=""><p data-v-de07ea7a=""
											class="manage-panel">
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button secondary sm">
												
												<span data-v-f8d3258e="" class="label">수정</span>
												
											</button>
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button info sm">
												
												<span data-v-f8d3258e="" class="label">삭제</span>
												
											</button>
										</p></td>
								</tr>
								<tr data-v-de07ea7a="">
									<td data-v-de07ea7a="">20:52:44</td>
									<td data-v-de07ea7a="">업무 <span data-v-de07ea7a="">
											/ 웹</span></td>
									
									<td data-v-de07ea7a=""></td>
									
									<td data-v-de07ea7a=""><p data-v-de07ea7a=""
											class="manage-panel">
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button secondary sm">
												
												<span data-v-f8d3258e="" class="label">수정</span>
												
											</button>
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button info sm">
												
												<span data-v-f8d3258e="" class="label">삭제</span>
												
											</button>
										</p></td>
								</tr>
								<tr data-v-de07ea7a="">
									<td data-v-de07ea7a="">21:06:43</td>
									<td data-v-de07ea7a="">외출 <span data-v-de07ea7a="">
											/ 웹</span></td>
									
									<td data-v-de07ea7a=""></td>
									
									<td data-v-de07ea7a=""><p data-v-de07ea7a=""
											class="manage-panel">
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button secondary sm">
												
												<span data-v-f8d3258e="" class="label">수정</span>
												
											</button>
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button info sm">
												
												<span data-v-f8d3258e="" class="label">삭제</span>
												
											</button>
										</p></td>
								</tr>
								<tr data-v-de07ea7a="">
									<td data-v-de07ea7a="">21:06:46</td>
									<td data-v-de07ea7a="">업무 <span data-v-de07ea7a="">
											/ 웹</span></td>
									
									<td data-v-de07ea7a=""></td>
									
									<td data-v-de07ea7a=""><p data-v-de07ea7a=""
											class="manage-panel">
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button secondary sm">
												
												<span data-v-f8d3258e="" class="label">수정</span>
												
											</button>
											<button data-v-f8d3258e="" data-v-de07ea7a="" type="button"
												class="hw-button info sm">
												
												<span data-v-f8d3258e="" class="label">삭제</span>
												
											</button>
										</p></td>
								</tr> -->
								<!---->
							</tbody>
							<!---->
						</table>
					</section>
					<section data-v-de07ea7a="">
						<h4 data-v-de07ea7a="" class="section-title">상세</h4>
						<div data-v-de07ea7a="" class="section-content">
							<textarea data-v-76d2f788="" data-v-de07ea7a=""  id="reason"
								id="AUTO_FOCUS_OBJECT" rows="3" placeholder=""
								class="hw-textarea" value=""
								style="width: 100%; height: 70px; overflow-y: hidden;"></textarea>
						</div>
					</section>
					<!-- <section data-v-de07ea7a="" class="attachment-wrapper">
						<div data-v-58de2198="" data-v-de07ea7a="" class="input-files">
							<div data-v-58de2198="" class="top">
								<div data-v-58de2198="" class="left upload-title">
									<div data-v-58de2198="" class="upload-title-text mr-20">별첨</div>
									<div data-v-58de2198="" class="upload-type">
										<button data-v-58de2198="" class="upload-type-item">파일
											첨부</button>
									</div>
									<input data-v-58de2198="" type="file" multiple="multiple"
										style="display: none;">
								</div>
								
							</div>
							<div data-v-58de2198="" class="center">여기로 파일을 끌어놓으세요.</div>
							<div data-v-58de2198="" class="files">
								
							</div>
							
						</div>
					</section> -->
				</div>
			</div>
		</div>
	</div>
</div>