package easydel.controller;

import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import easydel.contant.RequestStatus;
import easydel.entity.Request;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IRequestCmtService;
import easydel.service.IRequestService;
import easydel.service.IUserService;

@Controller
@RequestMapping(value="/show")
public class ShowRequestController {
	@Autowired
	private IRequestService reqService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IRequestCmtService reqCmtService;
	
	@RequestMapping(value="/predeli", params={"requestId"}, method=RequestMethod.GET)
	public String showRequestPredel(@RequestParam Integer requestId, Model model) {
		String resultPage = "/board/show/predeli";
		try {
			Request readRequest = reqService.getRequestWithRequestCmts(requestId);
			if((readRequest == null) || (readRequest.getRequestStatus() != RequestStatus.request.getStatusCode()))
				throw new ServiceFailException("더 이상 의뢰글이 아닌 의뢰입니다.");
			model.addAttribute("requestWithCmts", readRequest);
		} catch (ServiceFailException e) {
			resultPage = "/error";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		return resultPage;
	}
	
	public static final Logger logger = LoggerFactory
			.getLogger(ShowRequestController.class);
	
	@RequestMapping(value="/addcmt", params={"requestId"}, method=RequestMethod.POST)
	public String addCmt(@RequestParam Integer requestId,
			@RequestParam("imgFileInput") MultipartFile file,
			@RequestParam String replyContent,
			HttpSession session, Model model) {
		String resultPage = "redirect:/show/predeli?requestId=" + requestId;
		User loginUser = (User) session.getAttribute("loginSession");
		
		try {
			reqCmtService.addNewRequestCmt(requestId, loginUser.getUserId(), replyContent, file);
		} catch (ServiceFailException e) {
			resultPage = "/error";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
	@RequestMapping(value="/predeli/apply", params={"requestId"}, method=RequestMethod.POST)
	public String applyRequest(@RequestParam Integer requestId,
			HttpSession session, Model model) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.applyRequest(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			resultPage = "/error";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		return resultPage;
	}
}
