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

/* * {
	border: 1px solid red;
} */

#fullbrowser {
   width: 1025px;
   margin: 0px auto;
   align: center;   
}
#middlebrowser {
   width: 1009px;
   margin: 150px auto;
}

#text2{
border: 2px solid black;
font-size: 20px;
}


</style>


</head>
<body>
	<div id="fullbrowser">
		<div id="middlebrowser" style="border:1px solid blue;width:400px;margin:5px auto;">
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