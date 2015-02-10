<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.gradient.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav id=navbar class="uk-navbar">

		<ul class="uk-navbar-nav">
			<li>
				<div id="navbtn">
					<button id="mainbtn" class="uk-button uk-button-primary"
						data-uk-offcanvas="{target:'#my-id1'}">
						<i class="uk-icon-navicon uk-icon-large"></i>
					</button>
				</div>
				<div id="my-id1" class="uk-offcanvas">

					<div class="uk-offcanvas-bar">

						<ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon"
							data-uk-nav="">
							<li><a href="">메인</a></li>
							<li><a href="">전체 의뢰 보기</a></li>
							<li><a href="">의뢰 올리기</a></li>
							<li><a href="">EDMoney</a></li>

						</ul>

					</div>
				</div>
			</li>
		</ul>



		<div class="uk-navbar-flip">
			<ul class="uk-navbar-nav">
				<li>
					<div id="log" align="center">알림자리</div>
				</li>
				<li>
					<div id="profilebtn" data-uk-offcanvas="{target:'#my-id2'}">
						<img id="idimg" class="uk-border-circle"
							src="<%=request.getContextPath()%>/img/images.jpg">
						<div id="profilebtnsub" align="center">사용자 ID</div>

					</div>

					<div id="my-id2" class="uk-offcanvas">

						<div class="uk-offcanvas-bar uk-offcanvas-bar-flip">

							<ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon"
								data-uk-nav="">
								<li><a href="<%=request.getContextPath()%>/modify">개인정보 수정</a></li>
								<li><a href="">내 진행 보기</a></li>
								<li><a href="">로그아웃</a></li>

							</ul>

						</div>
					</div>
				</li>
			</ul>
		</div>

		<div class="uk-navbar-flip">
			<ul class="uk-navbar-nav">
				<li></li>
			</ul>

		</div>

		<div class="uk-navbar-content uk-navbar-center">
			<img id="logo1" src="<%=request.getContextPath()%>/img/easydel_logo.png">
		</div>

	</nav>
</body>
</html>