package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import easydel.service.IBoardService;

@Controller
public class TestController {
	@Autowired
	IBoardService boardService;
	
	
	@RequestMapping("/join")
	public String join(){
		return "member/join";
	}
	@RequestMapping("/modify")
	public String modify(){
		return "member/modify";
	}
	@RequestMapping("/test")
	public String test() {
		boardService.boardTest();
		return "showMessage";
	}
}
