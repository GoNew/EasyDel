package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.ReportType;

public class ReportTypeDaoImpl implements IReportTypeDao {

	@Autowired
	private SqlSession session;
	// 빈 설정 해줄것!!!!

	private String namespace = "easydel.type90.mapper.reports";

	@Override
	public List<ReportType> selectAllReportType() {
		String stmt = namespace + ".selectAllReportType";
		List<ReportType> result = session.selectList(stmt);
		return result;
	}

}
