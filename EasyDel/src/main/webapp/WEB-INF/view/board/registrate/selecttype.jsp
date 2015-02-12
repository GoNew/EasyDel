<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/selecttype.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id=fullbrowser align="center">
		<div id="middlebrowser" align="center">
			<div id="imgcontainer">
				
					<a href="<%=request.getContextPath()%>/register/typesimple"><img id="buttonimg1" alt="단순 운송 의뢰 등록" src="<%=request.getContextPath()%>/img/a1.PNG" class="uk-button"></a>

				
					<a href="<%=request.getContextPath()%>/register/typepurchase"><img id="buttonimg2" alt="구매&운송 의뢰 등록"
						src="<%=request.getContextPath()%>/img/a2.PNG" class="uk-button"></a>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>








