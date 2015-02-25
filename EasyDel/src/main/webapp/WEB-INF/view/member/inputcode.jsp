<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/inputcode.css"/>
</head>
<body>
<div class="uk-clearfix uk-align-center" align="left" >
	<div style="height:170px"></div>
	<div id="itext" align="center"> 수령인에게 받은 인증번호를 입력해주세요</div>
	<div style="height:100px"></div>
	<div class="webkitbox">
		<div style="width:360px"></div>
		<div>
			<div style="height:25px"></div>
			<div style="width:120px">인증번호 : </div>
			<div style="width:30px"></div>
		</div>	
		<div>
			<input type="text" pattern="[0-9]" id="iitext" required>
		</div>
	</div>
	<div style="height:50px"></div>
	<div align="center"><button id="button" class="uk-button uk-button-primary" type="button">확인</button></div>
</div>
</body>
</html>