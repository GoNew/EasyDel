<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="easydel.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/components/slideshow.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/components/slideshow-fx.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/components/slideshow.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css"/>
<script type="text/javascript">
$(document).ready(function() {
	<%	if(request.getAttribute("modifyedAndNotReroaded") != null) {	%>
	window.location.reload(true);
	<%	}	%>
	
})

function hover_mypage(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/mypage.bmp');
}
function unhover_mypage(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/mypage.png');
}
function hover_edmoney(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/edmoney_blue.bmp');
}
function unhover_edmoney(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/edmoney.png');
}
function hover_upload(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/write_board_blue.bmp');
}
function unhover_upload(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/write_board.png');
}
function hover_list(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/allboardlist_blue.bmp');
}
function unhover_list(element) {
    element.setAttribute('src', '<%=request.getContextPath()%>/img/button/allboardlist.png');
}

</script>
<title>EasyDeli-택배보다 빠르고 퀵보다 싸게</title>
<%
	User loginUserInfo = (User) session.getAttribute("loginSession");

 	int senderAvgTime = loginUserInfo.getSenderAvgTime();
 	int senderAvgThing = loginUserInfo.getSenderAvgThing();
 	int senderAvgKind = loginUserInfo.getSenderAvgKind();
 	int senderSuccesscnt = loginUserInfo.getSenderSuccesscnt();
 	int senderTotalcnt = loginUserInfo.getSenderTotalcnt();
 	double senderPercentage = 0.0;
 	String sPercentage = null;
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
 	String cPercentage = null;
 	if(courierTotalcnt != 0){
 		courierPercentage = ((double)courierSuccesscnt/(double)courierTotalcnt) * 100;
 		cPercentage = String.format("%.1f" , courierPercentage);
 	}
 	
 	String starsrc1 = null; String starsrc2 = null; String starsrc3 = null;
 	String starsrc4 = null; String starsrc5 = null; String starsrc6 = null;
 	
 	if(senderAvgTime == 5){starsrc1 = "img/stars/fivestar.png";} else if(senderAvgTime == 4){starsrc1 = "img/stars/fourstarl.png";} 
 	else if(senderAvgTime == 3){starsrc1 = "img/stars/threestarl.png";} else if(senderAvgTime == 2){starsrc1 = "img/stars/twostarl.png";} 
 	else if(senderAvgTime == 1){starsrc1 = "img/stars/onestarl.png";} else if(senderAvgTime == 0){starsrc1 = "img/stars/zerostar.png";}
 	
 	if(senderAvgThing == 5){starsrc2 = "img/stars/fivestar.png";} else if(senderAvgThing == 4){starsrc2 = "img/stars/fourstarl.png";} 
 	else if(senderAvgThing == 3){starsrc2 = "img/stars/threestarl.png";} else if(senderAvgThing == 2){starsrc2 = "img/stars/twostarl.png";} 
 	else if(senderAvgThing == 1){starsrc2 = "img/stars/onestarl.png";} else if(senderAvgThing == 0){starsrc2 = "img/stars/zerostar.png";}
 	
 	if(senderAvgKind == 5){starsrc3 = "img/stars/fivestar.png";} else if(senderAvgKind == 4){starsrc3 = "img/stars/fourstarl.png";} 
 	else if(senderAvgKind == 3){starsrc3 = "img/stars/threestarl.png";} else if(senderAvgKind == 2){starsrc3 = "img/stars/twostarl.png";} 
 	else if(senderAvgKind == 1){starsrc3 = "img/stars/onestarl.png";} else if(senderAvgKind == 0){starsrc3 = "img/stars/zerostar.png";}
 	
 	if(courierAvgTime == 5){starsrc4 = "img/stars/fivestar.png";} else if(courierAvgTime == 4){starsrc4 = "img/stars/fourstarr.png";} 
 	else if(courierAvgTime == 3){starsrc4 = "img/stars/threestarr.png";} else if(courierAvgTime == 2){starsrc4 = "img/stars/twostarr.png";} 
 	else if(courierAvgTime == 1){starsrc4 = "img/stars/onestarr.png";} else if(courierAvgTime == 0){starsrc4 = "img/stars/zerostar.png";}
 	
 	if(courierAvgSafe == 5){starsrc5 = "img/stars/fivestar.png";} else if(courierAvgSafe == 4){starsrc5 = "img/stars/fourstarr.png";} 
 	else if(courierAvgSafe == 3){starsrc5 = "img/stars/threestarr.png";} else if(courierAvgSafe == 2){starsrc5 = "img/stars/twostarr.png";} 
 	else if(courierAvgSafe == 1){starsrc5 = "img/stars/onestarr.png";} else if(courierAvgSafe == 0){starsrc5 = "img/stars/zerostar.png";}
 	
 	if(courierAvgKind == 5){starsrc6 = "img/stars/fivestar.png";} else if(courierAvgKind == 4){starsrc6 = "img/stars/fourstarr.png";} 
 	else if(courierAvgKind == 3){starsrc6 = "img/stars/threestarr.png";} else if(courierAvgKind == 2){starsrc6 = "img/stars/twostarr.png";} 
 	else if(courierAvgKind == 1){starsrc6 = "img/stars/onestarr.png";} else if(courierAvgKind == 0){starsrc6 = "img/stars/zerostar.png";}
