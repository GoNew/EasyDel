<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="easydel.entity.ReportType"%>
<%@page import="easydel.entity.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>report!</title>
<style type="text/css"></style>
<script type="text/javascript">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css" />

<script type="text/javascript">
</script>
</head>
<%
	List<ReportType> reportTypeList = (List<ReportType>) request.getAttribute("");
/*  */
	reportTypeList = reportTypeList != null ? reportTypeList : new ArrayList<ReportType>();
%>

<body>
<style>
* {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
            margin: 20px auto;
          
}
  #reportmain {
  max-width: 600px;
  margin: 0 auto;
  }
  #reportdesc{
  max-width 100px;
  margin : 1 auto;
  border-width: 1px;
  }
  #report1{
  max-width 100px;
  margin : 1 auto;
  border-width: 1px;
  border: 1px solid #000000; 
  
  }
  #report2{
  max-width 100px;
  margin : 1 auto;
  border-width: 1px;
  border: 1px solid #000000; 
  }
  
</style> 
  
<div id="reportmain" class="elem">
<form id="report1">
<span class="label">REPORT!</span><P></P>
<span class="label">신고대상</span><P></P>
<span class="label">신고글</span><p><p>
<span class="label">신고 이유</span>
<select id="reportType">
<%for (ReportType reporttype : reportTypeList) {%>
<option value="<%=reporttype.getReportType()%>"><%=reporttype.getReportTypeDesc()%></option>
<%}%>
</select><br>
</p>
</form>

신고하기 전에 잠시!<br>
허위 신고일 경우에는 그만큼 불이익이 갈 수 있음을 명심해주세요!
<br><br>
<form id="report2">
상세 사유<br>
<textarea id="reportdesc" type="text" name="reportdesc"  rows="5" cols="80" value="상세 신고 내용을 적어주세요"></textarea><br>
<button id="return" type="submit" value="notreport">Show Mercy!</button>
<button id="submit" type="submit" value="report">No Mercy!</button>
</form>



</div>
</select>


</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</html>