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
	<div id="mainBox"
		class="tm-grid-truncate uk-text-center uk-container-center">
		<div id="selectBox" class="uk-grid uk-panel uk-panel-box">
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-small-1-4">출발장소</div>
				<div class="uk-width-small-1-4">서울특별시</div>
				<div class="uk-width-small-1-4">
					<select id="startPosGuList">
						<%
							for (AddressGu gu : guList) {
						%>
						<option value="<%=gu.getGuName()%>"><%=gu.getGuName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="uk-width-small-1-4">
					<select id="startPosDongList"></select>
				</div>
			</div>
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-small-1-4">도착장소</div>
				<div class="uk-width-small-1-4">서울특별시</div>
				<div class="uk-width-small-1-4">
					<select id="arrivePosGuList">
						<%
							for (AddressGu gu : guList) {
						%>
						<option value="<%=gu.getGuName()%>"><%=gu.getGuName()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="uk-width-small-1-4">
					<select id="arrivePosDongList"></select>
				</div>
			</div>
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-small-1-4">출발시각</div>
				<div class="uk-width-small-3-4">
					<input type="datetime-local" id="startTime">
				</div>
			</div>
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-small-1-4">도착시각</div>
				<div class="uk-width-small-3-4">
					<input type="datetime-local" id="arriveTime">
				</div>
			</div>
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-1-1 uk-text-center uk-button" id="exeRecommendation">추천하기</div>
			</div>
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-small-1-3 uk-button" id="sortPrice">가격 순 정렬</div>
				<div class="uk-width-small-1-3 uk-button" id="sortSenderAvg">평점 순 정렬</div>
				<div class="uk-width-small-1-3 uk-button" id="sortExpireDate">게시만료 순 정렬</div>
			</div>
			<div class="uk-grid uk-width-1-1">
				<div class="uk-width-small-1-3"></div>
				<div class="uk-width-small-1-3">
					<select id="typeFilterSelect">
						<option value="total" selected="selected">전체</option>
						<option value="nomal">단순 운송</option>
						<option value="purchase">구매 운송</option>
					</select>
				</div>
				<div class="uk-width-small-1-3">
					<select id="statusFilterSelect">
						<option value="total" selected="selected">전체</option>
						<option value="onDelivery">진행중 제외</option>
					</select>
				</div>
			</div>
		</div>
		<div id="boardBox" class="uk-grid uk-panel uk-panel-box uk-panel-box-primary">
			<table id="printBoardList" class="uk-table uk-table-hover">
			</table>
			<div class="uk-width-1-1 uk-text-center uk-button" id="selectMore">
				다음 항목 더 보기
			</div>
		</div>
	</div>

</body>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</html>
