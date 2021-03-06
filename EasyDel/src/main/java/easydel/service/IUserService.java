package easydel.service;

import easydel.entity.User;
import easydel.exception.DuplicatedIdException;
import easydel.exception.ServiceFailException;

//2015.02.09 13:24 rabbit(깡총깡총) 작성
//2015.02.10 11:20 rabbit(깡총깡총) 작성
public interface IUserService {
	public void serviceRegistrateNewUser(User user)
			throws ServiceFailException;
	public void serviceCheckDuplicatedId(String userId)
			throws DuplicatedIdException, ServiceFailException;
	public boolean LoginService(String userId, String userPassword);
	public void serviceUpdateUser(User user) throws ServiceFailException;
	public User serviceGetUser(String userId);
	public void serviceDeleteUser(String userId) throws ServiceFailException;
	public void serviceWithrawUserEDMoney(String userId, Integer amount)
			throws ServiceFailException;
	public void serviceDepositUserEDMoney(String userId, Integer amount)
			throws ServiceFailException;
}
