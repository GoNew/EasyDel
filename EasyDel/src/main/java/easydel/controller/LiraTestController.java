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
	@RequestMapping("/selecttype")
	public String selectType(){
		return "board/registrate/selecttype";
	}
	@RequestMapping("/typesimple")
	public String typeSimple(){
		return "board/registrate/typesimple";
	}
	@RequestMapping("/typepurchase")
	public String typePurchase(){
		return "board/registrate/typepurchase";
	}
}
