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
<title>운송인 프로필</title>
<%
 	User courierInfos = (User) request.getAttribute("courierInfos");
 	courierInfos.setCourierAvgKind(4);
 	courierInfos.setCourierAvgSafe(5);
 	courierInfos.setCourierAvgTime(3);
 	courierInfos.setCourierSuccesscnt(30);
 	courierInfos.setCourierTotalcnt(31); 
	
 	int courierAvgTime = courierInfos.getCourierAvgTime();
 	int courierAvgSafe = courierInfos.getCourierAvgSafe();
 	int courierAvgKind = courierInfos.getCourierAvgKind();
 	int courierSuccesscnt = courierInfos.getCourierSuccesscnt();
 	int courierTotalcnt = courierInfos.getCourierTotalcnt();
 	double courierPercentage = 0.0;
 	String cPercentage = null;
 	if(courierTotalcnt != 0){
 		courierPercentage = ((double)courierSuccesscnt/(double)courierTotalcnt) * 100;
 		cPercentage = String.format("%.1f" , courierPercentage);
 	}
 	
 	String starsrc4 = null; String starsrc5 = null; String starsrc6 = null;
 	
 	if(courierAvgTime == 5){starsrc4 = "img/fivestar.jpg";} else if(courierAvgTime == 4){starsrc4 = "img/fourstarl.JPG";} 
 	else if(courierAvgTime == 3){starsrc4 = "img/threestarl.JPG";} else if(courierAvgTime == 2){starsrc4 = "img/twostarl.JPG";} 
 	else if(courierAvgTime == 1){starsrc4 = "img/onestarl.JPG";} else if(courierAvgTime == 0){starsrc4 = "img/zerostar.JPG";}
 	
 	if(courierAvgSafe == 5){starsrc5 = "img/fivestar.jpg";} else if(courierAvgSafe == 4){starsrc5 = "img/fourstarl.JPG";} 
 	else if(courierAvgSafe == 3){starsrc5 = "img/threestarl.JPG";} else if(courierAvgSafe == 2){starsrc5 = "img/twostarl.JPG";} 
 	else if(courierAvgSafe == 1){starsrc5 = "img/onestarl.JPG";} else if(courierAvgSafe == 0){starsrc5 = "img/zerostar.JPG";}
 	
 	if(courierAvgKind == 5){starsrc6 = "img/fivestar.jpg";} else if(courierAvgKind == 4){starsrc6 = "img/fourstarl.JPG";} 
 	else if(courierAvgKind == 3){starsrc6 = "img/threestarl.JPG";} else if(courierAvgKind == 2){starsrc6 = "img/twostarl.JPG";} 
 	else if(courierAvgKind == 1){starsrc6 = "img/onestarl.JPG";} else if(courierAvgKind == 0){starsrc6 = "img/zerostar.JPG";}
%>
</head>
<body>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center"> 
	<div style="height:40px"></div>
	<div id="profileid" align="center" style="font-size: 25px">
				' <%=courierInfos.getUserId()%> ' 님의 운송인 평가 정보 입니다.
	</div><br>
	<div id="profileupform">
		<div style="width:100px;"></div>
		
		<div id="profilephoto">
			<img id="profileimg" class="uk-border-circle" src= "<%=request.getContextPath()%><%=courierInfos.getUserPicture() %>">
		</div>
		<div style="width:130px;"></div>
		<div id="profileupsmallform">
			
			<div id="profileinfo">
				<div style="height:20px;"></div>
					<div id="profiledangdang">
						<div><img id = "courierimg" src= "<%=request.getContextPath()%>/img/time.png"/></div> 
						<div style="width:10px"></div>
						<div>
							<div style="height:8px"></div>
							<div id="profilediv">time precision</div>
						</div>
						<div>
							<div style="height:8px"></div>
							<div style="width: 10px"> : </div>
						</div>
						<div id="profilediv"><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc4%>"/> </div>
						<div>
							<div style="height:8px"></div>
							<div style="font-size: 23px; width: 100px;" align="center"><%=courierAvgTime%>점</div>
						</div>
					</div>
				  	<div id="profiledangdang">
					  	<div><img id = "courierimg" src= "<%=request.getContextPath()%>/img/safe.jpg"/></div>
					  	<div style="width:10px"></div>
					  	<div>
							<div style="height:10px"></div>
				  			<div id="profilediv">safe</div>
				  		</div>
				  		<div>
							<div style="height:8px"></div>
				  			<div style="width: 10px"> : </div>
				  		</div>
				  		<div id="profilediv"><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc5%>"/> </div>
				  		<div>
							<div style="height:8px"></div>
				  			<div style="font-size: 23px; width: 100px;" align="center"><%=courierAvgSafe%>점</div>
				  		</div>
				  	</div>
				  	<div id="profiledangdang">
				  		<div><img id = "courierimg" src= "<%=request.getContextPath()%>/img/smile.jpg"/></div> 
				  		<div style="width:10px"></div>
				  		<div>
							<div style="height:10px"></div>
				  			<div id="profilediv">kind</div>
				  		</div>
				  		<div>
							<div style="height:8px"></div>
				  			<div style="width: 10px"> : </div>
				  		</div>
				  		<div id="profilediv"><img id = "mainstar" src= "<%=request.getContextPath()%>/<%=starsrc6%>"/> </div>
				  		<div>
							<div style="height:8px"></div>
				  			<div style="font-size: 23px; width: 100px;" align="center"><%=courierAvgKind%>점</div>
				  		</div>
				  	</div>
				  	<div style="height:3px;"></div>
			</div>
			<div id="profiledangdang2">
				<div style="width:25px"></div>
				<div id="profilediv">거래완료율</div>
				<div style="width: 15px"> : </div> 
				<div id="profilediv" align="center"><%=cPercentage%>%</div>
				<div style="font-size: 23px; width: 100px;" align="center"><%=courierSuccesscnt%>/<%=courierTotalcnt%>건</div>
			</div>
		</div>
	</div>
	<div style="height:33px;"></div>
	<div id="profiledownform">
		<div id ="profiledowntext">
			<div id="profiletwo">
				<div style="width:70px;"></div>
				<div style="width:700px;"><strong>평가댓글</strong></div>
				<div style="width:200px;"><strong>댓글 등록일</strong></div>
			</div>	
			<div class="replacehr"></div>
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
							<div style="width:200px;line-height:20px;padding:7px;word-break:break-all;overflow:hidden;clear:both;color:#888888;font-size:13px">
								여기는 날짜입력
							</div>
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
								여기에 댓글이 올라옵니다.<br>
							</div>
							<div style="width:200px;line-height:20px;padding:7px;word-break:break-all;overflow:hidden;clear:both;color:#888888;font-size:13px">
								여기는 날짜입력
							</div>
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
							<div style="width:200px;line-height:20px;padding:7px;word-break:break-all;overflow:hidden;clear:both;color:#888888;font-size:13px">
								여기는 날짜입력
							</div>
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
</html>