package easydel.dao;

import easydel.entity.User;

//2015.02.09 13:24 rabbit(깡총깡총) 작성
//2015.02.10 11:20 rabbit(깡총깡총) 작성
public interface IUserDao {
	public int insertUser(User user);
	public int updateUser(User user);
	public User selectUserByUserId(String userId);
}
