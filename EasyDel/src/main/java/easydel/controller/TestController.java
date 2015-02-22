package easydel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import easydel.dao.IProfileDao; 
import easydel.entity.CourierEval;

@Controller
public class TestController {
	@Autowired
	IProfileDao dao;

	@RequestMapping("/test")
	public String test() {
		List<CourierEval> result = dao.selectCourierInfos(1, "james");
		System.out.println(result.toString());
		return "showMessage";
	}
}
