<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/typesimple.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단순 운송 의뢰 등록</title>
</head>
<body>
<div id="fullbrowser">
<div id="middlebrowser">

<form action="<%=request.getContextPath()%>/"  method="post">
<div id="allproductinfo">
<div>물품정보</div>
<hr>
	<div align="center">
		<img alt="" src="<%=request.getContextPath()%>/img/quick.PNG" >
	</div>
	
	<div id="subproductinfo">
		<div id="row1"><div>물품명</div><div><input type="text"></div></div>
		<div id="row2"><div>비용</div><div><input type="text"></div></div>
		<div id="row3"><div>물품 상세</div><div><input type="text"></div></div>
	</div>

</div>


<div id="allregistrater">
<div>보내는 사람</div>
<hr>
	<div id="row1"> <div id="row1"><div>이름</div><div><input type="text"></div></div><div id="row1"><div>전화번호</div><div><input type="text"></div></div></div>
	<div id="row2"><div>주소</div><div>서울특별시</div>
		<div><select><option>강서구</option><option>강동구</option></select></div><div>구</div>
		<div><select><option>군자동</option><option>행진동</option></select></div><div>동</div>
	</div>
	<div id="row3"><div>없음</div><div>상세주소</div><div><input type="text"></div></div>
	<div id="row4"><div>만날시간</div><div><input type="datetime-local"></div><div>부터</div><div><input type="datetime-local"></div><div>까지</div></div>
</div>


<div id="allreceiver">
<div id="row1"> <div>받는 사람</div> <div id="row1"><div id="ischeckbox" ><label><input type="checkbox" checked="checked" data-uk-toggle="{target:'#my-id'}">부재중일 경우 체크</label></div><div id="samebtn"><input type="button" value="본인 정보 입력"></div></div> </div>
<hr>
	<div id="row1"> <div id="row1"><div>이름</div><div><input type="text"></div></div><div id="row1"><div>전화번호</div><div><input type="text"></div></div></div>
	<div id="row2"><div>주소</div><div>서울특별시</div>
		<div><select><option>강서구</option><option>강동구</option></select></div><div>구</div>
		<div><select><option>군자동</option><option>행진동</option></select></div><div>동</div>
	</div>
	<div id="row3"><div>없음</div><div>상세주소</div><div><input type="text"></div></div>
	<div id="row4"><div>도착시간</div><div><input type="datetime-local"></div><div>부터</div><div><input type="datetime-local"></div><div>까지</div></div>
	<div id="my-id"><div>전달 메시지</div><div><input type="text" ></div></div>
</div>

<hr>
<div id="enterbtn" align="center"><button class="uk-button" type="submit">의뢰 등록</button></div>

</form>
</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>