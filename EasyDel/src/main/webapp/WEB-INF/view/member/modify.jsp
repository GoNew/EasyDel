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

	function sendValidateMsg() {
		var phoneNum = $("#telephone").val();
		if(phoneNum.length != 10 && phoneNum.length != 11) {
			alert("phone 번호가 제대로 입력되어야 합니다.");
			return;
		}
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath() %>/ajax/sendVC",
			data : {
				phoneNum: phoneNum
			},
			success : function(responseText) {
				if(responseText == "true") {
					alert("문자로 인증코드가 전송되었습니다.");
				} else {
					alert("인증코드 전송에 실패하였습니다. 다시 전송해주세요.");
				}
			}
		});
	}
	function checkValidateCode() {
		var valiCode = $("#userValidateInfo").val();
		if(valiCode == null || valiCode.length < 1) {
			alert("인증코드가 입력되어야 합니다.");
			return;
		}
		$.ajax({
			type : "get",
			url : "<%=request.getContextPath() %>/ajax/checkVC",
			data : {
				valiCode: valiCode
			},
			success : function(responseText) {
				if(responseText == "true") {
					alert("인증에 성공하였습니다.");
					$("#saveValidateInfo").val("true");
				} else {
					alert("인증에 실패하였습니다.");
				}
			}
		});
	}

	$(document).ready(function() {
		$("#telephone").keyup(function() {
			$("#saveValidateInfo").val("false");
		});
		
		$("#modifyForm").submit(function() {
			
			var pw = $("#userPassword").val()
			var pw2 = $("#userPassword2").val()
			
			var htp = $("#hiddentelephone").val()
			var tp = $("#telephone").val()
			
			var vcInfo = $("#saveValidateInfo").val();
			
			if (pw == pw2 && htp == tp ) {
				return true;
			} else if( pw != pw2) {
				alert("2개의 비밀번호가 일치해야 합니다.");
				return false;
			} else if(htp != tp){
				if(vcInfo != "true") {
					alert("전화번호 인증을 해야합니다.");
					return false;
				}
			} else{
				alert("넌 수정못해 이유는 나두몰러");
				return false;
			}			
			return true;
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
	<div style="height:30px"></div>
	<form class="uk-form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/modify" id="modifyForm" method="post">
		<section id="aaa">
			<div>
	    		<div id="smallform">
	    			<div>
	    				<div style="height:8px"></div>   		
		    			<div align="left" id="leftform"><label id="id"> 아이디</label></div>
		    		</div>
		    		<div align="left" id="middleform"><input id="my" value="<%=user.getUserId()%>" name="userId" readonly="readonly"></input></div>
		    	</div>
		    	<div id="smallform">
		    		<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
		    		<div style="width:5px"></div>
		    		<div>
	    				<div style="height:8px"></div>   
		    			<div align="left" id="leftform2"><label id="pw"> 비밀번호</label></div>
		    	 	</div>
		    	 	<div align="left" id="middleform"><input type="password" value="<%=user.getUserPassword()%>" id="userPassword" name="userPassword" style="color:#00B1F2" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호" required></div>
		    	</div>
		    	<div id="smallform">
		    		<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
		    		<div style="width:5px"></div>
		    		<div>
	    				<div style="height:8px"></div>   
		    			<div align="left" id="leftform2"><label id="pw"> 비밀번호 확인</label></div>
		    	 	</div>
		    	 	<div align="left" id="middleform"><input type="password" value="<%=user.getUserPassword()%>" id="userPassword2" style="color:#00B1F2" size="27" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." required></div>
		    	</div>
		    	<div id="smallform">
		    		<div>
	    				<div style="height:8px"></div>   
		    			<div align="left" id="leftform"><label id="name"> 이름</label></div> 
		    	 	</div>
		    	 	<div align="left" id="middleform"><input id="my" value="<%=user.getUserName()%>" readonly="readonly"></input></div>
		    	</div>
		    	<div id="smallform">
		    		<div>
	    				<div style="height:8px"></div>   
		    			<div align="left" id="leftform"><label id="sex"> 성별</label></div>
		    	 	</div>
		    	 	<div align="left" id="middleform"><input id="my" value="<% if(user.getUserGender()==1){ %>남자<% } else if(user.getUserGender()==2){ %>여자<% } %>" readonly="readonly"/></div>
		    	</div>
		    	<div id="smallform">
		    		<div>
	    				<div style="height:8px"></div>   
		    			<div align="left" id="leftform"><label id="birth"> 생년월일</label></div>
		    			<%
		    				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		    				String birth = transFormat.format(user.getUserBirthdate());
		    			%>
		    		</div>
		    		<div align="left" id="middleform"><input id="my" value="<%=birth %>" readonly="readonly"/></div> 						
				</div>
			</div>
			<div style="width:70px"></div>
			<div align="center" id="rightform">
				<div style="height:50px"></div>
				<label for="imgFileInput">
					<div id="imagePreview" class="uk-width-1-1 uk-text-center" style="background-image:url('<%=request.getContextPath() %><%=user.getUserPicture() %>')">
					</div>
				</label>
				<input type="file" id="imgFileInput" name="imgFileInput">
				<div style="height:30px"></div>
				<div>프로필 사진을 변경하려면 사진을 선택하세요!</div>
			</div>
		</section>
		
		<div>
			<div id="aaa">
				<div style="width:20px"></div>
				<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
				<input type="email" value="<%=user.getUserEmail()%>" placeholder="이메일"  style="color:#00B1F2" class="uk-width-3-5" id="modifyInfo" name="userEmail" required> <br>
			</div>
			<div id="aaa">
				<div style="width:20px"></div>
				<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
				<input type="hidden" value="<%=user.getUserPhone()%>" id="hiddentelephone"></input>
      	   	 	<input type="tel" value="<%=user.getUserPhone()%>" id="telephone" pattern="[0-9]{10,11}"  style="color:#00B1F2" title="10~11자리 숫자만 사용할 수 있습니다." placeholder="휴대폰전화번호" name="userPhone" class="uk-width-7-10" required> 
      	    	<button class="uk-button" type="button" id="button2" onclick="sendValidateMsg()">전송</button> <br>
     	   	</div>
     	   	<div id="aaa">
     	   		<div style="width:20px"></div>
				<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
     	   	 	<input type="text" placeholder="인증번호" class="uk-width-7-10"  style="color:#00B1F2" id="userValidateInfo" > 
     			<button class="uk-button" type="button" id="button2" onclick="checkValidateCode()">확인</button>
     		</div>
        </div>
     	<br>
     	<div align="center">
     	<input type="hidden" id="saveValidateInfo" required="required" value="false">
        	<button class="uk-button uk-button-primary uk-width-1-5" type="submit" id="button">수정완료</button>
        	<button class="uk-button uk-button-primary uk-width-1-5" type="reset" id="button">초기화</button>
        	<a href="<%=request.getContextPath()%>/withdraw"><button class="uk-button uk-button-primary uk-width-1-5" type="button" id="button">회원탈퇴</button></a>
  		</div>
	</form>
	
</div>
</div>
<jsp:include page = "/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>