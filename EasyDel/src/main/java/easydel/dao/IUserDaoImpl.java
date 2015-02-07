package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.User;

public class IUserDaoImpl implements IUserDao{

	@Autowired
	private SqlSession sqlSession;
	
	String statement = "easydel.gonew.mapper.users";
	
	@Override
	public User selectUserByUserId(String userId) {
		User user;
		user = sqlSession.selectOne(statement+".selectUserById", userId);
		return user;
	}

}
