package easydel.dao;

import java.util.List;

import easydel.entity.Report;


public interface IReportDao {
	
	public List<Report> selectRequestByRequestId();
	
}
