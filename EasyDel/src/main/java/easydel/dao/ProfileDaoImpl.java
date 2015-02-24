package easydel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.CourierEval;
import easydel.entity.SenderEval;

public class ProfileDaoImpl implements IProfileDao {
	public static final Logger logger = LoggerFactory.getLogger(TitleDaoImpl.class);
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.rabbit.mapper.profile";
	
	public ProfileDaoImpl(){}
	
	@Override
	public Integer selectCountOfCourierInfosByUserId(String userId) {
		String stmt = namespace + ".selectCountOfCourierInfosByUserId";
		Integer result = session.selectOne(stmt, userId);
		return result;
	}
	
	@Override
	public List<CourierEval> selectCourierEvalsByUserId(Integer pageNum, String courierId) {
		String stmt = namespace + ".selectCourierEvalsByUserId";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("userId", courierId);
		List<CourierEval> result = session.selectList(stmt, params);
		return result;
	}

	@Override
	public Integer selectCountOfSenderInfosByUserId(String userId) {
		String stmt = namespace + ".selectCountOfSenderInfosByUserId";
		Integer result = session.selectOne(stmt, userId);
		return result;
	}
	@Override
	public List<SenderEval> selectSenderEvalsByUserId(Integer pageNum,
			String senderId) {
		String stmt = namespace + ".selectSenderEvalsByUserId";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("pageNum", pageNum);
		params.put("userId", senderId);
		List<SenderEval> result = session.selectList(stmt, params);
		return result;
	}
}
