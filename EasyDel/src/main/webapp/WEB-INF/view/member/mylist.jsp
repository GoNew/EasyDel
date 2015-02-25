<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="easydel.contant.ReportStatus"%>
<%@page import="easydel.contant.RequestStatus"%>
<%@page import="easydel.contant.EvalStatus"%>
<%@page import="easydel.entity.ViewMySendRequest"%>
<%@page import="easydel.entity.ViewMyCarryRequest"%>
<%@page import="easydel.entity.ViewMyReportRequest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mylist.css" />
<html>
<!-- 각 경고창 모음 -->
<div id="alertMessageModalDivs">
<!-- 삭제 경고 -->
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
				<div class="uk-button uk-modal-close">돌아가기</div>
				<div class="uk-button uk-button-primary">삭제</div>
			</form>
		</div>
	</div>
</div>
<!-- 수락 경고 -->
<div id="alertMessagePopUpForAdmitMySendRequest" class="uk-modal" style="display: none; overflow-y: scroll;">
	<div class="uk-modal-dialog">
		<button type="button" class="uk-modal-close uk-close"></button>
			<div class="uk-modal-header">
				<h2>정말 수락하시겠습니까?</h2>
			</div>
		<p>의뢰 수락 후에는 취소가 매우 어렵습니다. 신중히 결정하시기 바랍니다.</p>
		<div class="uk-modal-footer uk-text-right">
			<form id="alertMessagePopUpForAdmitMySendRequestForm" method="post" action="<%=request.getContextPath() %>/mylist/send/admit">
				<input type="hidden" id="saveRequestIdForAdmitMySendRequest" name="requestId">
				<div class="uk-button uk-modal-close">돌아가기</div>
				<div class="uk-button uk-button-primary">수락</div>
			</form>
		</div>
	</div>
</div>
<!-- 거절 경고 -->
<div id="alertMessagePopUpForRejectMySendRequest" class="uk-modal" style="display: none; overflow-y: scroll;">
	<div class="uk-modal-dialog">
		<button type="button" class="uk-modal-close uk-close"></button>
			<div class="uk-modal-header">
				<h2>정말 거절하시겠습니까?</h2>
			</div>
		<p>거절 후에는 해당글은 다시 게시되어 다른 운송인들로부터 의뢰 신청을 받을 수 있습니다.</p>
		<div class="uk-modal-footer uk-text-right">
			<form id="alertMessagePopUpForRejectMySendRequestForm" method="post" action="<%=request.getContextPath() %>/mylist/send/reject">
				<input type="hidden" id="saveRequestIdForRejectMySendRequest" name="requestId">
				<div class="uk-button uk-modal-close">돌아가기</div>
				<div class="uk-button uk-button-primary">거절</div>
			</form>
		</div>
	</div>
</div>
<!-- 거래 완료 경고 -->
<div id="alertMessagePopUpForCompleteMySendRequest" class="uk-modal" style="display: none; overflow-y: scroll;">
	<div class="uk-modal-dialog">
		<button type="button" class="uk-modal-close uk-close"></button>
			<div class="uk-modal-header">
				<h2>정말 거래 완료 하시겠습니까?</h2>
			</div>
		<p>거래 완료 후에는 운송인에게 EDMoney가 전달되며, 이의제기가 매우 어렵습니다. 신중히 확인하시고 거래완료 하시기 바랍니다.</p>
		<div class="uk-modal-footer uk-text-right">
			<form id="alertMessagePopUpForCompleteMySendRequestForm" method="post" action="<%=request.getContextPath() %>/mylist/send/complete">
				<input type="hidden" id="saveRequestIdForCompleteMySendRequest" name="requestId">
				<div class="uk-button uk-modal-close">돌아가기</div>
				<div class="uk-button uk-button-primary">거래완료</div>
			</form>
		</div>
	</div>
