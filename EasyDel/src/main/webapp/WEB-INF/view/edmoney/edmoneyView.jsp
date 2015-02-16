<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="easydel.entity.User"%>

<%
	User loginUserInfo = (User) session.getAttribute("loginSession");
	int edmoneyBalance = loginUserInfo.getEdmoneyBalance();

%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EDMoney balance</title>

<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<script type="text/javascript">
</script>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"/> --%>

<style type="text/css">

img{ border: 0;}
address{font-style: normal;}
ul, ol{list-style:name;}

* {
	border: 1px solid red;
}

#fullbrowser {
   width: 1025px;
   margin: 0px auto;
}
#middlebrowser {
   width: 1009px;
   margin: 150px auto;
}
#mainbox{
align: center;
width: 300px;
height: 20px;
backgroud: peachpuff;
line-height: 20px; text-align: center;
color:black;
}

#text2{
border: 2px solid black;
font-size: 20px;
}

</style>


</head>
<body>
	<div id="fullbrowser">
		<div id="middlebrowser">
			<div class="uk-width-1-1">
				<span id="text1" > 현재 <%=loginUserInfo.getUserId()%>님의 EDmoney 잔고는</span><br>
				<span id="text2" > ${edmoneyBalance}</span><br>
				<span id="text3" > 원 입니다.</span><br>
			</div>
			<div class="uk-width-1-1">
				<div class="uk-panel uk-width-2-3 uk-container-center">
					<div id="edmoneyDeposit" class="uk-width-2-5 uk-pull-2-5 uk-button"> EDmoney 충전</div>
					<div id="edmoneyWithdraw" class="uk-width-2-5 uk-push-2-5 uk-button"> EDmoney 인출</div>
				</div>
			</div>
		</div>
	</div>

</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</html>