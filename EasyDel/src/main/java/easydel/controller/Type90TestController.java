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

	// reportedId에 나쁜놈1, 나쁜물건 1이라는 값 집어넣고 되는지 확인
	@RequestMapping("/reportformat")
	public String response(Model model){
	model.addAttribute("reportedId", "나쁜놈1");
	model.addAttribute("reportedCargo", "나쁜물건1");
	return "report";
	}
}
