<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/footer.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="footer" class="tm-footer">
		<div id="container" class="uk-container uk-container-center uk-text-center">

			<ul id="subnav" class="uk-subnav uk-subnav-line">
				<li><a href="http://github.com/uikit/uikit">사이트맵</a></li>
				<li><a href="http://github.com/uikit/uikit/issues">Issues</a></li>
				<li><a
					href="http://github.com/uikit/uikit/blob/master/CHANGELOG.md">Changelog</a></li>
				<li><a href="https://twitter.com/getuikit">Twitter</a></li>
			</ul>

			<div id="panel" class="uk-panel">
				<p>
					Made by <a href="#">TOOMUCH</a> Crazy People<br>.
				</p>
				<a href="../index.html"><img src="<%=request.getContextPath()%>/img/images.jpg"
					width="90" height="30" title="UIkit" alt="UIkit"></a>
			</div>

		</div>
	</div>
</body>
</html>