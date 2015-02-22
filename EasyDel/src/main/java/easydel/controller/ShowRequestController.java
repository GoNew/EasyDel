package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easydel.contant.RequestStatus;
import easydel.entity.Request;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IRequestService;
import easydel.service.IUserService;

@Controller
@RequestMapping(value="/show")
public class ShowRequestController {
	@Autowired
	private IRequestService reqService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/predeli", params={"requestId"}, method=RequestMethod.GET)
	public String showRequestPredel(@RequestParam Integer requestId, Model model) {
		String resultPage = "/board/show/predeli";
		try {
			Request readRequest = reqService.getRequestWithRequestCmts(requestId);
			if((readRequest == null) || (readRequest.getRequestStatus() != RequestStatus.request.getStatusCode()))
				throw new ServiceFailException();
			model.addAttribute("requestWithCmts", readRequest);
		} catch (ServiceFailException e) {
			resultPage = "/error";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		return resultPage;
	}
}
