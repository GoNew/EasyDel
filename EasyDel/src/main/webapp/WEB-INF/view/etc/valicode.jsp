<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인증번호 입력</title>
<style>
.vertical-container
{display: -webkit-flex;
 display:         flex;
 height: 300px;}
.vertically-centered {
  margin: auto;
</style>
</head>
<body>

<div class="vertical-container elem">
<section class="elem elem-green vertically-centered">
<p><p><span class="label"></span></p><p>인증번호를 입력하세요!</p>
<input type="text" name="valicode"> <span class="endlabel">
			<button type="submit">확인</button>
</span>
</section>  
</div>
</body>
</html>