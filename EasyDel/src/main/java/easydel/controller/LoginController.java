package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import easydel.service.IUserService;

@Controller
@SessionAttributes("reportsession")
public class LoginController {
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam String userid, @RequestParam String userpassword, Model model){
		String resultPage = "report/intro"; 
		if(service.LoginService(userid, userpassword)){
			model.addAttribute("loginSession",userid);
			resultPage = "main/main";
		}
		return resultPage;
	}
}
