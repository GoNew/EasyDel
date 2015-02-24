package easydel.dao;

import java.util.List;

import easydel.entity.ReportType;
import easydel.entity.Request;

public interface IReportTypeDao {
//	public List<ReportType> getReportType();
	public List<ReportType> selectAllReportType();
	public List<Request> getrequestByRequestId();
}
