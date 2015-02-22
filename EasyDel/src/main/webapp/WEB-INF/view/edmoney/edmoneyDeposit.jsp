<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EDmoney 입금</title>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<style type="text/css">
* { 
	margin: 0;
	padding: 0;
/* 	border: 1px solid red; */
	position: relative;
	}
.box {
  display: inline-block;
  width: 300px;
  height: 30px;
  margin: 1em;
}

.left{
  position: absolute;
  left: 0;
  width: 120px;
  text-align: left
}
.right{
  position: absolute;
  left: 130px;
  width: 150px;
  text-align: left
}


img {
	border: 0;
}

address {
	font-style: normal;
}

ul, ol {
	list-style: name;
}

#fullbrowser {
	width: 1025px;
	margin: 0px auto;
}

#middlebrowser {
	width: 1009px;
	margin: 150px auto;
}
</style>
</head>
<body>
	<div id="fullbrowser">
		<div id="middlebrowser"
			style="border: 1px solid blue; width: 400px; margin: 5px auto;">
			<div class=".uk-container-center" align="center">
				<span class="uk-text-large uk-text-bold uk-text-top">EDMoney
					충전<br>
				<br>
				</span><br>
				<br> 충전 금액 : <input type="text" placeholder="..... ....." height="30px" class="uk-form-large" align="right">
				원<br><br><br>
				<br><br>
				<div class="uk-form-controls uk-form-controls-text">
				<div class="payment-process">
				<h2>결제 수단 선택</h2>
				<p class="method-list">
				<div class="box">
					<label class="left" data-method="credit"><input type="radio" name="payment-method" value="credit">신용카드</label>
					<label class="right"><input type="radio" name="payment-method" value="mobile" checked="">휴대폰결제</label>
				</div>
				<div class="box">
					<label class="left"><input type="radio" name="payment-method" value="culture">문화상품권</label>
					<label class="right" data-method="bookculture" w><input type="radio" name="payment-method" value="bookculture">도서문화상품권</label>
					</div>
				<div class="box"><label class="left" data-method="transfer"><input type="radio" name="payment-method" value="transfer">계좌이체</label>
					</div>
				<div class=".uk-button-danger">
				<button class=".uk-width-1-1"><font size="20px">결제 요청</font></label>
				
				</div>
				</div>
				
                </div>
				<br>
			</div>




		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</html>