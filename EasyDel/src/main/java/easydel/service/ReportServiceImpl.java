package easydel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IReportDao;

public class ReportServiceImpl implements IReportService {
	
	@Autowired
	IReportDao dao;

	@Override
	@Transactional
	public List getRequest() {
		return dao.selectRequestByRequestId();
	}
}
