package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.ViewMySendRequest;

public class ViewMySendRequestDaoImpl implements IViewMySendRequestDao {

	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.requests";
	
	@Override
	public List<ViewMySendRequest> selectMySendRequest(String userId) {
		String stmt = namespace + ".selectMySendRequest";
		List<ViewMySendRequest> result = session.selectList(stmt, userId);
		return result;
	}

}
