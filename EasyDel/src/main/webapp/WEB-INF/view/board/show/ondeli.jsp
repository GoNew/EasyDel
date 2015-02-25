<%@page import="easydel.contant.RequestStatus"%>
<%@page import="easydel.contant.RequestType"%>
<%@page import="easydel.entity.RequestCmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="easydel.entity.Request"%>
<%@page import="easydel.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User) session.getAttribute("loginSession");
	Request req = (Request) request.getAttribute("requestWithCmts");
	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd a kk:mm");
	User senderUserInfo = (User) request.getAttribute("senderUserInfo");
%>
<!DOCTYPE html PUBLIC>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/deli.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#deli_userid").click(function() {
		$("#searchprofbtn_div").css("display", "");
	});
	
	$("#imgFileInput").change(function() {
		var files = !!this.files ? this.files : [];
		if (!files.length || !window.FileReader) return false; // no file selected, or no FileReader support

		if (/^image/.test(files[0].type)){ // only image file
			$("#imagePreview").html("");
			var reader = new FileReader(); // instance of the FileReader
			reader.readAsDataURL(files[0]); // read the local file
			reader.onloadend = function() { // set image data as background of div
				$("#imagePreview").css("background-image", "url("+this.result+")");
			}
		} else {
			alert("사진만 등록가능합니다.");
			return false;
		}
		return true;
	});
});
</script>

<%@include file="/WEB-INF/view/profile/sender" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasyDeli-택배보다 빠르고 퀵보다 싸게</title>
</head>
<body>
	<div id=fullbrowser align="center">
		<div id="middlebrowser" align="center" >
<!-- --------------------------------발송인 정보---------------------------------------------- -->		
		<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">발송인 정보</div></div>
		<div class="replace_hr"></div>
		
		<div class="margin_top_10px uk-panel uk-panel-box">
			<div class="standard_row_request">
				<div id="senderprofimg_main"><img src="<%=request.getContextPath()%><%=senderUserInfo.getUserPicture() %>" class="uk-border-circle"></div>
				<div id="deli_userid" class="text_middle fixed_font_color webkit_box"><a class="atag_color" data-uk-toggle="{target:'#my-profbtn'}"><%=req.getSenderId() %></a></div>
				<div class="uk-hidden" id="my-profbtn">
					<%	if(!loginUser.getUserId().equals(req.getSenderId())) {	%>
					<button id="searchprofbtn" class="uk-button" onclick="ready_ForShowingProfileOfSender('<%=req.getSenderId() %>')" data-uk-modal="{target:'#profileOfSenderUsingModal'}">프로필 보기</button>
					<%	}	%>
				</div>
			</div>
		</div>
<!-- --------------------------------물품 정보---------------------------------------------- -->		
		<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">물품 정보</div></div>
		<div class="replace_hr"></div>
		<div class="webkit_box margin_top_10px uk-panel uk-panel-box" align="left">
			<%
				String cargoPicturePath = req.getCargoPicture() != null ? req.getCargoPicture() : "/img/has_no_img.gif";
				cargoPicturePath = request.getContextPath() + cargoPicturePath;
			%>
			<%-- <a href="<%=cargoPicturePath %>" class="uk-overlay" id="wrapper_product_img_div">
				<img id="wrapper_product_img" class="uk-img-preserve" src="<%=cargoPicturePath %>">
				<div class="uk-overlay-area"></div>
			</a> --%>
			
			<div class="uk-overlay-hover" data-uk-modal="{target:'#modal-1'}">
				<figure class="uk-overlay" id="wrapper_product_img_div">
					<img id="wrapper_product_img" src="<%=cargoPicturePath %>" alt="">
					<figcaption class="uk-overlay-panel uk-overlay-icon uk-overlay-background uk-overlay-fade"></figcaption>
					<a class="uk-position-cover" href="#"></a>
				</figure>
       	 	</div>
       	 	
       	 	<div id="modal-1" class="uk-modal" style="display: none; overflow-y: scroll;">
				<div class="uk-modal-dialog uk-overflow-container modal_change">
					<a href="" class="uk-modal-close uk-close uk-close-alt"></a>
					<img src="<%=cargoPicturePath %>" alt="">
				</div>
	    	</div>
	    	
			<div id="wrapper_product_div"> 
				<div class="standard_row_request_product"><div class="row_standard_text_middle_product fixed_font_color">물품명</div><div class="text_middle unfixed_font_color"><%=req.getCargoName() %></div></div>
				<div class="standard_row_request_product"><div class="row_standard_text_middle_product fixed_font_color">비용</div><div class="text_middle unfixed_font_color"><%=req.getDeliveryPrice() %></div><div style="margin-left: 10px;" class="text_middle fixed_font_color">원</div></div>
				<div id="wrapper_product_details"><div class="row_standard_text_middle_product fixed_font_color">상세설명</div><div id="product_detail" class="unfixed_font_color"><%=req.getCargoDesc() %></div></div> 
			</div>
		</div>
