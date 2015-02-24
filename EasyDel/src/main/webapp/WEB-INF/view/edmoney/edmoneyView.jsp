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
%>
</head>
<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>

<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
	<div style="height:100px"></div>
        <div class=".uk-container-center">
			<div  id="edmsg">
				<div style="width:170px"></div>
				<div style="color: #7F7F7F;">현재</div>
			 	<div style="color: #00B1F2; font-style:bold; width:220px; font-size: 45px" align="center" ><%=loginUserInfo.getUserId()%></div>  
				<div style="color: #7F7F7F;">님의 EDmoney 잔고는</div>
			</div>
			<div style="height:70px"></div>
			<div  id="edmsg">
				<div style="width:240px"></div>
				<div style="color: #00B1F2; font-style:bold; width:200px; font-size: 45px" align="right"><%=loginUserInfo.getEdmoneyBalance()%></div>
				<div style="margin-left: 15px;color:#7F7F7F;">원 입니다.</div>
			</div>
		</div>
		<div class="uk-width-1-1">
			<p align="center"><br><br><br>
	        	<a href="<%=request.getContextPath()%>/edmoney/deposit"><button id="bu" class="uk-button uk-button-large uk-button-primary uk-animation-shake" type="button">EDmoney 충전</button></a>
	            <a href="<%=request.getContextPath()%>/edmoney/withdraw"><button id="bu" class="uk-button uk-button-large uk-button-primary uk-animation-shake" type="button">EDmoney 인출</button></a>
	        </p>
		</div>
	</div>
</div>

</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</html>