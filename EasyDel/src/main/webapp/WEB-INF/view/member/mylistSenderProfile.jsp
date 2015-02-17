<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ****************************************간단 개인 평가 프로필 정보 div 시작-->
<div style="display: none;" class="sender_info_box uk-panel-box">
	<div class="webkit_box row_request">
		<div id="subject_grade_info"
			class="uk-width-1-3 webkit_box row_request">
			<div class="margin_small uk-text-bold"><%=req.getUserId()%></div>
			<div class="margin_small uk-text-bold">평가정보</div>
		</div>
		<div class="uk-width-1-3"></div>
		<div align="right" class="uk-width-1-3 button_middle">
			<div class="uk-button uk-width-1-2">프로필 자세히 보기</div>
		</div>
	</div>

	<div class="row_request_details">
		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div class="">
					<img class="grade_icon"
						src="<%=request.getContextPath()%>/img/time.png">
				</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="time_grade" class="text_middle_grade"><%=req.getSenderAvgTime()%></div>
					<div class="text_middle_grade">점</div>
				</div>
			</div>
		</div>

		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div class="">
					<img class="grade_icon"
						src="<%=request.getContextPath()%>/img/safe.jpg">
				</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="safe_grade" class="text_middle_grade"><%=req.getSenderAvgThing()%></div>
					<div class="text_middle_grade">점</div>
				</div>
			</div>
		</div>

		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div class="">
					<img class="grade_icon"
						src="<%=request.getContextPath()%>/img/smile.jpg">
				</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="smile_grade" class="text_middle_grade"><%=req.getSenderAvgKind()%></div>
					<div class="text_middle_grade">점</div>
				</div>
			</div>
		</div>

		<div class="webkit_box text_middle uk-width-1-4">
			<div style="margin: 0px auto; display: -webkit-box">
				<div class="grade_text text_middle_grade">거래율</div>
				<div style="margin-left: 10px" class="grade_text webkit_box">
					<div id="transaction_rate" class="text_middle_grade">
						<%=String.format("%.1f", (double) req.getSenderSuccesscnt()
					/ req.getSenderTotalcnt() * 100.0)%>
					</div>
					<div class="text_middle_grade">%</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ****************************************간단 개인 평가 프로필 정보 div 끝-->