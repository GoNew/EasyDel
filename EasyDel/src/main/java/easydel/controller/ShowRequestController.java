package easydel.controller;

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
	public String showRequestPredel(@RequestParam Integer requestId, Model model,
			HttpSession session) {
		String resultPage = "/board/show/predeli";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			Request readRequest = reqService.getRequestWithRequestCmts(requestId);
			if(readRequest == null)
				throw new ServiceFailException("존재하지 않는 글");
			User senderUserInfo = userService.serviceGetUser(readRequest.getSenderId());
			if(readRequest.getRequestStatus() != RequestStatus.request.getStatusCode()
					&& !loginUser.getUserId().equals(readRequest.getSenderId())
					&& !loginUser.getUserId().equals(readRequest.getCourierId()))
				throw new ServiceFailException("해당 글에 대한 접근 권한이 없음");
			model.addAttribute("requestWithCmts", readRequest);
			model.addAttribute("senderUserInfo", senderUserInfo);
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
			HttpSession session, Model model, HttpServletRequest request) {
		String resultPage = "redirect:" + request.getHeader("referer");
		User loginUser = (User) session.getAttribute("loginSession");
		
		try {
			reqCmtService.addNewRequestCmt(requestId, loginUser.getUserId(), replyContent, file);
		} catch (ServiceFailException e) {
			resultPage = "error/errorpage";
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
	
	@RequestMapping(value="/ondeli", params={"requestId"}, method=RequestMethod.GET)
	public String showRequestOndel(@RequestParam Integer requestId, Model model,
			HttpSession session) {
		String resultPage = "/board/show/ondeli";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			Request readRequest = reqService.getRequestWithRequestCmts(requestId);
			if(readRequest == null)
				throw new ServiceFailException("존재하지 않는 글");
			User senderUserInfo = userService.serviceGetUser(readRequest.getSenderId());
			if((readRequest.getRequestStatus() != RequestStatus.on.getStatusCode()
					&& readRequest.getRequestStatus() != RequestStatus.cancelByDeliver.getStatusCode()
					&& readRequest.getRequestStatus() != RequestStatus.cancelBySender.getStatusCode()
					&& readRequest.getRequestStatus() != RequestStatus.arrive.getStatusCode())
					&& !loginUser.getUserId().equals(readRequest.getSenderId())
					&& !loginUser.getUserId().equals(readRequest.getCourierId()))
				throw new ServiceFailException("해당 글에 대한 접근 권한이 없음");
			model.addAttribute("requestWithCmts", readRequest);
			model.addAttribute("senderUserInfo", senderUserInfo);
		} catch (ServiceFailException e) {
			resultPage = "/error";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		return resultPage;
	}
	
	@RequestMapping(value="/ondeli/cancel", params={"requestId"}, method=RequestMethod.GET)
	public String cancelRequest(@RequestParam Integer requestId, Model model,
			HttpSession session) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.cancelRequestOnDel(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			resultPage = "error/errorpage";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		return resultPage;
	}
}
