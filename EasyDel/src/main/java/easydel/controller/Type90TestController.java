package easydel.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import easydel.service.IBoardService;

@Controller
public class Type90TestController {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(Type90TestController.class);
	}

	@RequestMapping("/reportformat")
	public String response(Model model){
	model.addAttribute("value1", "값넘기기1");
	model.addAttribute("value2", "값넘기기2");
	return "report";
	}
}
