package easydel.service;

import org.springframework.beans.factory.annotation.Autowired;

import easydel.dao.IUserDao;
import easydel.entity.User;
	
public class IUserServiceImpl implements IUserService {

	@Autowired
	private IUserDao dao;
	
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
