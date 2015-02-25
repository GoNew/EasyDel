package easydel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.contant.AlertStatus;
import easydel.contant.RequestStatus;
import easydel.dao.IReportDao;
import easydel.dao.IRequestDao;
import easydel.entity.Report;
import easydel.entity.Request;
import easydel.exception.ServiceFailException;

public class ReportServiceImpl implements IReportService {
	
	@Autowired
	IReportDao dao;
	@Autowired
	IAlertService alertService;
	@Autowired
	IRequestDao reqDao;

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
		
		Request req = reqDao.selectRequestByRequestId(requestId);
		switch (RequestStatus.valueOf(req.getRequestStatus())) {
		case on:
		case cancelByDeliver:
		case cancelBySender:
		case arrive:
			break;
		default:
			throw new ServiceFailException("해당 글은 신고가 불가능한 상태입니다.");
		}
		
		if(reportCmt == null
				|| reportedUserId == null
				|| reportType == null
				|| exeUserId == null
				|| requestId == null)
			throw new ServiceFailException("잘못된 입력 정보");
		if(dao.insertReport(report) <= 0)
			throw new ServiceFailException("신고 실패");
		alertService.insertAlert(reportedUserId, "신고 건수가 있습니다. '내 진행보기-신고탭'에서 확인하세요.", AlertStatus.system);
	}
	
	@Override
	public Report getReport(Integer requestId) throws ServiceFailException {
		if(requestId == null)
			throw new ServiceFailException("존재하지 않는 의뢰");
		Report result = null;
		result = dao.selectReportJoinWithReportType(requestId);
		if(result == null)
			throw new ServiceFailException("존재하지 않는 의뢰");
		return result;
	}
}
