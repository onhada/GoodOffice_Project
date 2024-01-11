<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,user-scaleable=no">
<title>GoodOffice</title>
<meta property="og:title" content="">
<meta property="og:image" content="">
<meta property="og:site_name" content="">
<meta property="og:description" content="">
<meta name="apple-mobile-web-app-title" content="hiworks">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="msapplication-config" content="none">



<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/css/bootstrap.min.css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%=ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js"></script>

<!-- official css -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/login/style_new.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/login/style.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/login/login.css">



<style type="text/css">
.int_jogin {
	width: 130%;
	height: 55px;
	line-height: 50px;
}
</style>



<script type="text/javascript">

$(document).ready(function() {
	
	
})// end of $(document).ready(function(){})-------------------------


// Function Declaration
<%-- 로그인하기 --%>
function login() {
	
	const loginId = $("input:text[name='loginId']").val(); 
	const loginPasswd = $("input:password[name='loginPasswd']").val(); 
	
	if(loginId.trim()=="") {
		alert("아이디를 입력하세요!!");
	 	$("input:text[name='loginId']").val(""); 
	 	$("input:text[name='loginId']").focus();
		return; // 종료 
	}
	
	if(loginPasswd.trim()=="") {
		alert("비밀번호를 입력하세요!!");
		$("input:password[name='loginPasswd']").val(""); 
		$("input:password[name='loginPasswd']").focus();
		return; // 종료 
	}
	  
	const frm = document.loginFrm;
	
	frm.action = "<%= ctxPath%>/common/loginEnd.gw";
	frm.method = "post";
	frm.submit();
	  
}// end of function login()--------------------------

</script>





</head>
<body class="vsc-initialized">
	<div id="wrap">
		<form name ="loginFrm" id="beta_form">
			<input type="hidden" name="ssl_login" id="ssl_login" value="Y">
			<input type="hidden" name="link_url" id="link_url" value="">
			<input type="hidden" name="ip_security" id="ip_security" value="">
			<div class="loginWrap-ofc" id="contents">
				<div class="loginBox-ofc">
					<h1 class="head-ofc">
						<img src="<%=ctxPath%>/resources/image/login/loginLog.svg" style="width: 280px; height: 61px;" alt="GoodOffice">
					</h1>
					<div class="body-ofc">
						<ul class="save-ofc">
						</ul>
						<section>
							<input type="text" style="display: none;">
							<input type="text" class="type-J" title="아이디" name="loginId" value="" placeholder="아이디" autocomplete='off'>
							<input type="password" class="type-J" title="비밀번호" name="loginPasswd" value="" placeholder="비밀번호" onkeydown="if(event.keyCode==13) login();" autocomplete='off'>
							<p class="err">
								<span class="wr-txt" id="login_error_msg"></span>
							</p>
							<p class="btn-login">
								<label>
									<input type="submit" title="로그인" value="로그인" class="int_jogin" onclick="login();">
								</label>
							</p>
						</section>
					</div>
				</div>
			</div>
		</form>
		<div id="dimmed"></div>
	</div>
</body>
</html>