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
		return "edmoney/edmoneyView";
	}
	
	// ed머니 인출화면으로 보내주는 컨트롤러 
	@RequestMapping(value="/edmoneywithdraw",method=RequestMethod.GET)
	public String showEDmoneyWithdraw(){
		return "edmoney/edmoneyWithdraw";
	}
//	// ed머니 인출후 ed머니 조회로 보내주는 컨트롤러 
//	@RequestMapping(value="/edmoneywithdraw",method=RequestMethod.POST)
//	public String EDmoneyWithdraw(){
//		return "edmoney/edmoneyView";
//	}
	// ed머니 입금화면으로 보내주는 컨트롤러
	@RequestMapping(value="/edmoneydeposit",method=RequestMethod.GET)
	public String showEDmoneydeposit(){
		return "edmoney/edmoneyDeposit";
	}
//	// ed머니 입금 완료 후 ed머니 조회로 보내주는 컨트롤러
//	@RequestMapping(value="/edmoneydeposit",method=RequestMethod.POST)
//	public String EDmoneyDeposit(){
//		return "edmoney/edmoneyView";
//	}
}
