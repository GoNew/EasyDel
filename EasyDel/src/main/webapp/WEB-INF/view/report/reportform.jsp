<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="easydel.entity.ReportType"%>
<%@page import="easydel.entity.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
<html>
<head>
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reportform.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	List<ReportType> reportTypeList = (List<ReportType>) request.getAttribute("reportType");
	reportTypeList = reportTypeList != null ? reportTypeList : new ArrayList<ReportType>();
	String reportedId = (String) request.getAttribute("reportedId");
	String reportedCargo = (String) request.getAttribute("reportedCargo");
	Integer requestId = (Integer) request.getAttribute("requestId");
%>
</head>
<body>

<div id=fullbrowser align="center">
	<div id="middlebrowser" class="uk-panel uk-panel-box">
		
		<form id="reportForm" action="<%=request.getContextPath() %>/report" method="post">
		<input type="hidden" name="requestId" value="<%=requestId %>">
		<input type="hidden" name="reportedId" value="<%=reportedId %>">
		<div class="wrapper_columm">  <div class="report_standard_subject">신고 대상</div> <div class="report_contents"><%=reportedId %></div></div>
		<div class="wrapper_columm">  <div class="report_standard_subject">신고 글 제목</div> <div class="report_contents"><%=reportedCargo %></div></div>
		<div class="wrapper_columm">  <div class="report_standard_subject">신고 이유</div> 
			<div class="report_contents">
				<select id="reportType" name="reportType" class="report_select_size" required="required">
					<%for (ReportType reporttype : reportTypeList) {%>
					<option value="<%=reporttype.getReportType()%>"><%=reporttype.getReportTypeDesc()%></option>
					<%}%>
				</select> 
			</div>  
		</div>
		
		
		<div class="uk-panel uk-panel-box uk-panel-box-secondary report_notice_margin">
			<div class="report_main_notice">신고하기 전에 잠시!</div>
			<div class="report_sub_notice">허위 신고일 경우에는 그만큼 불이익이 갈 수 있음을 명심해주세요!</div>
		</div>
		<div class="wrapper_columm"> <div class="report_standard_subject">상세 사유</div></div>
		<div align="left"><textarea class="report_textarea_details" name="reportDesc" required="required"></textarea></div>
		
		<div class="report_contents report_btn_margin">
			<button class="uk-button uk-width-1-5 btn_size" onclick="location.href='<%=request.getContextPath() %>/mylist'">용서 하기</button>
			<button type="submit" class="uk-button uk-width-1-5 btn_size">신고 하기</button>
		</div>
		</form>
		
	</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
