package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IUserDao;
import easydel.entity.User;
import easydel.exception.DuplicatedIdException;
import easydel.exception.ServiceFailException;

//2015.02.09 13:47 rabbit(깡총깡총) 작성
public class UserServiceImpl implements IUserService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	IUserDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void serviceRegistrateNewUser(User user) throws DuplicatedIdException, ServiceFailException {
		this.serviceCheckDuplicatedId(user.getUserId());
		
		int result = 0;
		
		result = dao.insertUser(user);
		
		if(result <= 0) {
			throw new ServiceFailException();
		}
	}
	@Override
	public void serviceCheckDuplicatedId(String userId) throws DuplicatedIdException, ServiceFailException {
//		if(userId == null) {
//			throw new ServiceFailException();
//		}
//		
//		User result = null;
//		
//		try {
//			result = userImpl.selectUserById(session, userId);
//		} catch (RuntimeException e) {
//			LOG.error("selectUserById를 DB에서 실행중 에러 발생", e);
//			session.close();
//			throw new ServiceFailException();
//		} finally {
//			session.close();
//		}
//		if(result != null) {
//			throw new DuplicatedIdException();
//		}
	}
	
	@Override
	public boolean LoginService(String userId, String userPassword) {
		boolean flag = false;
		User user;
		
		user = dao.selectUserByUserId(userId);
			
		String userPass = user.getUserPassword();
		
		if(userPass==userPassword){
			flag = true;
		}
		
		return flag;
	}

}
