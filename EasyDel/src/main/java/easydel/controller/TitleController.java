package easydel.controller;

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
	
	@RequestMapping(method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getBoard(@RequestParam Integer pageNum,
			@RequestParam String delTypeFilter, @RequestParam String statusFilter,
			@RequestParam String sortType, HttpServletRequest request, HttpSession session) {
		StringBuilder result = new StringBuilder();
		
		User loginUser = (User) session.getAttribute("loginSession");
		
		List<Title> list = boardService.getBoard(sortType, delTypeFilter, statusFilter, pageNum, loginUser.getUserId());
		logger.trace("mylog: sortType: " + sortType);
		logger.trace("mylog: delTypeFilter: " + delTypeFilter);
		logger.trace("mylog: statusFilter: " + statusFilter);
		logger.trace("mylog: pageNum: " + pageNum);
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
					.append("<span class=\"content_color\">"+title.getPickUpGu()+"</span>")
					.append("&nbsp;")
					.append("<span class=\"content_color\">"+title.getPickUpDong()+"</span>");
			} else {
				result.append("<span class=\"gonew_boardliststandard\">운송 종류</span>&nbsp; <span class=\"content_color\">구매운송</span>&nbsp;")
					.append("<br>&nbsp;&nbsp;&nbsp;<span class=\"gonew_boardliststandard\">글 제목</span>&nbsp;&nbsp;")
					.append("<span class=\"content_color\">"+title.getCargoName()+"</span>")
					.append("<br>");
			}
			result.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"gonew_boardliststandard\">도착</span>&nbsp;&nbsp;<span class=\"content_color\">서울시</span>&nbsp; ")
				.append("<span class=\"content_color\">"+title.getArrivalPlaceGu()+"</span>")
				.append("<span class=\"content_color\">"+title.getArrivalPlaceDong()+"</span>")
				.append("<br><span class=\"gonew_boardliststandard\" id=\"FinishedTime\">만료 시각</span>&nbsp;&nbsp;")
				.append("<span class=\"content_color\">"+title.getExpireDate().toString()+"</span>");
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
