package easydel.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easydel.entity.User;
import easydel.entity.ViewMyCarryRequest;
import easydel.entity.ViewMyReportRequest;
import easydel.entity.ViewMySendRequest;
import easydel.exception.ServiceFailException;
import easydel.service.IRequestService;
import easydel.service.IUserService;

@Controller
@RequestMapping(value="/mylist")
public class ViewMyListController {
	@Autowired
	IRequestService reqService;
	@Autowired
	IUserService userService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String mylist(HttpSession session, Model model){
		User user = (User) session.getAttribute("loginSession");
		String resultPage = "member/mylist";
		HashMap<String, List<ViewMyCarryRequest>> cResult = null;
		HashMap<String, List<ViewMyReportRequest>> rResult = null;
		HashMap<String, List<ViewMySendRequest>> sResult = null;
		try {
			cResult = reqService.serviceGetMyCarryRequestList(user.getUserId());
			rResult = reqService.serviceGetMyReportRequestList(user.getUserId());
			sResult = reqService.serviceGetMySendRequestList(user.getUserId());
			
			if(cResult.get("beforeDel") == null)
				throw new ServiceFailException("carryListBeforeDel 값이 null");
			model.addAttribute("carryListBeforeDel", cResult.get("beforeDel"));
			if(cResult.get("onDel") == null)
				throw new ServiceFailException("carryListOnDel 값이 null");
			model.addAttribute("carryListOnDel", cResult.get("onDel"));
			if(cResult.get("afterDel") == null)
				throw new ServiceFailException("carryListAfterDel 값이 null");
			model.addAttribute("carryListAfterDel", cResult.get("afterDel"));
			
			if(rResult.get("report") == null)
				throw new ServiceFailException("reportListReport 값이 null");
			model.addAttribute("reportListReport", rResult.get("report"));
			if(rResult.get("reported") == null)
				throw new ServiceFailException("reportListReported 값이 null");
			model.addAttribute("reportListReported", rResult.get("reported"));
			
			if(sResult.get("beforeDel") == null)
				throw new ServiceFailException("sendListBeforeDel 값이 null");
			model.addAttribute("sendListBeforeDel", sResult.get("beforeDel"));
			if(sResult.get("onDel") == null)
				throw new ServiceFailException("sendListOnDel 값이 null");
			model.addAttribute("sendListOnDel", sResult.get("onDel"));
			if(sResult.get("afterDel") == null)
				throw new ServiceFailException("sendListAfterDel 값이 null");
			model.addAttribute("sendListAfterDel", sResult.get("afterDel"));
		} catch (ServiceFailException e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
		}
		
		return resultPage;
	}
	
	@RequestMapping(value="/send/delete", params={"requestId"}, method=RequestMethod.POST)
	public String deleteSenderRequest(HttpSession session, Model model,
			@RequestParam Integer requestId) {
		User loginUser = (User) session.getAttribute("loginSession");
		String resultPage = "redirect:/mylist";
		try {
			reqService.serviceRemoveRequest(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
	@RequestMapping(value="/send/admit", params={"requestId"}, method=RequestMethod.POST)
	public String admitSenderRequest(HttpSession session, Model model,
			@RequestParam Integer requestId) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.admitCourierToPerformRequest(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
	@RequestMapping(value="/send/reject", params={"requestId"}, method=RequestMethod.POST)
	public String rejectSenderRequest(HttpSession session, Model model,
			@RequestParam Integer requestId) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.rejectCourierToPerformRequest(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
	@RequestMapping(value="/send/complete", params={"requestId"}, method=RequestMethod.POST)
	public String completeSenderRequest(HttpSession session, Model model,
			@RequestParam Integer requestId) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.completeRequest(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
			e.printStackTrace();
		}
		return resultPage;
	}
	
	@RequestMapping(value="/carry/cancel", params={"requestId"}, method=RequestMethod.POST)
	public String cancelCourierRequest(HttpSession session, Model model,
			@RequestParam Integer requestId) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.cancelRequestBeforeDelFromCourier(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
			e.printStackTrace();
		}
		
		return resultPage;
	}
	public static final Logger logger = LoggerFactory
			.getLogger(ViewMyListController.class);
	@RequestMapping(value="/carry/arrive", params={"requestId"}, method=RequestMethod.POST)
	public String arriveCourierRequest(HttpSession session, Model model,
			@RequestParam Integer requestId) {
		logger.trace("mylog: " + requestId);
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			reqService.arriveRequest(loginUser.getUserId(), requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "/error";
			e.printStackTrace();
		}
		return resultPage;
	}
}
