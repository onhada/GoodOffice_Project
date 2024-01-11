<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 --%>
<%
	String ctxPath = request.getContextPath();
%>

 <script type="text/javascript">

  $(document).ready(function(){
	  
	  loopshowNowTime();
	  
	
	$('button#work_status').on('click', (e) => {  //출근, 퇴큰 버튼
		  console.log(e.target.value);
		  const type=e.target.parentElement.value;
		  //alert(type);
		  
		  workstatus_insert(type);
		  
		  
		  
		
	 });
	
	
	$('button#work_status_four').on('click', (e) => {  
		
		
		  console.log(e.target.value);
		  const type=e.target.value;
		  
		  if(typeof type=="undefined"){
			  
			  
			  const typeRe=e.target.parentElement.value;
			 // alert(typeRe);
			  
			  workstatus_insert(typeRe);
			   
		  }
		  else{
			  
			  //alert(type);
			  
			  workstatus_insert(type);
			   
			  
		  }
		  
		  
		 
		  
		
	 });
	
	

  	
	  
	 
  });// end of $(document).ready(function(){})------------
  
function workstatus_insert(type){
	
	  
	  //alert("ee");
  		 $.ajax({
	          url : "<%= ctxPath%>/personnel/workstatus_insert.gw",
	          type : "post",
	          data : { "worktype":type  },
	         // processData:false,  // 파일 전송시 설정 
	          //contentType:false,  // 파일 전송시 설정 
	          dataType:"json",
	          success:function(json){
	             // console.log("~~~ 확인용 : " + JSON.stringify(json));
	              // ~~~ 확인용 : {"result":1}
	        	  //work_status_print();
	          },
	          error: function(request, status, error){
	          alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	          }
	      });
  }
	 
  //////////////

	function showNowTime() {
	      
	      const now = new Date();
	   
	      let month = now.getMonth() + 1;
	      if(month < 10) {
	         month = "0"+month;
	      }
	      
	      let date = now.getDate();
	      if(date < 10) {
	         date = "0"+date;
	      }
	      
	      let strNow_back = now.getFullYear() + "-" + month + "-" + date;
	      
	       
	    
	      
	      let hour = "";
	       if(now.getHours() < 10) {
	           hour = "0"+now.getHours();
	       } 
	       else {
	          hour = now.getHours();
	       }
	      
	       
	      let minute = "";
	      if(now.getMinutes() < 10) {
	         minute = "0"+now.getMinutes();
	      } else {
	         minute = now.getMinutes();
	      }
	      
	      let second = "";
	      if(now.getSeconds() < 10) {
	         second = "0"+now.getSeconds();
	      } else {
	         second = now.getSeconds();
	      }
	      
	      let strNow = hour + " : " + minute + " : " + second;
	      
	      $("span#clock").html(strNow);
	   
	   }// end of function showNowTime() -----------------------------
	   
	   
	   function loopshowNowTime() {
		      showNowTime();
		      
		      const timejugi = 1000;   // 시간을 1초 마다 자동 갱신하려고.
		      
		      setTimeout(function() {
		                  loopshowNowTime();   
		               }, timejugi);
		      
	   }// end of loopshowNowTime() 
	   
  </script>    

<style>
.home-header .wrapper {
	width: 920px;
}

.wrapper {
	width: 875px;
}
</style>



