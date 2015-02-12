<%@page import="easydel.entity.AddressGu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="easydel.entity.User"%>
<%
	User loginUser = (User) session.getAttribute("loginSession");
	List<AddressGu> guList = (List<AddressGu>) request.getAttribute("gu"); 
%>
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
<script type="text/javascript">

	function getStartDongList() {
		var url = "<%=request.getContextPath()%>/register/ajax/getdong";
		$.ajax({
			url: url,
			type: 'get',
			data: {
				guName: $("#startPosGuList").val()
			},
			success: function(responseText) {
				$("#startPosDongList").html(responseText);
			}
		});
	}
	function getArriveDongList() {
		var url = "<%=request.getContextPath()%>/register/ajax/getdong";
		$.ajax({
			url : url,
			type : 'get',
			data : {
				guName : $("#arrivePosGuList").val()
			},
			success : function(responseText) {
				$("#arrivePosDongList").html(responseText);
			}
		});
	}

	$(document).ready(function() {
		getStartDongList();
		getArriveDongList();
		$("#startPosGuList").change(getStartDongList);
		$("#arrivePosGuList").change(getArriveDongList);
		
		$("#imgFileInput").change(function() {
			var files = !!this.files ? this.files : [];
			if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

			if (/^image/.test(files[0].type)){ // only image file
				$("#imagePreview").html("");
				var reader = new FileReader(); // instance of the FileReader
				reader.readAsDataURL(files[0]); // read the local file
				reader.onloadend = function() { // set image data as background of div
					$("#imagePreview").css("background-image", "url("+this.result+")");
				}
			} else {
				alert("사진만 등록가능합니다.");
			}
		});
		
		/* 본인 정보 넣기 버튼 액션 */
		$("#personalInfoInsert").click(function() {
			$("#receiverName").val("<%=loginUser.getUserName() %>");
			$("#receiverPhone").val("<%=loginUser.getUserPhone() %>");
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단순 운송 의뢰 등록</title>
</head>
<body>
<div id="fullbrowser">
<div id="middlebrowser">

<form action="<%=request.getContextPath()%>/register/typesimple" enctype="multipart/form-data" method="post">
<div id="allproductinfo">
<div id="subject" >물품정보</div>
<hr>
	<div align="center">
		<label for="imgFileInput">
			<div id="imagePreview">
				<div id="imgnotice">프로필 사진을 등록하려면 여기를 클릭하세요!</div>
			</div>
		</label>
		<input type="file" id="imgFileInput" name="imgFileInput">
	</div>
	
	<div id="subproductinfo">
		<div id="row1"><div id="col1">물품명</div><div id=""><input class="producttext" type="text" name="cargoName" required></div></div>
		<div id="row2"><div id="col1">비용</div><div id=""><input class="producttext" type="number" name="deliveryPrice" required></div></div>
		<div id="row3"><div id="col1">물품 상세</div><div id=""><input class="productdetails" type="text" name="cargoDesc" required></div></div>
	</div>

</div>


<div id="allregistrater">
<div id="subject" >보내는 사람</div>
<hr>
	<div class="uk-width-1-1" id="row1"> <div class="uk-width-1-2" id="row1"><div id="col1">이름</div><div id=""><input class="nametext" type="text" value="<%=loginUser.getUserName() %>" readonly></div></div><div class="uk-width-1-2" id="row1"><div id="col1">전화번호</div><div id=""><input class="phonetext" type="text" name="senderPhone" value="<%=loginUser.getUserPhone() %>" required></div></div></div>
	<div id="row2"><div id="col1">주소</div><div id="col2">서울특별시</div>
		<div id="gudongselect"><select id="startPosGuList"><% for (AddressGu gu : guList) { %><option value="<%=gu.getGuName()%>"><%=gu.getGuName()%></option><% } %></select></div><div id="gudiv">구</div>
		<div id="gudongselect"><select id="startPosDongList" name="pickupPlace"></select></div><div id="dongdiv">동</div>
	</div>
	<div id="row3"><div id="col1"></div><div id="col2">상세주소</div><div id="col3"><input class="addressdetails" type="text" name="pickupPlaceDesc" required></div></div>
	<div id="row4"><div id="col1">만날시간</div><div id=""><input class="date" type="datetime-local" name="pickupMinTimeBeforeParse" required></div><div id="from">부터</div><div id=""><input class="date" type="datetime-local" name="pickupMaxTimeBeforeParse" required></div><div id="to">까지</div></div>
</div>

<div id="allreceiver">
<div id="subjectdiv"> <div id="subject" >받는 사람</div><div id="ischeckbox" ><input class="receiverchk" type="checkbox" checked="checked" data-uk-toggle="{target:'#my-id'}"><div class="chktext">부재중일 경우 체크</div></div><div id="samebtn"><input id="personalInfoInsert" class="uk-button" type="button" value="본인 정보 입력"></div> </div>
<hr>
	<div class="uk-width-1-1" id="row1"> <div class="uk-width-1-2" id="row1"><div id="col1">이름</div><div id=""><input id="receiverName" class="nametext" type="text" name="receiverName" required></div></div><div class="uk-width-1-2" id="row1"><div id="col1">전화번호</div><div id=""><input id="receiverPhone" class="phonetext" type="text" name="receiverPhone" required></div></div></div>
	<div id="row2"><div id="col1">주소</div><div id="col2">서울특별시</div>
		<div id="gudongselect"><select id="arrivePosGuList"><% for (AddressGu gu : guList) { %><option value="<%=gu.getGuName()%>"><%=gu.getGuName()%></option><% } %></select></div><div id="gudiv">구</div>
		<div id="gudongselect"><select id="arrivePosDongList" name="arrivalPlace"></select></div><div id="dongdiv">동</div>
	</div>
	<div id="row3"><div id="col1"></div><div id="col2">상세주소</div><div id="col3"><input class="addressdetails" type="text" name="arrivalPlaceDesc" required></div></div>
	<div id="row4"><div id="col1">도착시간</div><div id=""><input class="date" type="datetime-local" name="arrivalMinTimeBeforeParse" required></div><div id="from">부터</div><div id=""><input class="date" type="datetime-local" name="arrivalMaxTimeBeforeParse" required></div><div id="to">까지</div></div>
	<div id="my-id"><div id="col1">전달 메시지</div><div id=""><input class="givemessage" type="text" name="absenceMessage"></div></div>
</div>

<hr>
<div  align="center"><button id="enterbtn" class="uk-button" type="submit">의뢰 등록</button></div>

</form>
</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
