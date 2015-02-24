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

<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
	<div id="formcss" class="uk-align-center">
		<div class=".uk-container-center" align="center">
			<div style="height:30px"></div>
			<div id="edchung3">EDMoney 인출</div>
			<div class="possible_withdraw_price_Wrapperdiv" id="lira_align_left">
				<span id="poss_withdraw_price_text1">인출 가능 금액:</span>
				<div class="possible_withdraw_price_div">(3000)</div>
				<span id="poss_withdraw_price_text2">원 입니다.</span>
			</div>
			<div id="edchung2">인출 금액 : <input type="text" id="money" placeholder=""> 원</div>
			
			<hr color="black">
			<div id="edchung3" style="margin-top: 50px;">인출 은행 선택</div>
			<div style="height:30px"></div>
			<div align="left">
				<div id="webkitbox">
					<div style="margin-left: 180px;" class="radioclass"><input type="radio" name="payment-method" value="credit">신한은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="mobile" >우리은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="culture">KB국민은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="bookculture">하나은행</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="transfer">농협</div>
				</div>
			</div>
			
			<div id="edchung2">계좌 번호 : <input type="text" id="money" placeholder=""> 원</div>
			
			<button class="uk-button uk-width-1-5 uk-button-primary" type="button" data-uk-button id="pay_button">출금요청</button>
		</div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>