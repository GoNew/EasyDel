package easydel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

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
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String moveToJoin() {
		return "member/join";
	}
	
	//회원가입에서 id 중복체크 ajax를 위한 컨트롤러 
	@RequestMapping(value="/ajax/dupidcheck", produces="text/plain;charset=UTF-8")
	public @ResponseBody String process(@RequestParam String userId, Model model) {
		String result;
		try {
			service.serviceCheckDuplicatedId(userId);
			result = userId + " 는 <br> 사용할 수 있는 ID 입니다.";
		} catch (DuplicatedIdException | ServiceFailException e) {
			result = userId + " 는 <br> 중복된 ID 입니다.";
		}
		return result;
	}
	
	@RequestMapping("/modify")
	public String modify(){
		return "member/modify";
	}

	//회원가입을 위한 컨트롤러
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(Model model, User user, @RequestParam String birthdate) {
		String resultPage = "intro/intro";
		
		try {
			user.setUserBirthdate(new SimpleDateFormat("yyyy-MM-dd").parse(birthdate));
			service.serviceRegistrateNewUser(user);
		} catch (DuplicatedIdException e) { // 여기서 아이디 중복체크 한번 더 해준다
			model.addAttribute("errorMsg", "아이디 중복");
			resultPage = "error/errorPage";
		} catch (ServiceFailException | ParseException e) {
			model.addAttribute("errorMsg", "알수없는 원인");
			resultPage = "error/errorPage";
		}
		return resultPage;
	}

}
