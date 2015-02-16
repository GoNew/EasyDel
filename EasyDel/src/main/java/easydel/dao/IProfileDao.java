package easydel.dao;

import easydel.entity.User;

public interface IProfileDao {
	public User selectCourierInfos(String userId);
}
