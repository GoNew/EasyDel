package easydel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.contant.AlertStatus;
import easydel.entity.AlertLog;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IAlertService;

//헤더에서의 알람 처리를 위한 controller
@Controller
@RequestMapping(value="/alert")
public class AlertController {
	@Autowired
	IAlertService service;
	public static final Logger logger = LoggerFactory
			.getLogger(AlertController.class);
	
	@RequestMapping(value="/ajax/getCount", produces="text/plain;charset=UTF-8")
	public @ResponseBody String getAlertCount(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginSession");
		Integer result = service.getAlertListCount(loginUser.getUserId());
		if(service.hasMoreRemainingEvalThings(loginUser.getUserId()))
			result++;
		return result.toString();
	}
	
	@RequestMapping(value="/ajax/getList", produces="text/plain;charset=UTF-8")
	public @ResponseBody String getAlertList(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginSession");
		StringBuilder result = new StringBuilder();
		List<AlertLog> list = service.getAlert(loginUser.getUserId());
		
		if(service.hasMoreRemainingEvalThings(loginUser.getUserId())) {
			result.append("<li class=\"alertLogForSystem\"><a>평가항목이 존재합니다!!! 평가를 해주세요!!!</a></li>");
		}
		for(AlertLog log: list) {
			result.append("<li class=");
			switch (AlertStatus.valueOf(log.getAlertStatus())) {
			case deliver:
				result.append("\"alertLogForDeliver deletableAlertLog\"");
				break;
			case sender:
				result.append("\"alertLogForSender deletableAlertLog\"");
				break;
			case system:
			default:
				result.append("\"alertLogForSystem deletableAlertLog\"");
				break;
			}
			result.append(" onclick=\"removeAndHiddenAlertLog(this, '")
				.append(log.getAlertId())
				.append("')\"><a>")
				.append(log.getAlertComment())
				.append("</a></li>");
		}
		logger.trace("mylog: " + result.toString());
		return result.toString();
	}
	
	@RequestMapping(value="/ajax/remove", params={"alertId"}, method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody String removeAlert(@RequestParam Integer alertId) {
		String result = "true";
		try {
			service.deleteAlert(alertId);
		} catch (ServiceFailException e) {
			e.printStackTrace();
			result = "false";
		}
		return result;
	}
}
