package easydel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
	@ExceptionHandler(Exception.class)
	@RequestMapping("/error")
	public String errorHandling(){
		return "error/errorpage";
	}
}
