<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/errorpage.css"/>

<title>Error Page!</title>
<%
	String errormsg = (String)request.getAttribute("errorMsg");
	if(errormsg == null)
		errormsg = "";
%>
</head>
<body>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
	<div style="height:40px"></div>
	<div id="errornull">
		<div style="width:203px"></div>
		<div><img id="errorimg" src="<%=request.getContextPath()%>/img/error.png"></div>
	</div>
	<div id="errornull">
		<div style="width:270px"></div>
		<div>
			<div style="height:40px"></div>
			<div id="errormsg" align="center">
				<%=errormsg %>
			</div>
		</div>
	</div>
	<div id="errornull">
		<div style="width:435px"></div>
        <div>
        	<a href="<%=request.getContextPath() %>/main">
        	<button class="uk-button uk-button-primary uk-button uk-width-1-1 uk-button-large" type="button" id="button">메인으로 가기</button>
			</a>
		</div>
	</div>
</div>
</div>
</body>
</html>