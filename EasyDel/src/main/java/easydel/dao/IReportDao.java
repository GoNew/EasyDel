package easydel.dao;

import easydel.entity.Report;


public interface IReportDao {

	public int insertReport(Report report);
	
	public Report selectReportJoinWithReportType(Integer requestId);
	
}
