package easydel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IReportDao;
import easydel.entity.Report;

public class ReportServiceImpl implements IReportService {
	
	@Autowired
	IReportDao dao;

	@Override
	@Transactional
	public List<Report> getRequest() {
		return dao.selectRequestByRequestId();
	}
}
