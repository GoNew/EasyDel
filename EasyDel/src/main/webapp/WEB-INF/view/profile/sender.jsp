<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="easydel.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/courier.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css"/>
<title>발송인 프로필</title>
<%
	User loginUserInfo = (User) session.getAttribute("loginSession");
	loginUserInfo.setSenderAvgKind(3);
	loginUserInfo.setSenderAvgThing(4);
	loginUserInfo.setSenderAvgTime(2);
	loginUserInfo.setSenderSuccesscnt(10);
	loginUserInfo.setSenderTotalcnt(30);

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
 	
 	String starsrc1 = null; String starsrc2 = null; String starsrc3 = null;
 	
 	if(senderAvgTime == 5){starsrc1 = "img/fivestar.jpg";} else if(senderAvgTime == 4){starsrc1 = "img/fourstarl.JPG";} 
 	else if(senderAvgTime == 3){starsrc1 = "img/threestarl.JPG";} else if(senderAvgTime == 2){starsrc1 = "img/twostarl.JPG";} 
 	else if(senderAvgTime == 1){starsrc1 = "img/onestar1.JPG";} else if(senderAvgTime == 0){starsrc1 = "img/zerostar.JPG";}
 	
 	if(senderAvgThing == 5){starsrc2 = "img/fivestar.jpg";} else if(senderAvgThing == 4){starsrc2 = "img/fourstarl.JPG";} 
 	else if(senderAvgThing == 3){starsrc2 = "img/threestarl.JPG";} else if(senderAvgThing == 2){starsrc2 = "img/twostarl.JPG";} 
 	else if(senderAvgThing == 1){starsrc2 = "img/onestar1.JPG";} else if(senderAvgThing == 0){starsrc2 = "img/zerostar.JPG";}
 	
 	if(senderAvgKind == 5){starsrc3 = "img/fivestar.jpg";} else if(senderAvgKind == 4){starsrc3 = "img/fourstarl.JPG";} 
 	else if(senderAvgKind == 3){starsrc3 = "img/threestarl.JPG";} else if(senderAvgKind == 2){starsrc3 = "img/twostarl.JPG";} 
 	else if(senderAvgKind == 1){starsrc3 = "img/onestar1.JPG";} else if(senderAvgKind == 0){starsrc3 = "img/zerostar.JPG";}
%>
</head>
<body>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center"> 
	<div style="height:40px"></div>
	<div id="profileupform">
		<div style="width:100px;"></div>
		<div id="profilephoto">
			<img id="profileimg" class="uk-border-circle" src= "<%=request.getContextPath()%><%=loginUserInfo.getUserPicture() %>">
		</div>
		<div style="width:130px;"></div>
		<div id="profileupsmallform">
			<div id="profileid" align="left" style="font-size: 25px">
				' <%=loginUserInfo.getUserId()%> '  님의 발송인 평가 정보 입니다.
			</div><br>
			<div id="profileinfo">
				<div style="height:20px;"></div>
					<div id="profiledangdang">
						<%-- <div><img id = "courierimg" src= "<%=request.getContextPath()%>/img/time.png"/></div> --%>
						<div id="profilediv">time precision</div>
						<div style="width: 15px"> : </div>
						<div id="profilediv"><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc1%>"/> </div>
						<div style="font-size: 23px; width: 100px;" align="center"><%=senderAvgTime%>점</div>
					</div>
				  	<div id="profiledangdang">
					  	<%-- <div><img id = "courierimg" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div> --%>
				  		<div id="profilediv">safe</div>
				  		<div style="width: 15px"> : </div>
				  		<div id="profilediv"><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc2%>"/> </div>
				  		<div style="font-size: 23px; width: 100px;" align="center"><%=senderAvgThing%>점</div>
				  	</div>
				  	<div id="profiledangdang">
				  		<%-- <div><img id = "courierimg" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div> --%>
				  		<div id="profilediv">kind</div>
				  		<div style="width: 15px"> : </div>
				  		<div id="profilediv"><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc3%>"/> </div>
				  		<div style="font-size: 23px; width: 100px;" align="center"><%=senderAvgKind%>점</div>
				  	</div>
				  	<div style="height:3px;"></div>
				  	<div id="profiledangdang">
				  		<div id="profilediv">거래완료율</div>
				  		<div style="width: 15px"> : </div> 
				  		<div id="profilediv" align="center"><%=sPercentage%>%</div>
				  		<div style="font-size: 23px; width: 100px;" align="center"><%=senderSuccesscnt%>/<%=senderTotalcnt%>건</div>
				  	</div>
				  		

			</div>
		</div>
	</div>
	
	<div id="profiledownform">
		<div id ="profiledowntext">
			<div id="profiletwo">
				<div style="width:700px;"><strong>평가댓글</strong></div>
				<div style="width:200px;"><strong>댓글 등록일</strong></div>
			</div>	
			<table id="firsttable" style="width:100%">
				<tbody>
					<tr>
						<td height="1" colspan="3" bgcolor="#dddddd"></td>
					</tr>
					<tr>
						<div id="profiletwo">
							<div style="width:700px;line-height:20px;padding:7px;word-break:break-all;overflow:hidden;clear:both;font-size:12px;"> 
								여기에 댓글이 올라옵니다.
							</div>
							<span style="width:200px;color:#888888;font-size:13px">여기는 날짜입력</span>
						</div>
					</tr>
				</tbody>
			</table>
			<table id="secondtable" width="100%">
				<tbody>
					<tr>
						<td height="1" colspan="3" bgcolor="#dddddd"></td>
					</tr>
					<tr>
						<div id="profiletwo">
							<div style="width:700px;line-height:20px;padding:7px;word-break:break-all;overflow:hidden;clear:both;font-size:12px;"> 
								여기에 댓글이 올라옵니다.
							</div>
							<span style="width:200px;color:#888888;font-size:13px">여기는 날짜입력</span>
						</div>
					</tr>
				</tbody>
			</table>
		</div>	
	</div>
	<ul class="uk-pagination">
	    <li class="uk-active"><span><a href="#">[1]</a></span></li>
	    <li class="uk-active"><a href="#">[2]</a></li>
	    <li class="uk-active"><a href="#">[3]</a></li>
	</ul>
</div>
</div>
<jsp:include page = "/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html></html>