package easydel.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IUserService;

@Controller
@RequestMapping(value="/edmoney")
public class EdmoneyController {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(EdmoneyController.class);
	}
	
	@Autowired
	IUserService userService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String GetEdmoneyBalance(Model model, HttpSession session){
		User loginUser = (User) session.getAttribute("loginSession");
		session.setAttribute("loginSession", userService.serviceGetUser(loginUser.getUserId()));
		return "edmoney/edmoneyView";
	}
	
	// ed머니 인출화면으로 보내주는 컨트롤러 
	@RequestMapping(value="/withdraw",method=RequestMethod.GET)
	public String showEDmoneyWithdraw(){
		return "edmoney/edmoneyWithdraw";
	}

	// ed머니 입금화면으로 보내주는 컨트롤러
	@RequestMapping(value="/deposit",method=RequestMethod.GET)
	public String showEDmoneydeposit(){
		return "edmoney/edmoneyDeposit";
	}
	
//	// ed머니 입금 컨트롤러
	@RequestMapping(value="/ajax/deposit", params={"payAmountOfMoney", "payMethod"}, method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody String EDmoneyDeposit(@RequestParam Integer payAmountOfMoney
			, @RequestParam String payMethod, HttpSession session){
		JSONObject returnObj = new JSONObject();
		
		User loginUser = (User) session.getAttribute("loginSession");
		
		try {
			if(payAmountOfMoney == null || payAmountOfMoney == 0)
				throw new ServiceFailException("잘못된 입력 정보");
			userService.serviceDepositUserEDMoney(loginUser.getUserId(), payAmountOfMoney);
			session.setAttribute("loginSession", userService.serviceGetUser(loginUser.getUserId()));
			returnObj.put("result", "true");
			returnObj.put("successMsg", payMethod + "로 충전되었습니다.");
		} catch (ServiceFailException e) {
			e.printStackTrace();
			returnObj.put("errorMsg", e.getMessage());
			returnObj.put("result", "false");
		}
		return returnObj.toJSONString();
	}
	
//	// ed머니 출금 컨트롤러 
	@RequestMapping(value="/ajax/withdraw", params={"payAmountOfMoney", "account", "payMethod"}, method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody String EDmoneyWithdraw(@RequestParam Integer payAmountOfMoney, @RequestParam String payMethod,
			@RequestParam String account, HttpSession session){
		JSONObject returnObj = new JSONObject();
		
		User loginUser = (User) session.getAttribute("loginSession");
		
		try {
			if(payAmountOfMoney == null || payAmountOfMoney == 0)
				throw new ServiceFailException("잘못된 입력 정보");
			userService.serviceWithrawUserEDMoney(loginUser.getUserId(), payAmountOfMoney);
			session.setAttribute("loginSession", userService.serviceGetUser(loginUser.getUserId()));
			returnObj.put("result", "true");
			returnObj.put("successMsg", payMethod + "은행" + account + "계좌로 인출되었습니다.");
		} catch (ServiceFailException e) {
			e.printStackTrace();
			returnObj.put("errorMsg", e.getMessage());
			returnObj.put("result", "false");
		}
		return returnObj.toJSONString();
	}
}