</div>
<!-- 의뢰 신청 취소 경고 -->
<div id="alertMessagePopUpForCancelMyCourierRequest" class="uk-modal" style="display: none; overflow-y: scroll;">
	<div class="uk-modal-dialog">
		<button type="button" class="uk-modal-close uk-close"></button>
			<div class="uk-modal-header">
				<h2>정말 의뢰신청을 취소하시겠습니까?</h2>
			</div>
		<p>의뢰신청 취소 여부를 확인해주세요.</p>
		<div class="uk-modal-footer uk-text-right">
			<form id="alertMessagePopUpForCancelMyCourierRequestForm" method="post" action="<%=request.getContextPath() %>/mylist/carry/cancel">
				<input type="hidden" id="saveRequestIdForCancelMyCourierRequest" name="requestId">
				<div class="uk-button uk-modal-close">돌아가기</div>
				<div class="uk-button uk-button-primary">신청취소</div>
			</form>
		</div>
	</div>
</div>
<!-- 운송 완료 경고 -->
<div id="alertMessagePopUpForArriveMyCourierRequest" class="uk-modal" style="display: none; overflow-y: scroll;">
	<div class="uk-modal-dialog">
		<button type="button" class="uk-modal-close uk-close"></button>
			<div class="uk-modal-header">
				<h2>정말 운송완료 하시겠습니까?</h2>
			</div>
		<p>운송완료 여부를 확인해주세요.</p>
		<div class="uk-modal-footer uk-text-right">
			<form id="alertMessagePopUpForArriveMyCourierRequestForm" method="post" action="<%=request.getContextPath() %>/mylist/carry/arrive">
				<input type="hidden" id="saveRequestIdForArriveMyCourierRequest" name="requestId">
				<div class="uk-button uk-modal-close">돌아가기</div>
				<div class="uk-button uk-button-primary">운송완료</div>
			</form>
		</div>
	</div>
</div>
</div>

<%@include file="/WEB-INF/view/profile/courier" %>
<%@include file="/WEB-INF/view/profile/sender" %>

<head>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<script type="text/javascript">
	function toggleProfile(id) {
		if($("#" + id).css("display") == 'none') {
			$("#" + id).css("display", "");
		} else {
			$("#" + id).css("display", "none");
		}
	}
	function send_readyForDeleteMyRequest(id) {
		$("#saveRequestIdForDeleteMySendRequest").val(id);
	}
	function send_readyForAdmitMyRequest(id) {
		$("#saveRequestIdForAdmitMySendRequest").val(id);
	}
	function send_readyForRejectMyRequest(id) {
		$("#saveRequestIdForRejectMySendRequest").val(id);
	}
	function send_readyForCompleteMyRequest(id) {
		$("#saveRequestIdForCompleteMySendRequest").val(id);
	}
	function carry_readyForCancelMyRequest(id) {
		$("#saveRequestIdForCancelMyCourierRequest").val(id);
	}
	function carry_readyForArriveMyRequest(id) {
		console.log(id);
		$("#saveRequestIdForArriveMyCourierRequest").val(id);
	}
	$(document).ready(function() {
		$("#alertMessagePopUpForDeleteMySendRequest .uk-button-primary").click(function() {
			$("#alertMessagePopUpForDeleteMySendRequestForm").submit();
		});
		$("#alertMessagePopUpForAdmitMySendRequest .uk-button-primary").click(function() {
			$("#alertMessagePopUpForAdmitMySendRequestForm").submit();
		});
		$("#alertMessagePopUpForRejectMySendRequest .uk-button-primary").click(function() {
			$("#alertMessagePopUpForRejectMySendRequestForm").submit();
		});
		$("#alertMessagePopUpForCompleteMySendRequest .uk-button-primary").click(function() {
			$("#alertMessagePopUpForCompleteMySendRequestForm").submit();
		});
		$("#alertMessagePopUpForCancelMyCourierRequest .uk-button-primary").click(function() {
			$("#alertMessagePopUpForCancelMyCourierRequestForm").submit();
		});
		$("#alertMessagePopUpForArriveMyCourierRequest .uk-button-primary").click(function() {
			$("#alertMessagePopUpForArriveMyCourierRequestForm").submit();
		});
	});
</script>

