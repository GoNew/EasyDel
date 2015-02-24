package easydel.service;

import easydel.entity.Report;
import easydel.exception.ServiceFailException;

public interface IReportService {
	public void takeOverReportRequest(Integer requestId, Integer reportType,
			String reportedUserId, String exeUserId, String reportCmt)
			throws ServiceFailException;

	public Report getReport(Integer requestId) throws ServiceFailException;
}
