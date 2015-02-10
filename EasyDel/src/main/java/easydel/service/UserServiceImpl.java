package easydel.service;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.apache.bcel.generic.LOR;
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
//2015.02.10 11:20 rabbit(깡총깡총) 작성
public class UserServiceImpl implements IUserService {
	static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	private IUserDao dao;

	@Autowired
	private SqlSession session;

	@Override
	@Transactional(rollbackFor = { DuplicatedIdException.class, ServiceFailException.class })
	public void serviceCheckDuplicatedId(String userId) throws DuplicatedIdException, ServiceFailException {
		User user = dao.selectUserByUserId(userId);
		if (user != null) {
			throw new DuplicatedIdException();
		}
	}
	
	@Override
	@Transactional(rollbackFor = { DuplicatedIdException.class, ServiceFailException.class })
	public void serviceRegistrateNewUser(User user) throws DuplicatedIdException, ServiceFailException {
		this.serviceCheckDuplicatedId(user.getUserId());

		int result = 0;
		result = dao.insertUser(user);

		if (result <= 0) {
			throw new ServiceFailException();
		}
	}
	
	@Override
	public void serviceUpdateUser(User user) throws ServiceFailException{
		int result = 0;
		result = dao.updateUser(user);
		
		if(result <= 0){
			throw new ServiceFailException();
		}
	}

	@Override
	public boolean LoginService(String userId, String userPassword) {
		boolean result = false;
		User user = null;
		try {
			user = dao.selectUserByUserId(userId);
			String userPass = user.getUserPassword();
			if (userPass.equals(userPassword)) {
				result = true;
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return result;
	}

	//회원정보 수정 시 default값을 본인의 원래 data로 설정해주는 서비스
	@Override
	public User serviceGetUser(String userId){
		User user;
		user = dao.selectUserByUserId(userId);
		return user;
	}
}
