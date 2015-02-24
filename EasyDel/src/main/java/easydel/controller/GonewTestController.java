package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import easydel.dao.IRequestDao;

@Controller
public class GonewTestController {
	@Autowired
	private IRequestDao dao;
	
	@RequestMapping("/gonew/test")
	public String test() {
		/*Request temp = dao.selectRequestJoinRequestCmtByRequestId(1);
		System.out.println(temp.toString());*/
		return "showMessage";
	}
}
