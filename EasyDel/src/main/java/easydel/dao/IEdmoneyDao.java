package easydel.dao;

import easydel.entity.User;


public interface IEdmoneyDao {
	public int getEdmoneyByUserId(User user);
	public int depositEdmoney(User user);
	public int withdrawEdmoney(User user);
	
}
