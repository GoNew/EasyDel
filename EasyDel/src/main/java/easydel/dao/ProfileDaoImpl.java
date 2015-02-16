package easydel.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.entity.User;

public class ProfileDaoImpl implements IProfileDao {
	public static final Logger logger = LoggerFactory.getLogger(TitleDaoImpl.class);
	@Autowired
	private SqlSession session;
	
	private String namespace = "easydel.rabbit.mapper.profile";
	
	public ProfileDaoImpl(){}
	
	@Override
	public User selectCourierInfos(String userId) {
		String stmt = namespace + ".selectCourierInfos";
		User result = session.selectOne(stmt, userId);
		return result;
	}


}