<title>내 진행 글 보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
	<div id="fullbrowser" class="">
		<div id="middlebrowser">
			<div class="uk-width-medium-1-1">
				<ul class="uk-tab" data-uk-tab="{connect:'#tab-content'}">
					<li class="uk-active"><a href="#"><div class="tabfont">발송</div></a></li>
					<li class=""><a href="#"><div class="tabfont">운송</div></a></li>
					<li class=""><a href="#"><div class="tabfont">신고</div></a></li>
				</ul>
				
				<ul id="tab-content" class="uk-switcher uk-margin">
<!-- ******************************************발송 탭-->
					<li class="uk-active">
<!-- ==========================================작성한 의뢰글 -->
						<div id="all_mylist_sender" class="mylistsenderlist">
							<div id="registered_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">작성한 의뢰글</div>
									</div>
								</div>
								<hr>
								<div class="ajax_requests_list">
									<div class="row_request">
										<div class="uk-width-1-2"><div class="text_middle uk-text-bold text_grayColor">글 제목</div></div>
										<div class="uk-width-3-10"><div class="text_middle uk-text-bold text_grayColor">ID</div></div>
										<div class="uk-width-2-10"></div>
									</div>
									<div class="replace_standard_hr"></div>
								</div>
									
									
								<div class="ajax_requests_list">
									<%	for (ViewMySendRequest req : sendListBeforeDel) {	%>
									<div class="row_request text_lightgrayColor">
										<div class="uk-width-1-2"><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/predeli?requestId=<%=req.getRequestId() %>'">
											<%=req.getCargoName()%>
										</div></div>
									<%		if (req.getRequestStatus() == RequestStatus.request.getStatusCode()) {	%>
										<div class="uk-width-3-10">
										</div>
										<div class="uk-width-2-10 button_middle">
											<div class="uk-button uk-width-2-3" onclick="send_readyForDeleteMyRequest('<%=req.getRequestId()%>')" data-uk-modal="{target:'#alertMessagePopUpForDeleteMySendRequest'}">삭제하기</div>
										</div>
									</div>
									<div class="replace_hr text_lightgrayColor"></div>
									<%		} else {	%>
										<div class="uk-width-3-10">
											<div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId()%>')"><%=req.getUserId()%></div>
										</div>
										<div class="uk-width-2-10 button_middle">
											<div class="uk-button uk-width-1-3" onclick="send_readyForAdmitMyRequest('<%=req.getRequestId()%>')" data-uk-modal="{target:'#alertMessagePopUpForAdmitMySendRequest'}">수락</div>
											<div class="uk-button uk-width-1-3" onclick="send_readyForRejectMyRequest('<%=req.getRequestId()%>')" data-uk-modal="{target:'#alertMessagePopUpForRejectMySendRequest'}">거절</div>
										</div>
										
								</div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<%@include file="/WEB-INF/view/member/mylistCourierProfile" %>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
								<div class="replace_hr"></div>
									<%		}	%>
									<%	}	%>
							</div>
<!-- ==========================================진행중 의뢰글 -->
							<div id="processing_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">진행중 의뢰글</div>
									</div>
								</div>
								<hr>
								
								<div class="ajax_requests_list">
									<div class="row_request">
										<div class="uk-width-1-2"><div class="text_middle uk-text-bold text_grayColor">글 제목</div></div>
										<div class="uk-width-3-10"><div class="text_middle uk-text-bold text_grayColor">ID</div></div>
										<div class="uk-width-2-10"></div>
									</div>
									<div class="replace_standard_hr"></div>
								</div>
								
								<div class="ajax_requests_list">
									<%	for (ViewMySendRequest req : sendListOnDel) {	%>
									<%		if(req.getRequestStatus() == RequestStatus.cancelByDeliver.getStatusCode()) {	%>
									<div class="row_request pannel-cancel ">
									<%		} else {	%>
									<div class="row_request text_lightgrayColor">
									<%		}	%>
										<div class="uk-width-1-2 "><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/ondeli?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-3-10"><div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId()%>')"><%=req.getUserId()%></div></div>
									<%		if(req.getRequestStatus() == RequestStatus.arrive.getStatusCode()) {	%>
										<div class="button_middle uk-width-2-10"><div class="uk-button uk-width-2-3" onclick="send_readyForCompleteMyRequest('<%=req.getRequestId()%>')" data-uk-modal="{target:'#alertMessagePopUpForCompleteMySendRequest'}">거래완료</div></div>
									<%		} else { %>
										<div class="uk-width-2-10"></div>
									<%		}	%>
									</div>
									<div class="replace_hr text_lightgrayColor"></div>
									
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<%@include file="/WEB-INF/view/member/mylistCourierProfile" %>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
									<%	}	%>
									</div>
								
								</div>
							</div>
