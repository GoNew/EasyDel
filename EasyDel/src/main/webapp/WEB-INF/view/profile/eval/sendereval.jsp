<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="easydel.entity.User"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/sendereval.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css"/>

<title>운송인평가</title>
<%
	User loginUserInfo = (User) session.getAttribute("loginSession");
	User senderInfo = (User) request.getAttribute("senderInfo");
	Integer requestId = (Integer) request.getAttribute("requestId");
%>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#senderevaltime").html("0");
		$("#senderevalaccuracy").html("0");
		$("#senderevalkind").html("0");
		
		$("#senderevaltime2").val(0);
		$("#senderevalaccuracy2").val(0);
		$("#senderevalkind2").val(0);
		
		$("#solostar11").click(function() {
			$("#solostar11").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar12").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#solostar13").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar14").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar15").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevaltime").html("1"); $("#senderevaltime2").html("<input type='hidden' id='senderevaltime2' name='senderevaltime2' value='1'>")
			$("#senderevaltime2").val(1);
			});
		$("#solostar12").click(function() {
			$("#solostar11").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar12").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar13").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar14").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar15").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevaltime").html("2"); $("#senderevaltime2").html("<input type='hidden' id='senderevaltime2' name='senderevaltime2' value='2'>")
			$("#senderevaltime2").val(2);
			});
		$("#solostar13").click(function() {
			$("#solostar11").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar12").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar13").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar14").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar15").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevaltime").html("3"); $("#senderevaltime2").html("<input type='hidden' id='senderevaltime2' name='senderevaltime2' value='3'>")
			$("#senderevaltime2").val(3);
			});
		$("#solostar14").click(function() { 
			$("#solostar11").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar12").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar13").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar14").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar15").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevaltime").html("4"); $("#senderevaltime2").html("<input type='hidden' id='senderevaltime2' name='senderevaltime2' value='4'>")
			$("#senderevaltime2").val(4);
			});
		$("#solostar15").click(function() {
			$("#solostar11").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar12").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar13").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar14").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar15").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#senderevaltime").html("5"); $("#senderevaltime2").html("<input type='hidden' id='senderevaltime2' name='senderevaltime2' value='5'>")
			$("#senderevaltime2").val(5);
			});
		
		$("#solostar21").click(function() {
			$("#solostar21").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar22").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#solostar23").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar24").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar25").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalaccuracy").html("1"); $("#senderevalaccuracy2").html("<input type='hidden' id='senderevalaccuracy2' name='senderevalaccuracy2' value='1'>")
			$("#senderevalaccuracy2").val(1);
			});
		$("#solostar22").click(function() {
			$("#solostar21").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar22").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar23").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar24").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar25").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalaccuracy").html("2"); $("#senderevalaccuracy2").html("<input type='hidden' id='senderevalaccuracy2' name='senderevalaccuracy2' value='2'>")
			$("#senderevalaccuracy2").val(2);
			});
		$("#solostar23").click(function() {
			$("#solostar21").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar22").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar23").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar24").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar25").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalaccuracy").html("3"); $("#senderevalaccuracy2").html("<input type='hidden' id='senderevalaccuracy2' name='senderevalaccuracy2' value='3'>")
			$("#senderevalaccuracy2").val(3);
			});
		$("#solostar24").click(function() { 
			$("#solostar21").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar22").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar23").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar24").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar25").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalaccuracy").html("4"); $("#senderevalaccuracy2").html("<input type='hidden' id='senderevalaccuracy2' name='senderevalaccuracy2' value='4'>")
			$("#senderevalaccuracy2").val(4);
			});
		$("#solostar25").click(function() {
			$("#solostar21").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar22").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar23").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar24").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar25").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#senderevalaccuracy").html("5"); $("#senderevalaccuracy2").html("<input type='hidden' id='senderevalaccuracy2' name='senderevalaccuracy2' value='5'>")
			$("#senderevalaccuracy2").val(5);
			});
		
		$("#solostar31").click(function() {
			$("#solostar31").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar32").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#solostar33").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar34").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar35").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalkind").html("1"); $("#senderevalkind2").html("<input type='hidden' id='senderevalkind2' name='senderevalkind2' value='1'>")
			$("#senderevalkind2").val(1);
			});
		$("#solostar32").click(function() {
			$("#solostar31").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar32").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar33").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar34").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar35").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalkind").html("2"); $("#senderevalkind2").html("<input type='hidden' id='senderevalkind2' name='senderevalkind2' value='2'>")
			$("#senderevalkind2").val(2);
			});
		$("#solostar33").click(function() {
			$("#solostar31").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar32").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar33").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar34").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");$("#solostar35").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalkind").html("3"); $("#senderevalkind2").html("<input type='hidden' id='senderevalkind2' name='senderevalkind2' value='3'>")
			$("#senderevalkind2").val(3);
			});
		$("#solostar34").click(function() { 
			$("#solostar31").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar32").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar33").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar34").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar35").html("<img src='<%=request.getContextPath()%>/img/stars/solostar.png'/></div>");
			$("#senderevalkind").html("4"); $("#senderevalkind2").html("<input type='hidden' id='senderevalkind2' name='senderevalkind2' value='4'>")
			$("#senderevalkind2").val(4);
			});
		$("#solostar35").click(function() {
			$("#solostar31").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar32").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#solostar33").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar34").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");$("#solostar35").html("<img src='<%=request.getContextPath()%>/img/stars/filledstar.png'/></div>");
			$("#senderevalkind").html("5"); $("#senderevalkind2").html("<input type='hidden' id='senderevalkind2' name='senderevalkind2' value='5'>")
			$("#senderevalkind2").val(5);
			});
	});
