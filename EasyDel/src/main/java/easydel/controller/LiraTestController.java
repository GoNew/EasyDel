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
	
	@RequestMapping("/predeli")
	public String perdeli(){
		return "board/show/predeli";
	}
	@RequestMapping("/ondeli")
	public String ondeli(){
		return "board/show/ondeli";
	}
	@RequestMapping("/enddeli")
	public String enddeli(){
		return "board/show/enddeli";
	}
	@RequestMapping("/reported")
	public String reported(){
		return "board/show/reported";
	}
}
