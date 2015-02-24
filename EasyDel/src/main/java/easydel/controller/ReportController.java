package easydel.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import easydel.service.IReportService;
import easydel.service.IReportTypeService;
import easydel.service.IRequestService;

@Controller
public class ReportController {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReportController.class);
	}

	@Autowired
	IReportTypeService reportTypeService;
	@Autowired
	IRequestService requestService;
	@Autowired
	IReportService reportService;
		
	@RequestMapping(value = "/report", params={"requestId"}, method = RequestMethod.GET)
	public String moveToReportPage(Model model, HttpSession session,
			@RequestParam Integer requestId) {
		String resultPage = "report/reportform";
		User loginUser = (User) session.getAttribute("loginSession");
		
		Request req = null;
		try {
			req = requestService.getRequest(requestId);
			switch (RequestStatus.valueOf(req.getRequestStatus())) {
			case on:
			case cancelByDeliver:
			case cancelBySender:
				break;
			default:
				throw new ServiceFailException("신고 불가능한 글 상태");
			}
			model.addAttribute("reportType", reportTypeService.getReportType());
			if(loginUser.getUserId().equals(req.getSenderId())) {
				model.addAttribute("reportedId", req.getCourierId());
			} else if(loginUser.getUserId().equals(req.getCourierId())){
				model.addAttribute("reportedId", req.getSenderId());
			} else {
				throw new ServiceFailException("신고 권한이 없는 유저");
			}
			model.addAttribute("reportedCargo", req.getCargoName());
			model.addAttribute("requestId", req.getRequestId());
		} catch (ServiceFailException e) {
			resultPage = "error/errorpage";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}

		return resultPage;
	}

	@RequestMapping(value = "/report", params={"requestId", "reportedId", "reportDesc", "reportType"}, method=RequestMethod.POST)
	public String acceptReportRequest(@RequestParam Integer requestId, @RequestParam String reportedId,
			@RequestParam String reportDesc, @RequestParam Integer reportType,
			HttpSession session, Model model) {
		String resultPage = "redirect:/mylist";
		User loginUser = (User) session.getAttribute("loginSession");
		
		try {
			reportService.takeOverReportRequest(requestId, reportType, reportedId, loginUser.getUserId(), reportDesc);
		} catch (ServiceFailException e) {
			resultPage = "error/errorPage";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		return resultPage;
	}
}
