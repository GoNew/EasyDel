package easydel.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import easydel.entity.Request;
import easydel.model.Reportmodel;
import easydel.service.IReportTypeService;
import easydel.service.ReportServiceImpl;

@Controller
public class Type90TestController {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(Type90TestController.class);
	}

	@Autowired
	IReportTypeService reportTypeService;

	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public String GetReportParameter(Model model) {
		// Step 2. request에서 requestId, senderIdusers랑 cargoName 받아오기
		// String senderIdusers = ????.getParameter("senderIdUsers");
		// String cargoName = ???.getParameter("cargoName");
		// Step 3. 받아온 것들을 reportform에 집어넣기.
		// model.addAttribute("reportedId", "senderIdusers");
		// model.addAttribute("reportedCargo", "cargoName");
		return "report/reportform";
	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String GetReportType(Model model) {
		model.addAttribute("reportType", reportTypeService.getReportType());
		return "board/list";
	}

	// 1. reportform에서 작성된 reportdesc 파일을 컨트롤러로 받아올 수 있는지 확인

	public void GetReportDesc(Reportmodel reportmodel) {
		System.out.println(reportmodel.getReportdesc());
		;
	}
}
