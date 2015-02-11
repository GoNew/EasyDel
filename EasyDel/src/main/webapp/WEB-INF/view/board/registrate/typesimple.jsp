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
<script type="text/javascript">

$(document).ready(function() {
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
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단순 운송 의뢰 등록</title>
</head>
<body>
<div id="fullbrowser">
<div id="middlebrowser">

<form action="<%=request.getContextPath()%>/"  method="post">
<div id="allproductinfo">
<div id="subject" >물품정보</div>
<hr>
	<div align="center">
				<label for="imgFileInput">
					<div id="imagePreview">
						<div id="imgnotice">프로필 사진을 등록하려면 여기를 클릭하세요!</div>
					</div>
						<input type="file" id="imgFileInput" name="imgFileInput">
				</label>
	</div>
	
	<div id="subproductinfo">
		<div id="row1"><div id="col1">물품명</div><div id=""><input class="producttext" type="text"></div></div>
		<div id="row2"><div id="col1">비용</div><div id=""><input class="producttext" type="text"></div></div>
		<div id="row3"><div id="col1">물품 상세</div><div id=""><input class="productdetails" type="text"></div></div>
	</div>

</div>


<div id="allregistrater">
<div id="subject" >보내는 사람</div>
<hr>
	<div class="uk-width-1-1" id="row1"> <div class="uk-width-1-2" id="row1"><div id="col1">이름</div><div id=""><input class="nametext" type="text"></div></div><div class="uk-width-1-2" id="row1"><div id="col1">전화번호</div><div id=""><input class="phonetext" type="text"></div></div></div>
	<div id="row2"><div id="col1">주소</div><div id="col2">서울특별시</div>
		<div id="gudongselect"><select id="gudongselect"><option>강서구</option><option>강동구</option></select></div><div id="gudiv">구</div>
		<div id="gudongselect"><select id="gudongselect"><option>군자동</option><option>행진동</option></select></div><div id="dongdiv">동</div>
	</div>
	<div id="row3"><div id="col1"></div><div id="col2">상세주소</div><div id="col3"><input class="addressdetails" type="text"></div></div>
	<div id="row4"><div id="col1">만날시간</div><div id=""><input class="date" type="datetime-local"></div><div id="from">부터</div><div id=""><input class="date" type="datetime-local"></div><div id="to">까지</div></div>
</div>


<div id="allreceiver">
<div id="subjectdiv"> <div id="subject" >받는 사람</div><div id="ischeckbox" ><input class="receiverchk" type="checkbox" checked="checked" data-uk-toggle="{target:'#my-id'}"><div class="chktext">부재중일 경우 체크</div></div><div id="samebtn"><input class="uk-button" type="button" value="본인 정보 입력"></div> </div>
<hr>
	<div class="uk-width-1-1" id="row1"> <div class="uk-width-1-2" id="row1"><div id="col1">이름</div><div id=""><input class="nametext" type="text"></div></div><div class="uk-width-1-2" id="row1"><div id="col1">전화번호</div><div id=""><input class="phonetext" type="text"></div></div></div>
	<div id="row2"><div id="col1">주소</div><div id="col2">서울특별시</div>
		<div id="gudongselect"><select id="gudongselect"><option>강서구</option><option>강동구</option></select></div><div id="gudiv">구</div>
		<div id="gudongselect"><select id="gudongselect"><option>군자동</option><option>행진동</option></select></div><div id="dongdiv">동</div>
	</div>
	<div id="row3"><div id="col1"></div><div id="col2">상세주소</div><div id="col3"><input class="addressdetails" type="text"></div></div>
	<div id="row4"><div id="col1">도착시간</div><div id=""><input class="date" type="datetime-local"></div><div id="from">부터</div><div id=""><input class="date" type="datetime-local"></div><div id="to">까지</div></div>
	<div id="my-id"><div id="col1">전달 메시지</div><div id=""><input class="givemessage" type="text" ></div></div>
</div>

<hr>
<div  align="center"><button id="enterbtn" class="uk-button" type="submit">의뢰 등록</button></div>

</form>
</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>