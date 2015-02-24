package easydel.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;
import easydel.service.IProfileService;
import easydel.service.IUserService;

@Controller
@RequestMapping(value="/profile")
public class ProfileController {
	static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	@Autowired
	private IProfileService profileService;
	@Autowired
	private IUserService userService;
	
	//운송인의 유저 프로필 정보
	@RequestMapping(value="/courierInfo", params={"userId"}, method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getCourierProfile(@RequestParam String userId, Model model, HttpServletRequest request){
		User courierInfo = userService.serviceGetUser(userId);
		DecimalFormat decFormat = new DecimalFormat(".##");
		
		JSONObject returnObj = new JSONObject();
		
		//JSON 형식으로 출력
		returnObj.put("pageNum", profileService.serviceGetTotalPageNumOfCourierEval(userId));
		returnObj.put("userId", courierInfo.getUserId());
		returnObj.put("picturePath", request.getContextPath() + courierInfo.getUserPicture());
		returnObj.put("pTime", courierInfo.getCourierAvgTime());
		returnObj.put("pSafe", courierInfo.getCourierAvgSafe());
		returnObj.put("pKind", courierInfo.getCourierAvgKind());
		if(courierInfo.getCourierTotalcnt() == 0)
			returnObj.put("successRate", "0.00");
		else
			returnObj.put("successRate", decFormat.format((double)courierInfo.getCourierSuccesscnt() / courierInfo.getCourierTotalcnt() * 100.0));
		returnObj.put("successReq", courierInfo.getCourierSuccesscnt());
		returnObj.put("totalReq", courierInfo.getCourierTotalcnt());
		
		return returnObj.toJSONString();
	}
	
	//운송인 평가 댓글 내용을 불러온다
	@RequestMapping(value="/courierEvalCmts", params={"userId", "pageNum"}, method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getCourierProfileEvalCmts(@RequestParam String userId,
			@RequestParam Integer pageNum, Model model, HttpServletRequest request){
		StringBuilder result = new StringBuilder();
		List<CourierEval> list = profileService.serviceGetCourierInfos(pageNum, userId);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd a kk:mm");
		
		for(CourierEval eval: list) {
			result.append("<tr>")
				.append("<td style=\"width: 700px; line-height: 20px; padding: 7px; word-break: break-all; overflow: hidden; clear: both; font-size: 12px;\">")
				.append(eval.getCourierCmt())
				.append("</td><td style=\"width: 200px; line-height: 20px; padding: 7px; word-break: break-all; overflow: hidden; clear: both; color: #888888; font-size: 13px\">")
				.append(dateFormat.format(eval.getRegDate()))
				.append("</td></tr>");
		}
		return result.toString();
	}
	
	//발송인의 유저 프로필 정보
	@RequestMapping(value="/senderInfo", params={"userId"}, method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getSenderProfile(@RequestParam String userId, Model model, HttpServletRequest request){
		User senderInfo = userService.serviceGetUser(userId);
		DecimalFormat decFormat = new DecimalFormat(".##");

		JSONObject returnObj = new JSONObject();

		//JSON 형식으로 출력
		returnObj.put("pageNum", profileService.serviceGetTotalPageNumOfSenderEval(userId));
		returnObj.put("userId", senderInfo.getUserId());
		returnObj.put("picturePath", request.getContextPath() + senderInfo.getUserPicture());
		returnObj.put("pKind", senderInfo.getSenderAvgKind());
		returnObj.put("pThing", senderInfo.getSenderAvgThing());
		returnObj.put("pTime", senderInfo.getSenderAvgTime());
		if(senderInfo.getSenderTotalcnt() == 0)
			returnObj.put("successRate", "0.00");
		else
			returnObj.put("successRate", decFormat.format((double)senderInfo.getSenderSuccesscnt() / senderInfo.getSenderTotalcnt() * 100.0));
		returnObj.put("successReq", senderInfo.getSenderSuccesscnt());
		returnObj.put("totalReq", senderInfo.getSenderTotalcnt());

		return returnObj.toJSONString();
	}

	//발송인 평가 댓글 내용을 불러온다
	@RequestMapping(value="/senderEvalCmts", params={"userId", "pageNum"}, method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String getSenderProfileEvalCmts(@RequestParam String userId,
			@RequestParam Integer pageNum, Model model, HttpServletRequest request){
		StringBuilder result = new StringBuilder();
		List<SenderEval> list = profileService.serviceGetSenderInfos(pageNum, userId);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd a kk:mm");

		for(SenderEval eval: list) {
			result.append("<tr>")
			.append("<td style=\"width: 700px; line-height: 20px; padding: 7px; word-break: break-all; overflow: hidden; clear: both; font-size: 12px;\">")
			.append(eval.getSenderCmt())
			.append("</td><td style=\"width: 200px; line-height: 20px; padding: 7px; word-break: break-all; overflow: hidden; clear: both; color: #888888; font-size: 13px\">")
			.append(dateFormat.format(eval.getRegDate()))
			.append("</td></tr>");
		}
		return result.toString();
	}
}
