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

	$(document).ready(function() {
		getStartDongList();
		getArriveDongList();
		$("#startPosGuList").change(getStartDongList);
		$("#arrivePosGuList").change(getArriveDongList);
		
		/* sortPrice
		sortSenderAvg
		sortExpireDate
		typeFilterSelect
		statusFilterSelect */
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
		<div id="selectBox" class="uk-panel uk-panel-box">
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
				<div class="uk-button" id="exeRecommendation">추천하기</div>
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
		<div id="boardBox" class="uk-panel uk-panel-box-primary">
			<table id="printBoardList">
			</table>
		</div>
	</div>

</body>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</html>
