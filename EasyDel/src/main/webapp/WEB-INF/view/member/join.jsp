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
				$("#CheckId").html(args);
			}
		});
	}
	
	function sendValidateMsg() {
		var phoneNum = $("#userPhoneInfo").val();
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
		$("#userId").keyup(IdDuplicateCheck);
	
		$("#joinForm").submit(function() {
			var vali = $("#saveValidateInfo").val();
			if(vali != "true") {
				alert("폰 번호 인증이 실시되어야 합니다.");
				return false;
			}
			
			var pw = $("#userPassword").val()
			var pw2 = $("#userPassword2").val()
			if (pw != pw2) {
				alert("2개의 비밀번호가 일치해야 합니다.");
				return false;
			}
			return true;
		});
		
		$("#imgFileInput").change(function() {
			var files = !!this.files ? this.files : [];
			if (!files.length || !window.FileReader) return false; // no file selected, or no FileReader support
			
			if (/^image/.test(files[0].type)){ // only image file
				$("#imagePreview").html("");
				var reader = new FileReader(); // instance of the FileReader
				reader.readAsDataURL(files[0]); // read the local file
				
				reader.onloadend = function() { // set image data as background of div
					$("#imagePreview").css("background-image", "url("+this.result+")");
	            }
        	} else {
        		alert("사진만 등록가능합니다.");
        		return false;
        	}
			return true;
		});
		
		$("#userPhoneInfo").keyup(function() {
			$("#saveValidateInfo").val("false");
		});
	});
 
</script>
</head>
<body>
<div id="background_div" class="uk-cover-background uk-position-cover" style="background-image: url('<%=request.getContextPath() %>/img/background/back2.jpg')">
<div id="background_div_up">
<div id="fullbrowser" class="uk-clearfix" align="center" >
<div id="logoimg"> <img id="logo" src="<%=request.getContextPath()%>/img/easydel_Real_Log.jpg" class="uk-align-center"> </div>
<div id="formcss" class="uk-align-center">
<div style="height:20px"></div>
	<form class="uk-form" enctype="multipart/form-data" action="<%=request.getContextPath()%>/join" id="joinForm" method="post">
	 <label id="label"><span class="red">* </span> 는 항목은 필수 항목입니다. </label> <br>
    	<div style="height:20px"></div>
    	<section id="aaa">    		
	    	<div align="left">
	    		<div class="marg"><span class="red">* </span> <input type="text" id="userId" name="userId" pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="아이디" required></div>
   		        <div class="marg"><span class="red">* </span> <input type="password" id="userPassword" name="userPassword"  pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호" required></div> 
			    <div class="marg"><span class="red">* </span> <input type="password" id="userPassword2" name="userPassword2"  pattern="[A-Za-z0-9]{5,10}" title="5~10자리 영문자와 숫자만 사용할 수 있습니다." placeholder="비밀번호 확인" required> </div>
			    <div class="marg"><span class="red">* </span> <input type="text" id="userName" name="userName" maxlength="5"  placeholder="이름" required> </div> 				
				<div id="formbirth" class="uk-form-controls uk-form-controls-text">
					<div class="uk-form-icon" ></div> 
			    	<span class="red">* </span> <i class="uk-icon-birthday-cake" style="color:pink"></i>    	
			   		<label><input type="date" name="birthdate" id="userDate"></label>
				</div>
			</div>
			<div style="width:40px"></div>
			<div id="rightform">
				<div style="height:10px;"></div>
				<div id="CheckId" align="center"></div>
				<div id="aaa">
					<div style="width:40px"></div>
					<label for="imgFileInput">
						<div id="imagePreview" align="center">
							<br><br><br><br>프로필 사진을 등록하려면
							<br> 여기를 선택하세요!
						</div>
					</label>
				</div>
				<input type="file" id="imgFileInput" name="imgFileInput">
				
				<div data-uk-button-radio id="sex" align="center">
					<label for="sex_man"><div class="uk-button uk-button-primary uk-width-1-3 uk-active">남자</div></label>
					<input type="radio" id="sex_man" class="radio" name="userGender" value="1" checked="checked">				
					<label for="sex_woman"><div class="uk-button uk-button-primary uk-width-1-3">여자</div></label>
					<input type="radio" id="sex_woman" class="radio" name="userGender" value="2">
				</div>	
			</div>
		</section>
		<div>
			
			<div class="marg"><span class="red">* </span> <input type="email" name="userEmail" id="userInfo" placeholder="이메일" class="uk-width-7-10" required></div>
      	    <div class="marg"><span class="red">* </span> <input type="tel" name="userPhone"  id="userPhoneInfo" pattern="[0-9]{10,11}" title="10~11자리 숫자만 사용할 수 있습니다." placeholder="휴대폰전화번호 (-를 제외하고 입력하세요)" class="uk-width-7-10" required> 
      	    <button class="uk-button uk-button-primary" type="button" id="button2" onclick="sendValidateMsg()">전송</button></div>
     	    <div class="marg"><span class="red">* </span> <input type="text" name="identifyingNumber" id="userValidateInfo" placeholder="인증번호" class="uk-width-7-10" required> 
     		<button class="uk-button uk-button-primary" type="button" id="button2" onclick="checkValidateCode()">확인</button></div>
        </div>
     	<br>
     	<div align="center">
     		<input type="hidden" id="saveValidateInfo" required="required" value="false">
        	<button class="uk-button uk-button-primary uk-width-2-5" type="submit" id="button">회원가입</button>
        	
        	<a href="<%=request.getContextPath() %>/intro"><button class="uk-button uk-button-primary uk-width-2-5" type="button" id="button">취소</button></a>
  		</div>
	</form>
</div>
</div>
</div>
</div>
</body>
</html>