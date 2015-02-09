package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import easydel.dao.IUserDao;
import easydel.entity.User;
import easydel.exception.DuplicatedIdException;
import easydel.exception.ServiceFailException;

//2015.02.09 13:47 rabbit(깡총깡총) 작성
//2015.02.09 17:46 jll 작성
public class UserServiceImpl implements IUserService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private IUserDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	@Transactional(rollbackFor={DuplicatedIdException.class, ServiceFailException.class})
	public void serviceRegistrateNewUser(User user) throws DuplicatedIdException, ServiceFailException {
		this.serviceCheckDuplicatedId(user.getUserId());
		
		int result = 0;
		result = dao.insertUser(user);
		
		if(result <= 0) {
			throw new ServiceFailException();
		}
	}
	
	@Override
	@Transactional(rollbackFor={DuplicatedIdException.class, ServiceFailException.class})
	public void serviceCheckDuplicatedId(String userId) throws DuplicatedIdException, ServiceFailException {
		User user = dao.selectUserByUserId(userId);
		if(user != null) {
			throw new DuplicatedIdException();
		}
	}
	
	@Override
	public boolean LoginService(String userId, String userPassword) {
		boolean flag = false;
		User user;
		user = dao.selectUserByUserId(userId);
		String userPass = user.getUserPassword();
		if(userPass==userPassword){
			logger.trace("로그인 성공");
			flag = true;
		}
		return flag;
	}

}