<!-- --------------------------------배송 정보---------------------------------------------- -->		
		<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">배송 정보</div></div>
		<div class="replace_hr"></div>
		
		<div class="margin_top_10px uk-panel uk-panel-box">
		<div class="standard_row_request"> <div class="row_standard_text_middle fixed_font_color">종류</div>
		 	<div class="text_middle unfixed_font_color"><%=req.getRequestType() == RequestType.nomal.getTypeCode() ? "단순 운송" : "구매 후 운송" %></div></div>
		
<!-- --------------------------------보내는 사람---------------------------------------------- -->
		<%	if(req.getRequestType() == RequestType.nomal.getTypeCode()) {	%>
		<div class="row_request margin_top_40px"><div class="text_middle_subject_sub fixed_font_color">보내는 사람</div></div>
		<div class="replace_hr_sub"></div>
		
		<div class="margin_top_10px"></div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">이름</div>
		<div class="text_middle_sub unfixed_font_color"><%=senderUserInfo.getUserName() %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">전화 번호</div>
		<div class="text_middle_sub unfixed_font_color"><%=req.getSenderPhone() %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">만날 장소</div>
		<%
				StringBuilder pickUpAddress = new StringBuilder();
				pickUpAddress.append("서울시 ").append(req.getPickupPlaceGuName()).append(" ").append(req.getPickupPlaceDongDesc());
		%>
		<div class="text_middle_sub unfixed_font_color"><%=pickUpAddress %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color"></div>
		<div class="text_middle_sub unfixed_font_color"><%=req.getPickupPlaceDesc() %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">전달 희망 시간</div>
		<div class="text_middle_sub unfixed_font_color"><%=format.format(req.getPickupMinTime()) %></div> <div class="text_middle_sub margin_LR_10px">-</div>
		<div class="text_middle_sub unfixed_font_color"><%=format.format(req.getPickupMaxTime()) %></div> </div>
		<%	}	%>
<!-- --------------------------------받는 사람---------------------------------------------- -->		
		<div class="row_request margin_top_40px"><div class="text_middle_subject_sub fixed_font_color">받는 사람</div></div>
		<div class="replace_hr_sub"></div>
		
		<div class="margin_top_10px"></div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">이름</div>
		<div class="text_middle_sub unfixed_font_color"><%=req.getReceiverName() %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">전화번호</div>
		<div class="text_middle_sub unfixed_font_color"><%=req.getReceiverPhone() %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">주소</div>
		<%
				StringBuilder arriveAddress = new StringBuilder();
				arriveAddress.append("서울시 ").append(req.getArrivalPlaceGuName()).append(" ").append(req.getArrivalPlaceDongDesc());
		%>
		<div class="text_middle_sub unfixed_font_color"><%=arriveAddress %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color"></div>
		<div class="text_middle_sub unfixed_font_color"><%=req.getArrivalPlaceDesc() %></div> </div>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">도착 희망 시간</div>
		<div class="text_middle_sub unfixed_font_color"><%=format.format(req.getArrivalMinTime()) %></div> <div class="text_middle_sub margin_LR_10px" >-</div>
		<div class="text_middle_sub unfixed_font_color"><%=format.format(req.getArrivalMaxTime()) %></div> </div>
		<%	if(req.getAbsenceMessage() != null) {	%>
		<div class="standard_row_request_deli_sub"> <div class="row_standard_text_middle_sub fixed_font_color">전달 메시지(부재시)</div>
		<div class="text_middle_sub unfixed_font_color"><%=req.getAbsenceMessage() %></div> </div>
		<%	}	%>
		</div>
