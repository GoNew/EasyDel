package easydel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	@RequestMapping("/join")
	public String join(){
		return "member/join";
	}
	@RequestMapping("/modify")
	public String modify(){
		return "member/modify";
	}
}