%>
</head>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<body>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center" >
	<!-- <div style="height:40px"></div> -->
	
	<!-- <div id = "mainlineform" class="uk-align-center">
		<div id = "mainlineleft"></div>
		<div id = "mainlinemiddle"></div>
		<div id = "mainlineright"></div>
	</div> -->
	
	<div id = "mainbelowform" class="uk-align-center" >
		<div id = "mainleft" style="margin-top: 50px">
			<div class="request_people " align = "left">
				<div id="mainbigfont1">발송인</div><div class="webkit_box"><img id="mainphotos" src= "<%=request.getContextPath()%>/img/man_gray.jpg"/></div>
			</div>
			<div id = "mainleftone">
				<div id = "mainnull_left"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" src= "<%=request.getContextPath()%>/img/evalitems/time_blue.png"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">시간 정확성</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc1%>"/> </div>
				<div id = "null"></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_left"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/evalitems/safe_blue.png"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">물품 신뢰성</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc2%>"/></div>
				<div id = "null"></div>
			</div> 
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_left"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/evalitems/smile_blue.png"/></div>
				<div id = "null"></div>
				<div id = "maincontents"><label id="mainsmallfont">인성</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc3%>"/></div>
				<div id = "null"></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "null"></div>
				<div id = "null"></div>
				<div id = "maintwopercent" align="center">
					<label id="mainsmallfont2_left">거래완료율</label>
					<div class="webkit_box" align="left" >
						<div id = "completedRate_font_left"> <%=sPercentage%>%</div>
						<div id ="mainsmallmediumfont_left">(<%= senderSuccesscnt%>/<%= senderTotalcnt%>건)</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id = "mainmiddle" style="margin-top: 50px">
		<div id="mainphoto" class="uk-align-center" style="margin-top: 70px;">
			<img id="mainimg" class="uk-border-circle" src="<%=request.getContextPath()%><%=loginUserInfo.getUserPicture() %>">
		</div>
		</div>
		
		
		<div id = "mainright" style="margin-top: 50px">
			<div class="courier_people" align="right">
				<div class="webkit_box"><img id="mainphotos2" src= "<%=request.getContextPath()%>/img/delivery_gray.jpg"></div>
				<div id="mainbigfont2">운송인</div>
			</div>
			
			
			<div id = "mainrightone">
				<div id = "mainnull_right"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">시간 정확성</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc4%>"/> </div>
				<div id = "null"></div>
				<div id = "mainicon"><img id ="mainleftonephoto"  src= "<%=request.getContextPath()%>/img/evalitems/time_blue.png"/></div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_right"></div>
				<div id = "maincontents" align="right">
					<label id="mainsmallfont">안정성</label>
					<img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc5%>"/>
				</div>
				<div id = "null"></div>
				<div id = "mainicon">
					<img id ="mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/evalitems/safe_blue.png"/>
				</div>
			</div>
			<br>
			<div id = "mainleftone">
				<div id = "mainnull_right"></div>
				<div id = "maincontents" align="right"><label id="mainsmallfont">인성</label><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc6%>"/></div>
				<div id = "null"></div>
				<div id = "mainicon"><img id = "mainleftonephoto" class="uk-border-rounded" class="uk-border-circle" src= "<%=request.getContextPath()%>/img/evalitems/smile_blue.png"/></div>
			</div>
			<br>
			<div id = "maintwo">
				<div id = "maintwopercent_right" align ="right">
					<label id="mainsmallfont2_right">거래완료율</label>
					<div class="webkit_box" align="right">
						<div id ="mainsmallmediumfont_right">(<%=courierSuccesscnt%>/<%=courierTotalcnt%>건)</div>
						<div id = "completedRate_font_right"> <%=cPercentage%>%</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="wrapper_videoNbox" style="margin-top: 80px">
		
		<div class="uk-cover main_menu_long_box"> <!-- style="width: 430px; height: 232px; border: 1px solid blue;" -->
			<!-- autoplay="autoplay" loop="loop" --><iframe width="492" height="230" src="//www.youtube.com/embed/fwhbij0tDyw?autoplay=1&playlist=fwhbij0tDyw&loop=1&vq=highres&autohide=1&controls=0&showinfo=0&fs=0&rel=0&theme=light" frameborder="0" allowfullscreen></iframe>
		</div>
		
		<a id="a_font" href="<%=request.getContextPath()%>/board"><div class="main_menu_box" style="margin-left: 28px;" align="center">
			<img id="AllBoardList" alt="" src="<%=request.getContextPath()%>/img/button/allboardlist.png" onmouseover="hover_list(this);" onmouseout="unhover_list(this);">
			<div class="MenuFont">전체 의뢰 보기</div>
		</div></a>
	
		<a id="a_font" href="<%=request.getContextPath()%>/register/selecttype"><div class="main_menu_box" align="center">
			<img id="UploadRequest" alt="" src="<%=request.getContextPath()%>/img/button/write_board.png" onmouseover="hover_upload(this);" onmouseout="unhover_upload(this);">
			<div class="MenuFont">의뢰 올리기</div>
		</div></a>
		
	</div>
	<div class="wrapper_videoNbox" style="margin-bottom: 100px;">
		<div id="" class="main_menu_long_box" align="center">
			<ul id="advertisement_img_ul" class="uk-slideshow uk-border-rounded" data-uk-slideshow="{autoplay:true, animation: 'fade'}">
   				 <li><img style="animation-duration:500ms;" src="<%=request.getContextPath()%>/img/banner/banner2.jpg" ></li>
   				 <li><img style="animation-duration:500ms;" src="<%=request.getContextPath()%>/img/banner/banner1.jpg"></li>
   				 <li><img style="animation-duration:500ms;" src="<%=request.getContextPath()%>/img/banner/real_banner3.jpg"></li>
			</ul>
		</div>
		
		
		<a id="a_font" href="<%=request.getContextPath()%>/edmoney"><div class="main_menu_box" style="margin-left: 28px;" align="center">
			<img id="Edmoney" src="<%=request.getContextPath()%>/img/button/edmoney.png" onmouseover="hover_edmoney(this);" onmouseout="unhover_edmoney(this);">
			<div class="MenuFont">EDMoney</div>
		</div></a>
	
		<a id="a_font" href="<%=request.getContextPath()%>/mylist"><div id="MyRequestProgress_hover" class="main_menu_box" align="center">
			<img id="MyRequestProgress" alt="" src="<%=request.getContextPath()%>/img/button/mypage.png" onmouseover="hover_mypage(this);" onmouseout="unhover_mypage(this);">
			<div class="MenuFont">내 진행 보기 </div>
		</div></a>
		
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
