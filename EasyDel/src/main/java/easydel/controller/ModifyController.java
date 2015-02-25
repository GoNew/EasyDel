package easydel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IUserService;

@Controller
public class ModifyController {
	static final Logger logger = LoggerFactory.getLogger(ModifyController.class);
	@Autowired
	private IUserService service;


	//------------------------------------개인정보수정-----------------------------------------------
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String moveToModifyFake() {
		return "member/modify";
	}
	
	
	//회원정보수정을 위한 컨트롤러
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@RequestParam("imgFileInput") MultipartFile file,
			User user, Model model, HttpSession session){
		String resultPage = "redirect:/main";
		File createProfile = null;
		String filePath = null;
		
		try {
			if (file != null && !file.isEmpty()) {
				createProfile = new File("c:/db/uploaded/profile/"
						+ user.getUserId());
				file.transferTo(createProfile);
				filePath = "/profile/" + user.getUserId();
			}
			user.setUserPicture(filePath);
			
			logger.trace("mylog: " + user);
			
			service.serviceUpdateUser(user);
			
			session.setAttribute("loginSession", service.serviceGetUser(user.getUserId()));
			session.setAttribute("modifyedAndNotReroaded", "true");
		} catch (ServiceFailException | IllegalStateException | IOException e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "알수없는 원인");
			resultPage = "error/errorPage";
		}
		return resultPage;
	}
	
	//회원탈퇴를 위한 컨트롤러
	@RequestMapping(value="/withdraw", method=RequestMethod.GET)
	public String withdraw(Model model, HttpSession session){
		String resultPage = "intro/intro";
		User loginUser = (User) session.getAttribute("loginSession");
		try {
			service.serviceDeleteUser(loginUser.getUserId());
			session.removeAttribute("loginSession");
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", "알수없는 원인");
			resultPage = "error/errorPage";
		}
		return resultPage;
	}
}
