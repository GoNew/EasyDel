<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="easydel.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/modify.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css"/>
<title>회원정보 수정</title>
<script>
	$(document).ready(function() {
		$("#modifyForm").submit(function() {
			
			var pw = $("#userPassword").val()
			var pw2 = $("#userPassword2").val()
			
			var htp = $("#hiddentelephone").val()
			var tp = $("#telephone").val() 	
			
			if (pw == pw2 && htp == tp ) {
				return true;
			} else if( pw != pw2) {
				alert("2개의 비밀번호가 일치해야 합니다.");
				return false;
			} else if(htp != tp){
				alert("전화번호 인증을 해야합니다.");
				return false;
			} else{
				alert("넌 수정못해 이유는 나두몰러");
				return false;
			}			
			return false;
		});
		
		$("#imgFileInput").change(function() {
			var files = !!this.files ? this.files : [];
			if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
			
			if (/^image/.test(files[0].type)){ // only image file
				var reader = new FileReader(); // instance of the FileReader
				reader.readAsDataURL(files[0]); // read the local file
				
				reader.onloadend = function() { // set image data as background of div
					$("#imagePreview").css("background-image", "url("+this.result+")");
	            }
        	} else {
        		alert("사진만 등록가능합니다.");
        	}
		});
	});
</script>
<% 
	User user = (User) session.getAttribute("loginSession");
%>
</head>
<body>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>

<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
<pre>                            호잇             
                              </pre>

	<form class="uk-form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/modify" id="modifyForm" method="post">
		<section id="aaa">
			<div>
	    		<div id="smallform">   		
		    		<div align="left" id="leftform"><label id="id"> 아이디</label></div>
		    		<div align="left" id="middleform"><input id="my" value="<%=user.getUserId()%>" name="userId" readonly="readonly"></input></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="pw"> 비밀번호</label></div>
		    	 	<div align="left" id="middleform"><input type="password" value="<%=user.getUserPassword()%>" id="userPassword" name="userPassword" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호" required></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="pw"> 비밀번호 확인</label></div>
		    	 	<div align="left" id="middleform"><input type="password" value="<%=user.getUserPassword()%>" id="userPassword2" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." required></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="name"> 이름</label></div> 
		    	 	<div align="left" id="middleform"><input id="my" value="<%=user.getUserName()%>" readonly="readonly"></input></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="sex"> 성별</label></div>
		    	 	<div align="left" id="middleform"><input id="my" value="<% if(user.getUserGender()==1){ %>남자<% } else if(user.getUserGender()==2){ %>여자<% } %>" readonly="readonly"/></div>
		    	</div>
		    	<div id="smallform">
		    		<div align="left" id="leftform"><label id="birth"> 생년월일</label></div>
		    		<%
		    			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		    			String birth = transFormat.format(user.getUserBirthdate());
		    		%>
		    		<div align="left" id="middleform"><input id="my" value="<%=birth %>" readonly="readonly"/></div> 						
				</div>
			</div>
			<div align="right" id="rightform">
				<div id="null">프로필 사진을 변경하려면 사진을 선택하세요!</div>
				<label for="imgFileInput">
					<div id="imagePreview" class="uk-width-1-1 uk-text-center"
					style="background-image:url('<%=request.getContextPath() %><%=user.getUserPicture() %>')">
					</div>
				</label>
				<input type="file" id="imgFileInput" name="imgFileInput">
			</div>
		</section>
		
		<div>
			<input type="email" value="<%=user.getUserEmail()%>" placeholder="이메일" class="uk-width-7-10" name="userEmail" required> <br>
			<input type="hidden" value="<%=user.getUserPhone()%>" id="hiddentelephone"></input>
      	    <input type="tel" value="<%=user.getUserPhone()%>" id="telephone" pattern="[0-9]{10,11}" title="10~11자리 숫자만 사용할 수 있습니다." placeholder="휴대폰전화번호" name="userPhone" class="uk-width-7-10" required> 
      	    <button class="uk-button uk-button uk-width-1-5" type="button" data-uk-button id="button2">전송</button> <br>
     	    <input type="text" placeholder="인증번호" class="uk-width-7-10"> 
     		<button class="uk-button uk-button uk-width-1-5" type="button" data-uk-button id="button2">확인</button>
        </div>
     	<br>
     	<div align="center">
        	<button class="uk-button uk-button-primary uk-width-1-5" type="submit" data-uk-button id="button">수정완료</button>
        	<button class="uk-button uk-button-primary uk-width-1-5" type="reset" data-uk-button id="button">초기화</button>
        	<a href="<%=request.getContextPath()%>/withdraw"><button class="uk-button uk-button-primary uk-width-1-5" type="button" data-uk-button id="button">회원탈퇴</button></a>
  		</div>
	</form>
</div>
</div>
<jsp:include page = "/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>