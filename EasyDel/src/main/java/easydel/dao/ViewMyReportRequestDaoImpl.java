package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import antlr.NameSpace;
import easydel.entity.ViewMyReportRequest;

public class ViewMyReportRequestDaoImpl implements IViewMyReportRequestDao {

	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.requests";
	
	@Override
	public List<ViewMyReportRequest> selectMyReportRequest(String userId) {
		String stmt = namespace + ".selectMyReportRequest";
		List<ViewMyReportRequest> result = session.selectList(stmt, userId);
		return result;
	}

}