</script>

</head>
<body>
<jsp:include page = "/WEB-INF/view/main/header.jsp"></jsp:include>
<div class="uk-clearfix">
<div id="formcss" class="uk-align-center"> 
	<div style="height:140px"></div>
	<div style="height:150px" align="center"><img id="senderimg" class="uk-border-circle" src= "<%=request.getContextPath()%>/<%=senderInfo.getUserPicture() %>"/></div>
	<div style="height:30px"></div>
	<div class="senderbabo uk-align-center" style="font-size: 25px" align="center">
		
		<span style="color:#00B1F2"><%=senderInfo.getUserId() %></span> 님에 대한<br><br> 평가를 해주세요 
	</div>
	<hr>
	<div style="height:30px"></div>
	<form action="<%=request.getContextPath()%>/eval/sender" method="post">
		<div style="width:100%;height:140px;font-size: 25px">
			<div id ="sendereval">
				<div style="width:170px"></div>
				<div>
					<img class="evalitems" src="<%=request.getContextPath()%>/img/evalitems/time_blue.png">
				</div>
				<div style="width:10px"></div>
				<div>
					<div style="height:10px"></div>
					<div id="senderdiv">시간 정확성</div>
				</div>
				<div>
					<div style="height:10px"></div>
				<div style="width: 20px"> : </div>
				</div>
				<div class = "senderbabo" style="width:300px">
					<div id = "solostar11" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar12" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar13" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar14" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar15" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
				</div>
				<div style="width:24px"></div>
				<div style="height:6px"></div>
				<div>
					<div style="height:10px"></div>
					<div style="font-size: 23px; width: 100px;"><span id="senderevaltime"></span>점</div>
					<input type='hidden' id='senderevaltime2' name='senderevaltime2'>
				</div>
			</div>
			<div style="height:20px"></div>
			<div id ="sendereval">
				<div style="width:170px"></div>
				<div>
					<img class="evalitems" src="<%=request.getContextPath()%>/img/evalitems/safe_blue.png">
				</div>
				<div style="width:10px"></div>
				<div>
					<div style="height:10px"></div>
					<div id="senderdiv">물품 신뢰성</div>
				</div>
				<div>
					<div style="height:10px"></div>
					<div style="width: 20px"> : </div>
				</div>
				<div class = "senderbabo" style="width:300px">
					<div id = "solostar21" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar22" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar23" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar24" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar25" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
				</div>
				<div style="width:24px"></div>
				<div style="height:6px"></div>
				<div>
					<div style="height:10px"></div>
					<div style="font-size: 23px; width: 100px;"><span id="senderevalaccuracy"></span>점</div>
					<input type='hidden' id='senderevalaccuracy2' name='senderevalaccuracy2'>
				</div>
			</div>
			<div style="height:20px"></div>
			<div id ="sendereval">
				<div style="width:170px"></div>
				<div>
					<img class="evalitems" src="<%=request.getContextPath()%>/img/evalitems/smile_blue.png">
				</div>
				<div style="width:10px"></div>
				<div>
					<div style="height:10px"></div>
					<div id="senderdiv">인성</div>
				</div>
				<div>
					<div style="height:10px"></div>
					<div style="width: 20px"> : </div>
				</div>
				<div class = "senderbabo" style="width:300px">
					<div id = "solostar31" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar32" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar33" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar34" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
					<div id = "solostar35" style="width:43px;height:42px;"><img src= "<%=request.getContextPath()%>/img/stars/solostar.png"/></div>
				</div>
				<div style="width:24px"></div>
				<div style="height:6px"></div>
				<div>
					<div style="height:10px"></div>
					<div style="font-size: 23px; width: 100px;"><span id="senderevalkind" ></span>점</div>
					<input type="hidden" id="senderevalkind2" name="senderevalkind2">
				</div>
			</div>
			<div style="height:10px"></div>
		</div>
		
		<div style="height:80px"></div>
		<div id="senderevaltwo">
			<div style="width:120px"></div>
			<div>
				<div style="height:15px"></div>
				<div><img id = "senderevalimg" class="uk-border-circle"  src= "<%=request.getContextPath()%><%=loginUserInfo.getUserPicture()%>"/></div>
			</div>
			<div style="width:20px"></div>
			<div style="width:720px">
				<div style="height:15px"></div>
				<input type="text" name="senderevalcmt" id="senderevalcmt" size="70" maxlength="100" title="100자 이하로 작성해주세요." placeholder="여기에 코멘트를 달아주세요" >  
	        </div>
		</div>
		<input type="hidden" value="<%=senderInfo.getUserId() %>" name="senderId">
		<input type="hidden" value="<%=requestId %>" name="requestId">
		<div style="height:40px"></div>
		<div align="center"><button class="uk-button uk-width-1-5 uk-button-large uk-button-primary" style="font-size: 20px" type="submit">평가완료</button></div>
	</form>
	<input type="hidden" id="senderevalsystime" name="senderevalsystime">
	
</div>
</div>
<jsp:include page = "/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>