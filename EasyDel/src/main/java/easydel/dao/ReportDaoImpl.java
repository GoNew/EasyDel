package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ReportDaoImpl implements IReportDao {
	
	@Autowired
	private SqlSession session;
	
	// 빈!!!!을 생성해줍시다	
	private String namespace= "easydel.type90.mapper.report";

	@Override
	public List selectRequestByRequestId() {
		String stmt = namespace + ".selectRequestByRequestId";
		List result = session.selectList(stmt);
		return result;
	}

}
