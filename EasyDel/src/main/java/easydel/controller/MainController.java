package easydel.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import easydel.service.IUserService;

@Controller
public class MainController {
	static final Logger logger = LoggerFactory.getLogger(ModifyController.class);
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String moveToMain(){
		return "main/main";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public String main(){
		String resultPage = "redirect:main";
		return resultPage;
	}
}
