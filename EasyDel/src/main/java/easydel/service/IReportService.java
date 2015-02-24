package easydel.service;

import easydel.exception.ServiceFailException;

public interface IReportService {
	public void takeOverReportRequest(Integer requestId, Integer reportType,
			String reportedUserId, String exeUserId, String reportCmt)
			throws ServiceFailException;
}