<!-- ==========================================완료된 의뢰글 -->
							<div id="completed_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">완료된 의뢰글<div style="color: red; margin-left: 5px;">(7일이 지나면 자동 삭제됩니다.)</div></div>
									</div>
								</div>
								<hr>
								
								<div class="ajax_requests_list">
									<div class="row_request">
										<div class="uk-width-1-2"><div class="text_middle uk-text-bold text_grayColor">글 제목</div></div>
										<div class="uk-width-3-10"><div class="text_middle uk-text-bold text_grayColor">ID</div></div>
										<div class="uk-width-2-10"></div>
									</div>
									<div class="replace_standard_hr"></div>
								</div>
								
								<div class="ajax_requests_list">
									<%	for (ViewMySendRequest req : sendListAfterDel) {	%>
									<%		if(req.getSenderEvalstatus().equals(EvalStatus.beforeEval.getStatusCode())) {	%>
									<div class="row_request text_lightgrayColor">
									<%		} else {	%>
									<div class="row_request uk-panel-box-primary">
									<%		}	%>
										<div class="uk-width-1-2"><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/enddeli?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-3-10"><div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId()%>')"><%=req.getUserId()%></div></div>
									<%		if(req.getSenderEvalstatus().equals(EvalStatus.beforeEval.getStatusCode())) {	%>
										<div class="uk-width-2-10 button_middle"><div class="uk-button uk-width-2-3" onclick="location.href='<%=request.getContextPath() %>/eval/courier?requestId=<%=req.getRequestId() %>'">평가하기</div></div>
									<%		} else {	%>
										<div class="uk-width-2-10"><div class="text_middle">평가완료</div></div>
									<%		}	%>
									</div>
								<div class="replace_hr text_lightgrayColor"></div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<%@include file="/WEB-INF/view/member/mylistCourierProfile" %>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
									<%	} %>
								</div>
							</div>
						</div>
					</li>

<!-- ******************************************운송 탭********************************************************************************-->					
					<li class="">
						<div id="all_mylist_courier" class="mylistsenderlist">
