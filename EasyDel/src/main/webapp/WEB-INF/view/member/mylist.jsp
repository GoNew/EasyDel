<%@page import="easydel.contant.RequestStatus"%>
<%@page import="easydel.entity.ViewMySendRequest"%>
<%@page import="easydel.entity.ViewMyCarryRequest"%>
<%@page import="easydel.entity.ViewMyReportRequest"%>
<%@page import="java.util.List"%>
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
	function toggleProfile(id) {
		if($("#" + id).css("display") == 'none') {
			$("#" + id).css("display", "");
		} else {
			$("#" + id).css("display", "none");
		}
		return true;
	}
	function send_readyForDeleteMyRequest(id) {
		$("#saveRequestIdForDeleteMySendRequest").val(id);
	}
	$(document).ready(function() {
		$("#alertMessagePopUpForDeleteMySendRequest .uk-button-primary").click(function() {
			console.log("asdfasdf");
			$("#alertMessagePopUpForDeleteMySendRequestForm").submit();
		});
	});
</script>
<%
	List<ViewMyCarryRequest> carryListBeforeDel = (List<ViewMyCarryRequest>) request.getAttribute("carryListBeforeDel");
	List<ViewMyCarryRequest> carryListOnDel = (List<ViewMyCarryRequest>) request.getAttribute("carryListOnDel");
	List<ViewMyCarryRequest> carryListAfterDel = (List<ViewMyCarryRequest>) request.getAttribute("carryListAfterDel");
	
	List<ViewMyReportRequest> reportListReport = (List<ViewMyReportRequest>) request.getAttribute("reportListReport");
	List<ViewMyReportRequest> reportListReported = (List<ViewMyReportRequest>) request.getAttribute("reportListReported");
	
	List<ViewMySendRequest> sendListBeforeDel = (List<ViewMySendRequest>) request.getAttribute("sendListBeforeDel");
	List<ViewMySendRequest> sendListOnDel = (List<ViewMySendRequest>) request.getAttribute("sendListOnDel");
	List<ViewMySendRequest> sendListAfterDel = (List<ViewMySendRequest>) request.getAttribute("sendListAfterDel");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 진행 글 보기</title>
	<div id="alertMessagePopUpForDeleteMySendRequest" class="uk-modal" style="display: none; overflow-y: scroll;">
		<div class="uk-modal-dialog">
			<button type="button" class="uk-modal-close uk-close"></button>
				<div class="uk-modal-header">
					<h2>정말 삭제하시겠습니까?</h2>
				</div>
			<p>삭제하시면 해당 글은 닷~시~는 복구할 수 없습니다.</p>
			<div class="uk-modal-footer uk-text-right">
				<form id="alertMessagePopUpForDeleteMySendRequestForm" method="post" action="<%=request.getContextPath() %>/mylist/send/delete">
					<input type="hidden" id="saveRequestIdForDeleteMySendRequest" name="requestId">
					<div class="uk-button uk-modal-close">취소</div>
					<div class="uk-button uk-button-primary">삭제</div>
				</form>
			</div>
		</div>
	</div>
</head>
<body>
	                        
	<div id="fullbrowser">
		<div id="middlebrowser">


			<div class="uk-width-medium-1-1">

				<ul class="uk-tab" data-uk-tab="{connect:'#tab-content'}">
					<li class="uk-active"><a href="#"><div class="tabfont">발송</div></a></li>
					<li class=""><a href="#"><div class="tabfont">운송</div></a></li>
					<li class=""><a href="#"><div class="tabfont">신고</div></a></li>
					<li class="uk-tab-responsive uk-active uk-hidden"><a>Tab</a>
					<div class="uk-dropdown uk-dropdown-small">
							<ul class="uk-nav uk-nav-dropdown"></ul>
							<div></div>
						</div></li>
				</ul>

				<ul id="tab-content" class="uk-switcher uk-margin">

