<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EDMoney balance</title>
<script type="text/javascript"></script>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"/> --%>

<style type="text/css">

.word-break {
   word-break: break-all;
}

#mainbox{
width: 300px; height: 200px;
border: 1px solid orangered;
backgroud: peachpuff;
line-height: 200px; text-align: center;
color:mediumvioletred; font-weight: bold;

position: absolute;
left:50%;
margin-left:-150;
}
#innerDiv2, innerDiv3{
display:inline-block;
border: 1px solid black;

}
</style>


</head>
<body>
<div id="mainbox" class="elem" >
<div id="innerDiv1">

<span id="text1" name = "text1"> 현재 ${userid} 님의 EDmoney 잔고는</span><p>
<span id="text2" name = "text2" fontsize = 300%> ${edmoneyBalance}</span><p>
<span id="text3" name = "text3"> 원 입니다.</span><p>
</div>

<div id="innerDiv2" name="innerDiv2"> EDmoney 충전</div>
<div id="innerDiv3" name="innerDiv3"> EDmoney 인출</div>
</div><!-- alldiv끝 -->

</body>

</html>