<!-- ==========================================의뢰 수락을 기다리고 있는 의뢰글 -->				
							<div id="registered_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">의뢰 수락을 기다리고 있는 의뢰글</div>	
									</div>
								</div>
								
								<hr>
								
								<div class="ajax_requests_list">
									<div class="row_request">
										<div class="uk-width-2-5"><div class="text_middle uk-text-bold text_grayColor">글 제목</div></div>
										<div class="uk-width-1-5"><div class="text_middle uk-text-bold text_grayColor">ID</div></div>
										<div class="uk-width-1-5"><div class="text_middle uk-text-bold text_grayColor">남은 시간</div></div>
										<div class="uk-width-1-5"></div>
									</div>
									<div class="replace_standard_hr"></div>
								</div>
								
								<div class="ajax_requests_list">
									<%	for(ViewMyCarryRequest req: carryListBeforeDel) {	%>
									<div class="row_request text_lightgrayColor">
										<div class="uk-width-2-5"><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/predeli?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-1-5"><div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId()%>')"><%=req.getUserId() %></div></div>
									<%	Date currDate = new Date();	%>
										<div class="uk-width-1-5 webkit_box"><div class="text_middle right_margin_5px">TimeOut:</div><div class="text_middle webkit_box"><%=(req.getExpireDate().getTime()-currDate.getTime())/6000 %><div>분</div></div></div>
										<div class="uk-width-1-5 button_middle"><div class="uk-button uk-width-2-3" onclick="carry_readyForCancelMyRequest('<%=req.getRequestId()%>')" data-uk-modal="{target:'#alertMessagePopUpForCancelMyCourierRequest'}">신청취소</div></div>
									</div>
									<div class="replace_hr text_lightgrayColor"></div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<%@include file="/WEB-INF/view/member/mylistSenderProfile" %>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
									<%	}	%>
								</div>
							</div>
							<div id="processing_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">수행 중 의뢰글</div>
									</div>
								</div>
								<hr>
								
								<div class="ajax_requests_list">
									<div class="row_request">
										<div class="uk-width-1-2"><div class="text_middle uk-text-bold text_grayColor">글 제목</div></div>
										<div class="uk-width-3-10"><div class="text_middle uk-text-bold text_grayColor">ID</div></div>
										<div class="uk-width-2-10"></div>
									</div>
									<div class="replace_standard_hr"></div>
								</div>
								
								<div class="ajax_requests_list">
									<%	for(ViewMyCarryRequest req: carryListOnDel) {	%>
									<%		if(req.getRequestStatus() == RequestStatus.cancelBySender.getStatusCode()) {	%>
									<div class="row_request pannel-cancel">
									<%		} else {	%>
									<div class="row_request text_lightgrayColor">
									<%		}	%>
										<div class="uk-width-1-2 "><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/ondeli?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-3-10"><div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId()%>')"><%=req.getUserId() %></div></div>
									<%		if(req.getRequestStatus() == RequestStatus.arrive.getStatusCode()) {	%>
										<div class="button_middle uk-width-2-10"><div class="uk-button uk-width-2-3">인증하기</div></div>
									<%		} else {	%>
										<div class="button_middle uk-width-2-10"><div class="uk-button uk-width-2-3" onclick="carry_readyForArriveMyRequest('<%=req.getRequestId()%>')" data-uk-modal="{target:'#alertMessagePopUpForArriveMyCourierRequest'}">운송완료</div></div>
									<%		}	%>
									</div>
									<div class="replace_hr text_lightgrayColor"></div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<%@include file="/WEB-INF/view/member/mylistSenderProfile" %>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
									<%	}	%>
								</div>
							</div>
							<div id="completed_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">완료된 의뢰글 <div style="color: red; margin-left: 5px;"> (7일이 지나면 자동 삭제됩니다.)</div></div>
									</div>
								</div>
								<hr>
								
								<div class="ajax_requests_list">
									<div class="row_request">
										<div class="uk-width-1-2"><div class="text_middle uk-text-bold text_grayColor">글 제목</div></div>
										<div class="uk-width-3-10"><div class="text_middle uk-text-bold text_grayColor">ID</div></div>
										<div class="uk-width-2-10"></div>
									</div>
									<div class="replace_standard_hr"></div>
								</div>
								
								<div class="ajax_requests_list">
									<%	for(ViewMyCarryRequest req: carryListAfterDel) {	%>
									<%		if(req.getCourierEvalstatus().equals(EvalStatus.beforeEval.getStatusCode())) {	%>
									<div class="row_request text_lightgrayColor">
									<%		} else {	%>
									<div class="row_request uk-panel-box-primary">
									<%		}	%>
										<div class="uk-width-1-2"><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/enddeli?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-3-10"><div class="text_middle" onclick="toggleProfile('_profile_request_id_<%=req.getRequestId()%>')"><%=req.getUserId() %></div></div>
									<%		if(req.getCourierEvalstatus().equals(EvalStatus.beforeEval.getStatusCode())) {	%>
										<div class="uk-width-2-10 button_middle"><div class="uk-button uk-width-2-3" onclick="location.href='<%=request.getContextPath() %>/eval/sender?requestId=<%=req.getRequestId() %>'">평가하기</div></div>
									<%		} else {	%>
										<div class="uk-width-2-10"><div class="text_middle">평가완료</div></div>
									<%		}	%>
									</div>
									<div class="replace_hr text_lightgrayColor"></div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<%@include file="/WEB-INF/view/member/mylistSenderProfile" %>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->
									<%	}	%>
								</div>
							</div>
						</div>
					</li>

