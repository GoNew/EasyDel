package easydel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IRequestService;

@Controller
@RequestMapping(value="/validCode")
public class ValicodeController {
	@Autowired
	IRequestService reqService;
	
	@RequestMapping(value="/input", params={"requestId"}, method=RequestMethod.GET)
	public String moveToInputValidateCode(@RequestParam Integer requestId, Model model) {
		String resultPage = "member/inputcode";
		model.addAttribute("requestId", requestId);
		return resultPage;
	}
	
	@RequestMapping(value="/check", params={"requestId", "validationCode"}, method=RequestMethod.GET)
	public @ResponseBody String validationCheckAndComplete(HttpSession session,
			@RequestParam Integer requestId, @RequestParam Integer validationCode) {
		if(requestId == null || validationCode == null)
			return "false";
		
		User loginUser = (User) session.getAttribute("loginSession");
		String result = "true";
		
		try {
			reqService.checkValidationCode(loginUser.getUserId(), requestId, validationCode);
		} catch (ServiceFailException e) {
			e.printStackTrace();
			result = "false";
		}
		
		return result;
	}
}

