package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easydel.service.IRequestService;

@Controller
@RequestMapping(value="/show")
public class ShowRequestController {
	@Autowired
	private IRequestService reqService;
	
	@RequestMapping(value="/predeli", params={"requestId"}, method=RequestMethod.GET)
	public String showRequestPredel(@RequestParam Integer requestId) {

		return "";
	}
}