<div id="contents" class="contents-wrap">
	<div class="header-wrapper">
		<div class="home-header">
			<div class="wrapper" style="max-height: 273px;">
				<div class="vuebar-container vb vb-visible" style="width: auto; height: auto; position: relative; overflow: hidden;">
					<div class="vb-content" style="max-height: 273px; display: block; overflow: hidden scroll; height: 100%; width: calc(100% + 8px);">
						<div data-v-9d7b8978="" class="favorite-container" style="padding: 30px 0px;">
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%= ctxPath%>/mail/mailList.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 18 14">
																	<g>
																	<path class="svg-hover-color" fill="#5b6164" d="M58.012 54.462H41.3a.639.639 0 0 1-.643-.637V41.1a.639.639 0 0 1 .641-.637h16.714a.64.64 0 0 1 .643.637v12.726a.64.64 0 0 1-.643.636zm-16.071-1.271h15.428V41.734H41.94z" transform="translate(-171 -133) translate(130.345 92.538)"></path>
																	<path fill="#4e9bd4" d="M49.589 48.7a1.49 1.49 0 0 1-.818-.244l-4.911-3.627a.612.612 0 0 1-.16-.863.642.642 0 0 1 .882-.155l.04.029 4.883 3.6a.221.221 0 0 0 .218-.02l4.851-3.584a.641.641 0 0 1 .885.122.609.609 0 0 1-.124.867l-4.881 3.606a1.578 1.578 0 0 1-.865.269z" transform="translate(-171 -133) translate(130.235 92.425)"></path></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">사내메일</p>
									</div>
								</a>
							</div>
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%= ctxPath%>/reservation/myReservationList.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 18 18">
																	<g transform="translate(-796 -271)">
																	<path class="svg-hover-color" d="M711,663.2a7.8,7.8,0,1,1-7.8,7.8,7.809,7.809,0,0,1,7.8-7.8m0-1.2a9,9,0,1,0,9,9,9,9,0,0,0-9-9Z" transform="translate(94 -391)" fill="#5b6164"></path>
																	<path class="svg-hover-color" d="M720.792,680.792a.574.574,0,0,1-.809.039l-3.854-3.854a.6.6,0,0,1,.848-.848l3.854,3.854A.574.574,0,0,1,720.792,680.792Z" transform="translate(88.408 -396.592)" fill="#4e9bd4"></path>
																	<path class="svg-hover-color" d="M716.6,669a.6.6,0,0,1,.6.6v4.2a.6.6,0,0,1-1.2,0v-4.2A.6.6,0,0,1,716.6,669Z" transform="translate(88.4 -393.8)" fill="#4e9bd4"></path></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">예약</p>
									</div>
								</a>
							</div>
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%= ctxPath%>/personnel/personal_index.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" 273"="" viewBox="0 0 18 18.273">
												<g transform="translate(-591 -778.727)">
												<rect fill="none" width="18" height="18" transform="translate(591 779)"></rect>
												<path class="svg-hover-color" fill="#5b6164" d="M149.749,589.489H135.444a.625.625,0,0,1-.6-.651V571.92a.625.625,0,0,1,.6-.651h14.305a.625.625,0,0,1,.6.651v16.918A.625.625,0,0,1,149.749,589.489Zm-13.709-1.3h13.113V572.57H136.04Z" transform="translate(458.582 207.458)"></path>
												<path fill="#4e9bd4" d="M142.334,582.358h-2.083c-.221,0-.4-.291-.4-.651s.179-.651.4-.651h2.083c.221,0,.4.292.4.651S142.555,582.358,142.334,582.358Z" transform="translate(1181.972 642.897) rotate(90)"></path>
												<path fill="#4e9bd4" d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z" transform="translate(457.415 205.711)"></path>
												<path fill="#4e9bd4" d="M147.831,577.57H140.5a.651.651,0,1,1,0-1.3h7.331a.651.651,0,1,1,0,1.3Z" transform="translate(457.415 208.711)"></path></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">근태관리</p>
									</div>
								</a>
							</div>
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%=ctxPath %>/personnel/payAnnualList.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 18 18">
												<g transform="translate(-1081.986 -778.727)">
												<path class="svg-hover-color" d="M905.206 589.269h-16.714a.643.643 0 0 1-.643-.643v-16.714a.643.643 0 0 1 .643-.643h16.714a.643.643 0 0 1 .643.643v16.714a.643.643 0 0 1-.643.643zm-16.071-1.286h15.429v-15.428h-15.429z" fill="#5b6164" transform="translate(194.137 207.458)"></path>
												<path class="svg-hover-color" d="M893.454 587.662a.643.643 0 0 1-.455-1.1l10.286-10.286a.643.643 0 0 1 .924.894l-.016.015-10.286 10.286a.636.636 0 0 1-.453.191z" fill="#5b6164" transform="translate(192.365 205.739)"></path>
												<path class="svg-hover-color" d="M907.348 589.555h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z" fill="#4e9bd4" transform="translate(188.78 201.387)"></path>
												<path class="svg-hover-color" d="M907.348 593.56h-3.857a.643.643 0 1 1 0-1.286h3.857a.643.643 0 1 1 0 1.286z" fill="#4e9bd4" transform="translate(188.78 199.956)"></path>
												<path class="svg-hover-color" d="M897.348 580.768h-3.857a.643.643 0 0 1 0-1.286h3.857a.643.643 0 0 1 0 1.286z" fill="#4e9bd4" transform="translate(192.351 204.525)"></path>
												<path class="svg-hover-color" d="M896.491 581.417a.643.643 0 0 1-.643-.643v-3.857a.643.643 0 1 1 1.286 0v3.857a.643.643 0 0 1-.643.643z" fill="#4e9bd4" transform="translate(191.28 205.671)"></path></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">급여</p>
									</div>
								</a>
							</div>
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%=ctxPath %>/organization/empInfoViewPage.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 18 18">
																	<g transform="translate(-149.978 -60.062)">
																	<path fill="#4e9bd4" d="M0 0H1.3V7.991H0z" opacity="0.9" transform="translate(158.328 65.508)"></path>
																	<path class="svg-hover-color" d="M154.353 78.009H150.6a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.622.625zm-3.125-1.25h2.5v-2.5h-2.5z" fill="#5b6164" transform="translate(0 .053)"></path>
																	<path class="svg-hover-color" d="M161.794 66.062h-5.6a.727.727 0 0 1-.7-.75v-4.5a.726.726 0 0 1 .7-.75h5.6a.726.726 0 0 1 .7.75v4.5a.727.727 0 0 1-.7.75zm-4.9-1.5h4.2v-3h-4.2z" fill="#5b6164" transform="translate(-.016)"></path>
																	<path class="svg-hover-color" d="M166.117 73.47h-1.3v-3.264h-11.669v3.264h-1.3v-4.482h14.266z" fill="#5b6164" transform="translate(0 .035)"></path>
																	<path class="svg-hover-color" d="M160.869 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z" fill="#5b6164" transform="translate(-.016 .053)"></path>
																	<path class="svg-hover-color" d="M167.385 78.009h-3.75a.625.625 0 0 1-.625-.625v-3.75a.625.625 0 0 1 .625-.625h3.75a.625.625 0 0 1 .625.625v3.75a.625.625 0 0 1-.625.625zm-3.125-1.25h2.5v-2.5h-2.5z" fill="#5b6164" transform="translate(-.032 .053)"></path></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">조직</p>
									</div>
								</a>
							</div>
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%=ctxPath %>/approval/document/list/A.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 18 18">
																	<g id="service-menu-icon02_s" transform="translate(-363 -75)">
																	<rect width="18" height="18" transform="translate(363 75)" fill="none"></rect>
																	<g transform="translate(363 75)">
																	<path class="svg-hover-color" d="M181.928,683.857a.641.641,0,0,1-.454-.188l-1.286-1.286a.643.643,0,0,1,.909-.909l.831.831,2.117-2.117a.643.643,0,0,1,.909.909l-2.571,2.571A.641.641,0,0,1,181.928,683.857Z" transform="translate(-169.714 -668.428)" fill="#4e9bd4"></path>
																	<g transform="translate(0)">
																	<g>
																	<path class="svg-hover-color" d="M178.786,670.092v-5.52a1.285,1.285,0,0,0-1.286-1.286h-2.571A1.285,1.285,0,0,0,173.643,662h-4.5a1.285,1.285,0,0,0-1.286,1.286h-2.571A1.285,1.285,0,0,0,164,664.571v14.143A1.285,1.285,0,0,0,165.286,680h11.571a5.142,5.142,0,0,0,1.929-9.908Zm-5.143-6.806v1.286h-4.5v-1.286Zm-8.357,15.429V664.571h2.571a1.285,1.285,0,0,0,1.286,1.286h4.5a1.285,1.285,0,0,0,1.286-1.286H177.5v5.187a5.113,5.113,0,0,0-5.786,5.1,5.125,5.125,0,0,0,1.749,3.857Zm11.571,0a3.857,3.857,0,1,1,3.857-3.857A3.862,3.862,0,0,1,176.857,678.714Z" transform="translate(-164 -662)" fill="#5b6164"></path></g></g></g></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">전자결재</p>
									</div>
								</a>
							</div>
							<div data-v-9d7b8978="" class="circle-wrap">
								<a data-v-9d7b8978="" href="<%= ctxPath%>/admin/managerSet.gw" target="_self" class="menu office">
									<span data-v-9d7b8978="" class="circle">
										<span data-v-9d7b8978="" class="alarm-cnt" style="display: none;">0</span>
										<span data-v-9d7b8978="" class="icon">
											<svg class="service-menu-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 18 18">
																	<g transform="translate(-843.804 -361.04)">
																	<path d="M857.835 366.463l-.31-.262a5.887 5.887 0 0 0-1.9-1.081l-.39-.134v-1.932a8.089 8.089 0 0 0-3.224 0v1.933l-.388.136a6.053 6.053 0 0 0-1.9 1.084l-.309.26-1.69-.967a7.825 7.825 0 0 0-1.61 2.75l1.7.969-.076.4a5.785 5.785 0 0 0 0 2.16l.077.406-1.7.968a7.865 7.865 0 0 0 1.612 2.746l1.7-.971.309.264a5.886 5.886 0 0 0 1.891 1.085l.39.135v1.934a8.09 8.09 0 0 0 3.224 0v-1.932l.386-.137a6.1 6.1 0 0 0 1.9-1.088l.31-.261 1.693.974a7.819 7.819 0 0 0 1.608-2.755l-1.7-.967.076-.406a5.81 5.81 0 0 0 0-2.16l-.076-.405 1.7-.969a7.872 7.872 0 0 0-1.612-2.749zm-4.19 7.519h-.028a3.284 3.284 0 1 1 0-6.569h.03a3.284 3.284 0 1 1 0 6.568z" fill="none" transform="translate(-.827 -.661)"></path>
																	<path d="M856.6 375.979h.014a2.127 2.127 0 1 0 0-4.254h-.014a2.127 2.127 0 1 0-.007 4.254h.012z" fill="none" transform="translate(-3.801 -3.816)"></path>
																	<path d="M843.8 361.04v18h18v-18zm16.093 9.879l1.121.639a1 1 0 0 1 .447 1.136 9 9 0 0 1-2 3.437.991.991 0 0 1-1.219.183l-1.116-.642a7.219 7.219 0 0 1-1.553.89v1.268a.993.993 0 0 1-.78.961 9.223 9.223 0 0 1-3.983 0 .992.992 0 0 1-.777-.957v-1.27a7.027 7.027 0 0 1-1.553-.892l-1.119.64a1 1 0 0 1-1.211-.179 9.042 9.042 0 0 1-2.006-3.422.994.994 0 0 1 .458-1.154l1.107-.632a6.907 6.907 0 0 1 0-1.766l-1.112-.634a.984.984 0 0 1-.454-1.151 8.983 8.983 0 0 1 2-3.423.982.982 0 0 1 1.218-.183l1.113.637a7.185 7.185 0 0 1 1.555-.888v-1.267a.991.991 0 0 1 .779-.96 9.21 9.21 0 0 1 3.983 0 .99.99 0 0 1 .777.957v1.266a6.97 6.97 0 0 1 1.557.889l1.117-.638a1 1 0 0 1 1.211.181 9.044 9.044 0 0 1 2.006 3.425.991.991 0 0 1-.456 1.153l-1.109.633a6.987 6.987 0 0 1 .006 1.763z" fill="none"></path>
																	<path class="svg-hover-color" d="M859.956 373.848a2.149 2.149 0 0 0-2.148-2.123 2.127 2.127 0 1 1 0 4.254 2.15 2.15 0 0 0 2.148-2.131z" fill="#5b6164" transform="translate(-4.993 -3.816)"></path>
																	<path class="svg-hover-color"
													d="M861.626 367.387a9.044 9.044 0 0 0-2.006-3.425 1 1 0 0 0-1.211-.181l-1.117.638a6.97 6.97 0 0 0-1.557-.889v-1.266a.99.99 0 0 0-.777-.957 9.209 9.209 0 0 0-3.983 0 .991.991 0 0 0-.779.96v1.267a7.186 7.186 0 0 0-1.555.888l-1.113-.637a.982.982 0 0 0-1.218.183 8.983 8.983 0 0 0-2 3.423.984.984 0 0 0 .454 1.151l1.112.635a6.907 6.907 0 0 0 0 1.766l-1.107.632a.994.994 0 0 0-.458 1.154 9.042 9.042 0 0 0 2.006 3.422 1 1 0 0 0 1.211.179l1.119-.64a7.027 7.027 0 0 0 1.553.892v1.27a.992.992 0 0 0 .777.957 9.223 9.223 0 0 0 3.983 0 .993.993 0 0 0 .78-.961v-1.268a7.219 7.219 0 0 0 1.553-.89l1.116.642a.991.991 0 0 0 1.219-.183 9 9 0 0 0 2-3.437 1 1 0 0 0-.447-1.136l-1.121-.639a6.986 6.986 0 0 0 0-1.765l1.109-.633a.991.991 0 0 0 .457-1.152zm-6.91-4.948zm0 0zm-3.489 0zm0 0zm-4.063 2.318zm0 0zm-.206.034zm0 0zm-1.62 2.744zm0 0zm0 5.045zm0 0zm5.883 5.1zm0 0zm3.489 0zm0 0zm4.067-2.316zm0 0zm.206-.033zm0 0zm-.205-6.759l.076.405a5.81 5.81 0 0 1 0 2.16l-.076.406 1.7.967a7.82 7.82 0 0 1-1.608 2.755l-1.693-.974-.31.261a6.1 6.1 0 0 1-1.9 1.088l-.386.137v1.932a8.09 8.09 0 0 1-3.224 0v-1.934l-.39-.135a5.886 5.886 0 0 1-1.891-1.085l-.309-.264-1.7.971a7.865 7.865 0 0 1-1.612-2.746l1.7-.968-.076-.406a5.782 5.782 0 0 1 0-2.16l.076-.4-1.7-.969a7.826 7.826 0 0 1 1.61-2.75l1.69.967.309-.26a6.053 6.053 0 0 1 1.9-1.084l.388-.136v-1.94a8.089 8.089 0 0 1 3.224 0v1.932l.39.134a5.887 5.887 0 0 1 1.9 1.081l.31.262 1.695-.968a7.873 7.873 0 0 1 1.612 2.749zm1.815-1.036zm0 0z"
													fill="#5b6164" transform="translate(-.164 -.018)"
												></path>
																	<path class="svg-hover-color" d="M852.645 373.214a3.312 3.312 0 0 1 3.3-3.289 3.284 3.284 0 1 0 0 6.569 3.311 3.311 0 0 1-3.3-3.28z" fill="#5b6164" transform="translate(-3.157 -3.173)"></path>
																	<path class="svg-hover-color" d="M857.813 369.926a3.284 3.284 0 1 1-.005 6.568 3.284 3.284 0 1 0 0-6.568z" fill="#4e9bd4" transform="translate(-4.993 -3.174)"></path>
																	<path class="svg-hover-color" d="M854.446 373.857a2.151 2.151 0 0 1 2.152-2.132 2.127 2.127 0 1 0 0 4.254 2.15 2.15 0 0 1-2.152-2.122z" fill="#4e9bd4" transform="translate(-3.8 -3.816)"></path>
																	<path class="svg-hover-color" d="M859.277 373.206a3.309 3.309 0 0 0-3.3-3.28h-.028a3.284 3.284 0 1 0 0 6.568h.025a3.312 3.312 0 0 0 3.303-3.288zm-3.315 2.13h-.014a2.127 2.127 0 1 1 0-4.254h.021a2.127 2.127 0 1 1 0 4.254h-.013z" fill="#4e9bd4" transform="translate(-3.158 -3.173)"></path></g></svg>
										</span>
									</span>
									<div data-v-9d7b8978="" class="tit-box">
										<p data-v-9d7b8978="" class="tit">오피스 관리</p>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div class="sub-contents" style="position: static; max-height: 90vh;">
			<div class="time-check">
				<div class="time-check-component">
					<p class="title">근태관리</p>
					<div class="contents">
						<div class="today-info" style="margin: 5% 0 0 22%;  ">
						<span  id="clock" class="current-time"></span>
						
						<!-- 	<div class="today-status"  >
								<span  id="clock" class="current-time"></span>
							</div> -->
						</div>
						<div class="today-detail">
							<ul class="division-list">
								<li>
									<button type="button" class="" id="work_status"  value="6" >
										<img src="<%= ctxPath%>/resources/image/icon/checkin.ac627d8a.svg" alt="" class="icon-in-out">
										<div class="check-btn">출근하기</div>
									</button>
								</li>
								<li>
									<button type="button"  id="work_status" value="5"  >
									 <!--disabled="disabled" class="inactive"  -->
										<img src="<%= ctxPath%>/resources/image/icon/checkout.4919929e.svg" alt="" class="icon-in-out">
										<div class="check-btn">퇴근하기</div>
									</button>
								</li>
							</ul>
							<div class="list-btns-wrap" style="margin: 0 0 5% 0">
								<div class="list-btns less-six-etc-check">
									<div class="list-btn-item">
										<button data-v-f8d3258e="" type="button"  id="work_status_four" value="1" class="hw-button pill-shape-outline">
											<!---->
											<span data-v-f8d3258e="" class="label">업무</span>
											<!---->
										</button>
									</div>
									<div class="list-btn-item">
										<button data-v-f8d3258e="" type="button" id="work_status_four" value="2" class="hw-button pill-shape-outline">
											<!--disabled="disabled"-->
											<span data-v-f8d3258e="" class="label">외출</span>
											<!---->
										</button>
									</div>
									<div class="list-btn-item">
										<button data-v-f8d3258e="" type="button" id="work_status_four" value="3" class="hw-button pill-shape-outline">
											<!--disabled="disabled"-->
											<span data-v-f8d3258e="" class="label">회의</span>
											<!---->
										</button>
									</div>
									<div class="list-btn-item">
										<button data-v-f8d3258e="" type="button" id="work_status_four" value="4" class="hw-button pill-shape-outline">
											<!--disabled="disabled"-->
											<span data-v-f8d3258e="" class="label">외근</span>
											<!---->
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="sub-contents" style="position: static; max-height: 90vh; margin: 0 0 0 4%">
			<div class="approval">
				<div data-v-0f8ed5fd="">
					<p data-v-0f8ed5fd="" class="title">전자결재</p>
					<div data-v-0f8ed5fd="" class="contents">
						<div data-v-0f8ed5fd="" class="status-wrap">
							<a data-v-0f8ed5fd="" class="status">
								<span data-v-0f8ed5fd="">대기</span>
								<span data-v-0f8ed5fd="" class="count blue" style="">6</span>
							</a>
							<a data-v-0f8ed5fd="" class="status">
								<span data-v-0f8ed5fd="">확인</span>
								<span data-v-0f8ed5fd="" class="count blue" style="">1</span>
							</a>
							<a data-v-0f8ed5fd="" class="status">
								<span data-v-0f8ed5fd="">예정</span>
								<span data-v-0f8ed5fd="" class="count" style="display: none;">0</span>
							</a>
							<a data-v-0f8ed5fd="" class="status">
								<span data-v-0f8ed5fd="">진행</span>
								<span data-v-0f8ed5fd="" class="count">11</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="mail" style="padding: 27px 0 0 0;">
				<div data-v-0f8ed5fd="">
					<p data-v-0f8ed5fd="" class="title">사내메일</p>
					<div data-v-0f8ed5fd="" class="contents">
						<div data-v-0f8ed5fd="" class="status-wrap">
							<a data-v-0f8ed5fd="" class="status" href="<%= ctxPath%>/mail/mailWrite.gw" style="background: #2985db; color: #fff !important;">
								<span data-v-0f8ed5fd="">메일쓰기</span>
							</a>
							<a data-v-0f8ed5fd="" class="status" href="<%= ctxPath%>/mail/mailList.gw?mailType=1">
								<span data-v-0f8ed5fd="">받은편지함</span>
							</a>
							<a data-v-0f8ed5fd="" class="status" href="<%= ctxPath%>/mail/mailList.gw?mailType=2">
								<span data-v-0f8ed5fd="">보낸편지함</span>
							</a>
							<a data-v-0f8ed5fd="" class="status" href="<%= ctxPath%>/mail/mailList.gw?mailType=4">
								<span data-v-0f8ed5fd="">임시보관함</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
