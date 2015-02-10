package easydel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ErrorController {
	@ExceptionHandler(Exception.class)
	public String errorHandling(){
		return "error/errorPage";
	}
}
