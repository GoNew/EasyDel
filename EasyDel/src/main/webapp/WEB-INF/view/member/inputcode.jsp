<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>운송완료 인증코드 입력</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/inputcode.css"/>
<%
	Integer requestId = (Integer) request.getAttribute("requestId");
%>
<script type="text/javascript">
	$(document).ready(function() {
		$("button").click(function() {
			var validationCode = $("#iitext").val();
			var requestId = $("#requestId").val();
			if(validationCode == null || validationCode.length < 1) {
				alert("인증번호가 입력되어야 합니다.");
				return;
			}
			$.ajax({
				url: "<%=request.getContextPath() %>/validCode/check",
				type: 'get',
				data: {
					validationCode: validationCode,
					requestId: requestId
				},
				success: function(responseText) {
					if(responseText == "true") {
						$(opener.location).attr("href","<%=request.getContextPath() %>/mylist");
						window.close();
					} else {
						alert("인증 실패. 다시 한 번 번호를 확인하고 입력하세요");
					}
				}
			});
		})
	})
</script>
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
			<input type="hidden" id="requestId" name="requestId" value="<%=requestId %>">
			<input type="text" pattern="[0-9]" id="iitext" name="validationCode" required>
		</div>
	</div>
	<div style="height:50px"></div>
	<div align="center"><button id="button" class="uk-button uk-button-primary" type="button">확인</button></div>
</div>
</body>
</html>