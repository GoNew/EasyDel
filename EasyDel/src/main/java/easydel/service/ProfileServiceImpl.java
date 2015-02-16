package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IProfileDao;
import easydel.entity.User;

public class ProfileServiceImpl implements IProfileService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IProfileDao dao;

	@Autowired
	private SqlSession session;
	
	@Override	
	public User serviceGetCourierInfos(String userId){
		User user = null;
		user = dao.selectCourierInfos(userId);
		return user;
	}
}
