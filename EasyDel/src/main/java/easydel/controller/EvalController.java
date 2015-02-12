package easydel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.entity.User;

@Controller
public class EvalController {
	//운송인의 프로필
	@RequestMapping(value="/profile/eval/couriereval", method=RequestMethod.GET)
	public String moveToProfileCourier(){
		return "profile/eval/couriereval";
	}
	
	@RequestMapping(value="/profile/eval/couriereval", method=RequestMethod.POST)
	public String profileCourier(User user, Model model, HttpSession session){
		String resultPage = "redirect:couriereval";
		
		
		return resultPage;
	}
}
