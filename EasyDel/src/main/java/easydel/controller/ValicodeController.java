package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("valicheck")
public class ValicodeController {
	
	@RequestMapping(value = "/valirequest", method = RequestMethod.POST)
	public int ValidateCode(@RequestParam int valicode, Model model) {
		    System.out.println("제목:"+request.getParameter("valicodesubmit"));
		//jsp에서 submit된 valicode가 뭔지 테스트
		
		if(){}
		
	}
	
	
	public String login(@RequestParam String userid, @RequestParam String userpassword, Model model){
		System.out.println(userpassword);
		if(service.LoginService(userid, userpassword)){
			model.addAttribute("loginSession",userid);
			return "main/main";
		}else{
			return "showMessage";
		}
	
}

