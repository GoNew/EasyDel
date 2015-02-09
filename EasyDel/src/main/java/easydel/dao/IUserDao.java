package easydel.dao;

import easydel.entity.User;

//2015.02.09 13:24 rabbit(깡총깡총) 작성

public interface IUserDao {
	public int insertUser(User user);
	public User selectUserByUserId(String userId);
}
