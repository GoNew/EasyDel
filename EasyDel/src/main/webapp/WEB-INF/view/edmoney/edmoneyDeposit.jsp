<%@page import="easydel.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/edmoneyDeposit.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<%
	User loginUser = (User) session.getAttribute("loginSession");
%>
<title>EDmoney 입금</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pay_button").click(function() {
			var moneyAmount = $("#money").val();
			console.log($("#money").val());
			console.log($("#payment-method-saveData").val());
			if(moneyAmount != null && moneyAmount != 0) {
				$.ajax({
					url : "<%=request.getContextPath() %>/edmoney/ajax/deposit",
					type : "post",
					data : {
						payAmountOfMoney: $("#money").val(),
						payMethod: $("#payment-method-saveData").val()
					},
					success : function(responseText) {
						var returnObj = jQuery.parseJSON(responseText);
						if(returnObj.result == "true") {
							alert(returnObj.successMsg);
							$(location).attr("href", "<%=request.getContextPath() %>/edmoney");
						} else {
							var errorMsg = "충전에 실패하였습니다.\n 원인 : " + returnObj.errorMsg;
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
</head>

<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
	<div id="formcss" class="uk-align-center">
		<div class=".uk-container-center" align="center">
			<div style="height:30px"></div>
			<div id="edchung3">EDMoney 충전</div>
			<div class="possible_withdraw_price_Wrapperdiv" id="lira_align_left">
				<span id="poss_withdraw_price_text1">충전 가능 금액:</span>
				<div class="possible_withdraw_price_div"><%=String.format("%,d", 100000-loginUser.getEdmoneyBalance()) %></div>
				<span id="poss_withdraw_price_text2">원 입니다.</span>
			</div>
			<div id="edchung2">충전 금액 : <input type="number" id="money" placeholder="최대 100,000원 까지 소지 가능"> 원</div>
			
			<hr color="black">
			<div id="edchung3" style="margin-top: 50px;"> 결제수단 선택</div>
			<div style="height:30px"></div>
			<div align="left">
				<div id="webkitbox">
					<div style="margin-left: 150px;" class="radioclass"><input type="radio" name="payment-method" value="credit" onclick="$('#payment-method-saveData').val('credit')" checked="checked">신용카드</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="mobile" onclick="$('#payment-method-saveData').val('mobile')">휴대폰결제</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="culture" onclick="$('#payment-method-saveData').val('culture')">문화상품권</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="bookculture" onclick="$('#payment-method-saveData').val('bookculture')">도서문화상품권</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="transfer" onclick="$('#payment-method-saveData').val('transfer')">계좌이체</div>
					<input type="hidden" id="payment-method-saveData" value="credit">
				</div>
			</div>
			
			<div class="uk-button uk-width-1-5 uk-button-primary" id="pay_button">
				결제요청
			</div>
		</div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>