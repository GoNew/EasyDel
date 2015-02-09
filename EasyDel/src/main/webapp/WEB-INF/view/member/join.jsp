<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/join.css"/>


<script type="text/javascript">
		
	function IdDuplicateCheck() {
		var ajaxUrl = "<%=request.getContextPath()%>/ajax/dupidcheck";
		
		$.ajax({
			type : "get",
			url : ajaxUrl,
			data : {
				userId: $("#userId").val()
			},
			success : function(args) {
				$("#checkId").html(args);
			}
		});
	}

	$(document).ready(function() {
		$("#userId").keyup(IdDuplicateCheck);
	
		$("#joinForm").submit(function() {
			var pw = $("#userPassword").val()
			var pw2 = $("#userPassword2").val()
			if (pw == pw2) {
				return true;
			} else {
				alert("2개의 비밀번호가 일치해야 합니다.");
				return false;
			}
			return false;
		})
	})
</script>
</head>
<body>
<div class="uk-clearfix">
<div id="logoimg"> <img id="logo" src="<%=request.getContextPath()%>/img/EHlogo.PNG" alt="" class="uk-align-center"> </div>
<div id="formcss" class="uk-align-center">
	<form class="uk-form" action="<%=request.getContextPath()%>/join" id="joinForm" method="post">
	<label> <span class="red">* </span> 는 항목은 필수 항목입니다. </label> <br>
    	<section id="aaa">    		
	    	<div align="left" id="leftform">
	    		<div id="marg"><span class="red">* </span> <input type="text" id="userId" name="userId" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="아이디" required></div>
   		        <div id="marg"><span class="red">* </span> <input type="password" id="userPassword" name="userPassword" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호" required></div>
			    <div id="marg"><span class="red">* </span> <input type="password" id="userPassword2" name="userPassword2" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호 확인" required></div>
			    <div id="marg"><span class="red">* </span> <input type="text" name="userName" maxlength="5" size="27" placeholder="이름" required></div> 
				<div data-uk-switcher="{connect:'#switch-from-content'}" align="center">	
		           	<a id="sex" class="uk-button uk-active" name="userGender">남자</a>
		            <button id="sex" class="uk-button" type="button" name="userGender">여자</button>
				</div>						
			</div>
		
			<div align="right" id="rightform">
				<span style="color: red" id="joinFormCheckId"></span>
				<img id = "myimg" name="userPicture" src= "<%=request.getContextPath()%>/img/EHkoala.jpg">
			</div>
		</section>
		<div>
			<div id="formbirth" class="uk-form-controls uk-form-controls-text">
				<div class="uk-form-icon" ></div> 
		    	<span class="red">* </span> <i class="uk-icon-birthday-cake"></i>    	
		   		<label><input type="date" name="birthdate" class="uk-width-7-10"></label>
			</div>
			<div id="marg"><span class="red">* </span> <input type="email" name="userEmail" placeholder="이메일" class="uk-width-7-10" required></div>
      	    <div id="marg"><span class="red">* </span> <input type="tel" name="userPhone" pattern="[0-9]{10,11}" title="10~11자리 숫자만 사용할 수 있습니다." placeholder="휴대폰전화번호" class="uk-width-7-10" required> 
      	    <button class="uk-button uk-button uk-width-1-5" type="button" data-uk-button id="button2">전송</button></div>
     	    <div id="marg"><span class="red">* </span> <input type="text" name="identifyingNumber" placeholder="인증번호" class="uk-width-7-10" required> 
     		<button class="uk-button uk-button uk-width-1-5" type="button" data-uk-button id="button2">확인</button></div>
        </div>
     	<br>
     	<div align="center">
        	<button class="uk-button uk-button-primary uk-width-2-5" type="submit" data-uk-button id="button">회원가입</button>
        	
        	<a href="<%=request.getContextPath() %>/view/intro/intro.jsp"><button class="uk-button uk-button-primary uk-width-2-5" type="button" data-uk-button id="button">취소</button></a>
  		</div>
	</form>
</div>
</div>
</body>
</html>