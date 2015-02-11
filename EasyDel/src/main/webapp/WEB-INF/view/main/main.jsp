<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="easydel.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css"/>
<title>메인</title>
<%
	User loginUserInfo = (User) session.getAttribute("loginSession");
%>
</head>
<body>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
	<div id="beforemainphoto" style="height:40px"></div>
	<div id="mainphoto" class="uk-align-center">
		<img id="mainimg" class="uk-border-circle" src="<%=request.getContextPath()%><%=loginUserInfo.getUserPicture() %>">
	</div>
	<div id = "mainlineform" class="uk-align-center">
		<div id = "mainlineleft"></div>
		<div id = "mainlinemiddle"></div>
		<div id = "mainlineright"></div>
	</div>
	<div id = "mainbelowform" class="uk-align-center">
		<div id = "mainleft">
			<div align = "left"><label id="mainbigfont">발송인</label><img id="mainphotos" src= "<%=request.getContextPath()%>/img/man.jpg"/></div>
			<div id = "mainleftone">
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" src= "<%=request.getContextPath()%>/img/time.png"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">time precision</label><img id = "mainstar" src= "<%=request.getContextPath()%>/img/fivestar.PNG"/> </div>
				<div id = "null"></div>
				<div id = "mainscore"><br><div align="right" id ="mainmiddlefont">5.0/5</div></div>
				<div id = "mainnull"></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">accuracy</label><img id = "mainstar" src= "<%=request.getContextPath()%>/img/fourstar.PNG"/></div>
				<div id = "null"></div>
				<div id = "mainscore"><br><div align="right" id ="mainmiddlefont">4.0/5</div></div>
				<div id = "mainnull"></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">kind</label><img id = "mainstar" src= "<%=request.getContextPath()%>/img/pointstar.PNG"/></div>
				<div id = "null"></div>
				<div id = "mainscore"><br><div align="right" id ="mainmiddlefont">4.5/5</div></div>
				<div id = "mainnull"></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "null"></div>
				<div id = "null"></div>
				<div id = "maintwopercent" align = "center">
					<label id="mainsmallfont2">거래완료율</label><br>
					<div id = "mainbigfont"> 100%</div>
				</div>
				<div align="right" id ="mainsmallmediumfont">21/21건</div>
				<div id = "mainnull"></div>
			</div>
		</div>
		<div id = "mainmiddle"></div>
		<div id = "mainrignt">
			<div align = "right"><img id="mainphotos" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/deliveryman.png"><label id="mainbigfont">운송인</label></div>
			<div id = "mainrightone">
				<div id = "mainnull"></div>
				<div id = "mainscore"><br><div align="left" id ="mainmiddlefont">4.0/5</div></div>
				<div id = "null"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">time precision</label><img id = "mainstar" src= "<%=request.getContextPath()%>/img/fourstarright.PNG"/> </div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" src= "<%=request.getContextPath()%>/img/time.png"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull"></div>
				<div id = "mainscore"><br><div align="left" id ="mainmiddlefont">4.0/5</div></div>
				<div id = "null"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">safe</label><img id = "mainstar" src= "<%=request.getContextPath()%>/img/fourstarright.PNG"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull"></div>
				<div id = "mainscore"><br><div align="left" id ="mainmiddlefont">5.0/5</div></div>
				<div id = "null"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">kind</label><img id = "mainstar" src= "<%=request.getContextPath()%>/img/fivestar.PNG"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "mainnull"></div>
				<div align="left" id ="mainsmallmediumfont">9/10건</div>
				<div id = "maintwopercent" align = "center">
					<label id="mainsmallfont2">거래완료율</label><br>
					<div id = "mainbigfont"> 90%</div>
				</div>
			</div>
		</div>
	</div>


</div>
</div>
</body>
</html>