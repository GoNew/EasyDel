package easydel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.contant.AlertStatus;
import easydel.dao.IReportDao;
import easydel.entity.Report;
import easydel.exception.ServiceFailException;

public class ReportServiceImpl implements IReportService {
	
	@Autowired
	IReportDao dao;
	@Autowired
	IAlertService alertService;

	@Override
	@Transactional(rollbackFor={ServiceFailException.class})
	public void takeOverReportRequest(Integer requestId, Integer reportType,
			String reportedUserId, String exeUserId, String reportCmt)
			throws ServiceFailException {
		Report report = new Report();
		report.setReportCmt(reportCmt);
		report.setReportedUserId(reportedUserId);
		report.setReportType(reportType);
		report.setReportUserId(exeUserId);
		report.setRequestId(requestId);
		
		if(reportCmt == null
				|| reportedUserId == null
				|| reportType == null
				|| exeUserId == null
				|| requestId == null)
			throw new ServiceFailException("잘못된 입력 정보");
		if(dao.insertReport(report) <= 0)
			throw new ServiceFailException("신고 실패");
		alertService.insertAlert(reportedUserId, "'", AlertStatus.system);
	}
}
