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
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody String getBoard(@RequestParam Integer pageNum,
			@RequestParam String delTypeFilter, @RequestParam String statusFilter,
			@RequestParam String sortType, HttpServletRequest request) {
		StringBuilder result = new StringBuilder();
		
		List<Title> list = boardService.getBoard(sortType, delTypeFilter, statusFilter, pageNum);
		
		for(Title title: list) {
			result.append("<tr class=\"");
			if(title.getRequestStatus() == 1) {
				result.append("beforeDel");
			} else {
				result.append("onDel");
			}
			result.append("\" onclick=\"location.href='")
				.append(request.getContextPath())
				.append("/board/show?rid=")
				.append(title.getRequestId())
				.append("'\"><td>");
			if(title.getRequestType() == 0) {
				result.append("단순운송/ ");
			} else {
				result.append("구매운송/ ");
			}
			result.append(title.getCargoName())
				.append("<br>출발 : 서울시 ")
				.append(title.getPickUpGu())
				.append(" ")
				.append(title.getPickUpDong())
				.append(" 도착 : 서울시 ")
				.append(title.getArrivalPlaceGu())
				.append(" ")
				.append(title.getArrivalPlaceDong())
				.append("<br>")
				.append(title.getExprieDate().toString())
				.append("</td><td>")
				.append(title.getSenderId())
				.append("<br>")
				.append(title.getSenderAvg())
				.append("<br>")
				.append(title.getDeliveryPrice());
			result.append("</td></tr>");
		}
		return result.toString();
	}
	
	public static final Logger logger = LoggerFactory
			.getLogger(TitleController.class);
	
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
