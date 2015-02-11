package easydel.controller;

import java.io.File;

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
import easydel.service.IUserService;

@Controller
public class MainController {
	static final Logger logger = LoggerFactory.getLogger(RabbitController.class);
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String moveToMain(){
		return "main/main";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public String main(@RequestParam("imgFileInput") MultipartFile file,
			User user, Model model, HttpSession session){
		String resultPage = "redirect:main";
		return resultPage;
	}
	
}
