package easydel.controller;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EdmoneyController {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(EdmoneyController.class);
	}
	
	@RequestMapping(value="/edmoney", method=RequestMethod.GET)
	public String GetEdmoneyBalance(Model model, HttpSession session){
//		session.getAttribute("UserId");
		
		model.addAttribute("edmoneyBalance", 99999);
		
		return "edmoney/edmoneyView";
	}

}
