package easydel.service;

import easydel.entity.User;
import easydel.exception.DuplicatedIdException;
import easydel.exception.ServiceFailException;

//2015.02.09 13:24 rabbit(깡총깡총) 작성
public interface IUserService {
	public int serviceRegistrateNewUser(User user)
			throws DuplicatedIdException, ServiceFailException;
	public int serviceCheckDuplicatedId(String userId)
			throws DuplicatedIdException, ServiceFailException; 
}
