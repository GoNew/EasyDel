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
<title>EDmoney 입금</title>
</head>

<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
	<div id="formcss" class="uk-align-center">
		<div class=".uk-container-center" align="center">
			<div style="height:30px"></div>
			<div id="edchung3">EDMoney 충전</div>
			<div style="height:40px"></div>
			<div id="edchung2">충전 금액 : <input type="text" id="money" placeholder="최대 100,000원 까지 충전 가능"> 원</div>
			<div style="height:70px"></div>
			
			<hr color="black">
			<div id="edchung3"> 결제수단 선택</div>
			<div style="height:30px"></div>
			<div align="left">
				<div id="webkitbox">
					<div style="width:90px"></div>
					<div class="radioclass"><input type="radio" name="payment-method" value="credit">신용카드</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="mobile" >휴대폰결제</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="culture">문화상품권</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="bookculture">도서문화상품권</div>
					<div class="radioclass"><input type="radio" name="payment-method" value="transfer">계좌이체</div>
				</div>
			</div>
			
			<button class="uk-button uk-width-1-5 uk-button-primary" type="button" data-uk-button id="button">결제요청</button>
		</div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>