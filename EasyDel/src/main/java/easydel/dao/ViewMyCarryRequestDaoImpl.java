package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.ViewMyCarryRequest;

public class ViewMyCarryRequestDaoImpl implements IViewMyCarryRequestDao {
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.requests";
	
	@Override
	public List<ViewMyCarryRequest> selectMyCarryRequest(String userId) {
		String stmt = namespace + ".selectMyCarryRequest";
		List<ViewMyCarryRequest> result = session.selectList(stmt, userId);
		return result;
	}

}
