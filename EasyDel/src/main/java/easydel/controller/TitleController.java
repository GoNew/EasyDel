package easydel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.entity.Title;
import easydel.service.IBoardService;

@Controller
@RequestMapping(value="/board")
public class TitleController {
	@Autowired
	IBoardService service;
	
	@RequestMapping(method=RequestMethod.GET)
	public String showBoard(Model model) {
		return "board/list";
	}
	
	@RequestMapping(value="/mapping", method=RequestMethod.POST)
	public @ResponseBody String getBoard(@RequestParam Integer pageNum,
			@RequestParam String delTypeFilter, @RequestParam String statusFilter,
			@RequestParam String sortType) {
		StringBuilder result = new StringBuilder();
		
		List<Title> list = service.getBoard(sortType, delTypeFilter, statusFilter, pageNum);
		
		result.append("<table>");
		
		for(Title title: list) {
			result.append("<tr><td>");
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
		
		result.append("</table>");
		return result.toString();
	}
}
