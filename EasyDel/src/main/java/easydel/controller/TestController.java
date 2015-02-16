package easydel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import easydel.dao.IProfileDao;
import easydel.entity.User;

@Controller
public class TestController {
	@Autowired
	IProfileDao dao;

	@RequestMapping("/test")
	public String test() {
		User temp = dao.selectCourierInfos("simpson");
		System.out.println(temp.toString());
		return "showMessage";
	}
}