<!-- ******************************************발송 탭-->					
					<li class="uk-active">
					<div id="all_mylist_sender" class="mylistsenderlist">
					<div id="registered_requests_div" class="request_box">
						<div class="subject">작성한 의뢰글</div>
						<hr>
						<div class="ajax_requests_list">
							<%	for(ViewMySendRequest req: sendListBeforeDel) {	%>
							<div class="replace_hr"></div>
								<div class="row_request ">
									<div class="uk-width-1-2">
										<div class="text_middle"><%= req.getCargoName() %></div>
									</div>
									<div class="uk-width-3-10">
							<%		if(req.getRequestStatus() == RequestStatus.wait.getStatusCode()) {	%>
										<div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId() %>')"><%=req.getUserId() %></div>
									</div>
									<div class="uk-width-2-10 button_middle" >
										<div class="uk-button uk-width-1-3" onclick="location.href('#')">수락</div>
										<div class="uk-button uk-width-1-3" onclick="location.href('#')">거절</div>
									</div>
								</div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
								<div style="display: none" class="courier_info_box uk-panel-box" id="_profile_request_id_<%=req.getRequestId() %>">
									<div class="webkit_box row_request">
										<div id="subject_grade_info" class="uk-width-1-3 webkit_box row_request" >
											<div class="margin_small uk-text-bold"><%=req.getRequestId() %></div>
											<div class="margin_small uk-text-bold">평가정보</div>
										</div>
								
										<div class="uk-width-1-3"></div>

										<div align="right" class="uk-width-1-3 button_middle">
											<div class="uk-button uk-width-1-2" onclick="location.href('#')">프로필 자세히 보기</div>
										</div>
									</div>

									<div class="row_request_details"> 
										<div class="webkit_box text_middle uk-width-1-4">
											<div style="margin: 0px auto; display: -webkit-box">
											<div class=""><img class="grade_icon" src="<%=request.getContextPath()%>/img/time.png"></div>
											<div id="grade_text" style="margin-left: 10px" class="webkit_box">
												<div id="time_grade" class="text_middle_grade"><%=req.getCourierAvgTime() %></div>
												<div class="text_middle_grade">점</div>
											</div>
											</div>
										</div>
										
										<div class="webkit_box text_middle uk-width-1-4">
											<div style="margin: 0px auto; display: -webkit-box">
												<div class=""><img class="grade_icon" src="<%=request.getContextPath()%>/img/safe.jpg"></div>
												<div id="grade_text" style="margin-left: 10px" class="webkit_box">
													<div id="safe_grade" class="text_middle_grade"><%=req.getCourierAvgSafe() %></div>
													<div class="text_middle_grade">점</div>
												</div>
											</div>
										</div>		

										<div class="webkit_box text_middle uk-width-1-4">
											<div style="margin: 0px auto; display: -webkit-box">
												<div class=""><img class="grade_icon" src="<%=request.getContextPath()%>/img/smile.jpg"></div>
												<div id="grade_text" style="margin-left: 10px" class="webkit_box">
													<div id="smile_grade" class="text_middle_grade"><%=req.getCourierAvgKind() %></div>
													<div class="text_middle_grade">점</div>
											</div>
											</div>
										</div>	
								
										<div class="webkit_box text_middle uk-width-1-4">
											<div style="margin: 0px auto; display: -webkit-box">
												<div id="grade_text" class="text_middle_grade">성사율</div>
												<div id="grade_text" style="margin-left: 10px" class="webkit_box">
													<div id="transaction_rate" class="text_middle_grade">
														<%=String.format("%.1f" , (double)req.getCourierSuccesscnt() / req.getCourierTotalcnt() * 100.0) %>
													</div>
													<div class="text_middle_grade">%</div> 
												</div>
											</div>
										</div> 
									</div>
								</div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
							<%	} else { %>
									</div>
									<div class="uk-width-2-10 button_middle">
										<div class="uk-button uk-width-2-3" onclick="send_readyForDeleteMyRequest('<%=req.getRequestId() %>')"
											data-uk-modal="{target:'#alertMessagePopUpForDeleteMySendRequest'}">삭제하기</div>
									</div>
								</div>
							<%
									}
								}
							%>
						<div class="replace_hr"></div>
					</div>
						
					<div id="processing_requests_div" class="request_box">
						<div class="subject">진행중 의뢰글</div>
						<hr>
						<div class="ajax_requests_list">
							<div class="replace_hr"></div>
							<div id="Ex_progress_01" class="row_request"><div class="uk-width-1-2 "><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(신청 운송인 ID)</div></div><div class="uk-width-2-10"></div></div>
							<div class="replace_hr"></div>
							<div id="Ex_progress_cancel_02" class="row_request pannel-cancel"><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(신청 운송인 ID)</div></div><div class="uk-width-2-10"></div></div>
							<div class="replace_hr"></div>
							
							<div id="Ex_progress_03" class="row_request"><div class="uk-width-1-2"><div class="text_middle" >(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(신청 운송인 ID)</div></div><div class="button_middle uk-width-2-10"><button class="uk-button uk-width-2-3">거래완료</button></div></div>
							<div class="replace_hr"></div>
						</div>
					</div>	
					<div id="completed_requests_div" class="request_box">
						<div id="" class="subject">완료된 의뢰글 <div style="color: red; margin-left: 5px;"> (7일이 지나면 자동 삭제됩니다.)</div></div>
						<hr>
						<div class="ajax_requests_list">
						<div class="replace_hr"></div>
						<div id="Ex_completed_01" class="row_request "><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(신청 운송인 ID)</div></div><div class="uk-width-2-10 button_middle"><button class="uk-button uk-width-2-3">평가하기</button></div></div>
						<div class="replace_hr"></div>
						<div id="Ex_completed_02" class="row_request uk-panel-box-primary"><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(신청 운송인 ID)</div></div><div class="uk-width-2-10"><div class="text_middle">평가완료</div></div></div>
						<div class="replace_hr"></div>
						<div id="Ex_completed_03" class="row_request"><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(신청 운송인 ID)</div></div><div class="uk-width-2-10 button_middle"><button class="uk-button uk-width-2-3">평가하기</button></div></div>
						<div class="replace_hr"></div>
						</div>
					</div>	
					
					</div>
					</li>
					
<!-- ******************************************운송 탭********************************************************************************-->					
					<li class="">
					<div id="all_mylist_courier" class="mylistsenderlist">
					
					<div id="registered_requests_div" class="request_box">
						<div id="" class="subject">의뢰 수락을 기다리고 있는 의뢰글</div>
						<hr>
							<div class="ajax_requests_list">
						<div class="replace_hr"></div>
							<div id="Ex_request_01" class="row_request">
								<div class="uk-width-2-5"><div class="text_middle">(신청인이 작성한 글 제목)</div></div>
								<div class="uk-width-1-5"><div class="text_middle">(발송인 ID)</div></div>
								<div class="uk-width-1-5 webkit_box"><div class="text_middle right_margin_5px">TimeOut:</div><div class="text_middle webkit_box">20<div>분</div></div></div>
								<div class="uk-width-1-5 button_middle"><button class="uk-button uk-width-2-3">삭제하기</button></div>
							</div>
						<div class="replace_hr"></div>
							<div id="Ex_request_02" class="row_request">
								<div class="uk-width-2-5"><div class="text_middle">(신청인이 작성한 글 제목)</div></div>
								<div class="uk-width-1-5"><div class="text_middle">(발송인 ID)</div></div>
								<div class="uk-width-1-5 webkit_box"><div class="text_middle right_margin_5px">TimeOut:</div><div class="text_middle webkit_box">20<div>분</div></div></div>
								<div class="uk-width-1-5 button_middle"><button class="uk-button uk-width-2-3">삭제하기</button></div>
							</div>
						<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->					
						<div style="display: none;" class="sender_info_box uk-panel-box">
							<div class="webkit_box row_request">
								<div id="subject_grade_info" class="uk-width-1-3 webkit_box row_request" >
									<div class="margin_small uk-text-bold">(신청 운송인 ID)</div>
									<div class="margin_small uk-text-bold">평가정보</div>
								</div>
								
								<div class="uk-width-1-3"></div>
								
								<div align="right" class="uk-width-1-3 button_middle">
										<button class="uk-button uk-width-1-2">
											<div>프로필 자세히 보기</div>
										</button>
								</div>
							</div>
							
							<div class="row_request_details"> 
									<div class="webkit_box text_middle uk-width-1-4">
										<div style="margin: 0px auto; display: -webkit-box">
										<div class=""><img class="grade_icon" src="<%=request.getContextPath()%>/img/time.png"></div>
										<div id="grade_text" style="margin-left: 10px" class="webkit_box">
											<div id="time_grade" class="text_middle_grade">3</div>
											<div class="text_middle_grade">점</div>
										</div>
										</div>
									</div>
									
									<div class="webkit_box text_middle uk-width-1-4">
										<div style="margin: 0px auto; display: -webkit-box">
											<div class=""><img class="grade_icon" src="<%=request.getContextPath()%>/img/safe.jpg"></div>
											<div id="grade_text" style="margin-left: 10px" class="webkit_box">
												<div id="safe_grade" class="text_middle_grade">3</div>
												<div class="text_middle_grade">점</div>
											</div>
										</div>
									</div>
								
								<div class="webkit_box text_middle uk-width-1-4">
									<div style="margin: 0px auto; display: -webkit-box">
										<div class=""><img class="grade_icon" src="<%=request.getContextPath()%>/img/smile.jpg"></div>
										<div id="grade_text" style="margin-left: 10px" class="webkit_box">
											<div id="smile_grade" class="text_middle_grade">3</div>
											<div class="text_middle_grade">점</div>
										</div>
									</div>
								</div>
								
								<div class="webkit_box text_middle uk-width-1-4">
									<div style="margin: 0px auto; display: -webkit-box">
										<div id="grade_text" id="grade_text" class="text_middle_grade">거래율</div>
										<div id="grade_text" style="margin-left: 10px" class="webkit_box">
											<div id="transaction_rate" class="text_middle_grade">100</div>
											<div class="text_middle_grade">%</div> 
										</div>
									</div>
								</div> 
							</div>
						</div>
				<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
						<div class="replace_hr"></div>
							<div id="Ex_request_03" class="row_request">
								<div class="uk-width-2-5"><div class="text_middle">(신청인이 작성한 글 제목)</div></div>
								<div class="uk-width-1-5"><div class="text_middle">(발송인 ID)</div></div>
								<div class="uk-width-1-5 webkit_box"><div class="text_middle right_margin_5px" >TimeOut:</div><div class="text_middle webkit_box">20<div>분</div></div></div>
								<div class="uk-width-1-5 button_middle"><button class="uk-button uk-width-2-3">삭제하기</button></div>
							</div>
						<div class="replace_hr"></div>
							</div>
					</div>	
					
					<div id="processing_requests_div" class="request_box">
						<div id="" class="subject">수행 중 의뢰글</div>
						<hr>
							<div class="ajax_requests_list">
						<div class="replace_hr"></div>
							<div id="Ex_progress_01" class="row_request"><div class="uk-width-1-2 "><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(발송인 ID)</div></div><div class="button_middle uk-width-2-10"><button class="uk-button uk-width-2-3">운송완료</button></div></div>
						<div class="replace_hr"></div>
							<div id="Ex_progress_cancel_02" class="row_request pannel-cancel"><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(발송인 ID)</div></div><div class="button_middle uk-width-2-10"><button class="uk-button uk-width-2-3">운송완료</button></div></div>
						<div class="replace_hr"></div>
							<div id="Ex_progress_03" class="row_request"><div class="uk-width-1-2"><div class="text_middle" >(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(발송인 ID)</div></div><div class="button_middle uk-width-2-10"><button class="uk-button uk-width-2-3">인증하기</button></div></div>
						<div class="replace_hr"></div>
							</div>
					</div>	
					
					<div id="completed_requests_div" class="request_box">
						<div id="" class="subject">완료된 의뢰글 <div style="color: red; margin-left: 5px;"> (7일이 지나면 자동 삭제됩니다.)</div></div>
						<hr>
							<div class="ajax_requests_list">
						<div class="replace_hr"></div>
							<div id="Ex_completed_01" class="row_request "><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(발송인 ID)</div></div><div class="uk-width-2-10 button_middle"><button class="uk-button uk-width-2-3">평가하기</button></div></div>
						<div class="replace_hr"></div>
							<div id="Ex_completed_02" class="row_request uk-panel-box-primary"><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(발송인 ID)</div></div><div class="uk-width-2-10"><div class="text_middle">평가완료</div></div></div>
						<div class="replace_hr"></div>
							<div id="Ex_completed_03" class="row_request"><div class="uk-width-1-2"><div class="text_middle">(신청인이 작성한 글 제목)</div></div><div class="uk-width-3-10"><div class="text_middle">(발송인 ID)</div></div><div class="uk-width-2-10 button_middle"><button class="uk-button uk-width-2-3">평가하기</button></div></div>
						<div class="replace_hr"></div>
							</div>
					</div>		
							
					</div>
					</li>
					
					
<!-- ******************************************신고 탭************************************************************************************-->					
					<li class="">
					<div id="all_mylist_reporter" class="mylistsenderlist" >
					<div id="registered_requests_div" class="request_box">
						<div id="" class="subject">나의 신고 현황<div style="color: red; margin-left: 5px;"> (처리 완료된 글은 30일 후에 지워집니다.)</div></div>
						<hr>
							<div class="ajax_requests_list">
							<div id="Ex_request_01" class="row_request uk-text-bold">
								<div class="uk-width-3-10"><div class="text_middle">신고 글 제목</div></div>
								<div class="uk-width-2-10"><div class="text_middle">신고 대상</div></div>
								<div class="uk-width-2-10"><div class="text_middle">신고사유</div></div>
								<div class="uk-width-2-10"><div class="text_middle">신고일</div></div>
								<div class="uk-width-1-10"><div class="text_middle">상태</div></div>
							</div>
						<div class="replace_report_subject_hr"></div>
							<div id="Ex_request_01" class="row_request right_margin_20px">
								<div class="uk-width-3-10"><div class="text_middle">/신고 글 제목</div></div>
								<div class="uk-width-2-10"><div class="text_middle">/신고 대상</div></div>
								<div class="uk-width-2-10"><div class="text_middle">/신고사유</div></div>
								<div class="uk-width-2-10"><div class="text_middle_small">//2015.01.14 19:30</div></div>
								<div class="uk-width-1-10"><div class="text_middle">처리중</div></div>
							</div>
						<div class="replace_report_hr"></div>
							<div id="Ex_request_01" class="row_request right_margin_20px">
								<div class="uk-width-3-10"><div class="text_middle">/신고 글 제목</div></div>
								<div class="uk-width-2-10"><div class="text_middle">/신고 대상</div></div>
								<div class="uk-width-2-10"><div class="text_middle">/신고사유</div></div>
								<div class="uk-width-2-10"><div class="text_middle_small">/신고일</div></div>
								<div class="uk-width-1-10"><div class="text_middle">처리완료</div></div>
							</div>
						<div class="replace_report_hr"></div>
							</div>	
							</div>
							
							
					<div id="registered_requests_div" class="request_box">
						<div id="" class="subject">신고 받은 현황</div>
						<hr>
							<div class="ajax_requests_list">
							<div id="Ex_request_01" class="row_request uk-text-bold">
								<div class="uk-width-2-5"><div class="text_middle">신고 처리된 글 제목</div></div>
								<div class="uk-width-1-5"><div class="text_middle">신고사유</div></div>
								<div class="uk-width-1-5"><div class="text_middle">신고일</div></div>
								<div class="uk-width-1-5"><div class="text_middle">상태</div></div>
							</div>
						<div class="replace_report_subject_hr"></div>
							<div id="Ex_request_01" class="row_request right_margin_20px">
								<div class="uk-width-2-5"><div class="text_middle">/신고 글 제목</div></div>
								<div class="uk-width-1-5"><div class="text_middle">/신고사유</div></div>
								<div class="uk-width-1-5"><div class="text_middle_small">/2015.01.14 19:30</div></div>
								<div class="uk-width-1-5"><div class="text_middle">/상태</div></div>
							</div>
						<div class="replace_report_hr"></div>
							<div id="Ex_request_01" class="row_request right_margin_20px">
								<div class="uk-width-2-5"><div class="text_middle">/신고 글 제목</div></div>
								<div class="uk-width-1-5"><div class="text_middle">/신고사유</div></div>
								<div class="uk-width-1-5"><div class="text_middle_small">/신고일</div></div>
								<div class="uk-width-1-5"><div class="text_middle">/상태</div></div>
							</div>
						<div class="replace_report_hr"></div>
							</div>	
							</div>
					</div>
					</li>
				</ul>

			</div>





		</div>
	</div>

</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
