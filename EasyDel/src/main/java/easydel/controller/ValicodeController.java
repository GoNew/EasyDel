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
	@Autowired
	
	
	
	@RequestMapping(value = "/vali????", method = RequestMethod.POST) 
	public String ValidateCode(@RequestParam Integer valicode, Model model){
	
		return "valicode"; // valicode 호출 
	} 

}
