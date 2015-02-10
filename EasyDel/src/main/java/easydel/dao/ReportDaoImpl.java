package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ReportDaoImpl implements IReportDao {
	
	@Autowired
	private SqlSession session;
	
	private String namespace= "easydel.type90.mapper.report";

	@Override
	public List selectReportByRequestId() {
		String stmt = namespace + ".selectReportByRequestId";
		List result = session.selectList(stmt);
		return result;
	}

}
