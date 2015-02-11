package easydel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IReportTypeDao;
import easydel.entity.ReportType;

public class ReportTypeServiceImpl implements IReportTypeService{

	@Autowired
	IReportTypeDao dao;

	@Override
	@Transactional

	public List<ReportType> getReportType(){
		return dao.selectAllReportType();
	}

}
