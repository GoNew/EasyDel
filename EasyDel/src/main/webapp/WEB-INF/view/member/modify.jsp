<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/modify.css"/>
<title>회원수정</title>
</head>
<body>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
	<form class="uk-form" >
		<section id="aaa">
			<div>
	    		<div id="smallform">   		
		    		<div align="left" id="leftform"><label id="id"> 아이디</label></div>
		    		<div align="left" id="middleform"><label id="my">(text,fixed)</label></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="pw"> 비밀번호</label></div>
		    	 	<div align="left" id="middleform"><input type="password" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호" required></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="pw"> 비밀번호 확인</label></div>
		    	 	<div align="left" id="middleform"><input type="password" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호 확인" required></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="name"> 이름</label></div> 
		    	 	<div align="left" id="middleform"><label id="my"> (text,fixed)</label></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="sex"> 성별</label></div>
		    	 	<div align="left" id="middleform"><label id="my"> 남/여(fixed)</label></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="birth"> 생년월일</label></div>
		    		<div align="left" id="middleform"><label id="my"> (date,fixed)</label></div> 						
				</div>
			</div>
			<div align="right" id="rightform">
				<div id="null"></div>
				<img id="myimg" src= "<%=request.getContextPath()%>/img/EHkoala.jpg">
			</div>
		</section>
		
		<div>
			<input type="email" placeholder="이메일" class="uk-width-7-10" required> <br>
      	    <input type="tel" pattern="[0-9]{10,11}" title="10~11자리 숫자만 사용할 수 있습니다." placeholder="휴대폰전화번호" class="uk-width-7-10" required> 
      	    <button class="uk-button uk-button uk-width-1-5" type="button" data-uk-button id="button2">전송</button> <br>
     	    <input type="text" placeholder="인증번호" class="uk-width-7-10" required> 
     		<button class="uk-button uk-button uk-width-1-5" type="button" data-uk-button id="button2">확인</button>
        </div>
     	<br>
     	<div align="center">
        	<button class="uk-button uk-button-primary uk-width-1-5" type="submit" data-uk-button id="button">수정완료</button>
        	<button class="uk-button uk-button-primary uk-width-1-5" type="button" data-uk-button id="button">초기화</button>
        	<button class="uk-button uk-button-primary uk-width-1-5" type="button" data-uk-button id="button">회원탈퇴</button>
  		</div>
	</form>
</div>
</div>
</body>
</html>