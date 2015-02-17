<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/deli.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#deli_userid").click(function() {
		$("#searchprofbtn_div").css("display", "");
	});
	
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
<title>Insert title here</title>
</head>
<body>
	<div id=fullbrowser align="center">
		<div id="middlebrowser" align="center" >
		
<!-- --------------------------------발송인 정보---------------------------------------------- -->		
		<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">발송인 정보</div></div>
		<div class="replace_hr"></div>
		
		<div class="margin_top_10px uk-panel uk-panel-box">
			<div class="standard_row_request">
			<div id="senderprofimg_main"><img src="<%=request.getContextPath()%>/img/bart.PNG" class="uk-border-circle"></div>
			<div id="deli_userid" class="text_middle fixed_font_color">(발송인 ID)</div>
			</div>
		</div>
		<div id="searchprofbtn_div"><button id="searchprofbtn" class="uk-button uk-width-1-5">프로필 보기</button></div>
<!-- --------------------------------배송 정보---------------------------------------------- -->		
		<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">배송 정보</div></div>
		<div class="replace_hr"></div>
		
		<div class="margin_top_10px uk-panel uk-panel-box">
		<div class="standard_row_request fixed_font_color"> <div class="row_standard_text_middle">종류</div> 		<div class="text_middle unfixed_font_color">단순 운송/ 구매 후 운송</div> </div>
		<div class="standard_row_request fixed_font_color"> <div class="row_standard_text_middle">발송 장소</div> 		<div class="text_middle unfixed_font_color">사랑시 고백구 행복동</div> </div>
		<div class="standard_row_request fixed_font_color"> <div class="row_standard_text_middle">발송 희망 시간</div> 		<div class="text_middle unfixed_font_color">(2015/02/12 오후 14:45)</div> <div class="text_middle margin_LR_10px">-</div> <div class="text_middle unfixed_font_color">(2015/02/12 오후 14:45)</div> </div>
		<div class="standard_row_request fixed_font_color"> <div class="row_standard_text_middle">도착 장소</div> 		<div class="text_middle unfixed_font_color">이별시 차인구 빡친동</div> </div>
		<div class="standard_row_request fixed_font_color"> <div class="row_standard_text_middle">도착 희망 시간</div> 		<div class="text_middle unfixed_font_color">(2015/02/13 오후 14:45)</div> <div class="text_middle margin_LR_10px">-</div> <div class="text_middle unfixed_font_color">(2015/02/13 오후 14:45)</div> </div>
		</div>

<!-- --------------------------------물품 정보---------------------------------------------- -->		
	<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">물품 정보</div></div>
		<div class="replace_hr"></div>
		<div class="webkit_box margin_top_10px uk-panel uk-panel-box" align="left">
		
			<div id="wrapper_product_img_div"><img id="wrapper_product_img" src="<%= request.getContextPath()%>/img/quick.PNG"></div>
			<div id="wrapper_product_div"> 
																								<div class="standard_row_request_product"><div class="row_standard_text_middle_product fixed_font_color">물품명</div><div class="text_middle unfixed_font_color">()</div> </div>
																								<div class="standard_row_request_product"><div class="row_standard_text_middle_product fixed_font_color">비용</div><div class="text_middle unfixed_font_color">(금액)</div><div style="margin-left: 10px;" class="text_middle fixed_font_color">원</div> </div>
																								<div id="wrapper_product_details"><div class="row_standard_text_middle_product fixed_font_color">상세설명</div><div id="product_detail" class="unfixed_font_color">(왜 상세 내용이 안나오죠?) 나는 이제 글자를 옮겨오는 것을 완성하였다 ㅎㅎ</div> </div> 
			</div>
		</div> 

<!-- --------------------------------추가 대화---------------------------------------------- -->		
		<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">추가 사항</div></div>
			<div class="replace_hr"></div>
			
			<div class="uk-panel uk-panel-box margin_top_10px">
			<div class="standard_row_request_reply">
			
				<div class="row_request_extra">
					<div id="senderprofimg"><img src="<%=request.getContextPath()%>/img/bart.PNG" class="uk-border-circle"></div><div id="deli_userid" class="text_middle_extra fixed_font_color">(운송인 ID)</div>
				</div>
				<div class="margin_left_50px"><img src="<%=request.getContextPath()%>/img/images.jpg"></div>
				<div class="row_request_extra_long"> 
					<div class="margin_left_50px text_middle_extra_long unfixed_font_color">(글 내용)</div> 
				</div>
			
			<div class="replace_hr_plus"></div>
			</div>
			
			<div class="standard_row_request_reply margin_top_10px">
				<div class="row_request_extra"><div id="senderprofimg"><img src="<%=request.getContextPath()%>/img/bart.PNG" class="uk-border-circle"></div><div id="deli_userid" class="text_middle_extra fixed_font_color">(발송인 ID)</div></div>
				<div class="row_request_extra_long"> <div class="margin_left_50px text_middle_extra_long unfixed_font_color">(글 내용)</div> </div>
			
			<div class="replace_hr_plus"></div>
			</div>
		
				<div class="standard_row_request_reply margin_top_10px">
					<div class="webkit_box"> 
						<div id="wrapper_btn_div" class="margin_left_50px">
							<label for="imgFileInput"><div id="imagePreview"><div class="reply_img_text_middle">+사진</div></div></label>		
							<input type="file" id="imgFileInput" name="imgFileInput">
						</div> 
						<div><textarea id="add_textarea"></textarea></div> <div id="wrapper_btn_div"><button id="add_reply_btn" class="uk-button">완료</button></div>  
					</div>
				</div>
			</div>
<!-- ------------------------------버튼------------------------------- -->		
		<div id="wrapper_recept_deli_btn_div" align="center"><button id="" class="uk-button uk-width-1-2 recept_deli_btn">운송 신청</button></div>
		
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
