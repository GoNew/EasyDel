package easydel.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.exception.ServiceFailException;
import easydel.service.IEvalService;

@Controller
@RequestMapping(value="/eval")
public class EvalController {
	static final Logger logger = LoggerFactory.getLogger(EvalController.class);
	@Autowired
	private IEvalService service;
	
	//운송인 평가
	@RequestMapping(value="/courier", method=RequestMethod.GET)
	public String moveToEvalCourier(@RequestParam Integer requestId, Model model){
		model.addAttribute("courierInfo", service.serviceGetCourier(requestId));
		model.addAttribute("requestId", requestId);
		return "profile/eval/couriereval";
	}
	
	@RequestMapping(value="/courier", method=RequestMethod.POST)
	public String evalCourier(Model model, 
			@RequestParam Integer courierevaltime2, @RequestParam Integer courierevalsafe2, 
			@RequestParam Integer courierevalkind2, @RequestParam String courierevalcmt,
			@RequestParam String courierId, @RequestParam Integer requestId){
		//resultPage는 내 진행보기로 이동
		String resultPage = "redirect:/mylist";
		
		CourierEval couriereval = new CourierEval();
		
		couriereval.setRequestId(requestId);
		couriereval.setCourierId(courierId);
		couriereval.setCourierTime(courierevaltime2);
		couriereval.setCourierSafe(courierevalsafe2);
		couriereval.setCourierKind(courierevalkind2);
		couriereval.setCourierCmt(courierevalcmt);
		
		try {
			service.serviceCourierEval(couriereval);
			service.serviceUpdateCourierEval(requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "redirect:/error";
			e.printStackTrace();
		}
		
		return resultPage;
	}

	
	
	
	//발송인 평가
	@RequestMapping(value="/sender", method=RequestMethod.GET)
	public String moveToEvalSender(@RequestParam Integer requestId, Model model){
		model.addAttribute("senderInfo", service.serviceGetSender(requestId));
		model.addAttribute("requestId", requestId);
		return "profile/eval/sendereval";
	}
	
	@RequestMapping(value="/sender", method=RequestMethod.POST)
	public String evalSender(Model model, @RequestParam Integer senderevaltime2, @RequestParam Integer senderevalsafe2, 
			@RequestParam Integer senderevalkind2, @RequestParam String senderevalcmt,
			@RequestParam String senderId, @RequestParam Integer requestId){
		//resultPage는 내 진행보기로 이동
		String resultPage = "redirect:/mylist";
		
		SenderEval sendereval = new SenderEval();
		
		sendereval.setRequestId(requestId);
		sendereval.setSenderId(senderId);
		sendereval.setSenderTime(senderevaltime2); 
		sendereval.setSenderThing(senderevalsafe2); 
		sendereval.setSenderKind(senderevalkind2);
		sendereval.setSenderCmt(senderevalcmt);
		
		try {
			service.serviceSenderEval(sendereval);
			service.serviceUpdateSenderEval(requestId);
		} catch (ServiceFailException e) {
			model.addAttribute("errorMsg", e.getMessage());
			resultPage = "redirect:/error";
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
}
