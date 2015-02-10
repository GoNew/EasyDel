package easydel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easydel.service.IUserService;

@Controller
public class LoginController {
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam String userid, @RequestParam String userpassword, Model model, HttpSession session){
		String resultPage = "intro/intro";
		if(service.LoginService(userid, userpassword)){
			session.setAttribute("loginSession", service.serviceGetUser(userid));
			resultPage = "main/main";
		}
		return resultPage;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute("loginSession");
		return "intro/intro";
	}
}
