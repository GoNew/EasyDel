package easydel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
			@RequestParam String sortType, HttpServletRequest request) {
		StringBuilder result = new StringBuilder();
		
		List<Title> list = boardService.getBoard(sortType, delTypeFilter, statusFilter, pageNum);
		logger.trace("mylog: sortType: " + sortType);
		logger.trace("mylog: delTypeFilter: " + delTypeFilter);
		logger.trace("mylog: statusFilter: " + statusFilter);
		logger.trace("mylog: pageNum: " + pageNum);
		for(Title title: list) {
			result.append("<tr class=\"");
			if(title.getRequestStatus() == 1) {
				result.append("beforeDel");
			} else {
				result.append("onDel");
			}
			result.append("\" onclick=\"location.href='")
				.append(request.getContextPath())
				.append("/show/predeli?requestId=")
				.append(title.getRequestId())
				.append("'\"><td>");
			if(title.getRequestType() == 0) {
				result.append("단순운송&nbsp;<span class=\"gonew_boardliststandard\">/</span>&nbsp;")
					.append(title.getCargoName())
					.append("<br><span class=\"gonew_boardliststandard\">출발:</span>&nbsp;서울시&nbsp;")
					.append(title.getPickUpGu())
					.append("&nbsp;")
					.append(title.getPickUpDong())
					.append("<br>");
			} else {
				result.append("구매운송 <span class=\"gonew_boardliststandard\">/</span>&nbsp;")
					.append(title.getCargoName())
					.append("<br>");
			}
			result.append("<span class=\"gonew_boardliststandard\">도착:</span>&nbsp;서울시 ")
				.append(title.getArrivalPlaceGu())
				.append("&nbsp;")
				.append(title.getArrivalPlaceDong())
				.append("<br><span class=\"gonew_boardliststandard\">만료시각:</span>&nbsp;")
				.append(title.getExpireDate().toString())
				.append("</td><td>")
				.append(title.getSenderId())
				.append("<br><span class=\"gonew_boardliststandard\">평점:</span>&nbsp;")
				.append(title.getSenderAvg())
				.append("<br><span class=\"gonew_boardliststandard\">의뢰비:</span>&nbsp;")
				.append(title.getDeliveryPrice());
			result.append("</td></tr>");
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
