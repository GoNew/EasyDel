<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mylist.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<script type="text/javascript">
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="fullbrowser" style="border: 1px solid blue;">
		<div id="middlebrowser" style="border: 1px solid red;">


			<div class="uk-width-medium-1-1">

				<ul class="uk-tab" data-uk-tab="{connect:'#tab-content'}">
					<li class="uk-active"><a href="#">발송</a></li>
					<li class=""><a href="#">운송</a></li>
					<li class=""><a href="#">신고</a></li>
					<li class="uk-tab-responsive uk-active uk-hidden"><a>Tab</a>
					<div class="uk-dropdown uk-dropdown-small">
							<ul class="uk-nav uk-nav-dropdown"></ul>
							<div></div>
						</div></li>
				</ul>

				<ul id="tab-content" class="uk-switcher uk-margin">
					<li class="uk-active">
					<div id="all_mylist_sender" class="mylistsenderlist" style="border: 1px solid grey;">
					<div id="registered_requests_div" class="request_box">
						<div id="" class="subject">작성한 의뢰글</div>
						<hr>
						<div class="ajax_requests_list">
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_01" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">삭제하기</button></div></div>
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_02" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">수락</button><button class="uk-button">거절</button></div></div>
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_03" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">삭제하기</button></div></div>
						</div>
					</div>	
					<div id="processing_requests_div" class="request_box">
						<div id="" class="subject">진행중 의뢰글</div>
						<hr>
						<div class="ajax_requests_list">
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_01" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">삭제하기</button></div></div>
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_02" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">수락</button><button class="uk-button">거절</button></div></div>
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_03" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">삭제하기</button></div></div>
						</div>
					</div>	
					<div id="completed_requests_div" class="request_box">
						<div id="" class="subject">완료된 의뢰글</div>
						<hr>
						<div class="ajax_requests_list">
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_01" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">삭제하기</button></div></div>
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_02" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">수락</button><button class="uk-button">거절</button></div></div>
						<div style="border: 1px solid gray;"></div>
						<div id="Ex_request_03" class="row_request"><div class="text_middle">(신청인이 작성한 글 제목)</div><div class="text_middle">(신청 운송인 ID)</div><div><button class="uk-button">삭제하기</button></div></div>
						</div>
					</div>	
					
					<div id="progressing_requests_div">
					
					</div>		
					
					<div id="completed_requests_div">
					
					</div>		
					
					</div>
					</li>
					
					<li class="">
					<div id="all_mylist_courier" class="mylistsenderlist" style="border: 1px solid grey;">
						
							
					</div>
					</li>
					
					
					<li class="">
					<div id="all_mylist_reporter" class="mylistsenderlist" style="border: 1px solid grey;">
						
							
					</div>
					</li>
				</ul>

			</div>





		</div>
	</div>



</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
