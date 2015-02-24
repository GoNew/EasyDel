<%@page import="easydel.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/edmoneyWithdraw.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<title>EDmoney 입금</title>
</head>

<%
	User loginUser = (User) session.getAttribute("loginSession");
%>
<script type="text/javascript">
$(document).ready(function() {
	$("#pay_button").click(function() {
		var moneyAmount = $("#money").val();
		var account = $("#account").val();
		console.log($("#money").val());
		console.log($("#payment-method-saveData").val());
		console.log(account);
		if(moneyAmount != null && moneyAmount != 0 && account != null && account.length > 1) {
			$.ajax({
				url : "<%=request.getContextPath() %>/edmoney/ajax/withdraw",
				type : "post",
				data : {
					payAmountOfMoney: $("#money").val(),
					payMethod: $("#payment-method-saveData").val(),
					account: $("#account").val()
				},
				success : function(responseText) {
					var returnObj = jQuery.parseJSON(responseText);
					if(returnObj.result == "true") {
						alert(returnObj.successMsg);
						$(location).attr("href", "<%=request.getContextPath() %>/edmoney");
					} else {
						var errorMsg = "인출에 실패하였습니다.\n 원인 : " + returnObj.errorMsg;
						alert(errorMsg);
					}
				}
			});
		} else {
			alert("값이 입력되어야 합니다.");
		}
	});
});
</script>
<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
	<div id="formcss" class="uk-align-center">
		<div class=".uk-container-center" align="center">
			<div style="height:30px"></div>
			<div id="edchung3">EDMoney 인출</div>
			<div class="possible_withdraw_price_Wrapperdiv" id="lira_align_left">
				<span id="poss_withdraw_price_text1">인출 가능 금액:</span>
				<div class="possible_withdraw_price_div"><%=String.format("%,d", loginUser.getEdmoneyBalance()) %></div>
				<span id="poss_withdraw_price_text2">원 입니다.</span>
			</div>
			<div id="edchung2">인출 금액 : <input type="number" id="money" placeholder=""> 원</div>
			
			<hr color="black">
			<div id="edchung3" style="margin-top: 50px;">인출 은행 선택</div>
			<div style="height:30px"></div>
			<div align="left">
				<div id="webkitbox">
					<div style="margin-left: 180px;" class="radioclass"><input type="radio" name="payment-method" value="신한" onclick="$('#payment-method-saveData').val('신한')" checked="checked">신한은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="우리" onclick="$('#payment-method-saveData').val('우리')">우리은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="국민" onclick="$('#payment-method-saveData').val('국민')">KB국민은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="하나" onclick="$('#payment-method-saveData').val('하나')">하나은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="농협" onclick="$('#payment-method-saveData').val('농협')">농협</div>
					<input type="hidden" id="payment-method-saveData" value="신한">
				</div>
			</div>
			
			<div id="edchung2">계좌 번호 : <input type="text" id="account" placeholder=""></div>
			
			<div class="uk-button uk-width-1-5 uk-button-primary uk-animation-scale" id="pay_button">출금요청</div>
		</div>
    </div>
</div>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>