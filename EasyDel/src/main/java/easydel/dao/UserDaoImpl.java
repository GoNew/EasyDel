package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.User;

//2015.02.09 13:24 rabbit(깡총깡총) 작성

public class UserDaoImpl implements IUserDao {
	public static final Logger logger = LoggerFactory.getLogger(TitleDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	private String jll_namespace = "easydel.jll.mapper.users";
	private String rabbit_namespace = "easydel.rabbit.mapper.user";
	
	public UserDaoImpl(){}
	
	@Override
	public int insertUser(User user) {
		String stmt = rabbit_namespace + ".insertUser";
		int result = session.insert(stmt, user);
		return result;
	}
	
	@Override
	public User selectUserByUserId(String userId) {
		User user;
		user = session.selectOne(jll_namespace+".selectUserById", userId);
		return user;
	}

}
