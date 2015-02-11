package easydel.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.AlertLog;

public class AlertDaoImpl implements IAlertDao {
	
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.gonew.mapper.alertlogs";
	
	@Override
	public List<AlertLog> selectAlertLogsByUserId(String userId) {
		String stmt = namespace + ".selectAlertLogsByUserId";
		List<AlertLog> result = session.selectList(stmt, userId);
		return result;
	}

	@Override
	public Integer countAlertLogsByUserId(String userId) {
		String stmt = namespace + ".countAlertLogsByUserId";
		Integer result = session.selectOne(stmt, userId);
		return result;
	}

	@Override
	public int insertAlertLog(AlertLog alertLog) {
		String stmt = namespace + ".insertAlertLog";
		int result = session.insert(stmt, alertLog);
		return result;
	}

	@Override
	public int deleteAlertLogByAlertId(Integer alertId) {
		String stmt = namespace + ".deleteAlertLogByAlertId";
		int result = session.delete(stmt, alertId);
		return result;
	}

	@Override
	public Integer countRequestsBeforeEvalByUserId(String userId) {
		String stmt = namespace + ".selectRequestsBeforeEvalCountByUserId";
		Integer result = session.selectOne(stmt, userId);
		return result;
	}
}
