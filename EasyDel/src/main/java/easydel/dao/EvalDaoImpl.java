package easydel.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;
import easydel.entity.User;

public class EvalDaoImpl implements IEvalDao {
public static final Logger logger = LoggerFactory.getLogger(TitleDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	private String rabbit_namespace = "easydel.rabbit.mapper.eval";
	
	public EvalDaoImpl(){}
	
	@Override
	public User selectCourierByRequestId(Integer requestId, String exeUserId) {
		User user;
		String stmt = rabbit_namespace + ".selectCourierByRequestId";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("requestId", requestId);
		params.put("senderId", exeUserId);
		user = session.selectOne(stmt, params);
		return user;
	}
	@Override
	public int insertCourierEval(CourierEval courierEval) {
		String stmt = rabbit_namespace + ".insertCourierEval";
		int result = session.insert(stmt, courierEval);
		return result;
	}
	@Override
	public int updateCourierEvalScore(Integer requestId){
		String stmt = rabbit_namespace + ".updateCourierEvalScore";
		int result = session.update(stmt,requestId);
		return result;
	}
	
	
	@Override
	public User selectSenderByRequestId(Integer requestId, String exeUserId) {
		User user;
		String stmt = rabbit_namespace + ".selectSenderByRequestId";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("requestId", requestId);
		params.put("courierId", exeUserId);
		user = session.selectOne(stmt, params);
		return user;
	}
	@Override
	public int insertSenderEval(SenderEval senderEval) {
		String stmt = rabbit_namespace + ".insertSenderEval";
		int result = session.insert(stmt, senderEval);
		return result;
	}
	@Override
	public int updateSenderEvalScore(Integer requestId) {
		String stmt = rabbit_namespace + ".updateSenderEvalScore";
		int result = session.update(stmt,requestId);
		return result;
	}

	@Override
	public int checkAndUpdateCourierEvalStatusSetComplete(Integer requestId) {
		String stmt = rabbit_namespace + ".checkAndUpdateCourierEvalStatusSetComplete";
		int result = session.update(stmt, requestId);
		return result;
	}

	@Override
	public int checkAndUpdateSenderEvalStatusSetComplete(Integer requestId) {
		String stmt = rabbit_namespace + ".checkAndUpdateSenderEvalStatusSetComplete";
		int result = session.update(stmt, requestId);
		return result;
	}

}
