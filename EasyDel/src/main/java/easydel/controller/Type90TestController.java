package easydel.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.model.Reportmodel;

@Controller
public class Type90TestController {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(Type90TestController.class);
	}

	@RequestMapping(value="/report",method=RequestMethod.GET)
	public String SendParameters(Model model){
	//Step 1. reportedId에 나쁜놈1, 나쁜물건 1이라는 값 집어넣고 되는지 확인 => O
	//Step 2. request에서 requestId, senderIdusers랑 cargoName 받아오기
	//Step 3. 받아온 것들을 reportform에 집어넣기.
	model.addAttribute("reportedId","나쁜사람1" );
	model.addAttribute("reportedCargo","나쁜물건1");
	// 됨
	return "report/reportform";
	}
	
	//1. reportform에서 작성된 reportdesc 파일을 컨트롤러로 받아올 수 있는지 확인
	
	public String Getparameters(Reportmodel reportmodel){
		logger.trace(reportmodel.getReportdesc());
		return "report/reportform";		
	}
	
	

	
}
