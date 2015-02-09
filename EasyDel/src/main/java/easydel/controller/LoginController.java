package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import easydel.service.IUserService;

public class LoginController {
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="")
	public String login(Model model){
		return null;
	}
}
