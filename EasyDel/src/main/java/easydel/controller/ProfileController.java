package easydel.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.service.IProfileService;

@Controller
@RequestMapping(value="/profile")
public class ProfileController {
	static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	@Autowired
	private IProfileService service;
	
	
	//운송인의 프로필
	@RequestMapping(value="/courierInfo", params={"userId"}, method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getCourierProfile(@RequestParam String userId, Model model){
		StringBuilder builder = new StringBuilder();
		
		return builder.toString();
	}

}