<!-- --------------------------------추가 대화---------------------------------------------- -->		
			<div class="row_request margin_top_80px"><div class="text_middle_subject fixed_font_color">추가 사항</div></div>
			<div class="replace_hr"></div>

			<div class="uk-panel uk-panel-box margin_top_10px">
			<%	for(RequestCmt cmt: req.getRequestCmtsList()) {	%>
				<div class="standard_row_request_reply">
					<div class="row_request_extra">
						<div id="senderprofimg"><img src="<%=request.getContextPath() %><%=cmt.getSaveUserPictureByJoinWithUsers() %>" class="uk-border-circle"></div>
						<div id="deli_userid" class="text_middle_extra fixed_font_color"><%=cmt.getUserId() %></div>
					</div>
			<%		if(cmt.getReplyPicture() != null) {	%>
					
					<div class="uk-overlay-hover margin_left_50px" data-uk-modal="{target:'#_cmt_modal_picture_<%=cmt.getCmtId() %>'}">
						<figure class="uk-overlay">
							<img class="img_fixed_size_extra" src="<%=request.getContextPath() %><%=cmt.getReplyPicture() %>" alt="">
							<figcaption class="uk-overlay-panel uk-overlay-icon uk-overlay-background uk-overlay-fade"></figcaption>
							<a class="uk-position-cover" href="#"></a>
						</figure>
		       	 	</div>
		       	 	
		       	 	<div id="_cmt_modal_picture_<%=cmt.getCmtId() %>" class="uk-modal" style="display: none; overflow-y: scroll; overflow-x: scroll; ">
						<div align="center" class="uk-modal-dialog uk-modal-dialog-lightbox modal_change" >
							<a href="" class="uk-modal-close uk-close uk-close-alt"></a>
							<img src="<%=request.getContextPath() %><%=cmt.getReplyPicture() %>" alt="">
						</div>
			    	</div>
			    	
			<%		}	%>
					<div class="row_request_extra_long"> 
						<div class="margin_left_50px text_middle_extra_long unfixed_font_color"><%=cmt.getReplyText() != null ? cmt.getReplyText() : "" %></div> 
					</div>
					<div class="replace_hr_plus"></div>
				</div>
			<%	}	%>
				<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/show/addcmt">
				<div class="standard_row_request_reply margin_top_10px">
					<div class="webkit_box">
						<div id="wrapper_btn_div" class="margin_left_50px">
							<label for="imgFileInput"><div id="imagePreview"><div class="reply_img_text_middle">+사진</div></div></label>		
							<input type="file" id="imgFileInput" name="imgFileInput">
							<input type="hidden" name="requestId" value="<%=req.getRequestId() %>">
						</div> 
						<div><textarea id="add_textarea" name="replyContent"></textarea></div>
						<div id="wrapper_btn_div"><button id="add_reply_btn" class="uk-button">완료</button></div>
					</div>
				</div>
				</form>
			</div>
<!-- ------------------------------버튼------------------------------- -->		
			<div class="webkit_box margin_top_80px" >		
				<div align="center">
					<%
						switch(RequestStatus.valueOf(req.getRequestStatus())) {
						case on:
					%>		<button class="uk-button recept_deli_btn" onclick="location.href='<%=request.getContextPath() %>/show/ondeli/cancel?requestId=<%=req.getRequestId() %>'">취소 요청</button>	<%
							break;
						case cancelByDeliver:
							if(loginUser.getUserId().equals(req.getSenderId())) {
					%>		<button class="uk-button recept_deli_btn" onclick="location.href='<%=request.getContextPath() %>/show/ondeli/cancel?requestId=<%=req.getRequestId() %>'">취소 요청 확인</button>		<%
							}
							break;
						case cancelBySender:
							if(loginUser.getUserId().equals(req.getCourierId())) {
					%>		<button class="uk-button recept_deli_btn" onclick="location.href='<%=request.getContextPath() %>/show/ondeli/cancel?requestId=<%=req.getRequestId() %>'">취소 요청 확인</button>		<%
							}
							break;
						default:
							break;
						}
					%>
					<button class="uk-button recept_deli_btn" onclick="location.href='<%=request.getContextPath() %>/report?requestId=<%=req.getRequestId() %>'">신고 하기</button>
				</div>
			</div>
		
		
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
