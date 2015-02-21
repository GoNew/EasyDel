<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="easydel.entity.AddressGu"%>
<%@page import="easydel.entity.Title"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html class="uk-height-1-1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 글 보기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" />

<script type="text/javascript">
	function getStartDongList() {
		var url = "<%=request.getContextPath()%>/board/ajax/getdong";
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
		var url = "<%=request.getContextPath()%>/board/ajax/getdong";
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
	
	var pageNum = 1;
	var sort = "default";
	var typeFilter = "total";
	var statusFilter = "total";
	var sortExpireDateToggle = 0;
	
	function getAndInsertBoardList() {
		pageNum = 1;
		var url = "<%=request.getContextPath()%>/board";
		$.ajax({
			url : url,
			type : 'post',
			data : {
				pageNum: pageNum,
				delTypeFilter: typeFilter,
				statusFilter: statusFilter,
				sortType: sort
			},
			success : function(responseText) {
				$("#printBoardList").html(responseText);
			}
		});
	}
	function getAndAppendBoardList() {
		pageNum = pageNum + 1;
		var url = "<%=request.getContextPath()%>/board";
		$.ajax({
			url : url,
			type : 'post',
			data : {
				pageNum: pageNum,
				delTypeFilter: typeFilter,
				statusFilter: statusFilter,
				sortType: sort
			},
			success : function(responseText) {
				$("#printBoardList").append(responseText);
			}
		});
	}

	$(document).ready(function() {
		getAndInsertBoardList();
		getStartDongList();
		getArriveDongList();
		$("#startPosGuList").change(getStartDongList);
		$("#arrivePosGuList").change(getArriveDongList);
		
		$("#sortPrice").click(function() {
			sort = "price";
			getAndInsertBoardList();
		});
		$("#sortSenderAvg").click(function() {
			sort = "senderAvg";
			getAndInsertBoardList();
		});
		$("#sortExpireDate").click(function() {
			if(sortExpireDateToggle == 1) {
				sortExpireDateToggle = 0;
				sort = "expireDateASC";
			} else {
				sortExpireDateToggle = 1;
				sort = "expireDateDESC";
			}
			getAndInsertBoardList();
		});
		$("#typeFilterSelect").change(function() {
			typeFilter = $("#typeFilterSelect").val(); 
			getAndInsertBoardList();
		});
		$("#statusFilterSelect").change(function() {
			statusFilter = $("#statusFilterSelect").val();
			getAndInsertBoardList();
		});
		$("#selectMore").click(getAndAppendBoardList);
	});
</script>
</head>

<%
	List<AddressGu> guList = (List<AddressGu>) request
			.getAttribute("gu");
	guList = guList != null ? guList : new ArrayList<AddressGu>();
%>

<body>
	<div id="mainBox" class="uk-container-center">
		<div class="middlebrowser">
			<div id="selectBox" class="uk-panel uk-panel-box">
		
			<div class="wrapper_columm">
				<div class="same_subject_font_size">출발장소</div>
				<div class="same_font_size margin_50px_left">서울특별시</div>
				<div class="margin_50px_left">
					<select id="startPosGuList" class="same_select_font_size">
						<%
							for (AddressGu gu : guList) {
						%>
						<option value="<%=gu.getGuName()%>"><%=gu.getGuName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="margin_7px_left">
					<select id="startPosDongList" class="same_select_font_size"></select>
				</div>
			</div>
			
			<div class="wrapper_columm">
				<div class="same_subject_font_size">도착장소</div>
				<div class="same_font_size margin_50px_left">서울특별시</div>
				<div class="margin_50px_left">
					<select id="arrivePosGuList" class="same_select_font_size">
						<%
							for (AddressGu gu : guList) {
						%>
						<option value="<%=gu.getGuName()%>"><%=gu.getGuName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="margin_7px_left">
					<select id="arrivePosDongList" class="same_select_font_size"></select>
				</div>
			</div>
			
				<div class="wrapper_refer_columm">
					<div>
						<div class="wrapper_time_columm">
							<div class="uk-width-1-4 same_subject_font_size">출발시각</div>
							<div class="uk-width-2-4">
								<input type="datetime-local" class="same_date_font_size" id="startTime">
							</div>
						</div>
						
						<div class="wrapper_time_columm">
							<div class="uk-width-1-4 same_subject_font_size">도착시각</div>
							<div class="uk-width-2-4">
								<input type="datetime-local" class="same_date_font_size" id="arriveTime">
							</div>
						</div>
					</div>
					
					<div class="wrapper_recomendation_btn">
						<button class="uk-button recomendation_btn" id="exeRecommendation">추천하기</button>
					</div>
				</div>
			
		<div class="wrapper_order_columm" >
				<button class="uk-button order_btn " id="sortPrice">가격 순 정렬</button>
				<button class="uk-button order_btn " id="sortSenderAvg">평점 순 정렬</button>
				<button class="uk-button order_btn " id="sortExpireDate">게시만료 순 정렬</button>
			
				<div class="margin_small_left">
					<select id="typeFilterSelect" class="same_select_order_font_size">
						<option value="total" selected="selected">전체</option>
						<option value="nomal">단순 운송</option>
						<option value="purchase">구매 운송</option>
					</select>
				</div>
				
				<div class="">
					<select id="statusFilterSelect" class="same_select_order_font_size">
						<option value="total" selected="selected">전체</option>
						<option value="onDelivery">진행중 제외</option>
					</select>
				</div>
		</div>
		
	</div>
		
		
		<div id="boardBox" class="uk-panel uk-panel-box uk-panel-box-primary">
			<table id="printBoardList" class="uk-table uk-table-hover">
			</table>
			<div class="uk-width-1-1 uk-text-center uk-button" id="selectMore">
				다음 항목 더 보기
			</div>
		</div>
	</div>
</div>
</body>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</html>
