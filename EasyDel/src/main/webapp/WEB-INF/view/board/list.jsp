<%@page import="easydel.entity.AddressGu"%>
<%@page import="easydel.entity.Title"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html class="uk-height-1-1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 글 보기</title>
<script type="text/javascript">
	
	function getStartDongList() {
		var url = "<%=request.getContextPath() %>/board/ajax/getdong";
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
		var url = "<%=request.getContextPath() %>/board/ajax/getdong";
		$.ajax({
			url: url,
			type: 'get',
			data: {
				guName: $("#arrivePosDongList").val()
			},
			success: function(responseText) {
				$("#arrivePosDongList").html(responseText);
			}
		});
	}
	
	$(document).ready(function() {
		$("#startPosGuList").change(getStartDongList);
		$("#arrivePosGuList").change(getArriveDongList);
	});
</script>
</head>
<body>

<div class="uk-height-1-1 uk-grid">
	<div class="uk-width-small-1-5">
		출발장소
	</div>
	<div class="uk-width-small-1-5">
		서울특별시
	</div>
	<div class="uk-width-small-1-5">
		<select id="startPosGuList">
			<%
				List<AddressGu> guList = (List<AddressGu>) request.getAttribute("gu");
				for(AddressGu gu: guList) {
			%>
					<option value="<%=gu.getGuName() %>"><%=gu.getGuName() %></option>
			<%
				}
			%>
		</select>
	</div>
	<div class="uk-width-small-1-5">
		<select id="startPosDongList"></select>
	</div>
</div>
<div class="uk-height-1-1 uk-grid">
	<div class="uk-width-small-1-5">
		도착장소
	</div>
	<div class="uk-width-small-1-5">
		서울특별시
	</div>
	<div class="uk-width-small-1-5">
		<select id="arrivePosGuList">
			<%
				for(AddressGu gu: guList) {
			%>
					<option value="<%=gu.getGuName() %>"><%=gu.getGuName() %></option>
			<%
				}
			%>
		</select>
	</div>
	<div class="uk-width-small-1-5">
		<select id="arrivePosDongList"></select>
	</div>
</div>

</body>

<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</html>