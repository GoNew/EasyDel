package easydel.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.entity.User;
import easydel.entity.ViewMyCarryRequest;
import easydel.entity.ViewMyReportRequest;
import easydel.entity.ViewMySendRequest;
import easydel.exception.ServiceFailException;
import easydel.service.IRequestService;

@Controller
@RequestMapping(value="/mylist")
public class ViewMyListController {
	@Autowired
	IRequestService reqService;
	
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
			resultPage = "redirect:/error";
		}
		
		return resultPage;
	}
}