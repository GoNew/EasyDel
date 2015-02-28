package easydel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.entity.AddressDong;
import easydel.entity.Title;
import easydel.entity.User;
import easydel.service.IBoardService;
import easydel.service.IDongService;
import easydel.service.IGuService;

@Controller
@RequestMapping(value="/board")
public class TitleController {
	public static final Logger logger = LoggerFactory
			.getLogger(TitleController.class);
	
	@Autowired
	IBoardService boardService;
	@Autowired
	IGuService guService;
	@Autowired
	IDongService dongService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String showBoard(Model model) {
		model.addAttribute("gu", guService.getGu());
		return "board/list";
	}
	
	@RequestMapping(value="/ajax/getBoard", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getBoard(
			@RequestParam(required=false) Integer pageNum,
			@RequestParam(required=false) String delTypeFilter,
			@RequestParam(required=false) String statusFilter,
			@RequestParam(required=false) String sortType,
			@RequestParam(required=false, defaultValue="-1") Integer startPos,
			@RequestParam(required=false, defaultValue="-1") Integer arrivalPos,
			@RequestParam(required=false) String startTimeBeforeParse,
			@RequestParam(required=false) String arrivalTimeBeforeParse,
			HttpServletRequest request, HttpSession session) {
		StringBuilder result = new StringBuilder();
		
		if(startPos == -1)
			startPos = null;
		if(arrivalPos == -1)
			arrivalPos = null;
		
		User loginUser = (User) session.getAttribute("loginSession");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd a kk:mm");
		SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm");
		
		Date startTime = null;
		Date arrivalTime = null;
		try {
			startTime = (Date) parser.parse(startTimeBeforeParse);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			arrivalTime = (Date) parser.parse(arrivalTimeBeforeParse);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		logger.trace("mylog: sortType: " + sortType);
		logger.trace("mylog: delTypeFilter: " + delTypeFilter);
		logger.trace("mylog: statusFilter: " + statusFilter);
		logger.trace("mylog: pageNum: " + pageNum);
		logger.trace("mylog: startPos: " + startPos);
		logger.trace("mylog: arrivalPos: " + arrivalPos);
		logger.trace("mylog: startTime: " + startTime);
		logger.trace("mylog: arrivalTime: " + arrivalTime);
		List<Title> list = boardService.getBoard(sortType, delTypeFilter, statusFilter, pageNum, loginUser.getUserId(),
				startPos, arrivalPos, startTime, arrivalTime);
		for(Title title: list) {
			result.append("<div class=\"");
			if(title.getRequestStatus() == 1) {
				result.append("beforeDel\" onclick=\"location.href='")
					.append(request.getContextPath())
					.append("/show/predeli?requestId=")
					.append(title.getRequestId())
					.append("'\"><div class=\"first_row\">");
			} else {
				result.append("onDel\"><div>");
			}
			if(title.getRequestType() == 0) {
				result.append("<span class=\"gonew_boardliststandard\">운송 종류</span>&nbsp; <span class=\"content_color\">단순운송</span>&nbsp;")
					.append("<br>&nbsp;&nbsp;&nbsp;<span class=\"gonew_boardliststandard\">글 제목</span>&nbsp;&nbsp;")
					.append("<span class=\"content_color\">"+title.getCargoName()+"</span>")
					.append("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"gonew_boardliststandard\">출발</span>&nbsp;&nbsp;<span class=\"content_color\">서울시</span>&nbsp;")
					.append("<span class=\"content_color\">"+title.getPickUpGu()+"</span>&nbsp;")
					.append("&nbsp;")
					.append("<span class=\"content_color\">"+title.getPickUpDong()+"</span>");
			} else {
				result.append("<span class=\"gonew_boardliststandard\">운송 종류</span>&nbsp; <span class=\"content_color\">구매운송</span>&nbsp;")
					.append("<br>&nbsp;&nbsp;&nbsp;<span class=\"gonew_boardliststandard\">글 제목</span>&nbsp;&nbsp;")
					.append("<span class=\"content_color\">"+title.getCargoName()+"</span>")
					.append("<br>");
			}
			result.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"gonew_boardliststandard\">도착</span>&nbsp;&nbsp;<span class=\"content_color\">서울시</span>&nbsp;")
				.append("<span class=\"content_color\">"+title.getArrivalPlaceGu()+"</span>&nbsp;")
				.append("<span class=\"content_color\">"+title.getArrivalPlaceDong()+"</span>")
				.append("<br><span class=\"gonew_boardliststandard\" id=\"FinishedTime\">만료 시각</span>&nbsp;&nbsp;")
				.append("<span class=\"content_color\">"+format.format(title.getExpireDate())+"</span>");
			logger.trace("mylog: " + format.format(title.getExpireDate()));
			if(title.getRequestType() == 0) {
				result.append("</div><div class=\"second_row\" align=\"right\">")
				.append("<span class=\"gonew_boardliststandard\">"+title.getSenderId()+"</span>&nbsp;")
				.append("<br>");
			} else {
				result.append("</div><div class=\"second_row\" align=\"right\">")
				.append("<span class=\"gonew_boardliststandard\">"+title.getSenderId()+"</span>&nbsp;")
				.append("<br>");
			}
				result.append("<br><span class=\"gonew_boardliststandard\">평점</span>&nbsp;&nbsp;")
				.append("<span class=\"content_color\" id=\"UserScore\">"+title.getSenderAvg()+"</span>")
				.append("<br><span class=\"gonew_boardliststandard\" id=\"UserPayment\">의뢰비</span>&nbsp;&nbsp;")
				.append("<span class=\"content_color\">"+title.getDeliveryPrice()+"</span>");
			result.append("</div></div>");
		}
		return result.toString();
	}
	
	@RequestMapping(value="/ajax/getdong", params={"guName"}, method=RequestMethod.GET,
			produces="text/plain;charset=UTF-8")
	public @ResponseBody String getDongList(@RequestParam String guName) {
		StringBuilder builder = new StringBuilder();
		List<AddressDong> list = dongService.getDongByGu(guName);
		builder.append("<option value=\"\">선택없음</option>");
		for(AddressDong dong: list) {
			builder.append("<option value=\"")
				.append(dong.getDongId())
				.append("\">")
				.append(dong.getDongDesc())
				.append("</option>");
		}
		return builder.toString();
	}
}
