<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/intro.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/uikit/css/uikit.gradient.min.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath() %>/uikit/js/uikit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="fullbrowser" class="uk-clearfix" align="center">
		<div id="logoimg" class="uk-width-1-2">
			<img id="logo" alt="" src="img/easydel.png">
		</div>

		<div id="formcss" align="center">
			<form class="uk-form uk-width-1-3" method="post" action="<%=request.getContextPath()%>/login">
				<input id="userid" name="userid" type="text" placeholder="아이디를 입력하세요" class="uk-width-1-1">
				<input id="userpass" name="userpassword" type="password" placeholder="비밀번호를 입력하세요" class="uk-width-1-1">
				<button id="login" type="submit" class="uk-button uk-button-primary uk-width-1-1">로그인</button>
			</form>
				<button id="join" class="uk-button uk-button-primary uk-width-1-3">회원가입</button>
		</div>
	</div>
</body>
</html>