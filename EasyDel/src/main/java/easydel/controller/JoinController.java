package easydel.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.entity.User;
import easydel.service.IUserService;

@Controller
public class JoinController {

	static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Model model, User user){
//		service.serviceRegistrateNewUser(user);
		return "member/join";
	}

}
