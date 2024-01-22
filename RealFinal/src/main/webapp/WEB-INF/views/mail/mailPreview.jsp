<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String ctxPath = request.getContextPath();
%>






<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">



<script type="text/javascript" src="<%= ctxPath%>/resources/jquery/jquery-3.7.1.min.js"></script>



<script type="text/javascript">

	$(document).ready(function(){
		
	});// end of $(document).ready(function(){})-----------------

	
	// Function Declaration
	
	
</script>



<style>
body {
	font-family: 맑은 고딕;
	font-size: 16px;
	line-height: 1.6;
}

p {
	font-family: 맑은 고딕;
	font-size: 16px;
	line-height: 1.6;
	margin: 0;
}
</style>
</head>
<body class="vsc-initialized">
	<div style="font-size: 16px; font-weight: bold;">ㅎㅇ</div>
	<div style="font-size: 12px;">
		${requestScope.incomeMail}
		<div style="font-size: 12px;">받는 사람 : "관리자" &lt;admin&gt;,</div>
		<div style="font-size: 12px;">참조 : admin</div>
		<hr style="line-height: 0px; border: 1px solid #DDDDDD;">
		<div>&nbsp;</div>

		<div class="sign_area" style="margin: 0 0 0 0; margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;">
			<p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.6; margin-top: 0px; margin-bottom: 0px;">ㅎㅇ</p>

			<p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 16px; line-height: 1.6; margin-top: 0px; margin-bottom: 0px;">테스트서명입니다.</p>

			<p>&nbsp;</p>
		</div>
	</div>
</body>
</html>