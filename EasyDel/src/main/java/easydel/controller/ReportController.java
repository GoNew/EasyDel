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
public class ReportController {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReportController.class);
	}

	@Autowired
	IReportTypeService reportTypeService;

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String GetReportType(Model model, HttpSession session) {
		

		model.addAttribute("reportType", reportTypeService.getReportType());
		model.addAttribute("reportedId", "senderIdusers");
		model.addAttribute("reportedCargo", "cargoName");		

		return "report/reportform";
	}

	// 1. reportform에서 작성된 reportdesc 파일을 컨트롤러로 받아올 수 있는지 확인

	public void GetReportDesc(Reportmodel reportmodel) {
		System.out.println(reportmodel.getReportdesc());
		;
	}
}
