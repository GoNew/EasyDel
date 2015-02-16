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
<script type="text/javascript"></script>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"/> --%>

<style type="text/css">

img{ border: 0;}
address{font-style: normal;}
ul, ol{list-style:name;}

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

#innerDiv2{
display:inline-block;
border: 1px solid black;
background-color: #FF7878;
color : #EBFBFF;
height: 40px;
font-size: 20px;
vertical-align: middle;
}
#innerDiv3{
display:inline-block;
border: 1px solid black;
background-color: #14148C;
color : #EBFBFF;
height: 40px;
font-size: 20px;
text-align: "center";
vertical-align: middle;
}
#text2{
border: 2px solid black;
font-size: 20px;
}

</style>


</head>
<body>
<div id="mainbox">
<div id="innerDiv1">
<span id="text1" name = "text1" > 현재 <%=loginUserInfo.getUserId()%>님의 EDmoney 잔고는</span><p>
<span id="text2" name = "text2" > ${edmoneyBalance}</span><p>
<span id="text3" name = "text3" > 원 입니다.</span><p>
</div>

<div id="innerDiv2" name="innerDiv2";> EDmoney 충전</div>
<div id="innerDiv3" name="innerDiv3";> EDmoney 인출</div>


</div>

</body>
	
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>