<!-- ******************************************신고 탭************************************************************************************-->					
					<li class="">
						<div id="all_mylist_reporter" class="mylistsenderlist">
							<div id="registered_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div class="subject">나의 신고 현황<div style="color: red; margin-left: 5px;"> (처리 완료된 글은 30일 후에 지워집니다.)</div></div>
									</div>
								</div>
								<hr>
						<!-- List<ViewMyReportRequest> reportListReported = (List<ViewMyReportRequest>) request.getAttribute("reportListReported"); -->
								<div class="ajax_requests_list">
									<div class="row_request uk-text-bold text_grayColor">
										<div class="uk-width-3-10"><div class="text_middle">신고 글 제목</div></div>
										<div class="uk-width-2-10"><div class="text_middle">신고 대상</div></div>
										<div class="uk-width-2-10"><div class="text_middle">신고사유</div></div>
										<div class="uk-width-2-10"><div class="text_middle">신고일</div></div>
										<div class="uk-width-1-10"><div class="text_middle">상태</div></div>
									</div>
									<div class="replace_report_subject_hr"></div>
									<%	for (ViewMyReportRequest req : reportListReport) {	%>
									<div class="row_request right_margin_20px ">
										<div class="uk-width-3-10"><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/reported?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-2-10"><div class="text_middle"><%=req.getReportedUserId() %></div></div>
										<div class="uk-width-2-10"><div class="text_middle"><%=req.getReportTypeDesc() %></div></div>
										<div class="uk-width-2-10"><div class="text_middle_small"><%=req.getReportDate() %></div></div>
										<div class="uk-width-1-10"><div class="text_middle">
									<%
											switch(ReportStatus.valueOf(req.getReportStatus())) {
											case reportAfterTraitement:
												out.print("처리 완료");
												break;
											case reportOnProcess:
												out.print("처리 중");
												break;
											default:
												break;
											}
									%>
										</div></div>
									</div>
									<div class="replace_report_hr"></div>
									<%	}	%>
								</div>	
							</div>
							
							<div id="registered_requests_div" class="request_box">
								<div class="webkit_box">
									<img id="icon" src= "<%=request.getContextPath()%>/img/abc.png"/>
									<div>
										<div style="height:5px"></div>
										<div id="" class="subject">신고 받은 현황</div>	
									</div>
								</div>
								<hr>
									<div class="ajax_requests_list">
									<div id="Ex_request_01" class="row_request uk-text-bold text_grayColor">
										<div class="uk-width-2-5"><div class="text_middle">신고 처리된 글 제목</div></div>
										<div class="uk-width-1-5"><div class="text_middle">신고사유</div></div>
										<div class="uk-width-1-5"><div class="text_middle">신고일</div></div>
										<div class="uk-width-1-5"><div class="text_middle">상태</div></div>
									</div>
									<div class="replace_report_subject_hr"></div>
									<%	for (ViewMyReportRequest req : reportListReported) {	%>
									<div id="Ex_request_01" class="row_request right_margin_20px">
										<div class="uk-width-2-5"><div class="text_middle" onclick="location.href='<%=request.getContextPath() %>/show/reported?requestId=<%=req.getRequestId() %>'"><%=req.getCargoName() %></div></div>
										<div class="uk-width-1-5"><div class="text_middle"><%=req.getReportTypeDesc() %></div></div>
										<div class="uk-width-1-5"><div class="text_middle_small"><%=req.getReportDate() %></div></div>
										<div class="uk-width-1-5"><div class="text_middle">
									<%
											switch(ReportStatus.valueOf(req.getReportStatus())) {
											case reportAfterTraitement:
												out.print("처리 완료");
												break;
											case reportOnProcess:
												out.print("처리 중");
												break;
											default:
												break;
											}
									%>
										</div></div>
									</div>
									<div class="replace_report_hr"></div>
									<%	}	%>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</html>
