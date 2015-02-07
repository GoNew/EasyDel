package easydel.dao;

import easydel.entity.User;

public interface IUserDao {
	public User selectUserByUserId(String userId);
}
