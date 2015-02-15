package easydel.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.User;

//2015.02.09 13:24 rabbit(깡총깡총) 작성
//2015.02.10 11:20 rabbit(깡총깡총) 작성
public class UserDaoImpl implements IUserDao {
	public static final Logger logger = LoggerFactory.getLogger(TitleDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	private String jll_namespace = "easydel.jll.mapper.users";
	private String rabbit_namespace = "easydel.rabbit.mapper.user";
	private String gonew_namespace = "easydel.gonew.mapper.users";
	
	public UserDaoImpl(){}
	
	@Override
	public int insertUser(User user) {
		String stmt = rabbit_namespace + ".insertUser";
		int result = session.insert(stmt, user);
		return result;
	}
	
	@Override
	public int updateUser(User user){
		String stmt = rabbit_namespace + ".updateUser";
		int result = session.update(stmt, user);
		return result;
	}
	
	@Override	
	public int deleteUserByUserId(String userId){
		String stmt = rabbit_namespace + ".deleteUserByUserId";
		int result = session.delete(stmt, userId);
		return result;
	}
	
	@Override
	public User selectUserByUserId(String userId) {
		User user;
		user = session.selectOne(jll_namespace+".selectUserById", userId);
		return user;
	}

	@Override
	public int selectUserEDMoney(String userId) {
		String stmt = gonew_namespace + ".selectUserEDMoney";
		logger.trace("mylog: " + userId);
		int result = session.selectOne(stmt, userId);
		return result;
	}

	@Override
	public int updateUserEDMoney(String userId, Integer usedEDMoney) {
		String stmt = gonew_namespace + ".updateUserEDMoney";
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("edmoneyBalance", usedEDMoney);
		int result = session.update(stmt, params);
		return result;
	}
}
