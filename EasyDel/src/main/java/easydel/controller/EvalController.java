package easydel.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easydel.entity.CourierEval;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IEvalService;

@Controller
public class EvalController {
	static final Logger logger = LoggerFactory.getLogger(EvalController.class);
	@Autowired
	private IEvalService service;
	
	//운송인 평가
	@RequestMapping(value="/profile/eval/couriereval", method=RequestMethod.GET)
	public String moveToProfileCourier(){
		return "profile/eval/couriereval";
	}
	
	@RequestMapping(value="/profile/eval/couriereval", method=RequestMethod.POST)
	public String profileCourier(User user, CourierEval couriereval, Model model, 
			@RequestParam Integer courierevaltime2, @RequestParam Integer courierevalsafe2, 
			@RequestParam Integer courierevalkind2, @RequestParam String courierevalcmt/*,
			@RequestParam Date courierevalsystime*/){
		String resultPage = "redirect:couriereval";
		
		//service.serviceGetCourier(model.   requestId);
		
		couriereval.setCourierTime(courierevaltime2);
		couriereval.setCourierSafe(courierevalsafe2);
		couriereval.setCourierKind(courierevalkind2);
		couriereval.setCourierCmt(courierevalcmt);
		//couriereval.setRegDate(courierevalsystime);
		
		try {
			service.serviceCourierEval(couriereval);
		} catch (ServiceFailException e) {
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
	
	//발송인 평가
	@RequestMapping(value="/profile/eval/sendereval", method=RequestMethod.GET)
	public String moveToProfileSender(){
		return "profile/eval/sendereval";
	}
	
	@RequestMapping(value="/profile/eval/sendereval", method=RequestMethod.POST)
	public String profileSender(User user, Model model, HttpSession session){
		String resultPage = "redirect:sendereval";
		
		
		return resultPage;
	}
	
	
	//임시 : 에러페이지 테스트
	@RequestMapping(value="/error/errorpage", method=RequestMethod.GET)
	public String moveToErrorPage(){
		return "error/errorpage";
	}
}
