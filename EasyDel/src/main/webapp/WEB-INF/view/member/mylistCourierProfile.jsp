<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="display: none" class="courier_info_box uk-panel-box" id="_profile_request_id_<%=req.getRequestId()%>">
	<div class="webkit_box row_request">
		<div id="subject_grade_info" class="uk-width-1-3 webkit_box row_request">
			<div class="margin_small uk-text-bold"><%=req.getRequestId()%></div>
			<div class="margin_small uk-text-bold">평가정보</div>
		</div>

		<div class="uk-width-1-3"></div>
		<div align="right" class="uk-width-1-3 button_middle">
			<div class="uk-button uk-width-1-2" onclick="location.href('#')">프로필
				자세히 보기</div>
		</div>
	</div>

	<div class="row_request_details">
		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div>
					<img class="grade_icon"
						src="<%=request.getContextPath()%>/img/time.png">
				</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="time_grade" class="text_middle_grade"><%=req.getCourierAvgTime()%></div>
					<div class="text_middle_grade">점</div>
				</div>
			</div>
		</div>

		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div><img class="grade_icon" src="<%=request.getContextPath()%>/img/safe.jpg"></div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="safe_grade" class="text_middle_grade"><%=req.getCourierAvgSafe()%></div>
					<div class="text_middle_grade">점</div>
				</div>
			</div>
		</div>

		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div>
					<img class="grade_icon"
						src="<%=request.getContextPath()%>/img/smile.jpg">
				</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="smile_grade" class="text_middle_grade"><%=req.getCourierAvgKind()%></div>
					<div class="text_middle_grade">점</div>
				</div>
			</div>
		</div>

		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div class="grade_text text_middle_grade">성사율</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div class="text_middle_grade">
						<%=String.format("%.1f", (double) req.getCourierSuccesscnt() / req.getCourierTotalcnt() * 100.0)%>
					</div>
					<div class="text_middle_grade">%</div>
				</div>
			</div>
		</div>
	</div>
</div>