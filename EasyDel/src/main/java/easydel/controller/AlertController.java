package easydel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.entity.AlertLog;
import easydel.entity.User;
import easydel.service.IAlertService;

//헤더에서의 알람 처리를 위한 controller
@Controller
@RequestMapping(value="/alert")
public class AlertController {
	@Autowired
	IAlertService service;
	
	@RequestMapping(value="/ajax/getCount")
	public @ResponseBody String getAlertCount(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginSession");
		Integer result = service.getAlertListCount(loginUser.getUserId());
		if(service.hasMoreRemainingEvalThings(loginUser.getUserId()))
			result++;
		return result.toString();
	}
	
	@RequestMapping(value="/ajax/getList")
	public @ResponseBody String getAlertList(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginSession");
		StringBuilder result = new StringBuilder();
		List<AlertLog> list = service.getAlert(loginUser.getUserId());
		
		if(service.hasMoreRemainingEvalThings(loginUser.getUserId())) {
			result.append("<li>평가항목이 존재합니다!!! 평가를 해주세요!!!</li>");
		}
		for(AlertLog log: list) {
			
		}
		
		//<li><a href="#">Item</a></li>
		
		return result.toString();
	}
}
