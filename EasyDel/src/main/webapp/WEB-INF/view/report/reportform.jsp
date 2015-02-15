<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="easydel.entity.ReportType"%>
<%@page import="easydel.entity.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%-- <jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>--%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>report!</title>
<style type="text/css">
* {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
            margin: 20px auto;
          
}
  div{align:center;font-family:"맑은고딕";font-size:10px;}

  #reportmain {
  max-width: 600px;
  margin: 0 auto;
  }
  #reportdesc{
  max-width 100px;
  margin : 1 auto;
  border-width: 1px;
  }
  #div1{
  max-width : 300px;
  margin : 1 auto;
  border-width: 1px;
  border: 1px solid #000000; 
  
  }
  #div2{
  max-width : 300px;
  margin : 1 auto;
  border-width: 1px;
  border: 1px solid #000000; 
  }
  #middlediv{
  max-width : 300px;
  margin : 1 auto;
  border-width: 1px;
  border: 1px solid #000000; 
  }  


*{
   margin: 0; padding:0;
/*    border: 1px solid red;
 */}
img{ border: 0;}
address{font-style: normal;}
ul, ol{list-style:name;}

#fullbrowser {
   width: 1025px;
   margin: 0px auto;
}
#middlebrowser {
   width: 1009px;
   margin: 150px auto;
}</style>
<script type="text/javascript">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"/> --%>

<script type="text/javascript">
</script>
</head>
<%
	List<ReportType> reportTypeList = (List<ReportType>) request.getAttribute("reportType");
	reportTypeList = reportTypeList != null ? reportTypeList : new ArrayList<ReportType>();

%>

<body>




<form action="/request" method="post">
<div id="div1" class="elem">
<span class="label"><b>REPORT!</b></span><P></P>
<span class="label" align="center">신고대상</span> :   ${reportedId}<P>
<span class="label">신고글</span> :    ${reportedCargo}<p><p>
<span class="label">신고 이유</span>
<select id="reportType" name="reportType">
<%for (ReportType reporttype : reportTypeList) {%>
<option value="<%=reporttype.getReportType()%>"><%=reporttype.getReportTypeDesc()%></option>
<%}%>
</select><br></p>
</div>
<div id="middlediv" class="elem" font-size=8px;>
<b>신고하기 전에 잠시!</b><br>
허위 신고일 경우에는 그만큼 불이익이 갈 수 있음을 명심해주세요!<br><br>
</div>
<div id="div2" class="elem">
상세 사유<br>
<textarea id="reportdesc" type="text" name="reportdesc"  rows="5" cols="40">상세 신고 내용을 적어주세요</textarea><br>
<button id="submit" type="submit" value="report">No Mercy!</button>
<button id="submit" type="submit" value="report">Show Mercy!</button>
</div>
</form>
</center>
</body>
<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</html>