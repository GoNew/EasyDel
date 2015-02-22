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
	/* loginUserInfo.setSenderAvgKind(3);
	loginUserInfo.setSenderAvgThing(4);
	loginUserInfo.setSenderAvgTime(2);
	loginUserInfo.setSenderSuccesscnt(10);
	loginUserInfo.setSenderTotalcnt(30);
	loginUserInfo.setCourierAvgKind(4);
	loginUserInfo.setCourierAvgSafe(5);
	loginUserInfo.setCourierAvgTime(0);
	loginUserInfo.setCourierSuccesscnt(10);
	loginUserInfo.setCourierTotalcnt(300); */

 	int senderAvgTime = loginUserInfo.getSenderAvgTime();
 	int senderAvgThing = loginUserInfo.getSenderAvgThing();
 	int senderAvgKind = loginUserInfo.getSenderAvgKind();
 	int senderSuccesscnt = loginUserInfo.getSenderSuccesscnt();
 	int senderTotalcnt = loginUserInfo.getSenderTotalcnt();
 	double senderPercentage = 0.0;
 	String sPercentage = "0.0";
 	if(senderTotalcnt != 0){
 		senderPercentage = ((double)senderSuccesscnt/(double)senderTotalcnt) * 100;
 		sPercentage = String.format("%.1f" , senderPercentage);
 	}

 	int courierAvgTime = loginUserInfo.getCourierAvgTime();
 	int courierAvgSafe = loginUserInfo.getCourierAvgSafe();
 	int courierAvgKind = loginUserInfo.getCourierAvgKind();
 	int courierSuccesscnt = loginUserInfo.getCourierSuccesscnt();
 	int courierTotalcnt = loginUserInfo.getCourierTotalcnt();
 	double courierPercentage = 0.0;
 	String cPercentage = "0.0";
 	if(courierTotalcnt != 0){
 		courierPercentage = ((double)courierSuccesscnt/(double)courierTotalcnt) * 100;
 		cPercentage = String.format("%.1f" , courierPercentage);
 	}
 	
 	String starsrc1 = null; String starsrc2 = null; String starsrc3 = null;
 	String starsrc4 = null; String starsrc5 = null; String starsrc6 = null;
 	
 	if(senderAvgTime == 5){starsrc1 = "img/fivestar.jpg";} else if(senderAvgTime == 4){starsrc1 = "img/fourstarl.JPG";} 
 	else if(senderAvgTime == 3){starsrc1 = "img/threestarl.JPG";} else if(senderAvgTime == 2){starsrc1 = "img/twostarl.JPG";} 
 	else if(senderAvgTime == 1){starsrc1 = "img/onestar1.JPG";} else if(senderAvgTime == 0){starsrc1 = "img/zerostar.JPG";}
 	
 	if(senderAvgThing == 5){starsrc2 = "img/fivestar.jpg";} else if(senderAvgThing == 4){starsrc2 = "img/fourstarl.JPG";} 
 	else if(senderAvgThing == 3){starsrc2 = "img/threestarl.JPG";} else if(senderAvgThing == 2){starsrc2 = "img/twostarl.JPG";} 
 	else if(senderAvgThing == 1){starsrc2 = "img/onestar1.JPG";} else if(senderAvgThing == 0){starsrc2 = "img/zerostar.JPG";}
 	
 	if(senderAvgKind == 5){starsrc3 = "img/fivestar.jpg";} else if(senderAvgKind == 4){starsrc3 = "img/fourstarl.JPG";} 
 	else if(senderAvgKind == 3){starsrc3 = "img/threestarl.JPG";} else if(senderAvgKind == 2){starsrc3 = "img/twostarl.JPG";} 
 	else if(senderAvgKind == 1){starsrc3 = "img/onestar1.JPG";} else if(senderAvgKind == 0){starsrc3 = "img/zerostar.JPG";}
 	
 	if(courierAvgTime == 5){starsrc4 = "img/fivestar.jpg";} else if(courierAvgTime == 4){starsrc4 = "img/fourstarr.JPG";} 
 	else if(courierAvgTime == 3){starsrc4 = "img/threestarr.JPG";} else if(courierAvgTime == 2){starsrc4 = "img/twostarr.JPG";} 
 	else if(courierAvgTime == 1){starsrc4 = "img/onestarr.JPG";} else if(courierAvgTime == 0){starsrc4 = "img/zerostar.JPG";}
 	
 	if(courierAvgSafe == 5){starsrc5 = "img/fivestar.jpg";} else if(courierAvgSafe == 4){starsrc5 = "img/fourstarr.JPG";} 
 	else if(courierAvgSafe == 3){starsrc5 = "img/threestarr.JPG";} else if(courierAvgSafe == 2){starsrc5 = "img/twostarr.JPG";} 
 	else if(courierAvgSafe == 1){starsrc5 = "img/onestarr.JPG";} else if(courierAvgSafe == 0){starsrc5 = "img/zerostar.JPG";}
 	
 	if(courierAvgKind == 5){starsrc6 = "img/fivestar.jpg";} else if(courierAvgKind == 4){starsrc6 = "img/fourstarr.JPG";} 
 	else if(courierAvgKind == 3){starsrc6 = "img/threestarr.JPG";} else if(courierAvgKind == 2){starsrc6 = "img/twostarr.JPG";} 
 	else if(courierAvgKind == 1){starsrc6 = "img/onestarr.JPG";} else if(courierAvgKind == 0){starsrc6 = "img/zerostar.JPG";}
