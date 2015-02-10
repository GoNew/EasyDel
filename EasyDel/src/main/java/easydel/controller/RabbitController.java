package easydel.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IUserService;

@Controller
public class RabbitController {
	static final Logger logger = LoggerFactory.getLogger(RabbitController.class);
	@Autowired
	private IUserService service;

	//임시
	@RequestMapping("/main")
	public String main() {
		return "main/main";
	}
	
	//------------------------------------개인정보수정-----------------------------------------------
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String moveToModifyFake(Model model, HttpSession session) {
		return "member/modify";
	}
	
	//회원정보수정을 위한 컨트롤러
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Model model, User user){
		String resultPage = "main/main";
		try {
			service.serviceUpdateUser(user);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", "알수없는 원인");
			resultPage = "error/errorPage";
		}
		return resultPage;
	}
	
	

	//회원탈퇴를 위한 컨트롤러
	@RequestMapping(value="/withdraw", method=RequestMethod.GET)
	public String withdraw(Model model, HttpSession session){
		String resultPage = "intro/intro";
		String loginUserId = (String) session.getAttribute("loginSession");
		try {
			service.serviceDeleteUser(loginUserId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", "알수없는 원인");
			resultPage = "error/errorPage";
		}
		return resultPage;
	}
}
