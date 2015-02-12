package easydel.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.service.IUserService;

@Controller
public class ProfileController {
	static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	@Autowired
	private IUserService service;
	
	
	//발송인의 프로필
	@RequestMapping(value="/profile/sender", method=RequestMethod.GET)
	public String moveToMaintwo(){
		return "profile/sender";
	}
	
	@RequestMapping(value="/profile/sender", method=RequestMethod.POST)
	public String maintwo(){
		String resultPage = "redirect:sender";
		return resultPage;
	}
	
	//운송인의 프로필
	@RequestMapping(value="/profile/courier", method=RequestMethod.GET)
	public String moveToMain(){
		return "profile/courier";
	}
	
	@RequestMapping(value="/profile/courier", method=RequestMethod.POST)
	public String main(){
		String resultPage = "redirect:courier";
		return resultPage;
	}
}
