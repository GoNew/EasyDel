<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="easydel.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/edmoneyView.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<title>EDMoney balance</title>
<%
	User loginUserInfo = (User) session.getAttribute("loginSession");
	int edmoneyBalance = loginUserInfo.getEdmoneyBalance();
%>
</head>
<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>

<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
<pre>                                                          
                              </pre>
		<div class=".uk-container-center" align="center">
			<span>현재 <%=loginUserInfo.getUserId()%>님의 EDmoney 잔고는</span><br>
			<span class="uk-text-large uk-text-bold"> ${edmoneyBalance} 원</span><br>
			<span >입니다.</span><br>
		</div>
		<div class="uk-width-1-1">
			<div class="uk-panel uk-width-2-3 uk-container-center">
				<p align="center"><br><br><br>
               	<button id="button1" class="uk-button uk-button-large" type="button"><a href="<%=request.getContextPath()%>/edmoneydeposit"><font color="black">EDmoney 충전</font></button>
               	<button class="uk-button uk-button-large" type="button"><a href="<%=request.getContextPath()%>/edmoneywithdraw">EDmoney 인출</button>
                </p>
                <br><br>
			</div>
		</div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</html>