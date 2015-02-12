package easydel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LiraTestController {

	@RequestMapping("/intro")
	public String intro() {
		return "intro/intro";
	}
	@RequestMapping("/header")
	public String header(){
		return "main/header";
	}
	@RequestMapping("/footer")
	public String footer(){
		return "main/footer";
	}
	@RequestMapping("/mylist")
	public String mylist(){
		return "member/mylist";
	}
}
