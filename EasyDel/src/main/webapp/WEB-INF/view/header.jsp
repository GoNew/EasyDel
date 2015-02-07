<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="uikit/css/uikit.gradient.css" />
<link rel="stylesheet" href="header.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="uikit/js/uikit.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="uk-navbar">

		<ul class="uk-navbar-nav">
			<li>
				<button class="uk-button uk-button-primary"
					data-uk-offcanvas="{target:'#my-id1'}">
					<i class="uk-icon-navicon uk-icon-large"></i>
				</button>

				<div id="my-id1" class="uk-offcanvas">

					<div class="uk-offcanvas-bar">

						<ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon"
							data-uk-nav="">
							<li><a href="">Item</a></li>
							<li class="uk-active"><a href="">Active</a></li>

						</ul>

					</div>
				</div>
			</li>
		</ul>

		<div class="uk-navbar-flip">
			<ul class="uk-navbar-nav">
			<li>
				<button id="profilebtn"
					data-uk-offcanvas="{target:'#my-id2'}">
					사용자 ID
				</button>

				<div id="my-id2" class="uk-offcanvas">

					<div class="uk-offcanvas-bar uk-offcanvas-bar-flip">

						<ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon"
							data-uk-nav="">
							<li><a href="">Item</a></li>
							<li class="uk-active"><a href="">Active</a></li>

						</ul>

					</div>
				</div>
			</li>
		</ul>
		</div>

		<div class="uk-navbar-content uk-navbar-center">
			<img id="logo1" src="image/easydel.png">
		</div>

	</nav>
</body>
</html>