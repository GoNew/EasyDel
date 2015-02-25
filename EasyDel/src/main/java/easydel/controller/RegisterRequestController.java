package easydel.controller;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import easydel.contant.RequestType;
import easydel.entity.AddressDong;
import easydel.entity.Request;
import easydel.entity.User;
import easydel.exception.ServiceFailException;
import easydel.service.IDongService;
import easydel.service.IGuService;
import easydel.service.IRequestService;
import easydel.service.IUserService;

@Controller
@RequestMapping(value="/register")
public class RegisterRequestController {
	public static final Logger logger = LoggerFactory
			.getLogger(RegisterRequestController.class);
	
	@Autowired
	private IGuService guService;
	@Autowired
	private IDongService dongService;
	@Autowired
	private IRequestService reqService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/ajax/getdong", params={"guName"}, method=RequestMethod.GET,
			produces="text/plain;charset=UTF-8")
	public @ResponseBody String getDongList(@RequestParam String guName) {
		StringBuilder builder = new StringBuilder();
		List<AddressDong> list = dongService.getDongByGu(guName);
		for(AddressDong dong: list) {
			builder.append("<option value=\"")
				.append(dong.getDongId())
				.append("\">")
				.append(dong.getDongDesc())
				.append("</option>");
		}
		return builder.toString();
	}
	
	@RequestMapping("/selecttype")
	public String selectType(){
		return "board/registrate/selecttype";
	}
	@RequestMapping(value="/typesimple", method=RequestMethod.GET)
	public String typeSimple(Model model){
		model.addAttribute("gu", guService.getGu());
		return "board/registrate/typesimple";
	}
	@RequestMapping(value="/typesimple", method=RequestMethod.POST)
	public String registerTypeSimple(Request newRequest, @RequestParam("imgFileInput") MultipartFile file,
			@RequestParam String pickupMinTimeBeforeParse,
			@RequestParam String pickupMaxTimeBeforeParse,
			@RequestParam String arrivalMinTimeBeforeParse,
			@RequestParam String arrivalMaxTimeBeforeParse,
			HttpSession session, Model model) {
		SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm");
		User user = (User) session.getAttribute("loginSession");
		String resultPage = "redirect:/mylist";
		
		//시간 포멧 수정하여 setting
		Date currDate = new Date(); 
		Date pickupMinTime = null;
		Date pickupMaxTime = null;
		Date arrivalMinTime = null;
		Date arrivalMaxTime = null;
		try {
			pickupMinTime = (Date) parser.parse(pickupMinTimeBeforeParse);
			pickupMaxTime = (Date) parser.parse(pickupMaxTimeBeforeParse);
			arrivalMinTime = (Date) parser.parse(arrivalMinTimeBeforeParse);
			arrivalMaxTime = (Date) parser.parse(arrivalMaxTimeBeforeParse);
			if(pickupMaxTime.before(pickupMinTime)
					|| arrivalMaxTime.before(arrivalMinTime)
					|| pickupMaxTime.before(currDate)
					|| arrivalMaxTime.before(pickupMinTime)) {
				throw new ServiceFailException("입력된 시간이 잘못되었습니다.");
			}
			newRequest.setSenderId(user.getUserId());
			newRequest.setRequestType(RequestType.nomal.getTypeCode());
			newRequest.setPickupMinTime(pickupMinTime);
			newRequest.setPickupMaxTime(pickupMaxTime);
			newRequest.setArrivalMinTime(arrivalMinTime);
			newRequest.setArrivalMaxTime(arrivalMaxTime);
			newRequest.setExpireDate(pickupMaxTime);
			newRequest.setValidationCode((int) (Math.random() * 10000000));
			
			reqService.serviceRegistrateNewRequest(newRequest, file);
			session.setAttribute("loginSession", userService.serviceGetUser(user.getUserId()));
		} catch (ParseException | ServiceFailException e) {
			resultPage = "error/errorpage";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		
		return resultPage;
	}
	
	@RequestMapping(value="/typepurchase", method=RequestMethod.GET)
	public String typePurchase(Model model){
		model.addAttribute("gu", guService.getGu());
		return "board/registrate/typepurchase";
	}
	
	@RequestMapping(value="/typepurchase", method=RequestMethod.POST)
	public String registerTypePurchase(Request newRequest, @RequestParam("imgFileInput") MultipartFile file,
			@RequestParam String arrivalMinTimeBeforeParse,
			@RequestParam String arrivalMaxTimeBeforeParse,
			HttpSession session, Model model) {
		SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd'T'KK:mm");
		User user = (User) session.getAttribute("loginSession");
		String resultPage = "redirect:/mylist";
		
		logger.trace("mylog: " + file.isEmpty());
		
		//시간 포멧 수정하여 setting
		Date currDate = new Date(); 
		Date arrivalMinTime = null;
		Date arrivalMaxTime = null;
		try {
			arrivalMinTime = (Date) parser.parse(arrivalMinTimeBeforeParse);
			arrivalMaxTime = (Date) parser.parse(arrivalMaxTimeBeforeParse);
			if(arrivalMaxTime.before(arrivalMinTime)
					|| arrivalMaxTime.before(currDate)) {
				throw new ServiceFailException("입력된 시간이 잘못되었습니다.");
			}
			newRequest.setSenderId(user.getUserId());
			newRequest.setRequestType(RequestType.puchase.getTypeCode());
			newRequest.setArrivalMinTime(arrivalMinTime);
			newRequest.setArrivalMaxTime(arrivalMaxTime);
			newRequest.setExpireDate(arrivalMaxTime);
			newRequest.setValidationCode((int) (Math.random() * 10000000));
			
			reqService.serviceRegistrateNewRequest(newRequest, file);
			session.setAttribute("loginSession", userService.serviceGetUser(user.getUserId()));
		} catch (ParseException | ServiceFailException e) {
			resultPage = "error/errorpage";
			model.addAttribute("errorMsg", e.getMessage());
			e.printStackTrace();
		}
		
		return resultPage;
	}
}
