package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.Report;

public class ReportDaoImpl implements IReportDao {
	
	@Autowired
	private SqlSession session;
	
	// 빈!!!!을 생성해줍시다	
	private String namespace= "easydel.type90.mapper.reports";
	
	private String gonew_namespace = "easydel.gonew.mapper.reports";

	@Override
	public int insertReport(Report report) {
		String stmt = namespace + ".insertReport";
		int result = session.insert(stmt, report);
		return result;
	}

	@Override
	public Report selectReportJoinWithReportType(Integer requestId) {
		String stmt = gonew_namespace + ".selectReportJoinWithReportType";
		Report result = session.selectOne(stmt, requestId);
		return result;
	}

}
