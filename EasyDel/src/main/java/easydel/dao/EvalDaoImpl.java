package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.CourierEval;
import easydel.entity.User;

public class EvalDaoImpl implements IEvalDao {
public static final Logger logger = LoggerFactory.getLogger(TitleDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	private String rabbit_namespace = "easydel.rabbit.mapper.eval";
	
	public EvalDaoImpl(){}
	
	@Override
	public User selectCourierByRequestId(String requestId) {
		User user;
		String stmt = rabbit_namespace + ".selectCourierByRequestId";
		user = session.selectOne(stmt, requestId);
		return user;
	}

	@Override
	public int insertCourierEval(CourierEval courierEval) {
		String stmt = rabbit_namespace + ".insertCourierEval";
		int result = session.insert(stmt, courierEval);
		return result;
	}

}