%>
</head>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<body>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
	<div style="height:40px"></div>
	
	<!-- <div id = "mainlineform" class="uk-align-center">
		<div id = "mainlineleft"></div>
		<div id = "mainlinemiddle"></div>
		<div id = "mainlineright"></div>
	</div> -->
	
	<div id = "mainbelowform" class="uk-align-center">
		<div id = "mainleft">
			<div align = "left"><label id="mainbigfont">발송인</label><img id="mainphotos" src= "<%=request.getContextPath()%>/img/man.jpg"/></div>
			<div id = "mainleftone">
				<div id = "mainnull_left"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/time.png"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">time precision</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc1%>"/> </div>
				<div id = "null"></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_left"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">accuracy</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc2%>"/></div>
				<div id = "null"></div>
			</div> 
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_left"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">kind</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc3%>"/></div>
				<div id = "null"></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "null"></div>
				<div id = "null"></div>
				<div id = "maintwopercent" align = "center">
					<label id="mainsmallfont2">거래완료율</label><br>
					<div id = "mainbigfont"> <%=sPercentage%>%</div>
				</div>
				<div align="right" id ="mainsmallmediumfont"> <%= senderSuccesscnt%>/<%= senderTotalcnt%>건</div>
				<div id = "mainnull"></div>
			</div>
		</div>
		
		<div id = "mainmiddle">
		<div id="mainphoto" class="uk-align-center">
			<img id="mainimg" class="uk-border-circle" src="<%=request.getContextPath()%><%=loginUserInfo.getUserPicture() %>">
		</div>
		</div>
		
		
		<div id = "mainright">
			<div align ="right" ><img id="mainphotos" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/deliveryman.png"><label id="mainbigfont">운송인</label></div>
			<div id = "mainrightone">
				<div id = "mainnull_right"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">time precision</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc4%>"/> </div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/time.png"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_right"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">safe</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc5%>"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_right"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">kind</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc6%>"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div>
			</div>
			<br>
			<div id = "maintwo">
				<div align="left" id ="mainsmallmediumfont"><%=courierSuccesscnt%>/<%=courierTotalcnt%>건</div>
				<div id = "maintwopercent" align = "center">
					<label id="mainsmallfont2">거래완료율</label><br>
					<div id = "mainbigfont"> <%=cPercentage%>%</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div>
		
		<div class="uk-cover">
			<video id="video_deco" class="uk-cover-object" autoplay="autoplay" loop="loop" src="<%=request.getContextPath()%>/img/toomuch.mp4" ></video>
		</div>
		
		<div>
		
		</div>
	
		<div>
		
		</div>
		
	</div>
		

</div>
</div>
<%-- <div class="uk-clearfix">
<div id="formcss" class="uk-align-center">
	<div style="height:40px"></div>
	<!-- 프로필 사진 받아오는 부분 -->
	<div id="mainphoto" class="uk-align-center">
		<img id="mainimg" class="uk-border-circle" src="<%=request.getContextPath()%><%=loginUserInfo.getUserPicture() %>">
	</div>
	
	<div id = "mainlineform" class="uk-align-center">
		<div id = "mainlineleft"></div>
		<div id = "mainlinemiddle"></div>
		<div id = "mainlineright"></div>
	</div>
	
	<div id = "mainbelowform" class="uk-align-center" >
		<div id = "mainleft">
			<div align = "left"><label id="mainbigfont">발송인</label><img id="mainphotos" src= "<%=request.getContextPath()%>/img/man.jpg"/></div>
			<div id = "mainleftone">
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/time.png"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">time precision</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc1%>"/> </div>
				<div id = "null"></div>
				<div id = "mainscore"><br><div align="right" id ="mainmiddlefont"><%=senderAvgTime%>/5</div></div>
				<div id = "mainnull"></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">accuracy</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc2%>"/></div>
				<div id = "null"></div>
				<div id = "mainscore"><br><div align="right" id ="mainmiddlefont"><%=senderAvgThing%>/5</div></div>
				<div id = "mainnull"></div>
			</div> 
			<br>
			<div id = "mainleftone">
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">kind</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc3%>"/></div>
				<div id = "null"></div>
				<div id = "mainscore"><br><div align="right" id ="mainmiddlefont"><%=senderAvgKind%>/5</div></div>
				<div id = "mainnull"></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "null"></div>
				<div id = "null"></div>
				<div id = "maintwopercent" align = "center">
					<label id="mainsmallfont2">거래완료율</label><br>
					<div id = "mainbigfont"> <%=sPercentage%>%</div>
				</div>
				<div align="right" id ="mainsmallmediumfont"> <%= senderSuccesscnt%>/<%= senderTotalcnt%>건</div>
				<div id = "mainnull"></div>
			</div>
		</div>
		
		<div id = "mainmiddle"></div>
		
		
		<div id = "mainrignt">
			<div align = "right"><img id="mainphotos" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/deliveryman.png"><label id="mainbigfont">운송인</label></div>
			<div id = "mainrightone">
				<div id = "mainnull"></div>
				<div id = "mainscore"><br><div align="left" id ="mainmiddlefont"><%= courierAvgTime%>/5</div></div>
				<div id = "null"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">time precision</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc4%>"/> </div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/time.png"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull"></div>
				<div id = "mainscore"><br><div align="left" id ="mainmiddlefont"><%= courierAvgSafe%>/5</div></div>
				<div id = "null"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">safe</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc5%>"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull"></div>
				<div id = "mainscore"><br><div align="left" id ="mainmiddlefont"><%= courierAvgKind%>/5</div></div>
				<div id = "null"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">kind</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc6%>"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "mainnull"></div>
				<div align="left" id ="mainsmallmediumfont"><%=courierSuccesscnt%>/<%=courierTotalcnt%>건</div>
				<div id = "maintwopercent" align = "center">
					<label id="mainsmallfont2">거래완료율</label><br>
					<div id = "mainbigfont"> <%=cPercentage%>%</div>
				</div>
			</div>
		</div>
	</div>

</div>
</div> --%>
<jsp:include page = "/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>