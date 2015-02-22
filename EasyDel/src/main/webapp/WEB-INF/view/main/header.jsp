<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@page import="easydel.entity.User"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/uikit/css/uikit.almost-flat.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/header.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="<%=request.getContextPath()%>/uikit/js/uikit.js"></script>

<%
	User loginUserInfo = (User) session.getAttribute("loginSession");
%>

<nav id=navbar class="uk-navbar" data-uk-sticky="{boundary:'#define-an-offset'}">



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
						<li><a href="<%=request.getContextPath()%>/main">메인</a></li>
						<li><a href="<%=request.getContextPath()%>/board">전체 의뢰 보기</a></li>
						<li><a href="<%=request.getContextPath()%>/register/selecttype">의뢰 올리기</a></li>
						<li><a href="<%=request.getContextPath()%>/edmoney">EDMoney</a></li>

					</ul>

				</div>
			</div>
		</li>
	</ul>

	<div class="uk-navbar-flip">
		<ul class="uk-navbar-nav">
			<li>
				<div class="uk-button-dropdown" data-uk-dropdown="{boundary:'#boundary'}">
					<div id="log" align="center" class="uk-button"
						style="background-image: url('<%=request.getContextPath() %>/img/alertBell.png')"></div>
					<div class="uk-dropdown uk-dropdown-stack">
						<ul class="uk-nav uk-nav-dropdown">
							
						</ul>
					</div>
				</div>
			</li>
			<li>
				<div id="profilebtn" data-uk-offcanvas="{target:'#my-id2'}">
					<img id="idimg" class="uk-border-circle"
						src="<%=request.getContextPath()%><%=loginUserInfo.getUserPicture() %>">
					<div id="profilebtnsub" align="center"><%=loginUserInfo.getUserId() %></div>

				</div>

				<div id="my-id2" class="uk-offcanvas">

					<div class="uk-offcanvas-bar uk-offcanvas-bar-flip">

						<ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon"
							data-uk-nav="">
							<li><a href="<%=request.getContextPath()%>/modify">개인정보 수정</a></li>
							<li><a href="<%=request.getContextPath()%>/mylist">내 진행 보기</a></li>
							<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>

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
		<img id="logo1"
			src="<%=request.getContextPath()%>/img/easydel_logo.png">
	</div>

</nav>