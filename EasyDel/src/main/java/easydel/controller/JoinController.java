package easydel.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

import easydel.entity.User;
import easydel.exception.DuplicatedIdException;
import easydel.exception.ServiceFailException;
import easydel.service.IUserService;

@Controller
public class JoinController {
	static final Logger logger = LoggerFactory
			.getLogger(ModifyController.class);
	@Autowired
	private IUserService service;

	// ------------------------------------회원가입-----------------------------------------------
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String moveToJoinFake() {
		return "member/join";
	}

	// 회원가입에서 id 중복체크 ajax를 위한 컨트롤러
	@RequestMapping(value = "/ajax/dupidcheck", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String dupidcheck(@RequestParam String userId,
			Model model) {
		String result;
		try {
			service.serviceCheckDuplicatedId(userId);
			result = userId + " 는 <br> 사용할 수 있는 ID 입니다.";
		} catch (DuplicatedIdException | ServiceFailException e) {
			result = userId + " 는 <br> 중복된 ID 입니다.";
		}
		return result;
	}

	// 회원가입에서 인증번호 보내기
	@RequestMapping(value = "/ajax/sendVC")
	public @ResponseBody String sendValidateCode(HttpSession session) {
		Integer validateCode = (int) (Math.random() * 10000000);
		session.setAttribute("checkPhoneValidateCode", validateCode);
		return "";
	}

	// 회원가입에서 인증여부 확인하기
	@RequestMapping(value = "/ajax/checkVC", params = { "vc" }, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String checkValidateCode(@RequestParam Integer vc,
			HttpSession session) {
		String result = "f";
		if (vc != null) {
			Integer validateCode = (Integer) session
					.getAttribute("checkPhoneValidateCode");
			if (vc.equals(validateCode)) {
				result = "t";
				session.removeAttribute("checkPhoneValidateCode");
			}
		}
		return result;
	}

	// 회원가입을 위한 컨트롤러
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinWithPicture(Model model,
			@RequestParam("imgFileInput") MultipartFile file, User user,
			@RequestParam String birthdate, HttpSession session) {
		String resultPage = "intro";
		String filePath = "/img/EHlisaface.png";

		File createProfile = null;

		try {
			service.serviceCheckDuplicatedId(user.getUserId());
			if (file != null && !file.isEmpty()) {
				createProfile = new File("c:/db/uploaded/profile/"
						+ user.getUserId());
				file.transferTo(createProfile);
				filePath = "/profile/" + user.getUserId();
			}
			user.setUserPicture(filePath);
			user.setUserBirthdate(new SimpleDateFormat("yyyy-MM-dd")
					.parse(birthdate));
			service.serviceRegistrateNewUser(user);
		} catch (DuplicatedIdException | ServiceFailException | ParseException
				| IOException | IllegalStateException e) {
			e.printStackTrace();
			if (!filePath.equals("/img/EHlisaface.png")
					&& (createProfile != null))
				createProfile.delete();
			model.addAttribute("errorMsg", "알수없는 원인");
			resultPage = "error";
		}

		return "redirect:" + resultPage;
	}
}
