package easydel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.entity.User;
import easydel.exception.DuplicatedIdException;
import easydel.exception.ServiceFailException;
import easydel.service.IUserService;

@Controller
public class RabbitController {
	static final Logger logger = LoggerFactory.getLogger(RabbitController.class);
	@Autowired
	private IUserService service;
	
	//------------------------------------개인정보수정-----------------------------------------------
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String moveToModifyFake(Model model, HttpSession session) {
		String loginUserId = (String) session.getAttribute("loginSession");
		User user = service.serviceGetUser(loginUserId);
		model.addAttribute("newUser", user);
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
}
